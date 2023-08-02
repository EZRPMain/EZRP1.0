local RecyclePoints = {
	-- 979.79254150391, -2287.322265625, 30.639339447021 Heading: 244.22567749023
	{979.79254150391, -2287.322265625, 30.639339447021,["time"] = 0,["used"] = false},  
	--967.41864013672, -2284.8203125, 30.508047103882 Heading: 88.417938232422
	{967.41864013672, -2284.8203125, 30.508047103882,["time"] = 0,["used"] = false},  
	--970.87854003906, -2290.0834960938, 30.508047103882 Heading: 260.34436035156
	{970.87854003906, -2290.0834960938, 30.508047103882,["time"] = 0,["used"] = false},  
	--975.41174316406, -2298.8061523438, 30.508047103882 Heading: 94.566986083984
	{975.41174316406, -2298.8061523438, 30.508047103882,["time"] = 0,["used"] = false}, 
	--975.70501708984, -2293.3352050781, 30.508047103882 Heading: 83.008514404297
	{975.70501708984, -2293.3352050781, 30.508047103882,["time"] = 0,["used"] = false}, 
	--975.54284667969, -2290.6042480469, 30.508043289185 Heading: 83.758567810059
	{975.54284667969, -2290.6042480469, 30.508043289185,["time"] = 0,["used"] = false},  
	--967.17034912109, -2289.9333496094, 30.508043289185 Heading: 88.97208404541
	{967.17034912109, -2289.9333496094, 30.508043289185,["time"] = 0,["used"] = false},  
	--970.27056884766, -2298.4384765625, 30.508043289185 Heading: 252.84124755859
	{970.27056884766, -2298.4384765625, 30.508043289185,["time"] = 0,["used"] = false}, 
	--965.78460693359, -2298.3500976563, 30.508043289185 Heading: 88.817535400391 
	{965.78460693359, -2298.3500976563, 30.508043289185,["time"] = 0,["used"] = false}, 
	--966.25329589844, -2296.2141113281, 30.508043289185 Heading: 74.678985595703
	{966.25329589844, -2296.2141113281, 30.508043289185,["time"] = 0,["used"] = false}, 
	-- {1013.7381591797,-3100.9680175781,-38.999881744385,["time"] = 0,["used"] = false}, 
	-- {1009.3251342773,-3098.8120117188,-38.999881744385,["time"] = 0,["used"] = false},  
	-- {1005.9111938477,-3100.9387207031,-38.999881744385,["time"] = 0,["used"] = false}, 
	-- {1003.2393798828,-3093.9182128906,-38.999885559082,["time"] = 0,["used"] = false}, 
	-- {1008.0280151367,-3093.384765625,-38.999885559082,["time"] = 0,["used"] = false}, 
	-- {1010.8000488281,-3093.544921875,-38.999885559082,["time"] = 0,["used"] = false}, 
	-- {1016.1090087891,-3095.3405761719,-38.999885559082,["time"] = 0,["used"] = false},  
	-- {1018.2312011719,-3093.1293945313,-38.999885559082,["time"] = 0,["used"] = false},  
	-- {1025.1221923828,-3091.4680175781,-38.999885559082,["time"] = 0,["used"] = false}, 
	-- {1024.9321289063,-3096.4670410156,-38.999885559082,["time"] = 0,["used"] = false}, 
}

local dropPoints = {
	--979.68829345703, -2265.0307617188, 30.508043289185 Heading: 351.32241821289
	{979.68829345703, -2265.0307617188, 30.508043289185},
	-- {997.32006835938,-3099.3923339844,-38.999900817871},
	-- {1022.0564575195,-3095.892578125,-38.999855041504},
	-- {1022.1699829102,-3106.6181640625,-38.999855041504},
}

RegisterNetEvent('missionSystem:updatePoints')
AddEventHandler('missionSystem:updatePoints', function(result)
	RecyclePoints = result
end)
-----------------------------
-- Metal Harvest
-----------------------------
isRunningCrate = false

-- RegisterCommand("boxshit", function()
    -- exports['Renewed-Weaponscarry']:carryProp("pack2")
	-- TriggerEvent("attachItem","crate01")
-- end)

function runRecycle()
	isRunningCrate = true
	local isHolding = false
    exports['Renewed-Weaponscarry']:carryProp("pack2")
	-- TriggerEvent("attachItem","crate01")
    -- RequestAnimDict("anim@heists@box_carry@")
    -- TaskPlayAnim(PlayerPedId(),"anim@heists@box_carry@","idle",2.0, -8, 180, 49, 0, 0, 0, 0)
    Wait(1000)
    -- TaskPlayAnim(PlayerPedId(),"anim@heists@box_carry@","idle",2.0, -8, 180000000, 49, 0, 0, 0, 0)
	-- TriggerEvent("animation:disable", true)
	-- TriggerEvent("AnimSet:default")
    isHolding = true
    local rnd = math.random(1,#dropPoints)
    
    while isHolding do
    	Wait(0)
    	if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),dropPoints[rnd][1],dropPoints[rnd][2],dropPoints[rnd][3], true) <= 40 then
    		DrawText3Ds(dropPoints[rnd][1],dropPoints[rnd][2],dropPoints[rnd][3], "~b~[E]~w~ Drop Material")
    		if IsControlJustPressed(1, 38) and IsPedInAnyVehicle(PlayerPedId(), false) ~= 1 then
	    		if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),dropPoints[rnd][1],dropPoints[rnd][2],dropPoints[rnd][3], true) <= 3 then
                    TriggerServerEvent("40g9usdroib903ti4j4oigb")
	    			isHolding = false
	    		end
			end
			if IsPedRunning(PlayerPedId()) then
				SetPedToRagdoll(PlayerPedId(),2000,2000, 3, 0, 0, 0)
				Wait(2100)
				-- TaskPlayAnim(PlayerPedId(),"anim@heists@box_carry@","idle",2.0, -8, 180000000, 49, 0, 0, 0, 0)
			end
    	end
    end

    ClearPedTasks(PlayerPedId())
    exports['Renewed-Weaponscarry']:removeProp("pack2")
    FreezeEntityPosition(PlayerPedId(),true)
    RequestAnimDict("mp_car_bomb")
    TaskPlayAnim(PlayerPedId(),"mp_car_bomb","car_bomb_mechanic",2.0, -8, 180,49, 0, 0, 0, 0)
    Wait(100)
    TaskPlayAnim(PlayerPedId(),"mp_car_bomb","car_bomb_mechanic",2.0, -8, 1800000,49, 0, 0, 0, 0)
    Wait(3000)
    ClearPedTasks(PlayerPedId())
    FreezeEntityPosition(PlayerPedId(),false)

    if math.random(1,5) == 2 then
    	TriggerServerEvent('ez-recycle:GetReward',"recyclablematerial", math.random(2,3))
    else
    	TriggerServerEvent('ez-recycle:GetReward',"recyclablematerial", 1)
	end

	TriggerEvent("QBCore:Notify","Nice work, keep it up!")
	TriggerEvent("animation:disable", false)
    isRunningCrate = false
--	end
end

-- RegisterNetEvent("recycle:trade", function()
-- 	TriggerEvent("server-inventory-open", "103", "Craft")

-- end)


isTrading = false
isFishing = false



Citizen.CreateThread(function()

	while true do
		Wait(5)
		local PlayerPos = GetEntityCoords(PlayerPedId())
		
		for k,v in pairs(RecyclePoints) do
			if GetDistanceBetweenCoords(PlayerPos, v[1],v[2],v[3], true) <= 3 and not v.used and not isRunningCrate then
				DrawText3Ds(v[1],v[2],v[3], "~b~[E]~w~ Pickup Material")
			end
		end
		
		if IsControlJustPressed(1, 38) and IsPedInAnyVehicle(PlayerPedId(), false) ~= 1 then
			for k,v in pairs(RecyclePoints) do
				if GetDistanceBetweenCoords(PlayerPos, v[1],v[2],v[3], true) <= 2 then
					if not v.used and not isRunningCrate then
						v.used = true
						TriggerServerEvent('missionSystem:UpdateClients',RecyclePoints,k)
						runRecycle()
					end
				end
			end
			
			Wait(2500)

		end

	end

end)



function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end


