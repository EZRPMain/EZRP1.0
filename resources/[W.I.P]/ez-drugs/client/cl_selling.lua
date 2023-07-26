local Framework = exports['qb-core']
local Functions = Framework:GetModule("Functions")

local hasTarget = false
local lastPed = {}
local stealingPed = nil
local stealData = {}
local availableDrugs = {}
local currentOfferDrug = nil
local CurrentCops = 0
local textDrawn = false
local zoneMade = false

local function LoadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

local function TooFarAway()
    Functions.Notify("Moved too far away", 'error')
    LocalPlayer.state:set("inv_busy", false, true)
    cornerselling = false
    hasTarget = false
    availableDrugs = {}
end

local function PoliceCall()
    if Config.PoliceCallChance <= math.random(1, 100) then
        exports['ps-dispatch']:DrugSale()
    end
end

local function RobberyPed()
    exports['qb-target']:AddTargetEntity(stealingPed,{
        options = {
            {
                icon = 'fas fa-magnifying-glass',
                label = 'Search ped',
                action = function()
                    local player = PlayerPedId()
                    RequestAnimDict("pickup_object")
                    while not HasAnimDictLoaded("pickup_object") do
                        Wait(0)
                    end
                    TaskPlayAnim(player, "pickup_object", "pickup_low", 8.0, -8.0, -1, 1, 0, false, false, false)
                    Wait(2000)
                    ClearPedTasks(player)
                    TriggerServerEvent('qb-drugs:server:giveStealItems', stealData.drugType, stealData.amount)
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[stealData.item], "add")
                    exports['qb-target']:RemoveTargetEntity(stealingPed)
                    stealingPed = nil
                    stealData = {}
                end,
                canInteract = function(entity)
                    if IsEntityDead(entity) then
                        return true
                    end
                end
            }
        },
        distance = 1.5,
    })
    CreateThread(function()
        while stealingPed do
            local playerPed = PlayerPedId()
            local pos = GetEntityCoords(playerPed)
            local pedpos = GetEntityCoords(stealingPed)
            local dist = #(pos - pedpos)
            if dist > 100 then
                exports['qb-target']:RemoveTargetEntity(stealingPed)
                stealingPed = nil
                stealData = {}
                break
            end
            Wait(0)
        end
    end)
end

local function SellToPed(ped)
    hasTarget = true

    for i = 1, #lastPed, 1 do
        if lastPed[i] == ped then
            hasTarget = false
            return
        end
    end

    local successChance = math.random(1, 100)
    local scamChance = math.random(1, 100)
    local getRobbed = math.random(1, 100)
    if successChance <= Config.SuccessChance then hasTarget = false return end

    local drugType = math.random(1, #availableDrugs)
    local bagAmount = math.random(1, availableDrugs[drugType].amount)
    if bagAmount > 15 then bagAmount = math.random(9, 15) end

    currentOfferDrug = availableDrugs[drugType]

    local ddata = Config.DrugsPrice[currentOfferDrug.item]
    local randomPrice = math.random(ddata.min, ddata.max) * bagAmount
    if scamChance <= Config.ScamChance then randomPrice = math.random(3, 10) * bagAmount end

    SetEntityAsNoLongerNeeded(ped)
    ClearPedTasks(ped)

    local coords = GetEntityCoords(PlayerPedId(), true)
    local pedCoords = GetEntityCoords(ped)
    local pedDist = #(coords - pedCoords)
    if getRobbed <= Config.RobberyChance then
        TaskGoStraightToCoord(ped, coords, 15.0, -1, 0.0, 0.0)
    else
        TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
    end

    while pedDist > 1.5 do
        coords = GetEntityCoords(PlayerPedId(), true)
        pedCoords = GetEntityCoords(ped)
        if getRobbed <= Config.RobberyChance then
            TaskGoStraightToCoord(ped, coords, 15.0, -1, 0.0, 0.0)
        else
            TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
        end
        TaskGoStraightToCoord(ped, coords, 1.2, -1, 0.0, 0.0)
        pedDist = #(coords - pedCoords)
        Wait(100)
    end

    TaskLookAtEntity(ped, PlayerPedId(), 5500.0, 2048, 3)
    TaskTurnPedToFaceEntity(ped, PlayerPedId(), 5500)
    TaskStartScenarioInPlace(ped, "WORLD_HUMAN_STAND_IMPATIENT_UPRIGHT", 0, false)

    if hasTarget then
        while pedDist < 1.5 and not IsPedDeadOrDying(ped) do
            local coords2 = GetEntityCoords(PlayerPedId(), true)
            local pedCoords2 = GetEntityCoords(ped)
            local pedDist2 = #(coords2 - pedCoords2)
            if getRobbed <= Config.RobberyChance then
                TriggerServerEvent('qb-drugs:server:robCornerDrugs', drugType, bagAmount)
                Functions.Notify(("You have been robbed and lost %s bag(s) %s"):format(bagAmount, availableDrugs[drugType].label))
                stealingPed = ped
                stealData = {
                    item = availableDrugs[drugType].item,
                    drugType = drugType,
                    amount = bagAmount,
                }
                hasTarget = false
                local moveto = GetEntityCoords(PlayerPedId())
                local movetoCoords = {x = moveto.x + math.random(100, 500), y = moveto.y + math.random(100, 500), z = moveto.z, }
                ClearPedTasksImmediately(ped)
                TaskGoStraightToCoord(ped, movetoCoords.x, movetoCoords.y, movetoCoords.z, 15.0, -1, 0.0, 0.0)
                lastPed[#lastPed + 1] = ped
                RobberyPed()
                break
            else
                if pedDist2 < 1.5 and cornerselling then
                    zoneMade = true
                    exports['qb-target']:AddTargetEntity(ped, {
                        options = {
                            {
                                icon = 'fas fa-hand-holding-dollar',
                                label = ("Sell %sx %s for $%s?"):format(bagAmount, currentOfferDrug.label, randomPrice),
                                action = function(entity)
                                    if IsPedInAnyVehicle(PlayerPedId(), false) then
                                        Functions.Notify("Can't sell while in a vehicle", 'error')
                                        hasTarget = false
                                        SetPedKeepTask(entity, false)
                                        SetEntityAsNoLongerNeeded(entity)
                                        ClearPedTasksImmediately(entity)
                                        lastPed[#lastPed + 1] = entity
                                        exports['qb-target']:RemoveTargetEntity(entity)
                                        return
                                    else
                                        Functions.Progressbar("cornerSelling", "Selling drugs...", '5000', false, false, {
                                            disableMovement = true,
                                            disableCarMovement = true,
                                            disableMouse = false,
                                            disableCombat = false,
                                        }, {}, {}, {}, function()
                                            TriggerServerEvent('qb-drugs:server:sellCornerDrugs', drugType, bagAmount, randomPrice)
                                            hasTarget = false
                                            LoadAnimDict("gestures@f@standing@casual")
                                            TaskPlayAnim(PlayerPedId(), "gestures@f@standing@casual", "gesture_point", 3.0, 3.0, -1, 49, 0, 0, 0, 0)
                                            Wait(650)
                                            ClearPedTasks(PlayerPedId())
                                            SetPedKeepTask(entity, false)
                                            SetEntityAsNoLongerNeeded(entity)
                                            ClearPedTasksImmediately(entity)
                                            lastPed[#lastPed + 1] = entity
                                            exports['qb-target']:RemoveTargetEntity(entity)
                                            PoliceCall()
                                        end)
                                    end
                                end,
                            },
                            {
                                icon = 'fas fa-x',
                                label = 'Decline offer',
                                action = function(entity)
                                    Functions.Notify("Offer declined", 'error')
                                    hasTarget = false
                                    SetPedKeepTask(entity, false)
                                    SetEntityAsNoLongerNeeded(entity)
                                    ClearPedTasksImmediately(entity)
                                    lastPed[#lastPed + 1] = entity
                                    exports['qb-target']:RemoveTargetEntity(entity)
                                end,
                            },
                        },
                        distance = 1.5,
                    })
                else
              
                    exports['qb-target']:RemoveTargetEntity(entity)
            
                    hasTarget = false
                    SetPedKeepTask(ped, false)
                    SetEntityAsNoLongerNeeded(ped)
                    ClearPedTasksImmediately(ped)
                    lastPed[#lastPed + 1] = ped
                    break
                end
            end
            Wait(0)
        end
        Wait(math.random(4000, 7000))
    end
end

local function ToggleSelling()
    if not cornerselling then
        cornerselling = true
        LocalPlayer.state:set("inv_busy", true, true)
        Functions.Notify("You started selling drugs")
        local startLocation = GetEntityCoords(PlayerPedId())
        CreateThread(function()
            while cornerselling do
                local player = PlayerPedId()
                local coords = GetEntityCoords(player)
                if not hasTarget then
                    local PlayerPeds = {}
                    if next(PlayerPeds) == nil then
                        for _, activePlayer in ipairs(GetActivePlayers()) do
                            local ped = GetPlayerPed(activePlayer)
                            PlayerPeds[#PlayerPeds + 1] = ped
                        end
                    end
                    local closestPed, closestDistance = Functions.GetClosestPed(coords, PlayerPeds)
                    if closestDistance < 15.0 and closestPed ~= 0 and not IsPedInAnyVehicle(closestPed) and GetPedType(closestPed) ~= 28 then
                        SellToPed(closestPed)
                    end
                end
                local startDist = #(startLocation - coords)
                if startDist > 10 then
                    TooFarAway()
                end
                Wait(0)
            end
        end)
    else
        stealingPed = nil
        stealData = {}
        cornerselling = false
        LocalPlayer.state:set("inv_busy", false, true)
        Functions.Notify("You stopped selling drugs")
    end
end

-- Events
RegisterNetEvent('qb-drugs:client:cornerselling', function()
    print("tesert")
    local a = Functions.TriggerCallback('qb-drugs:server:cornerselling:getAvailableDrugs', function(result)
        print("asse")
        if CurrentCops >= Config.MinimumDrugSalePolice then
            print("test")
            if IsPedInAnyVehicle(PlayerPedId(), false) then
                Functions.Notify("Can't sell while in a vehicle", 'error')
            else
                if result then
                    availableDrugs = result
                    ToggleSelling()
                else
                    Functions.Notify("You aren't carrying any drugs with you", 'error')
                    LocalPlayer.state:set("inv_busy", false, true)
                end
            end
        else
            Functions.Notify(("There are not enough Police on duty (%s required)"):format())
        end
    end)
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('qb-drugs:client:refreshAvailableDrugs', function(items)
    availableDrugs = items
    if availableDrugs == nil or #availableDrugs <= 0 then
        Functions.Notify("No more drugs left to sell", 'error')
        cornerselling = false
        LocalPlayer.state:set("inv_busy", false, true)
    end
end)
