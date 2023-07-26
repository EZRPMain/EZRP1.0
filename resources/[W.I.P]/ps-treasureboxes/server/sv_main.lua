-- MAIN variables
local QBCore = exports['qb-core']:GetCoreObject()

local StashLocations = {} -- load from sql
-- Use Global State for this shit

-- functions


local StashIdentifier = {}
function CreateUniqueIdentifier()
    -- Select all Identifiers
    -- MySQL.execute("SELECT identifer FROM treasureboxes")
    -- add all identifiers to StashIdentifier


    -- if Ident


end

function CreateRandomTreasure()
    -- insert location
   
    -- random item generator
    local items = {}


    MySQL.insert('INSERT INTO treasureboxes (coords, type, identifier) VALUES (?, ?, ?)', {
        vector3(100,100,100),
        type,
        math.random(111111,999999)
    })

end

function SaveTreasureBox()

end

-- usable items

QBCore.Functions.CreateUseableItem(Config.MetalDetactor, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("ps-treasureboxes:client:useMetal", src)
    end
end)

-- did you know jay was here? no you didnt well i did -Jay

CreateThread(function()
    for name, data in pairs(Config.Items) do
        QBCore.Functions.CreateUseableItem(name, function(source, item)
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if Player.Functions.GetItemByName(item.name) then
                TriggerClientEvent("ps-treasureboxes:client:placeStash", src, data)
            end
        end)
    end
end)