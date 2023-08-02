local hiddenprocess = vector3(1100.53, -313.58, 59.36) -- Change this to whatever location you want. This is server side to prevent people from dumping the coords
local hiddenstart = vector3(2122.2004394531, 4784.7919921875, 40.970275878906) -- Change this to whatever location you want. This is server side to prevent people from dumping the coords

RegisterNetEvent('coke:updateTable')
AddEventHandler('coke:updateTable', function(bool)
    TriggerClientEvent('coke:syncTable', -1, bool)
end)

Framework:CreateUseableItem('coke', function(source, item)
	local Player = Framework:GetPlayer(source)
	if Player.Functions.GetItemByName(item.name) ~= nil then
 		TriggerClientEvent('coke:onUse', source)
	end
end)


Framework:CreateCallback('coke:processcoords', function(source, cb)
    cb(hiddenprocess)
end)

Framework:CreateCallback('coke:startcoords', function(source, cb)
    cb(hiddenstart)
end)

Framework:CreateCallback('coke:pay', function(source, cb)
	local src = source
	local Player = Framework:GetPlayer(src)
	local amount = Config.amount
	local cashamount = Player.PlayerData.money["cash"]
    local toamount = tonumber(amount)
   
	if cashamount >= amount then
		Player.Functions.RemoveMoney('cash', amount) 
    	cb(true)
	else
		TriggerClientEvent("QBCore:Notify", src, "You dont have enough Money to Start", "error", 4000)
		cb(false)
	end
end)

RegisterServerEvent("coke:processed")
AddEventHandler("coke:processed", function(x,y,z)
  	local src = source
  	local Player = Framework:GetPlayer(src)
	local pick = Config.randBrick()

		if 	TriggerClientEvent("QBCore:Notify", src, "Made a Coke Bag!!", "Success", 8000) then
			Player.Functions.RemoveItem('coke_brick', 1) 
			Player.Functions.AddItem('cokebaggy', 2)
			TriggerClientEvent("inventory:client:ItemBox", source, Framework:GetSharedItem('coke_brick'), "remove", 1)
			TriggerClientEvent("inventory:client:ItemBox", source, Framework:GetSharedItem('cokebaggy'), "add", 2)
		end
	end)

Framework:CreateCallback('coke:process', function(source, cb)
	local src = source
	local Player = Framework:GetPlayer(src)
	 
	if Player.PlayerData.item ~= nil and next(Player.PlayerData.items) ~= nil then
		for k, v in pairs(Player.PlayerData.items) do
		    if Player.Playerdata.items[k] ~= nil then
				if Player.Playerdata.items[k].name == "coke_brick" then
					cb(true)
			    else
					TriggerClientEvent("QBCore:Notify", src, "You do not have any coke bricks", "error", 10000)
					cb(false)
				end
	        end
		end	
	end
end)

RegisterServerEvent("coke:GiveItem")
AddEventHandler("coke:GiveItem", function()
  	local src = source
	  local Player = Framework:GetPlayer(src)
	  local price = Config.price
	  local brick = Config.randBrick()
	Player.Functions.AddMoney('cash', price)
	Player.Functions.AddItem('coke_brick', brick)
	TriggerClientEvent('inventory:client:ItemBox', src, Framework:GetSharedItem('coke_brick'), "add", brick)
end)
