-- TriggerServerEvent("ez-knit:CreateMask", input)

RegisterNetEvent("ez-knit:CreateMask", function(input)
    local source = source
    local Player = Framework:GetPlayer(source)
    if Player then 
        -- local info = {drawableId = input.drawable, textureId = input.texture}
        local info = input
        Player.Functions.AddItem("mask", 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', source, Framework:GetSharedItem("mask"), "add", 1)
    end 
end)

RegisterNetEvent("ez-knit:FAILED", function()
    local source = source
    local Player = Framework:GetPlayer(source)
    if Player then 
        Player.Functions.RemoveItem("cloth", 1)
        TriggerClientEvent('inventory:client:ItemBox', source, Framework:GetSharedItem("cloth"), "remove", 1)
    end 
end)