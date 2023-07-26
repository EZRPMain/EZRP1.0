QBCore = QBCore or exports[Config.Core]:GetCoreObject()

local WashedHands = false
local WashCounter = 0

local PlaceTables = {}
local TablesFormat = {}

business = nil
sitting = false
sitCounter = 0
onDuty = false
PlayerData = {}

RegisterNetEvent('QBCore:Client:UpdateObject', function()
	QBCore = exports[Config.Core]:GetCoreObject()
end)

-- Events
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    onDuty = PlayerData.job.onduty

	QBCore.Functions.TriggerCallback('qb-businesses:server:GetItemsCreated',function(items)
		if not items then return end

		QBCore.Shared.Items = items
	end)

	setupDUI()
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
	Wait(500)
	if PlayerData.job.name == business then
		BusinessTables()
	end
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    PlayerData = QBCore.Functions.GetPlayerData()
	Wait(3000)

	QBCore.Functions.TriggerCallback('qb-businesses:server:GetItemsCreated',function(items)
		if not items then return end
		QBCore.Shared.Items = items
	end)

	if PlayerData.job.name == business then
		BusinessTables()
	end
	setupDUI()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
	PlaceTables = {}
	TablesFormat = {}
end)

---- ** Table Functions for Syncronizations between clients ** ----

local function FormatTable(table)
	local newTable = {}
	if not table then return end
	for _, LPlusRatio in pairs(table) do
		if type(_) == "number" then
			if LPlusRatio.recipe then
				for _, v in pairs(table[_].recipe) do
					if QBCore.Shared.Items[v] then
						local ID = LPlusRatio.id
						if newTable[ID] then
							newTable[ID][#newTable[ID]+1] = { "<br><img src=nui://"..Config.FileDict..QBCore.Shared.Items[v].image.." width=35px; style=vertical-align:middle> &nbsp;|&nbsp; <u><b>"..QBCore.Shared.Items[v].label.."</b></u>" }
						else
							newTable[ID] = { "<br><img src=nui://"..Config.FileDict..QBCore.Shared.Items[v].image.." width=35px; style=vertical-align:middle> &nbsp;|&nbsp; <u><b>"..QBCore.Shared.Items[v].label.."</b></u>" }
						end
					end
				end
			end
		end
	end


	TablesFormat = newTable
end


function BusinessTables()
	if business then
		if business == PlayerData.job.name then
			QBCore.Functions.TriggerCallback("qb-businesses:server:GetAllTables",function(Foods)
				if not Foods then return end
				PlaceTables = Foods
				FormatTable(PlaceTables)
			end, business)
		end
	else
		PlaceTables = {}
	end
end

local function ResetHands()
	if WashCounter - 1 == 0 then
		WashCounter = 0
		WashedHands = false
	else
		WashCounter = WashCounter - 1
	end
end

RegisterNetEvent('qb-businesses:client:RefreshTable', function()
	if business then
		Wait(math.random(10,100))
		BusinessTables()
	end
end)

------------------------------0----------------------------------
--------------	  HAND WASHING FOR BUSINESSES	  --------------
----------------------------------------------------------------

CreateThread(function()
	for k, v in pairs(Config.HandWash) do
		exports['qb-target']:AddCircleZone("WashHands"..k, v.coords , 0.5,
		{
			name = "WashHands"..k,
			useZ = true,
			debugPoly = Config.debugPoly,
		}, {
			options =
			{ {
				event = "qb-businesses:client:WashHands",
				icon = v.icon,
				label = Lang:t('target.hand_wash'),
			}, },
			distance = 2.5
		})
	end
end)

RegisterNetEvent('qb-businesses:client:WashHands', function()
	QBCore.Functions.Progressbar('BusHandWash', Lang:t('progressbar.hand_wash'), 4500, false, true, { -- Name | Label | Time | useWhileDead | canCancel
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
        animDict = "mp_arresting",
        anim = "a_uncuff",
        flags = 8,
	}, {}, {}, function() -- Play When Done
		ClearPedTasksImmediately(PlayerPedId())
		WashedHands = true
		WashCounter = Config.WashCounter

		QBCore.Functions.Notify(Lang:t('info.hands_washed'), "success", 4500)
	end, function() -- Play When Cancel
		QBCore.Functions.Notify(Lang:t("error.cancelled"), "error", 4500)
	end)
end)


----------------------------------------------------------------
--------------	  CHAIR TARGETS FOR BUSINESSES	  --------------
----------------------------------------------------------------

CreateThread(function()
	for k, v in pairs(Config.Chairs) do
		exports['qb-target']:AddCircleZone("BusinessChair"..k, vector3(v.x, v.y, v.z-0.5) , 0.5,
		{
			name = "BusinessChair"..k,
			useZ = true,
			debugPoly = Config.debugPoly,
		}, {
			options =
			{ {
				event = "qb-businesses:client:SitDown",
				icon = "fas fa-chair",
				label = Lang:t('target.chairs_sitdown'),
				loc = vector3(v.x, v.y, v.z-0.5),
				head = v.w,
			}, },
			distance = 2.5
		})
	end
end)

local radial = nil

local function sittingCounter(ped)
	if not sitting then return end

	radial = exports['qb-radialmenu']:AddOption({
		id = 'businesses:situp',
		title = 'Sit Up',
		icon = 'chair',
		type = 'client',
		event = 'qb-businesses:client:SitUp',
		shouldClose = true
	})

	CreateThread(function()
		while sitting do
			sitCounter = sitCounter + 1
			if Config.Debug and business then log(("Currently been sitting in business %s for %s seconds"):format(business, sitCounter)) end

			if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				sitCounter = 0
				if Config.Debug and business then log(("No longer sitting in business %s"):format(business)) end
			end

			Wait(1000)
		end

		if radial then
			exports['qb-radialmenu']:RemoveOption(radial)
			radial = nil
		end
	end)
end

RegisterNetEvent('qb-businesses:client:SitDown', function(data)
	local ped = PlayerPedId()
	TaskStartScenarioAtPosition(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z, data.head, 0, 1, true)


	if not business then return end
	if Config.Debug then log(("Sitting down in business %s"):format(business)) end
	if sitting then return end

	sitting = true
	Wait(2500)

	sittingCounter(ped)
end)

RegisterNetEvent('qb-businesses:client:SitUp', function()
	if not sitting then return end

	local ped = PlayerPedId()

	if IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
		ClearPedTasksImmediately(ped)
		sitting = false
		sitCounter = 0
	end
end)

----------------------------------------------------------------
--------------	  TABLE TARGETS FOR BUSINESSES	  --------------
----------------------------------------------------------------

CreateThread(function()
	for k, v in pairs(Config.Tables) do
		exports['qb-target']:AddCircleZone("BusinessTable"..k, vector3(v.coords) , 0.50,
		{
			name="BusinessTable"..k,
			useZ=true,
			debugPoly = Config.debugPoly,
		}, {
			options = { {
				event = "qb-businesses:client:OpenTable",
				icon = "fas fa-chair",
				label = Lang:t('target.table_open'),
				loc = vector3(v.coords),
				id = k,
			}, },
			distance = 2.5
		})
	end
end)

RegisterNetEvent('qb-businesses:client:OpenTable', function(data)
	if #(GetEntityCoords(PlayerPedId()) - data.loc) <= 3 then
		TriggerEvent("inventory:client:SetCurrentStash",("%s_%s"):format(business, data.id))
		TriggerServerEvent("inventory:server:OpenInventory", "stash", ("%s_%s"):format(business, data.id))
	end
end)

----------------------------------------------------------------
--------------	  STASH TARGETS FOR BUSINESSES	  --------------
----------------------------------------------------------------


CreateThread(function()
	for k, v in pairs(Config.StaffStashes) do
		exports['qb-target']:AddCircleZone("StaffStash"..k, vector3(v.coords) , v.size,
		{
			name="StaffStash"..k,
			useZ=true,
			debugPoly = Config.debugPoly,
		}, {
			options =
			{ {
				event = "qb-businesses:client:OpenStaffStash",
				icon = "fas fa-box",
				label = Lang:t('target.stash_open'),
				job = v.job,
				stashname = v.name,
				stashsize = v.stashsize,
				stashslots = v.stashslots,
				loc = vector3(v.coords),
			}, },
			distance = 2.5
		})
	end
end)

RegisterNetEvent("qb-businesses:client:OpenStaffStash", function(data)
	local dist = #(GetEntityCoords(PlayerPedId()) - data.loc)
	if PlayerData.job.name == business and dist <= 3 then
		TriggerServerEvent("inventory:server:OpenInventory", "stash", data.stashname, {
			maxweight = data.stashsize,
			slots = data.stashslots,
		})
		TriggerEvent("inventory:client:SetCurrentStash", data.stashname)
	end
end)

----------------------------------------------------------------
--------------	  Bussinesses Cutting Stations	  --------------
----------------------------------------------------------------

CreateThread(function()
	for k, v in pairs(Config.CuttingBoardCoords) do
		exports['qb-target']:AddCircleZone("BidnessCutting"..k, v.coords, v.polysize,
		{
			name = "BidnessCutting"..k,
			useZ = true,
			debugPoly = Config.debugPoly,
		}, {
			options = {
			{  -- Vegetables
				event = "qb-businesses:client:CuttingMenu",
				icon = v.icon,
				label = Lang:t('target.cut_vegetables'),
				job = v.job,
			},
		},
			distance = 2.5
		})
	end
end)

RegisterNetEvent('qb-businesses:client:CuttingMenu', function()
	local menu = {
		{
			isMenuHeader = true,
			header = Lang:t('target.cut_vegetables'),
			icon = "fa-brands fa-cuttlefish",
		},
	}

	for k, v in pairs(Config.CuttingBoard) do
		if QBCore.Shared.Items[v.item] then
			menu[#menu + 1] = {
				header = Lang:t('menu.cutting_header'):format(QBCore.Shared.Items[v.item].label),
				txt = Lang:t('menu.cutting_info'):format(QBCore.Shared.Items[v.item].label, QBCore.Shared.Items[v.cutitem].label),
				icon = v.icon,
				params = {
					event = 'qb-businesses:client:CutFood',
					args = k
				}
			}
		end
	end
	exports[Config.Menu]:openMenu(menu)
end)

RegisterNetEvent("qb-businesses:client:CutFood", function(food)
	if QBCore.Functions.HasItem(Config.CuttingBoard[food].item) then
		if WashedHands then
			QBCore.Functions.Progressbar('Cut_Foods', Lang:t('progressbar.cutting_board'):format(QBCore.Shared.Items[Config.CuttingBoard[food].item].label), 5000, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = 'anim@heists@prison_heiststation@cop_reactions',
				anim = 'cop_b_idle',
				flags = 3,
			}, {}, {}, function() -- Play When Done
				ClearPedTasksImmediately(PlayerPedId())
				TriggerServerEvent('qb-businesses:server:CutFood', food)
				ResetHands()
			end, function() -- Play When Cancel
				QBCore.Functions.Notify(Lang:t("error.cancelled"), "error", 4500)
			end)
		else
			QBCore.Functions.Notify(Lang:t("info.no_handwash"), "error", 4500)
		end
	else
		QBCore.Functions.Notify("You don't have a "..Config.CuttingBoard[food].item, "error", 4500)
	end
end)


----------------------------------------------------------------
--------------	  Bussinesses Preps Stations	  --------------
----------------------------------------------------------------

CreateThread(function()
	for shop, _ in pairs(Config.Stations) do
		for k, v in pairs(Config.Stations[shop]) do
			exports['qb-target']:AddCircleZone(shop.."BusinessStations"..k, v.coords, v.pSize,
			{
				name= shop.."BusinessStations"..k,
				useZ=true,
				debugPoly = Config.debugPoly,
			}, {
				options = {
					{
						event = "qb-businesses:client:GetStationFoods",
						icon = v.icon,
						label = Lang:t("target.use_station"),
						job = v.job,
						menu = v.name,
						place = k,
						NewIcon = v.headericon
					},
				},
				distance = 2.5
			})
		end
	end
end)

local function HasItems(Required)

    local recipe = {}
    for _, v in pairs(Required) do
        if recipe[v] then
			recipe[v].amount = recipe[v].amount + 1
		else
            recipe[v] = { hasItem = false, amount = 1 }
		end
    end

    local items = QBCore.Functions.GetPlayerData().items
    if items then
		local OrganizedItems = {}
        for _, v in pairs(items) do
			if OrganizedItems[v.name] then
				OrganizedItems[v.name] = OrganizedItems[v.name] + v.amount
			else
				OrganizedItems[v.name] = v.amount
			end
        end

		for k, v in pairs(OrganizedItems) do
            if recipe[k] and recipe[k].amount <= v then
                recipe[k].hasItem = true
            end
		end
    end

    local hasItems = true

    for _, v in pairs(recipe) do
        if not hasItems then break end
        if not v.hasItem then hasItems = false end
    end

    return hasItems
end

RegisterNetEvent('qb-businesses:client:GetStationFoods', function(data)
	local menu = data.menu

	local Fooditems = {
		{
			header = menu.." Station",
			icon = data.NewIcon,
			isMenuHeader = true,
		},
	}


	for k, v in pairs(PlaceTables) do
		if v.active and menu == v.station and QBCore.Shared.Items[v.name] then
			Fooditems[#Fooditems + 1] = { --<u></u>
				header = ("<u>%s</u>"):format(v.label), -- header = "<u><b>"..v.label.."</b></u>",
				image = v.image,
				txt = TablesFormat[k],
				params = {
					event = 'qb-businesses:client:MakeItem',
					args =  {
						id = k,
					}
				}
			}
		end
	end

	exports[Config.Menu]:openMenu(Fooditems)
end)

RegisterNetEvent('qb-businesses:client:MakeItem', function(data)
	if WashedHands then
		local id = data.id
		local short = PlaceTables[id]
		local needed = short.recipe

		if not id or not short or not needed then return end

		local time = short.menu and Config.TimeToCook[short.menu] or 5000


		if HasItems(needed) then
			TriggerEvent('animations:client:EmoteCommandStart', {Config.Stations[business][short.station].emote})
			local name = {name = short.label}
			QBCore.Functions.Progressbar('qb-businessShit', Lang:t('info.making_food', name), time, false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Play When Done
				ClearPedTasks(PlayerPedId())
				TriggerServerEvent('qb-businesses:server:GetItem', short.name, needed, business)
				QBCore.Functions.Notify(Lang:t('info.food_made', name), "success", 4500)
				ResetHands()
			end, function() -- Play When Cancel
				QBCore.Functions.Notify(Lang:t("error.cancelled"), "error", 4500)
			end)
		else
			QBCore.Functions.Notify(Lang:t('info.wrong_ingredients'), "error", 4500)
		end
	else
		QBCore.Functions.Notify(Lang:t('info.no_handwash'), "error", 4500)
	end
end)