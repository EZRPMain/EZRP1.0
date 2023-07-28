local DriftMode = {}
GlobalState.DriftMode = {}

RegisterNetEvent("ez-drift:server:sync", function(plate, boolean)
    if Config.OldSync then
        DriftMode[plate] = boolean
        TriggerClientEvent("ez-drift:client:sync", -1, plate) -- Old Method
        return
    end
    GlobalState.DriftMode[plate] = boolean
end)

if Config.UseItem then 
    -- Inventory:CreateUsableItem
    Framework:CreateUseableItem(Config.Item, function(source, item)
        local source = source
        local ped = GetPlayerPed(source)
        local veh = GetVehiclePedIsIn(ped, false)
        if DoesEntityExist(veh) and veh and veh ~= 0 then
            TriggerClientEvent('ez-drift:client:ToggleDrift', source)
        else
            Framework:Notify(source, "You need to be in a vehicle for this", "error")
        end
    end)
end