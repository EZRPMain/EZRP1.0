MySQL.ready(function()
	Citizen.Wait(500)

    for name in pairs(Shared.Storages) do
        local result = MySQL.scalar.await('SELECT 1 from ez_storage WHERE zone = ?', {name})
        if not result then 
            MySQL.insert('INSERT INTO ez_storage (zone) VALUES (:zone) ON DUPLICATE KEY UPDATE zone = :zone', {
                ['zone'] = name
            })
            print("Created "..name)
        end
        Wait(100)
    end
	
end)

local function ConvertCidToTrue(cids)
    local result = {}
    for i, cid in pairs(cids) do
        result[cid] = true
    end
    return result
end


local function GetStorageKeyHolders(garage)
    local keyholders = {}
    local result = MySQL.scalar.await('SELECT keyholders from ez_storage WHERE zone = ?', {garage})
    if result then 
        keyholders = json.decode(result)
    end
    return keyholders
end

RegisterCommand("keyholder", function(s,a)
    local Player = Framework:GetPlayer(s)
    local cid = Player.PlayerData.citizenid
    if a[1] then 
        local keyholders = GetStorageKeyHolders(a[1])
        if keyholders then
            local keyholder = ConvertCidToTrue(keyholders)
            if keyholder[cid] then 
                TriggerClientEvent("QBCore:Notify", s, "You hold keys to ".. a[1])
            else
                TriggerClientEvent("QBCore:Notify", s, "You don't hold keys to "..a[1])
            end
        else
            TriggerClientEvent("QBCore:Notify", s, "No one holds keys to "..a[1])
        end
        
    end

end)

local function AddKeyHolder(src, garage, citizenid)
    local Player = Framework:GetPlayer(src)
    local cid = Player.PlayerData.citizenid


    local result = MySQL.scalar.await('SELECT keyholders from ez_storage WHERE zone = ?', {garage})
    if not result then
        MySQL.update('UPDATE ez_storage SET keyholders = ? WHERE zone = ?',{ json.encode({citizenid}), garage })
    elseif result then 
        local keyholders = GetStorageKeyHolders(garage)

        local hasKeyAlready = ConvertCidToTrue(keyholders)
        if hasKeyAlready[cid] then 
            return "Already has keys"
        end

        keyholders[#keyholders+1] = citizenid
        MySQL.update('UPDATE ez_storage SET keyholders = ? WHERE zone = ?',{ json.encode(keyholders), garage })
    end

end

RegisterCommand("addkeyholder", function(s,a)
    if a[1] and a[2] then 
        local canAdd = AddKeyHolder(s, a[1], a[2])
        
    end
end)

RegisterNetEvent("ez-storage:AddKeys", function(otherPlayer, garage)
    local source = source
    if isDebug then 
        garage = garage or "Garage1"
    end

    local Player = Framework:GetPlayer(source)

    local Player2 = Framework:GetPlayer(otherPlayer)

    if Player2 then 
        local canAdd = AddKeyHolder(s, a[1], a[2])
        -- Shared.Storages[garage].hasKeys[Player2.PlayerData.citizenid] = true
        -- MySQL.insert
    else
        TriggerClientEvent("QBCore:Notify", source, "Person does not exist", "error")
    end

end)

RegisterNetEvent("QBCore:Server:OnPlayerLoaded", function()
    local source = source
    -- Way to get Storage Key Holders (Save to DB or KVP?)
    local cids = {"CWP72955", "CWP72955","UBY85808"}

    -- for i, cid in pairs(cids) do
    --     Shared.Storages[garage].hasKeys[cid] = true
    -- end
    local garage = "Garage19"

    Shared.Storages[garage].hasKeys = ConvertCidToTrue(cids)
    

    TriggerClientEvent("ez-storage:loadKeys", source, garage, Shared.Storages[garage].hasKeys)
end)