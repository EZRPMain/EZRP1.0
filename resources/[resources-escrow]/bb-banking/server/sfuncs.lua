Core = exports['qb-core']:GetCoreObject()

JobsData = {}
CreditCards = {}
PlayersData = {}

BBBankingCore['functions'] = {
    GetIdentifier = function(src, p)
        -- GetIdentifier Function
        local player = p
        if not player then
            player = Core.Functions.GetPlayer(src)
        end
        return player.PlayerData.citizenid
    end,

    GetCharacterName = function(player)
        return player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname
    end,

    GenerateIbanNumber = function(s)
        math.randomseed(os.time())
        return 'BB0' .. math.random(1,9) .. "DSC" .. math.random(100, 999)
    end,

    SetCards = function(cards)
        CreditCards = cards
    end,

    SetPlayerData = function(src, data)
        PlayersData[src] = data
    end,

    SetJobData = function(name, amount)
        if name == 'ALL' then
            JobsData = amount
        else
            JobsData[name]['amount'] = amount
        end
    end,

    GetPlayerData = function(src)
        return PlayersData[src]
    end,

    ExecuteSql = function(wait, query, cb)
        local rtndata = {}
        local waiting = true
        exports['oxmysql']:execute(query, {}, function(data)
            if cb ~= nil and wait == false then
                cb(data)
            end
            rtndata = data
            waiting = false
        end)
        if wait then
            while waiting do
                Citizen.Wait(5)
            end
            if cb ~= nil and wait == true then
                cb(rtndata)
            end
        end
        return rtndata
    end
}

function tprint(a,b)for c,d in pairs(a)do local e='["'..tostring(c)..'"]'if type(c)~='string'then e='['..c..']'end;local f='"'..tostring(d)..'"'if type(d)=='table'then tprint(d,(b or'')..e)else if type(d)~='string'then f=tostring(d)end;print(type(a)..(b or'')..e..' = '..f)end end end