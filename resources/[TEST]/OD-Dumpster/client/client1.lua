local QBCore = exports['qb-core']:GetCoreObject()
local SmallBins = Config.SmallBinProps
local BigBins = Config.BigBinProps
local canSearch = true
local alreadySearched = {192192192192}

RegisterNetEvent('OD-dumpsterdive:SearchSmallBin', function()
    if canSearch then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local SearchSmallBinFound = false
        for i = 1, #SmallBins do
            local SearchSmallBin = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, SmallBins[i], false, false, false)
            local dumpPos = GetEntityCoords(SearchSmallBin)
            local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dumpPos.x, dumpPos.y, dumpPos.z, true)
            if dist < 1.5 then
                for i = 1, #alreadySearched do
                    if alreadySearched[i] == SearchSmallBin then
                        SearchSmallBinFound = true
                    end
                    if i == #alreadySearched and SearchSmallBinFound then
                        QBCore.Functions.Notify(Config.Text["SearchSmallBinAlreadySearched"], 'error')
                    elseif i == #alreadySearched and not SearchSmallBinFound then

                        local itemType = math.random(#Config.BinRewards)
                        TriggerEvent('OD-dumpsterdive:SearchSmallBinBar',itemType)
                        TriggerServerEvent('OD-dumpsterdive:SmallDumpsterTimer', SearchSmallBin)
                        table.insert(alreadySearched, SearchSmallBin)
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('OD-dumpsterdive:SmallBinRemove', function(object)
    for i = 1, #alreadySearched do
        if alreadySearched[i] == object then
            table.remove(alreadySearched, i)
        end
    end
end)


RegisterNetEvent('OD-dumpsterdive:SearchSmallBinBar', function(itemType)
    QBCore.Functions.Progressbar("trash_find", Config.Text["SearchingTrash"], Config.SmallBinTimer * 1000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@prop_human_bum_bin@idle_b",
        anim = "idle_d",
        flags = 16,
    }, {}, {}, function()
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
        local seconds = math.random(Config.MiniGame.SmallbinTimer.Min, Config.MiniGame.SmallbinTimer.Max)
        local circles = math.random(Config.MiniGame.SmallBinCircles.Min, Config.MiniGame.SmallBinCircles.Max)
        exports['ps-ui']:Circle(function(success)
            if success then
                if Config.BinRewards[itemType].type == "item" then
                    QBCore.Functions.Notify(Config.Text["FoundSomething"], "success")
                    TriggerServerEvent('OD-dumpsterdive:smallBins')
                elseif Config.BinRewards[itemType].type == "cash" then
                    QBCore.Functions.Notify(Config.Text["FoundCash"], "success")
                    TriggerServerEvent('OD-dumpsterdive:smallBinsMoney')
                elseif Config.BinRewards[itemType].type == "nothing" then
                    QBCore.Functions.Notify(Config.Text["FoundNothing"], "error")
                end
            else
                QBCore.Functions.Notify(Config.Text["FoundNothing"], "error")
            end
        end, circles, seconds)
    end, function()
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
    end)
end)


-- Big Trash Bins aka Dumpster Stuff
RegisterNetEvent('OD-dumpsterdive:SearchBigTrash', function()
    if canSearch then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local BigTrashFound = false
        for i = 1, #BigBins do
            local BigTrash = GetClosestObjectOfType(pos.x, pos.y, pos.z, 1.0, BigBins[i], false, false, false)
            local dumpPos = GetEntityCoords(BigTrash)
            local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, dumpPos.x, dumpPos.y, dumpPos.z, true)
            if dist < 1.5 then
                for i = 1, #alreadySearched do
                    if alreadySearched[i] == BigTrash then
                        BigTrashFound = true
                    end
                    if i == #alreadySearched and BigTrashFound then
                        QBCore.Functions.Notify(Config.Text["BigDumsterAlreadySerached"], 'error')
                    elseif i == #alreadySearched and not BigTrashFound then

                        local itemType = math.random(#Config.BinRewards)
                        TriggerEvent('OD-dumpsterdive:BigDumpster',itemType)
                        TriggerServerEvent('OD-dumpsterdive:RemoveDumpster', BigTrash)
                        table.insert(alreadySearched, BigTrash)
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('OD-dumpsterdive:BigBinRemove', function(object)
    for i = 1, #alreadySearched do
        if alreadySearched[i] == object then
            table.remove(alreadySearched, i)
        end
    end
end)

RegisterNetEvent('OD-dumpsterdive:BigDumpster', function(itemType)
    QBCore.Functions.Progressbar("trash_find", Config.Text["SearchDumpster"], Config.DumpsterTimer * 1000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@prop_human_bum_bin@idle_b",
        anim = "idle_d",
        flags = 16,
    }, {}, {}, function()
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
        local seconds = math.random(Config.MiniGame.BigBinTimer.Min, Config.MiniGame.BigBinTimer.Max)
        local circles = math.random(Config.MiniGame.BigBinCircles.Min, Config.MiniGame.BigBinCircles.Max)
        exports['ps-ui']:Circle(function(success)
            if success then
                if Config.BinRewards[itemType].type == "item" then
                    QBCore.Functions.Notify(Config.Text["FoundSomething"], "success")
                    TriggerServerEvent('OD-dumpsterdive:Bigbins')
                elseif Config.BinRewards[itemType].type == "cash" then
                    QBCore.Functions.Notify(Config.Text["FoundCash"], "success")
                    if success then
                        TriggerServerEvent('OD-dumpsterdive:BigbinsMoney')
                    else
                        QBCore.Functions.Notify(Config.Text["FoundNothing"], "error")
                    end
                elseif Config.BinRewards[itemType].type == "nothing" then
                    QBCore.Functions.Notify(Config.Text["FoundNothing"], "error")
                end
            else
                QBCore.Functions.Notify(Config.Text["FoundNothing"], "error")
            end
        end, circles, seconds)

    end, function()
        StopAnimTask(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 1.0)
    end)
end)

-- Target Handling


CreateThread(function()
    while true do
        exports['qb-target']:AddTargetModel(Config.SmallBinProps, {
            options = {
                {
                    type = "client",
                    event = "tr-dumpsterdive:SearchSmallBin",
                    icon = Target.IconsHighLight["smallBins"],
                    label = Target.Label["smallBins"],
                    targeticon = Target.Icon["smallBins"],
                }
            },
            distance = Config.Distance,
        })

        exports['qb-target']:AddTargetModel(Config.BigBinProps, {
            options = {
                {
                    type = "client",
                    event = "tr-dumpsterdive:SearchBigTrash",
                    icon = Target.IconsHighLight["bigBins"],
                    label = Target.Label["bigBins"],
                    targeticon = Target.Icon["bigBins"],
                }
            },
            distance = Config.Distance,
        })

        Wait(1)
    end
end)

