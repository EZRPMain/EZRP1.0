Framework:CreateUseableItem("mask", function(source, item)
    TriggerClientEvent("ez-usables:client:MaskOn", source, item)
end)

RegisterNetEvent('ez-usables:server:MaskOnByCommand', function(mask, tex)
    local source = source
    local Player = Framework:GetPlayer(source)
    local mask = Player.Functions.GetItemByName("mask")
    if mask then
        TriggerClientEvent("ez-usables:client:MaskOn", source, mask)
    else
        TriggerClientEvent("QBCore:Notify", source, "You dont have a mask", "error")
    end
end)

RegisterNetEvent('ez-usables:server:GiveMaskItem', function(mask, tex)
    if mask == 0 then return end
    local source = source
    local Player = Framework:GetPlayer(source)
    local info = {drawableId = mask, textureId = tex}

    Player.Functions.AddItem("mask", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', source, Framework:GetSharedItem("mask"), "add")
    -- TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["mask"], "add")
end)

RegisterNetEvent('ez-usables:server:RemoveMaskItem', function(item)
    local source = source
    local Player = Framework:GetPlayer(source)

    Player.Functions.RemoveItem(item.name, 1, item.slot)
    TriggerClientEvent('inventory:client:ItemBox', source, Framework:GetSharedItem(item), "remove")
end)