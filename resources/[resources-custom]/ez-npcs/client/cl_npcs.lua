Citizen.CreateThread(function()
    for k, v in pairs(Config.Peds) do
        exports['ez-npcs']:RegisterNPC(v)
    end
end)