local PedSpawned = {}
local EntityExports = {}
local BusinessPeds = {
	["catcafe"] = {
		{ coords = vector4(-577.14, -1069.22, 21.99, 0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", target = true, frozen = true, ped = `a_c_cat_01`, dist = 1.2 },
		{ coords = vector4(-583.32, -1069.32, 21.99, 90.0),  animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", target = true, frozen = true, ped = `a_c_cat_01`, dist = 1.2},
		{ coords = vector4(-576.49, -1054.94, 21.42, 350.0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", target = true, frozen = true, ped = `a_c_cat_01`, dist = 2},
		{ coords = vector4(-582.07, -1055.92, 21.43, 250.0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", target = true, frozen = true, ped = `a_c_cat_01`, dist = 2},
		{ coords = vector4(-595.29, -1055.54, 21.43, 180.0), animDict = "creatures@cat@amb@world_cat_sleeping_ledge@base", animName = "base", target = false, frozen = true, ped = `a_c_cat_01`, dist = 2},
		{ coords = vector4(-571.65, -1057.26, 21.54, 90.0), animDict = "creatures@cat@move", animName = "gallop", frozen = true, ped = `a_c_cat_01`},

		{ coords = vector4(-584.33, -1062.76, 22.40, 223.0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", target = true, frozen = true, ped = `a_c_cat_01`, dist = 2},
		{ coords = vector4(-575.53, -1049.41, 22.53, 90.0),  animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", target = true, frozen = true, ped = `a_c_cat_01`, dist = 2},
		{ coords = vector4(-584.71, -1054.55, 22.33, 280.0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", target = true, frozen = true, ped = `a_c_cat_01`, dist = 2},
		{ coords = vector4(-586.85, -1064.68, 22.35, 0), animDict = "creatures@cat@amb@world_cat_sleeping_ground@base", animName = "base", target = true, frozen = true, ped = `a_c_cat_01`, dist = 2},

		{ coords = vector4(-576.78, -1057.52, 24.15, 0.0), animDict = "creatures@cat@amb@world_cat_sleeping_ledge@base", animName = "base", target = false, frozen = true, ped = `a_c_cat_01`, dist = 2},
		{ coords = vector4(-583.55, -1048.88, 24.50, 240.0), animDict = "creatures@cat@amb@world_cat_sleeping_ledge@base", animName = "base", target = false, frozen = true, ped = `a_c_cat_01`, dist = 2},
		{ coords = vector4(-587.4, -1059.6, 22.3, 180.0), animDict = "creatures@cat@amb@world_cat_sleeping_ledge@base", animName = "base", target = false, frozen = true, ped = `a_c_cat_01`, dist = 2},

		{ coords = vector4(-573.78, -1052.5, 22.40, 90.0), wander = true, ped = `a_c_cat_01` },
		{ coords = vector4(-582.57, -1059.72, 22.40, 180.0), wander = true, ped = `a_c_cat_01` },
		{ coords = vector4(-582.35, -1050.91, 22.40, 180.0), wander = true, ped = `a_c_cat_01` },
		{ coords = vector4(-585.55, -1067.99, 22.40, 0.0), wander = true, ped = `a_c_cat_01` },
		{ coords = vector4(-578.73, -1051.92, 22.40, 180.0), wander = true, ped = `a_c_cat_01` },
	},
	["vu"] = {
		{ coords = vector4(112.78, -1283.24, 27.88, 318.1), animDict = "mini@strip_club@private_dance@idle", animName = "priv_dance_idle", frozen = true, ped = `a_f_y_topless_01`},
		{ coords = vector4(115.75, -1286.86, 27.88, 248.86), animDict = "mini@strip_club@private_dance@part2", animName = "priv_dance_p2", frozen = true, ped = `a_f_y_topless_01`},
		{ coords = vector4(121.01, -1285.24, 27.68, 298.27), animDict = "mini@strip_club@private_dance@part3", animName = "priv_dance_p3", frozen = true, ped = `a_f_y_topless_01`},
	},
}

local PropsSpawned = {}
local BusinessProps = {
	["popsdiner"] = {
		{ coords = vector4(1596.42, 6454.42, 26.0, 244.30), frozen = true, prop = `prop_ff_sink_01`},
	},
	["burgershot"] = {
		{ coords = vector4(-1192.41, -896.84, 14.1, 119.74), frozen = true, prop = `prop_food_bs_tray_02`},
		{ coords = vector4(-1194.42, -893.88, 14.1, 121.46), frozen = true, prop = `prop_food_bs_tray_02`},
		{ coords = vector4(-1193.36, -895.44, 14.1, 119.74), frozen = true, prop = `prop_food_bs_tray_02`},
	},
	["vu"] = {
		{ coords = vector4(135.869675, -1286.77246, 28.2695389, 300.0), frozen = true, prop = `prop_chip_fryer`},
		{ coords = vector4(136.452545, -1287.78027, 28.2695389, 300.0), frozen = true, prop = `prop_cooker_03`},
		{ coords = vector4(136.541443, -1287.52917, 29.2022575, 300.0), frozen = true, prop = `prop_kitch_pot_huge`},
		{ coords = vector4(137.103409, -1288.852, 28.2701149, 300.0), frozen = true, prop = `v_res_fridgemodsml`},
		{ coords = vector4(136.620056, -1288.57349, 30.6486816, 210.0), frozen = true, prop = `prop_pot_rack`},
		{ coords = vector4(134.925262, -1290.24768, 28.2695389, 210.0), frozen = true, prop = `prop_ff_counter_03`},
		{ coords = vector4(132.779739, -1291.48621, 28.2695389, 210.0), frozen = true, prop = `prop_ff_counter_03`},
		{ coords = vector4(131.708618, -1290.84546, 28.2695389, 120.0), frozen = true, prop = `prop_ff_sink_02`},
		{ coords = vector4(131.009827, -1289.753, 28.2695389, 120.0), frozen = true, prop = `prop_bar_fridge_04`},
		{ coords = vector4(131.013214, -1289.75159, 29.1795464, 120.0), frozen = true, prop = `prop_bar_fridge_04`},
		{ coords = vector4(135.78923, -1290.191, 29.5089684, 210.0), frozen = true, prop = `v_res_mkniferack`},
		{ coords = vector4(135.243774, -1290.45422, 29.3698635, 210.0), frozen = true, prop = `prop_utensil`},
		{ coords = vector4(132.967667, -1291.43555, 29.1720062, 210.0), frozen = true, prop = `prop_tea_urn`},
		{ coords = vector4(133.73613, -1291.1615, 29.1747631, 210.0), frozen = true, prop = `prop_micro_04`},
		{ coords = vector4(134.27977, -1290.773, 29.1805573, 210.0), frozen = true, prop = `prop_microwave_1`},
		{ coords = vector4(134.27948, -1290.77283, 29.5135765, 210.0), frozen = true, prop = `prop_microwave_1`},
		{ coords = vector4(134.704559, -1290.6864, 29.1776237, 210.0), frozen = true, prop = `v_res_foodjara`},
		{ coords = vector4(134.883575, -1290.58423, 29.177145, 210.0), frozen = true, prop = `v_res_foodjarc`},
		{ coords = vector4(134.949081, -1290.14771, 29.1948986, 210.0), frozen = true, prop = `v_res_fa_chopbrd`},
		{ coords = vector4(135.6515, -1289.746, 29.1762028, 210.0), frozen = true, prop = `v_res_mchopboard`},
		{ coords = vector4(135.381088, -1290.09265, 29.1829815, 210.0), frozen = true, prop = `v_res_mknifeblock`},
		{ coords = vector4(136.4154, -1287.99866, 29.1981659, 210.0), frozen = true, prop = `prop_cs_steak`},
		{ coords = vector4(136.665665, -1287.8656, 29.2001972, 210.0), frozen = true, prop = `prop_cs_steak`},
		{ coords = vector4(135.758774, -1289.55786, 28.4052962, 210.0), frozen = true, prop = `v_res_tt_bowlpile02`},
		{ coords = vector4(135.863281, -1289.73889, 28.4052962, 210.0), frozen = true, prop = `v_res_tt_bowlpile02`},
		{ coords = vector4(135.970413, -1289.92444, 28.4052962, 210.0), frozen = true, prop = `v_res_tt_bowlpile02`},
		{ coords = vector4(135.80011, -1290.02271, 28.4052962, 210.0), frozen = true, prop = `v_res_tt_bowlpile02`},
		{ coords = vector4(135.690857, -1289.83838, 28.4052962, 210.0), frozen = true, prop = `v_res_tt_bowlpile02`},
		{ coords = vector4(135.5905, -1289.655, 28.4052962, 210.0), frozen = true, prop = `v_res_tt_bowlpile02`},
		{ coords = vector4(135.336868, -1290.00879, 28.45993, 210.0), frozen = true, prop = `v_ret_fh_pot01`},
		{ coords = vector4(134.78801, -1290.29053, 28.4514927, 210.0), frozen = true, prop = `prop_kitch_pot_huge`},
		{ coords = vector4(134.455215, -1290.72168, 28.3960721, 210.0), frozen = true, prop = `v_res_tt_platepile`},
		{ coords = vector4(134.179459, -1290.88086, 28.3960721, 210.0), frozen = true, prop = `v_res_tt_platepile`},
		{ coords = vector4(134.008453, -1290.58472, 28.3960721, 210.0), frozen = true, prop = `v_res_tt_platepile`},
		{ coords = vector4(134.2922, -1290.43066, 28.3960721, 210.0), frozen = true, prop = `v_res_tt_platepile`},
		{ coords = vector4(132.552216, -1291.58459, 28.4380268, 210.0), frozen = true, prop = `prop_kitch_pot_lrg`},
		{ coords = vector4(133.016357, -1291.30139, 28.4166664, 210.0), frozen = true, prop = `v_res_tt_pot01`},
		{ coords = vector4(133.5553, -1291.053, 28.4328983, 210.0), frozen = true, prop = `v_ret_fh_fry02`},
	}
}

local PetCD = true

local function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

local function loadmodel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(100)
	end
end

local function CatPetWait()
	PetCD = false
	Wait(60000)
	PetCD = true
end

local function SpawnObject(model, coords, frozen)
	loadmodel(model)
	local propId = #PropsSpawned+1
	PropsSpawned[propId] = CreateObject(model, coords.x, coords.y, coords.z, false)
	SetEntityHeading(PropsSpawned[propId], coords.w)
	FreezeEntityPosition(PropsSpawned[propId], frozen)
	SetModelAsNoLongerNeeded(model)
end

local function SpawnPed(model, coords, frozen, wander, animDict, animName, target, pedNum)
	loadmodel(model)
	local ped = CreatePed(5, model, coords.x, coords.y, coords.z, coords.w, false, false)

	PedSpawned[pedNum] = ped

	if frozen then
		FreezeEntityPosition(ped, true)
	end

	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)

	if animDict and animName then
		loadAnimDict(animDict)
		TaskPlayAnim(ped, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end

	if wander then
		TaskWanderStandard(ped, 10.0, 10.0)
	end

	SetEntityNoCollisionEntity(ped, PlayerPedId(), false)
	if target then
		EntityExports[#EntityExports+1] = exports['qb-target']:AddTargetEntity(ped, {
			options = {
				{
					type = "client",
					event = "qb-businesses:client:PetTheCat",
					icon = "fas fa-paw",
					label = "Pet the Cat",
					canInteract = function() return PetCD end,
					data = pedNum,
				}
			},
			distance = 1.5
		})
	end
end

RegisterNetEvent('qb-businesses:client:PlayCatAnim', function(cat)
	loadAnimDict("creatures@cat@amb@world_cat_sleeping_ground@exit")

	TaskPlayAnim(cat, "creatures@cat@amb@world_cat_sleeping_ground@exit", "exit", 1.0, 200.0, 0.3, 8, 0.2, 0, 0, 0)
	Wait(4000)
	RemoveAnimDict("creatures@cat@amb@world_cat_sleeping_ground@exit")
	FreezeEntityPosition(cat, false)
	TaskTurnPedToFaceEntity(cat, PlayerPedId(), 1000)
	Wait(1000)
	FreezeEntityPosition(cat, true)
	Wait(1500)

	if math.random() >= 0.5 then
		loadAnimDict("creatures@cat@player_action@")
		TaskPlayAnim(cat, "creatures@cat@player_action@", "action_a", 2.0, 200.0, 0.3, 8, 0.2, 0, 0, 0)
	end

	Wait(3000)

	TaskPlayAnim(cat, "creatures@cat@amb@world_cat_sleeping_ground@base", "base", 2.0, 200.0, 0.3, 2, 0.2, 0, 0, 0)
end)

RegisterNetEvent('qb-businesses:client:PetTheCat', function(data)
	local ped = PlayerPedId()
	local cat = PedSpawned[data.data]
	local UwUCatPos = GetEntityCoords(cat)

	if cat then
		TaskTurnPedToFaceEntity(ped, cat, 1200)
		Wait(1200)
		if UwUCatPos.z > 22 then
			TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
		else
			TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
		end

		TriggerEvent('qb-businesses:client:PlayCatAnim', cat)

		QBCore.Functions.Progressbar('businessCatPetting', 'Petting the Cat', 7500, false, true, {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		}, {}, {}, {}, function() -- Play When Done
			TriggerServerEvent('hud:server:RelieveStress', math.random(1, 5))
			CatPetWait()
		end, function() -- Play When Cancel
			QBCore.Functions.Notify("Cancelled...", "success", 4500)
		end)
	end
end)

CreateThread(function()
    CreateModelHide(vector3(132.86, -1288.0, 29.27), 0.2, 1695461688, true)
end)

local IsSpawned = false
function BusinessWalkIn(restaurant)
    if restaurant == "catcafe" and not IsSpawned then
		IsSpawned = true
		for k, v in pairs(BusinessPeds.catcafe) do
			SpawnPed(v.ped, v.coords, v.frozen, v.wander, v.animDict, v.animName, v.target, k)
		end
	elseif restaurant == "vu" and not IsSpawned then
		IsSpawned = true
		for k, v in pairs(BusinessPeds.vu) do
			SpawnPed(v.ped, v.coords, v.frozen, v.wander, v.animDict, v.animName, v.target, k)
		end
		for k=1, #BusinessProps.vu do
            SpawnObject(BusinessProps.vu[k].prop, BusinessProps.vu[k].coords, BusinessProps.vu[k].frozen)
			Wait(5)
		end
	elseif restaurant == "popsdiner" and not IsSpawned then
		IsSpawned = true
		for k=1, #BusinessProps.popsdiner do
            SpawnObject(BusinessProps.popsdiner[k].prop, BusinessProps.popsdiner[k].coords, BusinessProps.popsdiner[k].frozen)
		end
	elseif restaurant == "burgershot" and not IsSpawned then
		IsSpawned = true
		for k=1, #BusinessProps.burgershot do
            SpawnObject(BusinessProps.burgershot[k].prop, BusinessProps.burgershot[k].coords, BusinessProps.burgershot[k].frozen)
		end
	elseif not restaurant and IsSpawned then
		IsSpawned = false
		for _, v in pairs(PedSpawned) do
			DeletePed(v)
		end
		for k in pairs(EntityExports) do
			exports['qb-target']:RemoveZone(EntityExports[k])
		end
		for k=1, #PropsSpawned do
			DeleteObject(PropsSpawned[k])
		end
		PedSpawned={}
		PropsSpawned={}
		EntityExports={}
	end
end

local poles = {
	vector3(104.76, -1294.18, 28.25),
	vector3(108.83, -1289.02, 28.25),
	vector3(102.22, -1289.87, 28.25),
}

for k = 1,#poles do
	exports['qb-target']:AddBoxZone("VuDancePole"..k, poles[k], 0.7, 0.7, {
		name = "VuDancePole"..k,
		heading = 30.0,
		debugPoly = Config.debugPoly,
		minZ = 28.0,
		maxZ = 32.9,
	}, {
		options = { {
			event = "qb-businesses:client:poleDance",
			icon = "fas fa-chair",
			label = "Dance",
			job = "vu",
			pole = k
		}, },
		distance = 3
	})
end

RegisterNetEvent('qb-businesses:client:poleDance', function(data)
	local ped = PlayerPedId()
	loadAnimDict('mini@strip_club@pole_dance@pole_dance'..data.pole)
	local scene = NetworkCreateSynchronisedScene(vector3(poles[data.pole].x, poles[data.pole].y, poles[data.pole].z+1), vector3(0.0, 0.0, 0.0), 2, false, true, 1065353216, 0, 1.3)
    NetworkAddPedToSynchronisedScene(ped, scene, 'mini@strip_club@pole_dance@pole_dance' .. data.pole, 'pd_dance_0' .. data.pole, 1.5, -4.0, 1, 1, 1148846080, 0)
    NetworkStartSynchronisedScene(scene)
end)