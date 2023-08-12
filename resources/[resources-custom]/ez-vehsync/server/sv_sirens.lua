RegisterNetEvent("ez-vehsync:updateSirenState")
AddEventHandler("ez-vehsync:updateSirenState", function(pNetId, pSirenState, pSirenPreset)
    TriggerClientEvent("ez-vehsync:updateSirenState", -1, pNetId, pSirenState, pSirenPreset)
end)