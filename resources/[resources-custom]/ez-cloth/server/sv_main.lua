-- TriggerServerEvent("ez-knit:CreateMask", input)
CreateThread(function()
    print("poenis")
end)

RegisterNetEvent("ez-knit:CreateClothe", function(item, input)
    local source = source
    local Player = Framework:GetPlayer(source)
    if Player then 
        print(json.encode(input))
        -- local info = {drawableId = input.drawable, textureId = input.texture}
        local info = input
        Player.Functions.AddItem(item, 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', source, Framework:GetSharedItem(item), "add", 1)
    end 
end)

RegisterNetEvent("ez-knit:RemoveCloth", function(amt)
    local source = source
    local Player = Framework:GetPlayer(source)
    if Player then 
        Player.Functions.RemoveItem("cloth", amt)
        TriggerClientEvent('inventory:client:ItemBox', source, Framework:GetSharedItem("cloth"), "remove", amt)
    end 
end)