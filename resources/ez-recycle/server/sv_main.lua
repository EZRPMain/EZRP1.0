local isAllowed = {}

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


local function BanPlayer(source, reason)
    MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        GetPlayerName(source),
        Framework:GetIdentifier(source, 'license'),
        Framework:GetIdentifier(source, 'discord'),
        Framework:GetIdentifier(source, 'ip'),
        reason,
        2147483647,
        'ez-recycle'
    })
    DropPlayer(src, 'You were permanently banned by the server for: Exploiting')
end

local function ExploitLog(source, reason)
    local pSrc = source
    local Player = Framework:GetPlayer(pSrc)
    local pCharName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname

    local pName = GetPlayerName(pSrc)
    -- local pDiscord = GetPlayerIdentifiers(pSrc)[3]

    local pLicense = Framework:GetIdentifier(source, 'license'),
    local pDiscord = Framework:GetIdentifier(source, 'discord'),
    local pIp = Framework:GetIdentifier(source, 'ip'),


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
                    ['name'] = '`Reason For Log`',
                    ['value'] = reasonData[reason].reason,
                    ['inline'] = true
                },
            },
            ['author'] = {
                ['name'] = "Steam Name: "..pName
            },
        }
    }

    PerformHttpRequest("https://discord.com/api/webhooks/1136224109299245057/XbjSx7vxLLtK-UrIGDVOVKHm6LHpKQgA0BY8xT8cc1VMOVAUqq9CDsHzjde0HIWgNfaF", function(err, text, headers) end, 'POST', json.encode({username = "EZRP Cheater/Exploit Logs (Recycle)", embeds = LogData}), { ['Content-Type'] = 'application/json' })	


    if reasonData[reason].ban then 
        BanPlayer(pSrc, reasonData[reason].reason)
    end
end

RegisterNetEvent("40g9usdroib903ti4j4oigb", function()
    local source = source
    isAllowed[source] = true
end)

RegisterNetEvent("ez-recycle:GetReward", function(item, amt)
    local source = source
    if item ~= "recyclablematerial" then 
        ExploitLog(source, "item")
        return 
    end
    if amt > 3 then 
        return 
    end
    if not isAllowed[source] then 
        return 
    end


    if isAllowed[source] then
        isAllowed[source] = false
        Inventory:AddItem(source, "recyclablematerial", amt)
        

    end
end)