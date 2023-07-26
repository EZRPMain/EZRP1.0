----------------------------------------------------------------
--------------	  Bussinesses Food and buffs	  --------------
----------------------------------------------------------------

RegisterNetEvent('qb-businesses:client:EatBusinessFood', function(itemName, emote, label)
    TriggerEvent('animations:client:EmoteCommandStart', {emote})
    QBCore.Functions.Progressbar('business:eats', 'Eating '..label, math.random(5000, 12500), false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Play When Done
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('qb-businesses:server:EatMyFuckingFood', itemName, business, sitting, sitCounter)
    end, function() -- Play When Cancel
        QBCore.Functions.Notify(Lang:t("error.cancelled"), "error", 4500)
    end)
end)

RegisterNetEvent('qb-businesses:client:SendClientBuffs', function(table)
    for _, v in pairs(table) do
        if v.buff == "stamina" then
            exports["ps-buffs"]:StaminaBuffEffect(v.duration, v.amount)
        end

        if v.buff == "swimming" then
            exports["ps-buffs"]:SwimmingBuffEffect(v.duration, v.amount)
        end
    end
end)

----------------------------------------------------------------
--------------	  Bussinesses Drinks and Buffs	  --------------
----------------------------------------------------------------


-- Change this if you want to change the way driving behaves, i test a lot of them some of them crash you some of them just dont give the correct effects IMO.
local VehicleActions = {
    7, -- Turn left and accelerate
    8, -- Turn right and accelerate
    10, -- Turn left + restore wheel pos to center in the end
    11, -- Turn right + restore wheel pos to center in the end
    23, -- Acceleration quic
    32, -- Accelerate very strongly
}

local alcometer = 0
local drunkeffectActive = false

local function AlcoholEffect()
	local ped = PlayerPedId()

	Wait(math.random(1000,3500))
	AnimpostfxPlay("DrugsDrivingIn", 10000, false)

    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do
      Wait(1)
    end

    SetTimecycleModifier("spectator5")
    SetPedMotionBlur(ped, true)
    SetPedMovementClipset(ped, "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedIsDrunk(ped, true)
    SetRunSprintMultiplierForPlayer(PlayerId(), 0.70)
    ShakeGameplayCam("DRUNK_SHAKE", 3.0)
    drunkeffectActive = true
    while alcometer >= 1 do
        alcometer = alcometer - 1
        if math.random() <= 0.75 then -- 75% chance to trigger this
            if IsPedInAnyVehicle(ped, false) and not IsPedInAnyHeli(ped) then
                local curVeh = GetVehiclePedIsIn(ped, false)
                -- This will set the vehicle to do random tasks, if you want to go more in depth, then look at the site below, and add whatever you'd like, in the VehicleActions table.
                -- https://docs.fivem.net/natives/?_0xC429DCEEB339E129
                local action = VehicleActions[math.random(1, #VehicleActions)]
                TaskVehicleTempAction(ped, curVeh, action, math.random(2500,3500)) -- Increase math.random(2500,3500) to whatever if you want it to last longer
            end
        end

        if math.random() == 1 then -- 1% chance to trigger this
            SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
        end
        Wait(10000)
    end

    drunkeffectActive = false
    SetPedMoveRateOverride(PlayerId(), 1.0)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    SetPedIsDrunk(ped, false)
    SetPedMotionBlur(ped, false)
    ResetPedMovementClipset(ped)
    AnimpostfxStopAll()
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    SetTimecycleModifierStrength(0.0)
end

RegisterNetEvent('qb-businesses:client:DrinkBusinesses', function(itemName, emote, label)
    TriggerEvent('animations:client:EmoteCommandStart', {emote})
    QBCore.Functions.Progressbar('business:eats', 'Drinking '..label, math.random(5000, 12500), false, true, { -- Name | Label | Time | useWhileDead | canCancel
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Play When Done
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent('qb-businesses:server:DrinkMyFuckingShit', itemName, business, sitting, sitCounter)
    end, function() -- Play When Cancel
        QBCore.Functions.Notify(Lang:t("error.cancelled"), "error", 4500)
    end)
end)

RegisterNetEvent('qb-businesses:client:BecomeDrunk', function(alcoAmt)
    alcometer = alcometer + alcoAmt
    if alcometer >= 3 and not drunkeffectActive then
        AlcoholEffect()
    end
end)


-- USAGE FOR THE ALOCHOL EXPORTS --

-- EXAMPLE
-- exports['qb-businesses']:addAlcohol(5)
-- Use this in small resources to have the same cosistency between alcohol stuff, and to make it easier to change the amount of alcohol you get from a drink.

local function addAlcohol(amount)
    alcometer = alcometer + amount

    if alcometer >= 3 and not drunkeffectActive then
        AlcoholEffect()
    end
end exports("addAlcohol", addAlcohol)



-- REGISTERS --




RegisterNetEvent('qb-businesses:client:openCashRegister', function(data)
    QBCore.Functions.TriggerCallback('qb-businesses:server:getNearbyPlayers', function(nearbyPlayers)
        if nearbyPlayers then
            if #nearbyPlayers > 0 then
                local dialog = exports[Config.Input]:ShowInput({
                    header = "Cash Register",
                    submitText = "Bill Civilian",
                    inputs = {
                        {
                            text = "Billed Civilian",
                            name = "billed",
                            type = "select",
                            options = nearbyPlayers
                        },
                        {
                            text = "($) Bill Price",
                            name = "amount",
                            type = "number",
                            isRequired = true,
                            default = 0,
                        },
                        {
                            text = "Bill Type",
                            name = "billtype",
                            type = "radio",
                            options = {
                                { value = "cash", text = "Cash" },
                                { value = "bank", text = "Bank" }
                            },
                        },
                    },
                })
                if dialog then
                    if not dialog.billed or not dialog.amount or not dialog.billtype then
                        QBCore.Functions.Notify("[F8] An unexpected error occured.", "error")
                        return
                    end
                    local bill = {
                        billed = dialog.billed,
                        amount = dialog.amount,
                        billtype = dialog.billtype,
                    }
                    TriggerServerEvent('qb-businesses:server:sendBillRequest', bill)
                end
            end
        end
    end)
end)

RegisterNetEvent('qb-businesses:client:recievePayRequest', function(billData, biller)
    exports[Config.Menu]:openMenu({
		{
            isMenuHeader = true,
            header = "Payment Request Recieved",
            txt = "Do you want accept the payment?",
            icon = "fa-solid fa-circle-info",
        },
		{
            isMenuHeader = true,
            header = "",
            icon = "fa-solid fa-dollar-sign",
            txt = (" Payment: $%s"):format(billData.amount)
        },
		{
            header = "Yes",
            icon = "fa-solid fa-circle-check",
            txt = "",
            params = {
                isServer = true,
                event = "qb-businesses:server:confirmPaymment",
                args = {
                    accept = true,
                    billData = billData,
                    biller = biller
                }
            }
        },
		{
            header = "No",
            txt = "",
            icon = "fa-solid fa-circle-xmark",
            params = {
                isServer = true,
                event = "qb-businesses:server:confirmPaymment",
                args = {
                    accept = false,
                    billData = billData,
                    biller = biller
                }
            }
        }
    })
end)
