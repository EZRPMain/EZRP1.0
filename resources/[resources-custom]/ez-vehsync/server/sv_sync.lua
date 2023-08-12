RegisterNetEvent("ez-vehsync:updateSyncState")
AddEventHandler("ez-vehsync:updateSyncState", function(pNetId, pSyncState)
    TriggerClientEvent("ez-vehsync:updateSyncState", -1, pNetId, pSyncState)
end)