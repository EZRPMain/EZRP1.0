RegisterNetEvent('cookies:ByeItem', function(itemName, amount, slot)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(itemName, amount, slot)
end)

RegisterNetEvent('cookies:WagwanItem', function(itemName, amount, slot, info)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(itemName, amount, slot, info)
end)

Framework:CreateUseableItem("purplecookiepunchblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UsePurpleCookiePunchBlunt", source)
    end
end)

Framework:CreateUseableItem("thinmintcookiesblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseThinMintCookiesBlunt", source)
    end
end)

Framework:CreateUseableItem("pinkcookiesblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UsePinkCookiesBlunt", source)
    end
end)

Framework:CreateUseableItem("lemoncookiesblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseLemonCookiesBlunt", source)
    end
end)

Framework:CreateUseableItem("cerealmilkblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseCerealMilkBluntt", source)
    end
end)

Framework:CreateUseableItem("cakemixblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:UseCakeMixBlunt", source)
    end
end)

Framework:CreateUseableItem("gorrilaglueblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Usegorrilaglueblunt", source)
    end
end)

Framework:CreateUseableItem("backpackboyzblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:backpackboyzblunt", source)
    end
end)

Framework:CreateUseableItem("garypaytonblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Usegarypaytonblunt", source)
    end
end)

Framework:CreateUseableItem("blackcherrygelatoblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Useblackcherrygelatoblunt", source)
    end
end)

Framework:CreateUseableItem("peanutbutterbreathblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Usepeanutbutterbreathblunt", source)
    end
end)

Framework:CreateUseableItem("poundcakeblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Usepoundcakeblunt", source)
    end
end)

Framework:CreateUseableItem("jefeogblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Usejefeogblunt", source)
    end
end)


Framework:CreateUseableItem("thraxogblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Usethraxogblunt", source)
    end
end)

Framework:CreateUseableItem("sharklatoblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Usesharklatoblun", source)
    end
end)


Framework:CreateUseableItem("lemonpeperblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Uselemonpeperblunt", source)
    end
end)

Framework:CreateUseableItem("whiteruntzblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Usewhiteruntzblunt", source)
    end
end)

Framework:CreateUseableItem("snowmontanablunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Usesnowmontanablunt", source)
    end
end)

Framework:CreateUseableItem("italianiceblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Useitalianiceblunt", source)
    end
end)

Framework:CreateUseableItem("sorbertblunt", function(source, item)
    local Player = Framework:GetPlayer(source)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("consumables:client:Usesorbertblunt", source)
    end
end)