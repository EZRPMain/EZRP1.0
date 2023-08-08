local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.ItemName, function(source, item)
    local src = source
    TriggerClientEvent("qb-atmrobbery:client:UseTowingRope", src)
end)

QBCore.Functions.CreateUseableItem(Config.ATMItemName, function(source, item)
    local src = source
    TriggerClientEvent("qb-atmrobbery:client:UseATMObject", src)
end)

RegisterNetEvent('qb-atmrobbery:createRopeForAll', function(VehCoord, ATMCoord)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local BSN = Player.PlayerData.citizenid
	TriggerClientEvent("qb-atmrobbery:client:Sync", -1, src, VehCoord, ATMCoord, BSN)
end)

RegisterNetEvent('qb-atmrobbery:DeleteRopeDelete', function(coord)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local BSN = Player.PlayerData.citizenid
	TriggerClientEvent("qb-atmrobbery:client:DeleteRopeDelete", -1, coord, BSN)
end)

RegisterNetEvent('qb-atmrobbery:AddSearchATMReward', function(Amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney('cash', tonumber(Amount), "ATM")
end)

RegisterNetEvent('inventory:server:SaveInventory', function()
    local src = source
    TriggerClientEvent("qb-atmrobbery:client:UpdateEmote", src)
end)

RegisterNetEvent('qb-atmrobbery:server:DeleteObj', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local BSN = Player.PlayerData.citizenid
    TriggerClientEvent("qb-atmrobbery:client:DeleteObject", -1, BSN)
end)

RegisterNetEvent('qb-atmrobbery:server:AddRewardForATMObj', function(Amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney('cash', tonumber(Amount), "ATM")
end)

RegisterNetEvent("ez-atmrob:server:RemvoeATM", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.ATMItemName, 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.ATMItemName], "remove")
end)

RegisterNetEvent("ez-atmrob:server:BYeItemSzzKekW", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem(Config.ItemName, 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.ItemName], "remove")
end)

local isAllowed={}
local reasonData = {
    ["item"] = {
        reason = "Wrong Item Name (CHEATER 100% CONFIRMED)",
        ban = true,
    },
    ["amount"] = {
        reason = "Invalid Amount (CHEATER 100% CONFIRMED)",
        ban = true,
    },
    ["zone"] = {
        reason = "Player did not Press E to sell (CHEATER 100% CONFIRTMED)",
        ban = true,
    },
}


RegisterNetEvent("ez-robatm:SyncATM", function()
    local s = source
    isAllowed[s] = true
end)

local function ExploitLog(source, reason)
    local pSrc = source
    local Player = QBCore.Functions.GetPlayer(pSrc)
    local pCharName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname

    local pName = GetPlayerName(pSrc)
    -- local pDiscord = GetPlayerIdentifiers(pSrc)[3]

    local pLicense = QBCore.Functions.GetIdentifier(source, 'license')
    local pDiscord = QBCore.Functions.GetIdentifier(source, 'discord')
    local pIp = QBCore.Functions.GetIdentifier(source, 'ip')


    local LogData = {
        {
            ['description'] = string.format("`%s`\n\n`• Server Id: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• License: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• IP: %s`\n\n━━━━━━━━━━━━━━━━━━\n\n`• Discord: %s`\n━━━━━━━━━━━━━━━━━━", "EXPLOIT LOG", pSrc, pLicense, pIp, pDiscord),
            ['color'] = 2317994,
            ['fields'] = {
                {
                    ['name'] = '`Character Name`',
                    ['value'] = pCharName,
                    ['inline'] = true
                },
                {
                    ['name'] = '`Steam Name`',
                    ['value'] = pName,
                    ['inline'] = true
                },
                {
                    ['name'] = '`Reason For Log`',
                    ['value'] = reasonData[reason].reason,
                    ['inline'] = true
                },
            },
        }
    }

    PerformHttpRequest("https://discord.com/api/webhooks/1136224112352694383/KUmr79Pfn_usCYJn2H4KyIFSv02UNMNs1QTuXOXvgzqTaNPJCHoRlulCWdEdMIxGIk-j", function(err, text, headers) end, 'POST', json.encode({username = "EZRP Cheater/Exploit Logs (ATM ROBBERY)", embeds = LogData}), { ['Content-Type'] = 'application/json' })	


    if reasonData[reason].ban then 
        BanPlayer(pSrc, reasonData[reason].reason)
    end
end


RegisterNetEvent("ez-anticheat:ExploitDetected", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if not isAllowed[source] then 
        ExploitLog(source, "zone")
        return 
    end

    if isAllowed[source] then
        isAllowed[source] = false
        Player.Functions.AddItem(Config.ATMItemName, 1, nil, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.ATMItemName], "add")

    end
    -- Player.Functions.AddItem(item, amount, slot, info)
    -- Player.Functions.AddItem(Config.ATMItemName, 1, nil, info)
    -- TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.ATMItemName], "add")
		-- TriggerServerEvent("QBCore:Server:AddItem", Config.ATMItemName, 1, false, info)
		-- TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[Config.ATMItemName], "add")
end)

QBCore.Functions.CreateCallback('ExpertCheckItem:HasItem', function(source, cb, items, amount)
    local src = source
    local retval = false
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName(items)
    if Player then
        if item then
            if amount then
                if item.amount >= amount then
                    retval = true
                end
            else
                retval = true
            end
        end
    end
    cb(retval)
end)