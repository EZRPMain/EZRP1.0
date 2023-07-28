local DriftMode = {}
GlobalState.DriftMode = {}

RegisterNetEvent("ez-drift:server:sync", function(plate)
    if Config.OldSync then
        DriftMode[plate] = true
        TriggerClientEvent("ez-drift:client:sync", -1, plate) -- Old Method
        return
    end
    GlobalState.DriftMode[plate] = true
end)