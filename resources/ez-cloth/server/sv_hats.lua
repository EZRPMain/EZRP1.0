Framework:CreateUseableItem("hat", function(source, item)
    TriggerClientEvent("ez-usables:client:HatOn", source, item)
end)

RegisterNetEvent('ez-usables:server:HatOnByCommand', function(hat, tex)
    local source = source
    local Player = Framework:GetPlayer(source)
    local hat = Player.Functions.GetItemByName("hat")
    if hat then
        TriggerClientEvent("ez-usables:client:HatOn", source, hat)
    else
        TriggerClientEvent("QBCore:Notify", source, "You dont have a hat", "error")
    end
end)

RegisterNetEvent('ez-usables:server:GiveHatItem', function(hat, tex)
    if hat == 0 then return end
    local source = source
    local Player = Framework:GetPlayer(source)
    local info = {drawableId = hat, textureId = tex}

    Player.Functions.AddItem("hat", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', source, Framework:GetSharedItem("hat"), "add")
    -- TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["hat"], "add")
end)

RegisterNetEvent('ez-usables:server:RemoveHatItem', function(item)
    local source = source
    local Player = Framework:GetPlayer(source)

    Player.Functions.RemoveItem(item.name, 1, item.slot)
    TriggerClientEvent('inventory:client:ItemBox', source, Framework:GetSharedItem(item.name), "remove")
end)