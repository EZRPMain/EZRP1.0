Citizen.CreateThread(function()
	RegisterCommand('antishuffle', function(source, args, rawCommand)
		local _source = source
		TriggerClientEvent('OD:noshuff', _source)
	end)
	
	if (enableSeatCommand) then
		RegisterCommand('seat', function(source, args, rawCommand)
			local _source = source
			TriggerClientEvent('OD:seat', _source, args[1])
		end)
	end
end)
