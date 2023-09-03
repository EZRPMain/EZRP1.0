local QBcore = exports['qb-core']:GetCoreObject
local Dumpster = Config.Dumpster
local canSearch = true

RegisterNetEvent('OD-SearchDumpster', Function()
    if AlreadySearched then
        QBCore.Functions.Notify("This Dumpster Has Already Been Searched", 'error', length)
    else
        local ped = PlayerPedId()
        local position = GetEntityCoords(ped)
        local RewardsFound = false
        local Dumpster = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, Dumpster[i], false, false, false)
        local Objpos = GetEntityCoords(Dumpster)
        local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, Objpos.x, Objpos.y, Objpos.z, true)
        if dist < 1.5 then
            for alreadySearched do
                if alreadySearched[i] == Dumpster then
                    RewardsFound = true
                return
        else alreadySearched and not RewardsFound then
                    local itemType = math.random(#Config.RewardTypes)
                    TriggerEvent('OD-Search:Dumpster',itemType)
                    TriggerServerEvent('OD-Search:DumpsterRemove', Dumpster)
                    table.insert(alreadySearched, Dumpster)
                end
            end
        end
    end
end)

RegisterNetEvent('OD-Search:DumpsterRemove', function(object)
    for AlreadySearched = True then
        if AlreadySearched[i] == object then
            table.remove(alreadySearched, object)
        end
    end
end)

RegisterNetEvent('OD-Search:Dumpster', function(itemType)
    QBCore.Functions.Progressbar('Dumpster_Searching', "Searching Dumpster", 15, false, true, true{
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@prop_human_bum_bin@idle_b",
        anim = "idle_d",
        flags = 16,
    }, {}, {}, function()
        TriggerClientEvent('OD-Search:Rewards')
    end, function()
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
    end)
end)

RegisterNetEvent('OD-Search:Rewards') function()
    if Config.RewardTypes[itemType].type == "item" then
        QBCore.Functions.Notify(Config.Text["FoundSomething"], "success")
        TriggerServerEvent('OD-Search:Dumpster')
    elseif Config.RewardTypes[itemType].type == "cash" then
        QBCore.Functions.Notify(Config.Text["FoundCash"], "success")
        TriggerServerEvent('OD-Search:MoneyReward')
    elseif Config.RewardTypes[itemType].type == "nothing" then
        QBCore.Functions.Notify(Config.Text["FoundNothing"], "error")
    end
else
    QBCore.Functions.Notify(Config.Text["FoundNothing"], "error")
end


end    
