-- Main Framework Shits
local DriftMode = {}

local isDev = false
RegisterNetEvent("cl_DevMode", function(boolean)
    isDev = boolean
end)

AddStateBagChangeHandler('DriftMode', nil, function(bagName, key, value)
    print(bagName, key, value)
end)

RegisterNetEvent("ez-drift:client:sync", function(plate) -- old fashioned way (bad but keeping for support)
    DriftMode[plate] = true
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
        SetVehicleEngineOn(vehicle, true, false)
        TriggerServerEvent("ez-drift:server:sync", plate)
	end, function() -- Cancel
		-- Framework:Notify()
	end, 'fas fa-microchip')
end


RegisterNetEvent("ez-drift:client:ToggleDrift", function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    local isDrift = GetDriftTyresEnabled(veh)
    if vehicle ~= 0
end)

