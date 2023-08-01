local QBCore = exports['qb-core']:GetCoreObject()

local copsCalled = false
local PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerJob = {}
end)

AddEventHandler('onClientResourceStart',function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

local attempted = 0
local pickingup = false
local pickup = false

RegisterNetEvent('thermite:UseThermite', function()
    local coordA = GetEntityCoords(PlayerPedId(), 1)
    local coordB = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0,100.0, 0.0)
    local targetVehicle = getVehicleInDirection(coordA, coordB)
    if targetVehicle ~= 0 and GetHashKey("stockade") == GetEntityModel(targetVehicle) then
        local entityCreatePoint = GetOffsetFromEntityInWorldCoords(targetVehicle, 0.0, -4.0, 0.0)
        local coords = GetEntityCoords(PlayerPedId())
        local distance = #(coords - vector3(entityCreatePoint["x"],entityCreatePoint["y"],entityCreatePoint["z"]))
        if distance < 2.0 then
            TriggerEvent("qb-truckrobbery:client:ThermiteTruck", targetVehicle)
        else
            QBCore.Functions.Notify('You need to do this from behind the vehicle.')
        end
    end
end)

RegisterNetEvent('qb-truckrobbery:client:ThermiteTruck', function(veh)
    QBCore.Functions.TriggerCallback('qb-truckrobbery:server:getCops', function(cops)
        local plate = GetVehicleNumberPlateText(veh)
        if not Config.RobbedPlates[plate] then
            if cops >= Config.MinCops then
                --enough cops
                attempted = veh
                SetEntityAsMissionEntity(attempted, true, true)
                local pedCo = GetEntityCoords(PlayerPedId())
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                -- call cops
                if not copsCalled then
                    local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
                    local street1 = GetStreetNameFromHashKey(s1)
                    local street2 = GetStreetNameFromHashKey(s2)
                    local streetLabel = street1
                    if street2 ~= nil then 
                        streetLabel = streetLabel .. " " .. street2
                    end
                    exports['ps-dispatch']:BankTruck()
                    -- TriggerServerEvent("qb-truckrobbery:server:callCops", "Banktruck", 0, streetLabel, pos)
                    CreateThread(function()
                        Wait(5*60*1000)
                        copsCalled = false
                    end)
                    copsCalled = true
                end
                -- plant charge
                ThermitePlantCharge()
                --thermite minigame
                exports['ps-ui']:Thermite(function(success)
                    if success then
                        ThermiteTruckSuccess()
                        TriggerEvent("qb-truckrobbery:client:AllowHeist", veh, "thermite")
                    else
                        ThermiteTruckFailed()
                    end
                 end, 12, 8, 3) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlock

                -- exports["memorygame"]:thermiteminigame(Config.Minigame.correctBlocks, Config.Minigame.incorrectBlocks, Config.Minigame.timetoShow, Config.Minigame.timetoLose,
                --     function() -- success
                --         ThermiteTruckSuccess()
                --         TriggerEvent("qb-truckrobbery:client:AllowHeist", veh, "thermite")
                --     end,
                --     function() -- failure
                --         ThermiteTruckFailed()
                --     end)
                
            else
                --not enough cops
                QBCore.Functions.Notify('Not enough cops',"error", 2000)
            end
        else
            QBCore.Functions.Notify('This truck has recently been robbed',"error", 2000)
        end
    end)
end)

function ThermitePlantCharge()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Wait(50)
    end
    local ped = PlayerPedId()
    local pos = GetOffsetFromEntityInWorldCoords(attempted, 0.0, -3.535, 0.5)
    local vehcoords = GetEntityCoords(attempted)
    SetEntityHeading(ped, GetEntityHeading(attempted))
    Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), pos.x, pos.y, pos.z,  true,  true, false)
    SetEntityCollision(bag, false, true)

    local x, y, z = table.unpack(GetEntityCoords(ped))
    local charge = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.2,  true,  true, true)
    SetEntityCollision(charge, false, true)
    AttachEntityToEntity(charge, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Wait(5000)
    DetachEntity(charge, 1, 1)
    FreezeEntityPosition(charge, true)
    DeleteObject(bag)
    NetworkStopSynchronisedScene(bagscene)
    CreateThread(function()
        Wait(15000)
        DeleteEntity(charge)
    end)
end

function ThermiteTruckSuccess()
    TriggerServerEvent("QBCore:Server:RemoveItem", "thermite", 1)
    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["thermite"], "remove")
    QBCore.Functions.Notify('Thermite Successful',"error")
    ThermiteEffect()
end

function ThermiteTruckFailed()
    TriggerServerEvent("QBCore:Server:RemoveItem", "thermite", 1)
    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["thermite"], "remove")
    QBCore.Functions.Notify('Thermite Failed',"error")
end

function ThermiteEffect()
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do
        Wait(50)
    end
    local ped = PlayerPedId()
    local ptfx = GetEntryPositionOfDoor(attempted, 3)
    Wait(1500)
    TriggerServerEvent("qb-truckrobbery:server:ThermitePtfx", ptfx)
    Wait(500)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Wait(20000)
    ClearPedTasks(ped)
    Wait(2000)
end

RegisterNetEvent("qb-truckrobbery:client:ThermitePtfx", function(coords)
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
        Wait(50)
    end
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", coords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Wait(22500)
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent("qb-truckrobbery:client:UseBlackCard", function()
    local ped = PlayerPedId()
    local coordA = GetEntityCoords(ped, 1)
    local coordB = GetOffsetFromEntityInWorldCoords(ped, 0.0,100.0, 0.0)
    local targetVehicle = getVehicleInDirection(coordA, coordB)
    if targetVehicle ~= 0 and GetHashKey("stockade") == GetEntityModel(targetVehicle) then
        local entityCreatePoint = GetOffsetFromEntityInWorldCoords(targetVehicle, 0.0, -4.0, 0.0)
        local coords = GetEntityCoords(ped)
        local distance = #(coords - vector3(entityCreatePoint["x"],entityCreatePoint["y"],entityCreatePoint["z"]))
        if distance < 2.0 then
            TriggerEvent("qb-truckrobbery:client:AttemptHeist", targetVehicle)
        else
            QBCore.Functions.Notify('You need to do this from behind the vehicle.')
        end
    end
end)

RegisterNetEvent('qb-truckrobbery:client:AttemptHeist', function(veh)
    QBCore.Functions.TriggerCallback('qb-truckrobbery:server:getCops', function(cops)
        local plate = GetVehicleNumberPlateText(veh)
        if not Config.RobbedPlates[plate] then
            if cops >= Config.MinCops then
                --enough cops
                attempted = veh
                SetEntityAsMissionEntity(attempted, true, true)
                local pedCo = GetEntityCoords(PlayerPedId())
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                -- call cops
                if not copsCalled then
                    local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z)
                    local street1 = GetStreetNameFromHashKey(s1)
                    local street2 = GetStreetNameFromHashKey(s2)
                    local streetLabel = street1
                    if street2 ~= nil then 
                        streetLabel = streetLabel .. " " .. street2
                    end
                    exports['ps-dispatch']:BankTruck()
                    -- TriggerServerEvent("qb-truckrobbery:server:callCops", "Banktruck", 0, streetLabel, pos)
                    copsCalled = true
                    CreateThread(function()
                        Wait(5*60*1000)
                        copsCalled = false
                    end)
                end
                -- unlocking doors progressbar
                QBCore.Functions.Progressbar("unlockdoor_action", "Unlocking Door", 5000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true
                }, {
                    animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                    anim = "machinic_loop_mechandplayer",
                    flags = 49
                }, {}, {}, function(status)
                    if not status then
                        TriggerEvent("qb-truckrobbery:client:AllowHeist", veh, "card")
                        TriggerServerEvent("qb-truckrobbery:server:removeItem")
                    end
                end)
            else
                --not enough cops
                QBCore.Functions.Notify('Not enough cops',"error", 2000)
            end
        else
            QBCore.Functions.Notify('This truck has recently been robbed',"error", 2000)
        end
    end)
end)

RegisterNetEvent('qb-truckrobbery:client:robberyCall', function(type, key, streetLabel, coords)
    if PlayerJob.name == "police" then
        local cameraId = nil
        local bank = "Banktruck"
        if type == "Banktruck" then
            PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
            TriggerEvent('chatMessage', "ALARM", "warning", "Banktruck robbery")
            TriggerEvent('qb-policealerts:client:AddPoliceAlert', {
                timeOut = 10000,
                alertTitle = "Banktruck robbery in progress",
                coords = {
                    x = coords.x,
                    y = coords.y,
                    z = coords.z,
                },
                details = {
                    [1] = {
                        icon = '<i class="fas fa-university"></i>',
                        detail = bank,
                    },
                    [2] = {
                        icon = '<i class="fas fa-globe-europe"></i>',
                        detail = streetLabel,
                    },
                },
                callSign = QBCore.Functions.GetPlayerData().metadata["callsign"],
            })

            local transG = 250
            local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
            SetBlipSprite(blip, 487)
            SetBlipColour(blip, 4)
            SetBlipDisplay(blip, 4)
            SetBlipAlpha(blip, transG)
            SetBlipScale(blip, 1.9)
            SetBlipFlashes(blip, true)
            SetBlipAsShortRange(blip, false)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString("911: Truckrobbery")
            EndTextCommandSetBlipName(blip)
            
            while transG ~= 0 do
                Wait(180 * 4)
                transG = transG - 1
                SetBlipAlpha(blip, transG)
                if transG == 0 then
                    SetBlipSprite(blip, 2)
                    RemoveBlip(blip)
                    return
                end
            end
        end
    end
end)

RegisterNetEvent('qb-truckrobbery:client:AllowHeist', function(veh,type)
    -- update robbed plate config
    local plate = GetVehicleNumberPlateText(veh)
    TriggerServerEvent('qb-truckrobbery:server:UpdatePlates', plate)
    -- add guards
    TriggerEvent("qb-truckrobbery:client:AddGuards", attempted)
    if type == "thermite" then
        -- remove doors
        TriggerServerEvent('qb-truckrobbery:server:RemoveDoors', attempted)
    elseif type == "card" then
        -- open doors
        SetVehicleDoorOpen(attempted, 2, 0, 0)
        SetVehicleDoorOpen(attempted, 3, 0, 0)
    end
    -- pick up loot loop
    TriggerEvent("qb-truckrobbery:client:PickupCash")
end)

RegisterNetEvent('qb-truckrobbery:client:RemoveDoors', function(truck)
    SetVehicleDoorBroken(truck, 2, false)
    SetVehicleDoorBroken(truck, 3, false)
end)

RegisterNetEvent('qb-truckrobbery:client:UpdatePlates', function(plate)
    Config.RobbedPlates[plate] = true
end)

RegisterNetEvent('qb-truckrobbery:client:AddGuards', function(veh)
    local pedmodel = `ig_casey`
    RequestModel(pedmodel)
    while not HasModelLoaded(pedmodel) do
        RequestModel(pedmodel)
        Wait(100)
    end

    guard1 = CreatePedInsideVehicle(veh, 4, pedmodel, 1, 1, 0.0)
    guard2 = CreatePedInsideVehicle(veh, 4, pedmodel, 2, 1, 0.0)
    GiveWeaponToPed(guard1, `WEAPON_SMG`, 420, 0, 1)
    GiveWeaponToPed(guard2, `WEAPON_SMG`, 420, 0, 1)
    SetPedMaxHealth(guard1, 350)
    SetPedMaxHealth(guard2, 350)
    SetPedDropsWeaponsWhenDead(guard1, false)
    SetPedRelationshipGroupDefaultHash(guard1, `COP`)
    SetPedRelationshipGroupHash(guard1, `COP`)
    SetPedAsCop(guard1, true)
    SetCanAttackFriendly(guard1, false, true)
    SetPedDropsWeaponsWhenDead(guard2, false)
    SetPedRelationshipGroupDefaultHash(guard2, `COP`)
    SetPedRelationshipGroupHash(guard2, `COP`)
    SetPedAsCop(guard2, true)
    SetCanAttackFriendly(guard2, false, true)
    TaskCombatPed(guard1, PlayerPedId(), 0, 16)
    TaskCombatPed(guard2, PlayerPedId(), 0, 16)
end)

RegisterNetEvent('qb-truckrobbery:client:PickupCash', function()
    pickup = true
    TriggerEvent("qb-truckrobbery:client:PickupCashLoop")
    local markerlocation = GetOffsetFromEntityInWorldCoords(attempted, 0.0, -3.7, 0.1)
    SetVehicleHandbrake(attempted, true)
    exports['qb-target']:AddBoxZone("TruckrobberyGrabItems", vector3(markerlocation["x"], markerlocation["y"], markerlocation["z"]), 1.2, 1.7, {
        name = "TruckrobberyGrabItems",
        heading = GetEntityHeading(attempted),
        debugPoly = false,
        minZ = markerlocation["z"]-1.0,
        maxZ = markerlocation["z"]+2.0
        }, {
        options = {
            {
                type = "client",
                event = "qb-truckrobbery:client:eye:takeitems",
                icon = "fas fa-wallet",
                label = "Grab Items"
            }
        },
        distance = 1.5,
    })
    Wait(180000)
    pickup = false
end)

RegisterNetEvent('qb-truckrobbery:client:eye:takeitems', function()
    pickUpCash()
    pickup = false
end)

function pickUpCash()
    if not pickingup then
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        pickingup = true
        RequestAnimDict("mini@repair")

        while not HasAnimDictLoaded("mini@repair") do 
            Wait(10) 
        end

        while pickingup do
            Wait(1)
            local coords2 = GetEntityCoords(PlayerPedId())
            local distance = #(coords - coords2)

            if distance > 1.0 or not pickup then 
                pickingup = false 
            end

            if not IsEntityPlayingAnim(ped, "mini@repair", "fixing_a_player", 3) then
                TaskPlayAnim(ped, "mini@repair", "fixing_a_player", 8.0, -8, -1, 49, 0, 0, 0, 0)
                FreezeEntityPosition(ped, true)
            end

            pickingup = false
            QBCore.Functions.Progressbar("truckrobbery", "Collecting Items", 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                ClearPedTasks(ped)
                TriggerServerEvent('qb-truckrobbery:server:addItem')
                FreezeEntityPosition(ped, false)
                QBCore.Functions.Notify("Successful..", "error")
                exports['qb-target']:RemoveZone("TruckrobberyGrabItems")
                SetVehicleHandbrake(attempted, false)
            end, function() -- Cancel
                ClearPedTasks(ped)
                FreezeEntityPosition(ped, false)
                QBCore.Functions.Notify("Cancelled..", "error")
            end)
        end
        ClearPedTasks(ped)
    end
end

function getVehicleInDirection(coordFrom, coordTo)
    local offset = 0
    local rayHandle
    local vehicle

    for i = 0, 100 do
        rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z,coordTo.x, coordTo.y,coordTo.z + offset, 10, PlayerPedId(), 0)
        a, b, c, d, vehicle = GetRaycastResult(rayHandle)
        offset = offset - 1
        if vehicle ~= 0 then 
            break 
        end
    end

    local distance = #(coordFrom - GetEntityCoords(vehicle))
    
    if distance > 25 then 
        vehicle = nil 
    end

    return vehicle ~= nil and vehicle or 0
end