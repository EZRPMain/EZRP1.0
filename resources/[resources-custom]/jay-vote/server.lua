local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("jay-vote:signUp", function(data)
    if not data then return end
    local Player = QBCore.Functions.GetPlayer(source)
    local option = {
        fullname = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
        key = Player.PlayerData.citizenid,
        desc = data.description,
    }

    Config.Options[option.key] = {
        name = option.fullname,
        desc = option.desc,
        count = 0,
    }

    TriggerClientEvent("jay-vote:setOptions", -1, option)
end)


QBCore.Functions.CreateCallback('jay-vote:hasPlayerVoted', function(source,cb)
    local loadFile= LoadResourceFile(GetCurrentResourceName(), "./votes.json")
    local Player = QBCore.Functions.GetPlayer(source)
    local cid = Player.PlayerData.citizenid
    local result = json.decode(loadFile)
    if json.encode(result) == '{}' then
        cb(true)
    end
    if result[cid] == nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Commands.Add('clearvotes', "Clear Votes", {}, false, function(source)
    SaveResourceFile(GetCurrentResourceName(), "votes.json", '[]', -1)
end, 'admin')

RegisterServerEvent('jay-vote:voteWithData', function(data)
    local loadFile= LoadResourceFile(GetCurrentResourceName(), "./votes.json")
    local Player = QBCore.Functions.GetPlayer(source)
    local cid = Player.PlayerData.citizenid
    local result = json.decode(loadFile)
    result[cid] = {vote = data}
    SaveResourceFile(GetCurrentResourceName(), "votes.json", json.encode(result), -1)
    if Config.GiveItem then
        local info = {
            election = Config.ElectionName,
        }
        Player.Functions.AddItem('votingpin',1, false, info)
    end
end)

QBCore.Functions.CreateCallback('jay-vote:countCallback', function(source,cb)
    local totalvotes = 0
    local loadFile= LoadResourceFile(GetCurrentResourceName(), "./votes.json")
    local Options = {}
    local Total = 0
    for k,v in pairs(Config.Options) do
        Options[k] = 0
    end
    local result = json.decode(loadFile)
    for k, v in pairs(result) do
        print(v.vote)
        vote = v.vote

        totalvotes = totalvotes + 1
        Total = totalvotes 
        print(k, json.encode(v))

        Options[vote] = Options[vote] + 1

    end
    cb({Options = Options, Total = Total})
end)
