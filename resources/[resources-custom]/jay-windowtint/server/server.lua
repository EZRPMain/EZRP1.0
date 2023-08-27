-- Create Useable Item QBCore
QBCore.Functions.CreateUseableItem("tintreader", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("cl_checkTint", src)
    end
end)