local cachedData = {}

MySQL.ready(function()
	Citizen.Wait(500)

	local players = Framework:GetPlayers()

	if #players > 0 then
		TriggerClientEvent("storerobbery:eventHandler", players[1], "create_clerks")

		while not cachedData["networkedClerks"] do
			Citizen.Wait(0)
		end

		TriggerClientEvent("storerobbery:eventHandler", -1, "update_clerks", cachedData["networkedClerks"])
	end
end)

RegisterServerEvent("storerobbery:globalEvent")
AddEventHandler("storerobbery:globalEvent", function(options)
    TriggerClientEvent("storerobbery:eventHandler", -1, options["event"] or "none", options["data"] or nil)
end)

RegisterServerEvent("storerobbery:receiveBagCash")
AddEventHandler("storerobbery:receiveBagCash", function(cashAmount)	
	local source = source
	local player = Framework:GetPlayer(source)

	if player then
		player.Functions.AddItem("cash_roll", cashAmount)
		TriggerClientEvent('inventory:client:ItemBox', source, Framework:GetSharedItem("cash_roll"), "add", cashAmount)

		-- player.Functions.AddMoney("cash", cashAmount)

		-- TriggerClientEvent("QBCore:Notify", source, "You grabbed $" .. cashAmount .. ", added to your pocket.")
	end
end)

Framework:CreateCallback("storerobbery:createClerks", function(source, callback)
	local player = Framework:GetPlayer(source)

	if player then
		local players = Framework:GetPlayers()

		if #players == 1 then
			callback(true)
		elseif cachedData["networkedClerks"] then
			callback(cachedData["networkedClerks"])
		else
			callback(true)
		end
	else
		callback(false)
	end
end)

Framework:CreateCallback("storerobbery:updateClerks", function(source, callback, networkedClerks)
	local player = Framework:GetPlayer(source)

	if player then
		if networkedClerks then
			cachedData["networkedClerks"] = networkedClerks

			callback(true)
		else
			callback(false)
		end
	else
		callback(false)
	end
end)