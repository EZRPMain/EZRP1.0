-- Main Framework
local DriftMode = {}

local isDev = false
RegisterNetEvent("cl_DevMode", function(boolean)
    isDev = boolean
end)

AddStateBagChangeHandler('DriftMode', nil, function(bagName, key, value)
    print(bagName, key, value) 
    -- This will just print until I do the global State Bag
end)

RegisterNetEvent("ez-drift:client:sync", function(plate, boolean) -- old fashioned way (bad but keeping for support)
    DriftMode[plate] = boolean
    -- SetDriftTyresEnabled(vehicle, boolean)
end)

local function ToggleDrift(vehicle, boolean, plate)
    if not plate then plate = Framework:GetPlate(vehicle) end
    Framework:Progressbar("driftmode", "Toggling Drift Mode", Config.ActivateTime, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function()
        SetDriftTyresEnabled(vehicle, boolean)
        print(vehicle, boolean)
        local isDrift = GetDriftTyresEnabled(vehicle)
        print(isDrift)
        SetVehicleEngineOn(vehicle, true, false)
        TriggerServerEvent("ez-drift:server:sync", plate, boolean)
	end, function() -- Cancel
		-- Framework:Notify()
	end, 'fas fa-microchip')
end

RegisterNetEvent("ez-drift:client:ToggleDrift", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    local isDrift = GetDriftTyresEnabled(veh)
    --tier check
    if DoesEntityExist(veh) then
        local Class = Manager:GetVehicleTier(veh)
        if Config.Tiers[Class] then
            if veh ~= 0 then
                if GetEntitySpeed(veh) > 1.0 then 
                    Framework:Notify("You need to be parked to do this", "error")
                else
                    SetVehicleEngineOn(veh, false, false, true)
                    if not isDrift then 
                        Framework:Notify("Drift Mode: On")
                        ToggleDrift(veh, true)
                        print(Class)
                        print("^ Veh class ^")
                    else
                        Framework:Notify("Drift Mode: Off")
                        ToggleDrift(veh, false)
                        print(Class)
                        print("^ Veh class ^")
                    end
                end
            end
        else
            Framework:Notify("Your vehicle is not the correct class", "error")
        end
    end
end)

-- Keybinds
if Config.Keybind.UseBind then
    RegisterCommand("+mrdrifta", function()
        if Config.Keybind.RequireItem then 
            if Framework:HasItem(Config.Item) then
                TriggerEvent("ez-drift:client:ToggleDrift")
            else 
                Framework:Notify("You are missing a drift chip")
            end
        else 
            TriggerEvent("ez-drift:client:ToggleDrift")
        end
        -- TriggerEvent("ez-drift:client:ToggleDrift")
    end)
    RegisterCommand("-mrdrifta", function()

    end)
    Keybinds:AddKeyMapping("Vehicle", "+mrdrifta", "-mrdrifta", "Toggle Drift Mode")
end

RegisterNetEvent("ez-drift:client:ShitBox", function()
    print("i hate you bro")
end)