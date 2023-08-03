local isPickingUp, isProcessing = false, false
local QBCore = exports['qb-core']:GetCoreObject()

local created_object = nil

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	DeleteEntity(created_object)
end)

CreateThread(function()
	local lsdTable = `v_ret_ml_tableb`
	--vector3(-168.1, 6167.61, 31.21)
	local lsdTableCoords = vector4(-168.3, 6167.51, 31.21, 224.66)
	RequestModel(lsdTable)
	local iter_for_request = 1
	while not HasModelLoaded(lsdTable) and iter_for_request < 5 do
		Wait(500)                
		iter_for_request = iter_for_request + 1
	end
	if not HasModelLoaded(lsdTable) then
		SetModelAsNoLongerNeeded(lsdTable)
	else
		local ped = PlayerPedId()
		created_object = CreateObjectNoOffset(lsdTable, lsdTableCoords.x, lsdTableCoords.y, lsdTableCoords.z - 1, 1, 0, 1)
		PlaceObjectOnGroundProperly(created_object)
		SetEntityHeading(created_object, lsdTableCoords.w)
		FreezeEntityPosition(created_object, true)
		SetModelAsNoLongerNeeded(lsdTable)
	end
end)

local function Processlsd()
	isProcessing = true
	local playerPed = PlayerPedId()

	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.processing"), 15000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
		disableKeyboard = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('ps-drugprocessing:Processlsd')

		local timeLeft = Config.Delays.lsdProcessing / 1000
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
			if #(GetEntityCoords(playerPed)-Config.CircleZones.lsdProcessing.coords) > 5 then
				QBCore.Functions.Notify(Lang:t("error.too_far"))
				TriggerServerEvent('ps-drugprocessing:cancelProcessing')
				break
			end
		end
		ClearPedTasks(playerPed)
		isProcessing = false
	end, function()
		ClearPedTasks(playerPed)
		isProcessing = false
	end)
end

local function Processthionylchloride()
	isProcessing = true
	local playerPed = PlayerPedId()

	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	QBCore.Functions.Progressbar("search_register", Lang:t("progressbar.processing"), 15000, false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
		disableKeyboard = true,
	}, {}, {}, {}, function()
		TriggerServerEvent('ps-drugprocessing:processThionylChloride')
		local timeLeft = Config.Delays.thionylchlorideProcessing / 1000
		while timeLeft > 0 do
			Wait(1000)
			timeLeft -= 1
			if #(GetEntityCoords(playerPed)-Config.CircleZones.thionylchlorideProcessing.coords) > 5 then
				QBCore.Functions.Notify(Lang:t("error.too_far"))
				TriggerServerEvent('ps-drugprocessing:cancelProcessing')
				break
			end
		end
		ClearPedTasks(playerPed)
		isProcessing = false
	end, function()
		ClearPedTasks(playerPed)
		isProcessing = false
	end)
end

CreateThread(function()
    while true do
        Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

        if #(coords-Config.CircleZones.lsdProcessing.coords) < 2 then
            if not isProcessing then
                local pos = GetEntityCoords(PlayerPedId())
                QBCore.Functions.DrawText3D(pos.x, pos.y, pos.z, Lang:t("drawtext.process_lsd"))
            end
            if IsControlJustReleased(0, 38) and not isProcessing then
				QBCore.Functions.TriggerCallback('ps-drugprocessing:validate_items', function(result)
					if result.ret then
                        Processlsd()
					else
						QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
					end
				end, {lsa = 1, thionyl_chloride = 1})
            end
        else
            Wait(500)
        end
    end
end)

RegisterNetEvent('ps-drugprocessing:processingThiChlo', function()
	local coords = GetEntityCoords(PlayerPedId(source))
	
	if #(coords-Config.CircleZones.thionylchlorideProcessing.coords) < 5 then
		if not isProcessing then
			QBCore.Functions.TriggerCallback('ps-drugprocessing:validate_items', function(result)
				if result.ret then
					Processthionylchloride()
				else
					QBCore.Functions.Notify(Lang:t("error.no_item", {item = result.item}))
				end
			end, {lsa = 1, chemicals = 1})
		end
	end
end)
