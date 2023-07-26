QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("server:Reward", function(quest)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        if quest == "" or quest == nil then print("Error getting quest type") return end
        if quest == "package" then
            local ped = GetPlayerPed(source)
            local pos = GetEntityCoords(ped)
            local dist = #(pos - vector3(4863.24, -4633.92, 14.29))
            if dist > 10 then print(("Player (%s) %s is probably cheating"):format(source, GetPlayerName(source))) return end
            local RandomRewards = {
                "randomitem",
                "randomitem2",
                "randomitem3",
            }
            local RandomReward = RandomRewards[math.random(#RandomRewards)]
            Player.Functions.AddItem(RandomReward)
        end
    end
end)