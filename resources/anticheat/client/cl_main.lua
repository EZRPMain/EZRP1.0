print(GetPlayerServerId(PlayerId()))

print(PedToNet(PlayerPedId()))

RegisterCommand("anal", function()
    ApplyForceToEntity(PlayerPedId(), 1, 9500.0, 3.0, 7100.0, 1.0, 0.0, 0.0, 1, false, true, false, false, false)
end, false)
