local cache_data = {}

local firstCheck = false

RegisterNetEvent("ez-gangflags:loadFlags", function()
    local source = source
    -- print(json.encode(cache_data))
    if json.encode(cache_data) == '[]' and not firstCheck then
        -- print("fresh start") 
        -- print("cache_data == {}")
        local response = MySQL.query.await('SELECT * from gangflags', {})
        if response then 
            -- print("test")
            -- print(json.encode(response))
            firstCheck = true
            cache_data = response
        else 
            cache_data = {}
        end
        
    end

    if cache_data then
        -- print(json.encode(response))
        -- print("balls")
        TriggerClientEvent("ez-gangflags:loadProps", source, cache_data)
        -- print(json.encode(cache_data))
    end



end)

-- Setup all the placeable props as useable items
for _, prop in pairs(Shared.Flags) do
    Framework:CreateUseableItem(prop.item, function(source, item)
    -- RegisterCommand(prop.item, function(source, item)
        TriggerClientEvent("ez-gangflags:placeFlag", source, Framework:GetSharedItem(prop.item))
        -- TriggerClientEvent("ez-gangflags:placeFlag", source, Shared.DebugShared[prop.item])
  
    end)
end

-- This function is to handle the syncing of deleting world props between all clients
-- RegisterServerEvent("ez-sync:server:deleteWorldObject", function(object)
--     TriggerClientEvent("ez-sync:client:deleteWorldObject", -1, object)
-- end)

RegisterNetEvent("ez-gangflags:removeFlag", function(itemName)
    local src = source
    local Player = Framework:GetPlayer(src)
    if Player then 
        -- Player.Functions.RemoveItem(itemName, 1)
        -- TriggerClientEvent('inventory:client:ItemBox', src, Framework:GetSharedItem(prop.item), "remove")
    end
end)

-- RegisterNetEvent("ez-gangflags:TargetData", function(coords, model)
--     TriggerClientEvent("ez-gangflags:CreateTarget", -1, coords, model)
-- end)

RegisterNetEvent("ez-gangflags:RemoveTargetZone", function(name)
    TriggerClientEvent("ez-gangflags:removeZone", -1, name)
end)

-- TO DO database shit cunt
-- do i want to do this? no not really

RegisterNetEvent("ez-gangflags:Save", function(coords, model, heading)
    local source = source
    local Player = Framework:GetPlayer(source)
    local cid = Player.PlayerData.citizenid
    -- print(model)

    MySQL.insert('INSERT INTO `gangflags` (coords, model, creator, heading) VALUES (?, ?, ?, ?)', {
        json.encode(coords), model, cid, heading
    }, function(id)
        print(id)
    end)

    TriggerClientEvent("ez-gangflags:syncObject", -1, coords, model, heading)

    -- MySQL.insert('INSERT INTO gangflags (coords) VALUES (:coords) ON DUPLICATE KEY UPDATE zone = :zone', {
    --     ['coords'] = json.encode(coords)
    -- })
    -- print("Created "..name)
end)

RegisterNetEvent("ez-gangflags:delete", function(name)
    MySQL.query('DELETE FROM gangflags WHERE coords = ?', { name })

    for k, data in pairs(cache_data) do
        if data.coords == name then 
            print(data.coords, name)
            cache_data[k] = nil
        end
    end

    TriggerClientEvent("ez-gangflags:reload", -1)

end)