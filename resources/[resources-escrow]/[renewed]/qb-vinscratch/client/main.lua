local QBCore = exports['qb-core']:GetCoreObject()
-- All the locals don't touch these else it will not work
local PlayerJob = {}
local VehicleHack = false
local location = 0
local VinBusy = false
local ongoing = false
local gps = false
local CanVinScratch = false
local FirstHack = false
local listen = false
local tier = ""
local job = ''
local BoostingRep = 0
local UseComputer = false
local copsCalled = false
local VehicleGPSCD = Config.StartCD
local Menus = { vinscratch = { text = "[E] Scratch Vehicle" } }

CurrentCops = 0

-- Down from this line comes all the CODE do NOT edit if you do NOT know what you are doing

-- Job Update and checks
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = true
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    onDuty = true
end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

Citizen.CreateThread(function()
    Wait(500)
    if QBCore.Functions.GetPlayerData() ~= nil then
        PlayerJob = QBCore.Functions.GetPlayerData().job
        onDuty = true
    end
end)
-- Ped Menus

-- Nathaniel's menu to start the job
RegisterNetEvent('qb-vinscratch:StartMenu', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    BoostingRep = PlayerData.metadata["boostingrep"]
    
    if BoostingRep >= Config.VinRep then 
        TriggerEvent('nh-context:sendMenu', {
            {
                id = 1,
                header = "Nathaniel",
                txt = BoostingRep.." Reputation"
            },
            {
                id = 2,
                header = "Job",
                txt = "Car boosting Job",
                params = {
                    event = "qb-vinscratch:StartBoostingJob",
                    args = {
                        number = 1,
                        id = 2
                    }
                }
            },
            {
                id = 3,
                header = "Job",
                txt = "Vinscratch Job",
                params = {
                    event = "qb-vinscratch:startvinjob",
                    args = {
                        number = 1,
                        id = 2
                    }
                }
            },
        })
    else 
        TriggerEvent('nh-context:sendMenu', {
            {
                id = 1,
                header = "Nathaniel",
                txt = BoostingRep.." Reputation"
            },
            {
                id = 2,
                header = "Job",
                txt = "Car boosting Job",
                params = {
                    event = "qb-vinscratch:StartBoostingJob",
                    args = {
                        number = 1,
                        id = 2
                    }
                }
            },
        })
    end
end)

-- Event to start vin scratch job
RegisterNetEvent('qb-vinscratch:startvinjob')
AddEventHandler('qb-vinscratch:startvinjob', function()
    QBCore.Functions.TriggerCallback('qb-vinscratching:server:IsVinScratchBusy', function(isBusy)
        local PlayerData = QBCore.Functions.GetPlayerData()
        if CurrentCops >= Config.MinCops then
            if PlayerData.money.cash >= Config.StartPrice then
                local ped = PlayerPedId()
                TriggerEvent('animations:client:EmoteCommandStart', {"crossarms2"})
                if not isBusy then
                    QBCore.Functions.Progressbar("qb-vinscratching:StartMeBar", "Talking to Nathaniel", 10000, false, false, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        job = 'vinscratch'
                        TriggerServerEvent('qb-vinscratch:server:MoneyCheck', job)
                        ClearPedTasks(ped)
                    end)
                else
                    QBCore.Functions.Notify("I Have no jobs for you right now...", "error", 4500) 
                end
            else 
                QBCore.Functions.Notify("I don't wanna speak with you", "error", 4500) 
            end
        else 
            QBCore.Functions.Notify("Not enough cops on...", "error", 4500) 
        end
    end)
end)

-- Boosting Job Start, also checks whether or not Boosting is busy
RegisterNetEvent('qb-vinscratch:StartBoostingJob')
AddEventHandler('qb-vinscratch:StartBoostingJob', function()
    QBCore.Functions.TriggerCallback('qb-vinscratching:server:IsBoostingBusy', function(isBusy)
        local PlayerData = QBCore.Functions.GetPlayerData()
        if CurrentCops >= Config.MinCops then
            if PlayerData.money.cash >= Config.StartPrice then
                local ped = PlayerPedId()
                TriggerEvent('animations:client:EmoteCommandStart', {"crossarms2"})
                if not isBusy then
                    QBCore.Functions.Progressbar("qb-vinscratching:StartMeBar", "Talking to Nathaniel", 10000, false, false, {
                        disableMovement = true,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        job = 'boosting'
                        TriggerServerEvent('qb-vinscratch:server:MoneyCheck', job)
                        ClearPedTasks(ped)
                    end)
                else
                    QBCore.Functions.Notify("I Have no jobs for you right now...", "error", 4500) 
                end
            else 
                QBCore.Functions.Notify("I don't wanna speak with you", "error", 4500) 
            end
        else 
            QBCore.Functions.Notify("Not enough cops on...", "error", 4500) 
        end
    end)
end)


-- Server callback that starts the actual job
RegisterNetEvent('qb-vinscratch:RecievingJob')
AddEventHandler('qb-vinscratch:RecievingJob', function()
    GetTier()
    VinBusy = true
end)

-- Get the tier of the car you are getting
function GetTier()
    if location == 0 then
        if job == 'vinscratch' then
                local PlayerData = QBCore.Functions.GetPlayerData()
                BoostingRep = PlayerData.metadata["boostingrep"]
                    local chance 
                    if BoostingRep < Config.VinSkipC then 
                        chance = math.random(1, 100)
                    elseif BoostingRep >=Config.VinSkipC and BoostingRep <= Config.VinSkipB then 
                        chance = math.random(Config.CCarChance, 100)
                    elseif BoostingRep >= Config.VinSkipB then 
                        chance = math.random(Config.BCarChance, 100)
                    end
                    Citizen.Wait(500)
                    -- Chance Shit
                    if chance <= Config.CCarChance then
                            location = math.random(1,Config.MaxCLocations) -- location = math.random(1,20) - C Tier
                            tier = "C"
                            SpawnVehicle(Config.CLocations[location].vehicle, Config.CLocations[location].vehiclepos.x, Config.CLocations[location].vehiclepos.y, Config.CLocations[location].vehiclepos.z, Config.CLocations[location].vehiclepos.h)
                    elseif chance >= Config.CCarChance+1 and chance < Config.BCarChance then -- 10%
                            location = math.random(1,Config.MaxBLocations)  -- location = math.random(11,20) -- B Tier
                            tier = "B"
                            SpawnVehicle(Config.BLocations[location].vehicle, Config.BLocations[location].vehiclepos.x, Config.BLocations[location].vehiclepos.y, Config.BLocations[location].vehiclepos.z, Config.BLocations[location].vehiclepos.h)
                    elseif chance >= Config.BCarChance+1 and chance < Config.ACarChance then -- 5%
                            location = math.random(1,Config.MaxALocations)  -- location = math.random(21,30) -- A Tier
                            tier = "A"
                            SpawnVehicle(Config.ALocations[location].vehicle, Config.ALocations[location].vehiclepos.x, Config.ALocations[location].vehiclepos.y, Config.ALocations[location].vehiclepos.z, Config.ALocations[location].vehiclepos.h)
                    elseif chance >= Config.ACarChance+1 and Config.SCarChance < 1980 then -- 4%
                            location = math.random(1,Config.MaxSLocations)  -- location = math.random(31,40) -- S Tier
                            tier = "S"
                            SpawnVehicle(Config.SLocations[location].vehicle, Config.SLocations[location].vehiclepos.x, Config.SLocations[location].vehiclepos.y, Config.SLocations[location].vehiclepos.z, Config.SLocations[location].vehiclepos.h)
                    elseif chance >= Config.SCarChance+1 and chance <= Config.SPCarChance then -- 1%
                            location = math.random(1,Config.MaxSPLocations)  -- location = math.random(41,50) -- S+ Tier
                            tier = "S+"
                            SpawnVehicle(Config.SPLocations[location].vehicle, Config.SPLocations[location].vehiclepos.x, Config.SPLocations[location].vehiclepos.y, Config.SPLocations[location].vehiclepos.z, Config.SPLocations[location].vehiclepos.h)
                    end
                        TriggerEvent("qb-vinscratch:startmail", location)
        elseif job == 'boosting' then 
            local chance = math.random(1,100)
                if chance <= Config.CCarChance then
                    location = math.random(1,Config.MaxCLocations) -- location = math.random(1,20) - C Tier
                    tier = "C"
                    SpawnVehicle(Config.CLocations[location].vehicle, Config.CLocations[location].vehiclepos.x, Config.CLocations[location].vehiclepos.y, Config.CLocations[location].vehiclepos.z, Config.CLocations[location].vehiclepos.h)
                elseif chance >= Config.CCarChance+1 and chance < Config.BCarChance then -- 10%
                    location = math.random(1,Config.MaxBLocations)  -- location = math.random(11,20) -- B Tier
                    tier = "B"
                    SpawnVehicle(Config.BLocations[location].vehicle, Config.BLocations[location].vehiclepos.x, Config.BLocations[location].vehiclepos.y, Config.BLocations[location].vehiclepos.z, Config.BLocations[location].vehiclepos.h)
                elseif chance >= Config.BCarChance+1 and chance < Config.ACarChance then -- 5%
                    location = math.random(1,Config.MaxALocations)  -- location = math.random(21,30) -- A Tier
                    tier = "A"
                    SpawnVehicle(Config.ALocations[location].vehicle, Config.ALocations[location].vehiclepos.x, Config.ALocations[location].vehiclepos.y, Config.ALocations[location].vehiclepos.z, Config.ALocations[location].vehiclepos.h)
                elseif chance >= Config.ACarChance+1 and Config.SCarChance < 1980 then -- 4%
                    location = math.random(1,Config.MaxSLocations)  -- location = math.random(31,40) -- S Tier
                    tier = "S"
                    SpawnVehicle(Config.SLocations[location].vehicle, Config.SLocations[location].vehiclepos.x, Config.SLocations[location].vehiclepos.y, Config.SLocations[location].vehiclepos.z, Config.SLocations[location].vehiclepos.h)
                elseif chance >= Config.SCarChance+1 and chance <= Config.SPCarChance then -- 1%
                    location = math.random(1,Config.MaxSPLocations)  -- location = math.random(41,50) -- S+ Tier
                    tier = "S+"
                    SpawnVehicle(Config.SPLocations[location].vehicle, Config.SPLocations[location].vehiclepos.x, Config.SPLocations[location].vehiclepos.y, Config.SPLocations[location].vehiclepos.z, Config.SPLocations[location].vehiclepos.h)
                end
            TriggerEvent("qb-vinscratch:startmail", location)
        end
    else 
        QBCore.Functions.Notify("You already got a job", "error", 4500)
    end
end

-- After Recieving a location this loop will start going which will determine whether or not you are close enough
-- To start the job. 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if VinBusy then
            Citizen.Wait(1000)
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local dist
            if tier == "C" then
                dist = #(pos - vector3(Config.CLocations[location].vehiclepos.x, Config.CLocations[location].vehiclepos.y, Config.CLocations[location].vehiclepos.z))
            elseif tier == "B" then 
                dist = #(pos - vector3(Config.BLocations[location].vehiclepos.x, Config.BLocations[location].vehiclepos.y, Config.BLocations[location].vehiclepos.z))
            elseif tier == "A" then  
                dist = #(pos - vector3(Config.ALocations[location].vehiclepos.x, Config.ALocations[location].vehiclepos.y, Config.ALocations[location].vehiclepos.z))
            elseif tier == "S" then 
                dist = #(pos - vector3(Config.SLocations[location].vehiclepos.x, Config.SLocations[location].vehiclepos.y, Config.SLocations[location].vehiclepos.z))
            elseif tier == "S+" then 
                dist = #(pos - vector3(Config.SPLocations[location].vehiclepos.x, Config.SPLocations[location].vehiclepos.y, Config.SPLocations[location].vehiclepos.z))
            end
            Citizen.Wait(1)
            if dist <= 15 then
                if not copsCalled then 
                    local veh = QBCore.Functions.GetClosestVehicle()
                    local vehname = GetDisplayNameFromVehicleModel(GetEntityModel(veh)):lower()
                    local s1, s2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
                    local street1 = GetStreetNameFromHashKey(s1)
                    local street2 = GetStreetNameFromHashKey(s2)
                    local streetLabel = street1
                    if street2 ~= nil then 
                        streetLabel = streetLabel .. " " .. street2
                    end
                    TriggerServerEvent("qb-vinscratch:server:callCops", streetLabel, pos, job, LicensePlate, vehname)
                    copsCalled = true
                end
                if dist <= 5 then
                    Citizen.Wait(1000)
                    spawnPed(tier)
                    VinBusy = false
                    local veh = GetVehiclePedIsIn(ped, false)
                    if GetVehicleNumberPlateText(veh) ~= LicensePlate then
                        if job == 'boosting' then
                            local TrackerChance = math.random(1,100)
                            if TrackerChance <= 10 then 
                                copsCalled = false
                                RemoveBlip(blip)
                                ongoing = true
                                gps = true
                                TriggerEvent('qb-vinscratch:marker')
                                QBCore.Functions.Notify("There is a Tracker in the vehicle", "error", 4500)
                                Citizen.Wait(15000)
                                QBCore.Functions.Notify("There is a Tracker in the vehicle", "error", 4500)
                            else 
                                copsCalled = false
                                RemoveBlip(blip)
                                Citizen.Wait(1000)
                                QBCore.Functions.Notify("Go turn in the vehicle to finish the job!", "error", 4500)
                                Citizen.Wait(1000)
                                CreateHandoffBlip()
                                SetNewWaypoint(Config.TurnInLocation.x, Config.TurnInLocation.y)
                            end
                        elseif job == 'vinscratch' then
                            copsCalled = false
                            RemoveBlip(blip)
                            ongoing = true
                            gps = true
                            TriggerEvent('qb-vinscratch:marker')
                            QBCore.Functions.Notify("There is a Tracker in the vehicle", "error", 4500)
                        end
                    end
                end
            end
        end
    end
end)

-- Once in distance the Peds will start spawning with weapons etc.
function spawnPed(tier)
    if tier == "C" then
        local pedtype = Config.CLocations[location].ped
        local weapon = Config.CLocations[location].weapon
        local pedmodel = GetHashKey(pedtype)

        RequestModel(pedmodel)
        while not HasModelLoaded(pedmodel) do
            RequestModel(pedmodel)
            Citizen.Wait(100)
        end

        for k, v in pairs(Config.CLocations[location].coords) do
            local spawnedped = CreatePed(1, pedmodel, v.x, v.y, v.z, true, true)
            GiveWeaponToPed(spawnedped, GetHashKey(weapon), 90, 0, 1)
            SetPedMaxHealth(spawnedped, 500)
            SetPedDropsWeaponsWhenDead(spawnedped, false)
            SetPedAsCop(spawnedped, true)
            SetCanAttackFriendly(spawnedped, false, true)
            TaskCombatPed(spawnedped, PlayerPedId(), 0, 16)
            SetPedAccuracy(spawnedped, 100)
            SetPedArmour(spawnedped, 100)
            SetPedCombatAttributes(spawnedped, 46, 1)
            SetPedCombatAbility(spawnedped, 100)
            SetPedAsEnemy(spawnedped, 1)
            SetPedKeepTask(spawnedped, true)
            SetPedFleeAttributes(spawnedped, 0, 0)
            SetPedRelationshipGroupHash(spawnedped, GetHashKey("HATES_PLAYER"))
            SetPedAsEnemy(spawnedped, 1)
            TaskGoStraightToCoord(spawnedped, Config.CLocations[location].vehiclepos.x, Config.CLocations[location].vehiclepos.y, Config.CLocations[location].vehiclepos.z, 1, -1, 0.0, 0.0)
        end
    elseif tier == "B" then
        local pedtype = Config.BLocations[location].ped
        local weapon = Config.BLocations[location].weapon
        local pedmodel = GetHashKey(pedtype)

        RequestModel(pedmodel)
        while not HasModelLoaded(pedmodel) do
            RequestModel(pedmodel)
            Citizen.Wait(100)
        end

        for k, v in pairs(Config.BLocations[location].coords) do
             spawnedped = CreatePed(1, pedmodel, v.x, v.y, v.z, true, true)
            GiveWeaponToPed(spawnedped, GetHashKey(weapon), 90, 0, 1)
            SetPedMaxHealth(spawnedped, 500)
            SetPedDropsWeaponsWhenDead(spawnedped, false)
            SetPedAsCop(spawnedped, true)
            SetCanAttackFriendly(spawnedped, false, true)
            TaskCombatPed(spawnedped, PlayerPedId(), 0, 16)
            SetPedAccuracy(spawnedped, 100)
            SetPedArmour(spawnedped, 100)
            SetPedCombatAttributes(spawnedped, 46, 1)
            SetPedCombatAbility(spawnedped, 100)
            SetPedAsEnemy(spawnedped, 1)
            SetPedKeepTask(spawnedped, true)
            SetPedFleeAttributes(spawnedped, 0, 0)
            SetPedRelationshipGroupHash(spawnedped, GetHashKey("HATES_PLAYER"))
            SetPedAsEnemy(spawnedped, 1)
            TaskGoStraightToCoord(spawnedped, Config.BLocations[location].vehiclepos.x, Config.BLocations[location].vehiclepos.y, Config.BLocations[location].vehiclepos.z, 1, -1, 0.0, 0.0)
        end
    elseif tier == "A" then
        local pedtype = Config.ALocations[location].ped
        local weapon = Config.ALocations[location].weapon
        local pedmodel = GetHashKey(pedtype)

        RequestModel(pedmodel)
        while not HasModelLoaded(pedmodel) do
            RequestModel(pedmodel)
            Citizen.Wait(100)
        end

        for k, v in pairs(Config.ALocations[location].coords) do
             spawnedped = CreatePed(1, pedmodel, v.x, v.y, v.z, true, true)
            GiveWeaponToPed(spawnedped, GetHashKey(weapon), 90, 0, 1)
            SetPedMaxHealth(spawnedped, 500)
            SetPedDropsWeaponsWhenDead(spawnedped, false)
            SetPedAsCop(spawnedped, true)
            SetCanAttackFriendly(spawnedped, false, true)
            TaskCombatPed(spawnedped, PlayerPedId(), 0, 16)
            SetPedAccuracy(spawnedped, 100)
            SetPedArmour(spawnedped, 100)
            SetPedCombatAttributes(spawnedped, 46, 1)
            SetPedCombatAbility(spawnedped, 100)
            SetPedAsEnemy(spawnedped, 1)
            SetPedKeepTask(spawnedped, true)
            SetPedFleeAttributes(spawnedped, 0, 0)
            SetPedRelationshipGroupHash(spawnedped, GetHashKey("HATES_PLAYER"))
            SetPedAsEnemy(spawnedped, 1)
            TaskGoStraightToCoord(spawnedped, Config.ALocations[location].vehiclepos.x, Config.ALocations[location].vehiclepos.y, Config.ALocations[location].vehiclepos.z, 1, -1, 0.0, 0.0)
        end
    elseif tier == "S" then
        local pedtype = Config.SLocations[location].ped
        local weapon = Config.SLocations[location].weapon
        local pedmodel = GetHashKey(pedtype)

        RequestModel(pedmodel)
        while not HasModelLoaded(pedmodel) do
            RequestModel(pedmodel)
            Citizen.Wait(100)
        end

        for k, v in pairs(Config.SLocations[location].coords) do
             spawnedped = CreatePed(1, pedmodel, v.x, v.y, v.z, true, true)
            GiveWeaponToPed(spawnedped, GetHashKey(weapon), 90, 0, 1)
            SetPedMaxHealth(spawnedped, 500)
            SetPedDropsWeaponsWhenDead(spawnedped, false)
            SetPedAsCop(spawnedped, true)
            SetCanAttackFriendly(spawnedped, false, true)
            TaskCombatPed(spawnedped, PlayerPedId(), 0, 16)
            SetPedAccuracy(spawnedped, 100)
            SetPedArmour(spawnedped, 100)
            SetPedCombatAttributes(spawnedped, 46, 1)
            SetPedCombatAbility(spawnedped, 100)
            SetPedAsEnemy(spawnedped, 1)
            SetPedKeepTask(spawnedped, true)
            SetPedFleeAttributes(spawnedped, 0, 0)
            SetPedRelationshipGroupHash(spawnedped, GetHashKey("HATES_PLAYER"))
            SetPedAsEnemy(spawnedped, 1)
            TaskGoStraightToCoord(spawnedped, Config.SLocations[location].vehiclepos.x, Config.SLocations[location].vehiclepos.y, Config.SLocations[location].vehiclepos.z, 1, -1, 0.0, 0.0)
        end
    elseif tier == "S+" then
        local pedtype = Config.SPLocations[location].ped
        local weapon = Config.SPLocations[location].weapon
        local pedmodel = GetHashKey(pedtype)

        RequestModel(pedmodel)
        while not HasModelLoaded(pedmodel) do
            RequestModel(pedmodel)
            Citizen.Wait(100)
        end

        for k, v in pairs(Config.SPLocations[location].coords) do
             spawnedped = CreatePed(1, pedmodel, v.x, v.y, v.z, true, true)
            GiveWeaponToPed(spawnedped, GetHashKey(weapon), 90, 0, 1)
            SetPedMaxHealth(spawnedped, 500)
            SetPedDropsWeaponsWhenDead(spawnedped, false)
            SetPedAsCop(spawnedped, true)
            SetCanAttackFriendly(spawnedped, false, true)
            TaskCombatPed(spawnedped, PlayerPedId(), 0, 16)
            SetPedAccuracy(spawnedped, 100)
            SetPedArmour(spawnedped, 100)
            SetPedCombatAttributes(spawnedped, 46, 1)
            SetPedCombatAbility(spawnedped, 100)
            SetPedAsEnemy(spawnedped, 1)
            SetPedKeepTask(spawnedped, true)
            SetPedFleeAttributes(spawnedped, 0, 0)
            SetPedRelationshipGroupHash(spawnedped, GetHashKey("HATES_PLAYER"))
            SetPedAsEnemy(spawnedped, 1)
            TaskGoStraightToCoord(spawnedped, Config.SPLocations[location].vehiclepos.x, Config.SPLocations[location].vehiclepos.y, Config.SPLocations[location].vehiclepos.z, 1, -1, 0.0, 0.0)
        end
    end
end 

CreateThread(function()
    AddEventHandler('onResourceStop', function(resourceName)
        if (GetCurrentResourceName() ~= resourceName) then
          return
        end
        DeleteEntity(spawnedped)
        print('22222222222222222222222222 The resource ' .. resourceName .. ' was stopped.')
      end)
end)
  
-- Function to spawn the vehicle, and send the email and Blip
function SpawnVehicle(vehicle, x, y, z, h)
    local coords = vector4(x, y, z, h)
    QBCore.Functions.SpawnVehicle(vehicle, function(veh)
        SetEntityHeading(veh, coords.w)
        SetVehicleEngineOn(veh, false, false)
        SetVehicleOnGroundProperly(veh)
        SetVehicleNeedsToBeHotwired(veh, false)
        SetVehicleDoorsLocked(veh, 2)
        exports['lj-fuel']:SetFuel(veh, 100.0)
        for i = 0, 5 do
            SetVehicleDoorShut(veh, i, true)
        end
        LicensePlate = GetVehicleNumberPlateText(veh)
        coordsproblipx, coordsproblipy = x, y
        QBCore.Functions.Notify('I will send some information to your email.', 'success')
    end, coords, true)
end

RegisterNetEvent('qb-vinscratch:startmail')
AddEventHandler('qb-vinscratch:startmail', function(location)
    local vehicle
    if tier == "C" then 
        vehicle = Config.CLocations[location].vehicle
    elseif tier == "B" then
        vehicle = Config.BLocations[location].vehicle
    elseif tier == "A" then 
        vehicle = Config.ALocations[location].vehicle
    elseif tier == "S" then 
        vehicle = Config.SLocations[location].vehicle
    elseif tier == "S+" then 
        vehicle = Config.SPLocations[location].vehicle
    end
    Citizen.Wait(math.random(15000,30000))
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "Nathaniel",
        subject = "Vehicle Located",
        message = "Yo<br><br> One of my scouters found a<br><b>" .. vehicle .. "<br><br>I sent you the cars approximate location to your GPS go find it.<br><br><b>Nathaniel</b>",
    })
    CreateBlip(coordsproblipx, coordsproblipy)
end)


-- Creates the blip for the car
function CreateBlip()
    coordsproblipx = coordsproblipx + math.random(-75.0, 75.0)
    coordsproblipy = coordsproblipy + math.random(-75.0, 75.0)
    
    blip = AddBlipForRadius(coordsproblipx, coordsproblipy, 0.0, 100.0)
    SetBlipSprite(blip, 9)
    SetBlipColour(blip, 38)
    SetBlipAlpha(blip, 80)
end

function CreateScratchBlip()
    ScratchBlip = AddBlipForCoord(Config.ScratchBlip.x, Config.ScratchBlip.y, Config.ScratchBlip.z)
    SetBlipSprite(ScratchBlip, 289)
    SetBlipDisplay(ScratchBlip, 4)
    SetBlipScale(ScratchBlip, 0.6)
    SetBlipColour(ScratchBlip, 60)
    SetBlipAsShortRange(ScratchBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Scratch Location")
    EndTextCommandSetBlipName(ScratchBlip)
end

function CreateHandoffBlip()
    HandOffBlip = AddBlipForCoord(Config.TurnInLocation.x, Config.TurnInLocation.y, Config.TurnInLocation.z)
    SetBlipSprite(HandOffBlip, 289)
    SetBlipDisplay(HandOffBlip, 4)
    SetBlipScale(HandOffBlip, 0.6)
    SetBlipColour(HandOffBlip, 60)
    SetBlipAsShortRange(HandOffBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Handoff Location")
    EndTextCommandSetBlipName(HandOffBlip)
end

-- Vehicle Blips Cooldown Trigger

RegisterNetEvent('qb-vinscratch:vehiclechipCD')
AddEventHandler('qb-vinscratch:vehiclechipCD', function()
    local timer = math.random(1000,4000)
    local seconds = math.ceil(timer/1000)
    VehicleGPSCD = VehicleGPSCD + timer
    QBCore.Functions.Notify("You have delayed the tracker by another "..seconds.." seconds", "success", 4500)
end)


-- The actual marker that marks stuff once entering the Vehicle
RegisterNetEvent('qb-vinscratch:marker')
AddEventHandler('qb-vinscratch:marker', function()
	while ongoing do
        Citizen.Wait(100)
        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)
        local platetex4k = GetVehicleNumberPlateText(vehicle)
        if IsPedSittingInVehicle(ped, vehicle) then
            if platetex4k == LicensePlate then
                if not VehicleHack then 
                    VehicleHack = true
                end
                local cveh = GetVehiclePedIsIn(ped, false)
                local coord = GetEntityCoords(cveh)
                if gps then
                    if VehicleGPSCD <= Config.MaxCD then 
                        TriggerServerEvent('qb-vinscratch:gps',coord)
                        Citizen.Wait(VehicleGPSCD)
                    end
                end
            else
                ongoing = false
                QBCore.Functions.Notify("You exited the vehicle job canceled", "error", 4500)
                TriggerServerEvent('qb-vinscratch:server:JobPunishment')
                TriggerEvent('qb-vinscratch:client:resetjob')
            end
        end
	end
end)


-- Vehicle blip that got returned from server side to link between all client
RegisterNetEvent('qb-vinscratch:vehblip')
AddEventHandler('qb-vinscratch:vehblip', function(targetCoords)
	if PlayerJob.name == "police" and onDuty or PlayerJob.name == "BCSO" and onDuty or PlayerJob.name == "sast" and onDuty then 

        local vehBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, 35.0)
        SetBlipHighDetail(vehBlip, true)
        SetBlipColour(vehBlip, 1)
        SetBlipAsShortRange(vehBlip, true)
        Citizen.Wait(VehicleGPSCD+50)
        RemoveBlip(vehBlip)
	end
end)


-- The hack that can remove the chip from PD radars
RegisterNetEvent('qb-vinscratch:client:trackremover')
AddEventHandler('qb-vinscratch:client:trackremover', function()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    local platetex4k = GetVehicleNumberPlateText(vehicle)
        if platetex4k == LicensePlate and VehicleHack and ongoing then
            if VehicleGPSCD <= Config.MaxCD then
                if not FirstHack then
                    local ped = PlayerPedId()
                    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
                    QBCore.Functions.Progressbar("QBVinAttatchDevice", "Attatching Hacking Device", 12000, false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function()
                        ClearPedTasks(ped)
                        FirstHack = true
                        TriggerEvent('qb-vinscratch:vehiclechipCD')
                    end)
                else
                    TriggerEvent('qb-vinscratch:vehiclechipCD')
                end
            else
                local ped = PlayerPedId()
                TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
                QBCore.Functions.Progressbar("VinScratchHackDone", "Removing hacking device...", 9000, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                    ClearPedTasks(ped)
                    QBCore.Functions.Notify("The tracker has overheated! Police no longer sees you!", "success", 4500)
                    Citizen.Wait(10000)
                    CreateScratchBlip()
                    QBCore.Functions.Notify("Scratch location is marked in your GPS", "success", 4500)
                    UseComputer = true
                    VehicleHack = false
                    FirstHack = false
                    ongoing = false
                    gps = false
                    SetNewWaypoint(Config.ScratchBlip.x, Config.ScratchBlip.y)
                    Citizen.Wait(15000)
                    QBCore.Functions.Notify("You can also go hand it off for money!", "success", 4500)
                    CreateHandoffBlip()
                end)
            end
        end
end)




-- Police alert function used to alert all active police on Duty
RegisterNetEvent('qb-vinscratch:client:robberyCall')
AddEventHandler('qb-vinscratch:client:robberyCall', function(streetLabel, coords, LicensePlate, vehname)
    if PlayerJob.name == "police" and onDuty or PlayerJob.name == "bcso" and onDuty or PlayerJob.name == "sast" and onDuty then
        local msg = vehname.." is getting Robbed"
        local LplateMSG = "License Plate "..LicensePlate
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        TriggerEvent('chatMessage', "ALARM", "warning", "Vinscratch robbery")
         TriggerEvent('qb-policealerts:client:AddPoliceAlert', {
            timeOut = 15000,
            alertTitle = "Advanced Vehicle Robbery",
            coords = {
                 x = coords.x,
                y = coords.y,
                z = coords.z,
            },
            details = {
                [1] = {
                     icon = '<i class="fas fa-car"></i>',
                    detail = msg,
                },
                [2] = {
                    icon = '<i class="fas fa-car"></i>',
                    detail = LplateMSG,
                },
                [3] = {
                    icon = '<i class="fas fa-globe-europe"></i>',
                    detail = streetLabel,
                },
            },
            callSign = QBCore.Functions.GetPlayerData().metadata["callsign"],
        })

        local transG = 250
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipSprite(blip, 227)
        SetBlipColour(blip, 4)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, transG)
        SetBlipScale(blip, 1.9)
        SetBlipFlashes(blip, true)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("911: vinscratch")
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
end)



-- Use to reset job if the vinscratch fails reset all triggers so client does NOT need to restart before doing it again
RegisterNetEvent('qb-vinscratch:client:resetjob')
AddEventHandler('qb-vinscratch:client:resetjob', function()
    if VehicleHack then 
        VehicleHack = false
    elseif location >= 1 then 
        location = 0
    elseif VinBusy then 
        VinBusy = false
    elseif ongoing then 
        ongoing = false
    elseif gps then 
        gps = false 
    elseif CanVinScratch then
        CanVinScratch = false
    elseif FirstHack then 
        FirstHack = false 
    elseif UseComputer then 
        UseComputer = false
    elseif copsCalled then 
        copsCalled = false 
    end

    RemoveBlip(blip)
    RemoveBlip(ScratchBlip)
    RemoveBlip(HandOffBlip)

    job = ''
    tier = ""
end)



-- First Event being called from BT target when using computer to setup for the vinscratch
RegisterNetEvent('qb-vinscratch:client:DataStuff')
AddEventHandler('qb-vinscratch:client:DataStuff', function()
    if UseComputer then
        local ped = PlayerPedId()
        SetEntityCoords(ped, -230.29, -2661.85, 5.0)
        SetEntityHeading(ped, 85.78)
        TriggerEvent('animations:client:EmoteCommandStart', {"type"})
        QBCore.Functions.Progressbar("ClearDataVin", "Wiping Online Paperwork...", 9000, false, false, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            TriggerEvent('qb-vinscratch:client:ReplaceData')
        end)
    else 
        QBCore.Functions.Notify("You can't use this Computer!", "error", 4500)
    end
end)

-- Second event that replaces data in the vehicle
RegisterNetEvent('qb-vinscratch:client:ReplaceData')
AddEventHandler('qb-vinscratch:client:ReplaceData', function()
    if UseComputer then
        local ped = PlayerPedId()
        SetEntityCoords(ped, -230.29, -2661.85, 5.0)
        SetEntityHeading(ped, 85.78)
        TriggerEvent('animations:client:EmoteCommandStart', {"type2"})
        QBCore.Functions.Progressbar("ReplacingDataVinS", "Making a false document...", 6500, false, false, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            ClearPedTasks(ped)
            QBCore.Functions.Notify("All data has been replaced go scratch the vehicle!", "success", 4500)
            RemoveBlip(ScratchBlip)
            CanVinScratch = true
            UseComputer = false
        end)
    end
end)


-- Event that starts listening for control using PolyzoneHelper
local function startListening4Control()
    listen = true
    Citizen.CreateThread(function()
        while listen do
            if IsControlJustReleased(0, 38) then -- E
                if Config.RequiredItem then
                    QBCore.Functions.TriggerCallback('qb-vinscratch:server:GetItem', function(hasItem)
                        if hasItem then
                            TriggerEvent('qb-vinscratch:ScratchTheVin')
                        else 
                            QBCore.Functions.Notify("You have nothing to scratch the vin with!", "error", 4500)
                        end
                    end, Config.RareItem)
                else 
                    TriggerEvent('qb-vinscratch:ScratchTheVin')
                end
            end
            Wait(0)
        end
    end)
end

-- The scratch event itself DO NOT touch this if you do NOT know what you are doing
RegisterNetEvent('qb-vinscratch:ScratchTheVin')
AddEventHandler('qb-vinscratch:ScratchTheVin', function()
    local vehicleHash = QBCore.Functions.GetClosestVehicle()
    local vehicle = GetDisplayNameFromVehicleModel(GetEntityModel(vehicleHash)):lower()
    local veh = GetVehiclePedIsIn(PlayerPedId(), false)
    if GetVehicleNumberPlateText(veh) ~= LicensePlate then
        local ped = PlayerPedId()
        TriggerEvent('animations:client:EmoteCommandStart', {"kneel3"})
        TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
        QBCore.Functions.Progressbar("qb-vinscratch:removingVin", "Scratching Vin", 14000, false, false, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
            ClearPedTasks(ped)
            CanVinScratch = false
            TriggerServerEvent('qb-vinscratch:server:GetVehicleWhenDone', vehicle, LicensePlate, job)
            location = 0
            QBCore.Functions.Notify("The car is yours! GO park it so the Police don't catch you!", "success", 5500)
            TriggerEvent('qb-vinscratch:client:resetjob')
            Citizen.Wait(math.random(10000,15000))
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender = "Nathaniel",
                subject = "Congrats!",
                message = "Yo<br><br> I heard you got the <br><b>Vehicle</b> <br><br>But be carefull I heard PD is still looking for it so be Carefull!<br><b><br><br><b>Nathaniel</b>",
            })
        end)
    else
        QBCore.Functions.Notify("This is NOT the right vehicle", "error", 4500) 
    end
end)


-- Function to get money and potential rare item during a job
RegisterNetEvent('qb-vinscratch:GetMonitaryFromBoost')
AddEventHandler('qb-vinscratch:GetMonitaryFromBoost', function()
    if job == 'vinscratch' or job == 'boosting' then 
        local veh = QBCore.Functions.GetClosestVehicle()
        local Closestplate = GetVehicleNumberPlateText(veh)
        local vehname = GetDisplayNameFromVehicleModel(GetEntityModel(veh)):lower()
        if Closestplate == LicensePlate then
            local ped = PlayerPedId()
            TriggerEvent('animations:client:EmoteCommandStart', {"wait2"})
            QBCore.Functions.Progressbar("qb-vinscratch:removingVin", "Turning in Car", 8000, false, false, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                ClearPedTasks(ped)
                local damaged = GetVehicleEngineHealth(veh)

                TriggerServerEvent('qb-vinscratch:server:GetMonitaryReward', vehname, damaged, job, tier)

                SetEntityAsMissionEntity(veh, true, true)
                DeleteVehicle(veh)
                location = 0

                local chance = math.random(1,100)
                local hackchance = math.random(1,100)

                if chance <= Config.RareItemChance then
                    Citizen.Wait(5000)
                    TriggerServerEvent('qb-vinscratch:server:GetRareItem', vehname, job)
                end

                if hackchance <= Config.RareItemChance then 
                    Citizen.Wait(5000)
                    TriggerServerEvent('qb-vinscratch:server:GetHackingItem', vehname, job)
                end

                TriggerEvent('qb-vinscratch:client:resetjob')

            end)
        else
            QBCore.Functions.Notify("This is NOT the right vehicle", "error", 4500) 
        end
    else 
        QBCore.Functions.Notify("I don't want to speak to you!", "error", 4500) 
    end
end)

-- The rest down here is just PolyZone helper stuff
Citizen.CreateThread(function()
    for k, v in pairs(Config.ScratchLocation) do
        exports["polyzonehelper"]:AddBoxZone("vinscratch", vector3(Config.ScratchLocation[k].polyzone.x, Config.ScratchLocation[k].polyzone.y, Config.ScratchLocation[k].polyzone.z), Config.ScratchLocation[k].polyzone1, Config.ScratchLocation[k].polyzone2, {
            name="vinscratch",
            heading=Config.ScratchLocation[k].heading,
            debugPoly=Config.DebugPolyzones,
            minZ = Config.ScratchLocation[k].minZ,
            maxZ = Config.ScratchLocation[k].maxZ
        }) 
    end
end)

AddEventHandler("polyzonehelper:enter", function(zone, data)
    local currentZone = Menus[zone]
    if currentZone and CanVinScratch and job == 'vinscratch' then
        exports["fjam-ui"]:showInteraction("[E] Scratch Plate", 'grey')
        startListening4Control()
        RemoveBlip(ScratchBlip)
    end
end)

AddEventHandler("polyzonehelper:exit", function(zone)
    local currentZone = Menus[zone]
    if currentZone then
        listen = false
        exports["fjam-ui"]:hideInteraction()
    end
end)

