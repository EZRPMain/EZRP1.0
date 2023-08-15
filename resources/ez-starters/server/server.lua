local QBCore = exports['qb-core']:GetCoreObject()
local whitelist = {}

local item_array = {
    'bandage',
    'bscoke',
    'weapon_cash',
    'bleeder',
    'advancedrepairkit',
    'advancedlockpick',
    'ausb2'
}

-- CUSTOM ITEMS
RegisterServerEvent('ez-starter:server:giveitem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not whitelist[src] then return end -- should drop player but eh
    --if whitelist[src] then
    if Player.Functions.RemoveItem('starter_gift', 1) then
        whitelist[src] = nil
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["starter_gift"], "remove")
        for i = 1, #item_array do
            local itemchance = math.random(0,1)
            if itemchance == 1 then
                Player.Functions.AddItem(itemchance[i], 1)
            end
        end

        -- for i,v in pairs(item_array) do
        --     itemchance = math.random(0,1)
        --     if itemchance == 1 then
        --         TriggerServerEvent('ez-starter:server:giveitem', v) --Give the item to the user using server event
        --     end
        -- end
        
        
    end
end)

-- RegisterServerEvent('ez-starter:server:removebox', function()
--     local src = source
--     local Player = QBCore.Functions.GetPlayer(src)
--     Player.Functions.RemoveItem('starter_gift', 1)
--     TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["starter_gift"], "remove")
-- end)

QBCore.Functions.CreateUseableItem("starter_gift", function(source, item)
    local source = source
    whitelist[source] = true
    TriggerClientEvent("ez-starter:client:givestarteritem", source)
end)