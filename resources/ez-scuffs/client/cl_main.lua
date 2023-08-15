RegisterNetEvent("scuff-fix", function()
    SetEntityCoords(PlayerPedId(), GetEntityCoords(PlayerPedId()))
end)

RegisterCommand("scuff-fix", function()
    TriggerEvent("scuff-fix")
end)