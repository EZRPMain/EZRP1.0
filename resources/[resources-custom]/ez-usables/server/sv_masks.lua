local Framework = exports['qb-core']

Framework:CreateUseableItem("mask", function(source, item)
    TriggerClientEvent("ez-usables:client:MaskOn", source, item)
end)

RegisterNetEvent('ez-usables:server:MaskOnByCommand', function(mask, tex)
    local src = source
    local Player = Framework:GetPlayer(src)
    local mask = Player.Functions.GetItemByName("mask")
    if mask then
        TriggerClientEvent("ez-usables:client:MaskOn", source, mask)
    else
        TriggerClientEvent("QBCore:Notify", src, "You dont have a mask", "error")
    end
end)

RegisterNetEvent('ez-usables:server:GiveMaskItem', function(mask, tex)
    if mask == 0 then return end
    local src = source
    local Player = Framework:GetPlayer(src)
    local info = {drawableId = mask, textureId = tex}

    Player.Functions.AddItem("mask", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["mask"], "add")
end)

RegisterNetEvent('ez-usables:server:RemoveMaskItem', function(item)
    local src = source
    local Player = Framework:GetPlayer(src)

    Player.Functions.RemoveItem(item.name, 1, item.slot)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "remove")
end)