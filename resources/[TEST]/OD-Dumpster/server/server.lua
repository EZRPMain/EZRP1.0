local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('OD-Search:RemoveDumpster', function(Dumpster)
    bigTimer(source, Dumpster)
end)

RegisterNetEvent('OD-Search:DumpsterRemove', function()
    local source = source
    local player = QBCore.Functions.GetPlayer(source)
    local FoundItem = Config.BigBinRewards["items"][math.random(1, #Config.BigBinRewards["items"])]
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[FoundItem[1]], "add")
    player.Functions.AddItem(FoundItem[1], FoundItem[2])
end)

RegisterNetEvent('OD-Search:MoneyReward', function()
    local source = source
    local cashAmount = math.random(Config.Rewards.CashMin, Config.Rewards.CashMax)
    local player = QBCore.Functions.GetPlayer(source)
    player.Functions.AddMoney("cash", cashAmount)
end)

function bigTimer(id, object)
    local timer = 10 * 1000
    while timer > 0 do
        Wait(10)
        timer = timer - 10
        if timer == 0 then
            TriggerClientEvent('OD-Search:RemveDumpster', id, object)
        end
    end
end