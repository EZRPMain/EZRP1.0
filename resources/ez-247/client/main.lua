cachedData = {
	["clerks"] = {}
}

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function(response)
	-- PlayerData = response

	Initial()
end)

RegisterNetEvent("storerobbery:eventHandler")
AddEventHandler("storerobbery:eventHandler", function(event, eventData)
	local PD = Framework:GetPlayerData()
	if event == "update_clerks" then
		for clerkIndex, clerkData in ipairs(eventData) do
			if NetworkDoesNetworkIdExist(clerkData["clerk"]) then
				cachedData["clerks"][clerkData["store"]] = NetToPed(clerkData["clerk"])
			end
		end
	elseif event == "create_clerks" then
		CreateClerks()
	elseif event == "create_bag" then
		BagThread(eventData)
	elseif event == "alert_police" then
		if PD.job and PD.job.type == "leo" then
			Framework:Notify("Store robbery alarm gone off, gps set.")

			SetNewWaypoint(eventData["coords"]["x"], eventData["coords"]["y"])
		end
	else
		-- print("Wrong event handler.")
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(100)

	if Config.ShowBlips then
		for clerkStore, clerkCoords in pairs(Config.StoreClerks) do
			local clerkBlip = AddBlipForCoord(clerkCoords)

			SetBlipSprite(clerkBlip, 156)
			SetBlipScale(clerkBlip, 0.8)
			SetBlipColour(clerkBlip, 1)
			SetBlipAsShortRange(clerkBlip, true)

			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString("Robbable clerk")
			EndTextCommandSetBlipName(clerkBlip)
		end
	end

	while true do
		local sleepThread = 500
		
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		
		for clerkStore, clerkCoords in pairs(Config.StoreClerks) do
			local dstCheck = #(pedCoords - vector3(clerkCoords["x"], clerkCoords["y"], clerkCoords["z"]))
			
			if dstCheck <= 10.0 then
				sleepThread = 5

				if IsPedArmed(ped, 7) then
					local isAiming, entityFound, entityAimingAt = IsPlayerFreeAiming(PlayerId()), GetEntityPlayerIsFreeAimingAt(PlayerId())

					if isAiming then
						if entityFound and GetEntityModel(entityAimingAt) == Config.ClerkData["model"] then
							if DecorGetBool(entityAimingAt, "isRobbable") then
								StartRobberyThread(entityAimingAt)
							-- else
								-- Framework:Notify("Can't rob this clerk right now.")
							end
						end
					end
				end
			end	
		end

	  	Citizen.Wait(sleepThread)
	end
end)

