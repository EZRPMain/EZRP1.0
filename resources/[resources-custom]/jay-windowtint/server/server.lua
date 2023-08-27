-- Create Useable Item QBCore
exports['qb-core']:CreateUseableItem("tintreader", function(source, item)
    local src = source
    local Player = exports['qb-core']:GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("cl_checkTint", src)
    end
end)