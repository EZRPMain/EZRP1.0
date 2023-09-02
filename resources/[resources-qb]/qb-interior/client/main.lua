local IsNew = false

RegisterNetEvent('qb-interior:client:SetNewState', function(bool)
    IsNew = bool
end)
-- Functions
function TeleportToInterior(x, y, z, h)
    CreateThread(function()
        SetEntityCoords(PlayerPedId(), x, y, z, 0, 0, 0, false)
        SetEntityHeading(PlayerPedId(), h)

        Wait(100)

        DoScreenFadeIn(1000)
    end)
end

exports('DespawnInterior', function(objects, cb)
    CreateThread(function()
        for _, v in pairs(objects) do
            if DoesEntityExist(v) then
                DeleteEntity(v)
            end
        end

        cb()
    end)
end)

--Core Functions

local function CreateShell(spawn, exitXYZH, model)
    local objects = {}
    local POIOffsets = {}
    POIOffsets.exit = exitXYZH
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(1000)
    end
    local house = CreateObject(model, spawn.x, spawn.y, spawn.z, false, false, false)

    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
    TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end

exports('CreateShell', function(spawn, exitXYZH, model)
    return CreateShell(spawn, exitXYZH, model)
end)

exports('CreateContainerRobbery', function(spawn) -- Container Robberies
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 0.08, "y": -5.93, "z": 1.24, "h": 359.32}')
	POIOffsets.prop = json.decode('{"x": 0.00, "y": 4.7, "z": 1.24, "h": 359.32}')
	POIOffsets.prop2 = json.decode('{"x": 0.00, "y": 0.1, "z": 2.2, "h": 270.0}')
	POIOffsets.prop3 = json.decode('{"x": 0.00, "y": -1.0, "z": 1.84, "h": 270.0}')
	POIOffsets.prop4 = json.decode('{"x": 0.00, "y": -4.4, "z": 1.84, "h": 270.0}')
	POIOffsets.prop5 = json.decode('{"x": 0.77, "y": -0.7, "z": 0.0, "h": 360.0}')
	POIOffsets.prop6 = json.decode('{"x": -0.88, "y": -2.9, "z": 0.0, "h": 360.0}')
	POIOffsets.prop7 = json.decode('{"x": 0.82, "y": 0.9, "z": 0.0, "h": 360.0}')
	POIOffsets.prop8 = json.decode('{"x": 1.27, "y": -3.1, "z": 1.35, "h": 360.0}')
	POIOffsets.prop9 = json.decode('{"x": 1.2, "y": -3.0, "z": 0.1, "h": 360.0}')
	POIOffsets.prop10 = json.decode('{"x": -1.19, "y": 0.8, "z": 0.1, "h": 360.0}')
	POIOffsets.prop11 = json.decode('{"x": 0.0, "y": 0.0, "z": 2.5, "h": 360.0}')
	POIOffsets.prop12 = json.decode('{"x": -0.9, "y": 4.0, "z": 1.8, "h": 360.0}')
	POIOffsets.prop13 = json.decode('{"x": -1.2, "y": 1.2, "z": 0.1, "h": 360.0}')
	POIOffsets.prop14 = json.decode('{"x": -1.34, "y": 0.5, "z": 0.9, "h": 360.0}')
	POIOffsets.prop15 = json.decode('{"x": 0.79, "y": 0.9, "z": 0.8, "h": 360.0}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`container_shell`)
	while not HasModelLoaded(`container_shell`) do
	    Wait(1000)
	end
	local house = CreateObject(`container_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
	local newprop = CreateObject(`ba_prop_battle_crate_art_02_bc`, spawn.x, spawn.y + POIOffsets.prop.y, spawn.z, false, false, false)
	local newprop2 = CreateObject(`hei_prop_hei_cont_light_01`, spawn.x, spawn.y + POIOffsets.prop2.y, spawn.z + POIOffsets.prop2.z, false, false, false)

	local newprop5 = CreateObject(`gr_prop_gr_drillcage_01a`, spawn.x + POIOffsets.prop5.x, spawn.y + POIOffsets.prop5.y, spawn.z + POIOffsets.prop5.z, false, false, false)
	local newprop6 = CreateObject(`gr_prop_gr_crates_pistols_01a`, spawn.x + POIOffsets.prop6.x, spawn.y + POIOffsets.prop6.y, spawn.z + POIOffsets.prop6.z, false, false, false)
	local newprop7 = CreateObject(`gr_prop_gr_bench_02b`, spawn.x + POIOffsets.prop7.x, spawn.y + POIOffsets.prop7.y, spawn.z + POIOffsets.prop7.z, false, false, false)
	local newprop8 = CreateObject(`v_ret_neon_baracho`, spawn.x + POIOffsets.prop8.x, spawn.y + POIOffsets.prop8.y, spawn.z + POIOffsets.prop8.z, false, false, false)
	local newprop9 = CreateObject(`ex_office_swag_paintings01`, spawn.x + POIOffsets.prop9.x, spawn.y + POIOffsets.prop9.y, spawn.z + POIOffsets.prop9.z, false, false, false)
	local newprop10 = CreateObject(`w_am_fire_exting`, spawn.x + POIOffsets.prop10.x, spawn.y + POIOffsets.prop10.y, spawn.z + POIOffsets.prop10.z, false, false, false)
	local newprop11 = CreateObject(`xm_prop_lab_strip_lightbl`, spawn.x + POIOffsets.prop11.x, spawn.y + POIOffsets.prop11.y, spawn.z + POIOffsets.prop11.z, false, false, false)
	local newprop12 = CreateObject(`hei_prop_hei_carrier_disp_01`, spawn.x + POIOffsets.prop12.x, spawn.y + POIOffsets.prop12.y, spawn.z + POIOffsets.prop12.z, false, false, false)
	local newprop13 = CreateObject(`prop_security_case_01`, spawn.x + POIOffsets.prop13.x, spawn.y + POIOffsets.prop13.y, spawn.z + POIOffsets.prop13.z, false, false, false)
	local newprop14 = CreateObject(`prop_cash_depot_billbrd`, spawn.x + POIOffsets.prop14.x, spawn.y + POIOffsets.prop14.y, spawn.z + POIOffsets.prop14.z, false, false, false)
	local newprop15 = CreateObject(`prop_tool_bluepnt`, spawn.x + POIOffsets.prop15.x, spawn.y + POIOffsets.prop15.y, spawn.z + POIOffsets.prop15.z, false, false, false)
	SetEntityHeading(newprop7, -90.0)
	SetEntityHeading(newprop8, -90.0)
	SetEntityHeading(newprop9, -90.0)
	SetEntityHeading(newprop10, 90.0)
	SetEntityHeading(newprop11, 90.0)
	SetEntityHeading(newprop12, 60.0)
	SetEntityHeading(newprop13, 90.0)
	SetEntityHeading(newprop14, 90.0)
	SetEntityHeading(newprop15, 0.0)
    FreezeEntityPosition(house, true)
	FreezeEntityPosition(newprop, true)
	FreezeEntityPosition(newprop2, true)
	FreezeEntityPosition(newprop5, true)
	FreezeEntityPosition(newprop6, true)
	FreezeEntityPosition(newprop7, true)
	FreezeEntityPosition(newprop8, true)
	FreezeEntityPosition(newprop9, true)
	FreezeEntityPosition(newprop10, true)
	FreezeEntityPosition(newprop11, true)
	FreezeEntityPosition(newprop12, true)
	FreezeEntityPosition(newprop13, true)
	FreezeEntityPosition(newprop14, true)
	FreezeEntityPosition(newprop15, true)
    objects[#objects+1] = house
	objects[#objects+1] = newprop
	objects[#objects+1] = newprop2
	objects[#objects+1] = newprop5
	objects[#objects+1] = newprop6
	objects[#objects+1] = newprop7
	objects[#objects+1] = newprop8
	objects[#objects+1] = newprop9
	objects[#objects+1] = newprop10
	objects[#objects+1] = newprop11
	objects[#objects+1] = newprop12
	objects[#objects+1] = newprop13
	objects[#objects+1] = newprop14
	objects[#objects+1] = newprop15
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

-- Starting Apartment

exports('CreateApartmentFurnished', function(spawn)

    local exit = json.decode('{"x": 1.5, "y": -10.0, "z": 0, "h":358.50}')
    
    local model = "furnitured_midapart"
    local obj = CreateShell(spawn, exit, model)
    if obj and obj[2] then
		obj[2].clothes = json.decode('{"x": -6.028, "y": -9.5, "z": 1.2, "h":2.263}')
		obj[2].stash = json.decode('{"x": -7.305, "y": -3.922, "z": 0.5, "h":2.263}')
		obj[2].logout = json.decode('{"x": -0.8, "y": 1.0, "z": 1.0, "h":2.263}')
	end
    if IsNew then
        SetTimeout(750, function()
            TriggerEvent('qb-clothes:client:CreateFirstCharacter')
            IsNew = false
        end)
    end
    return { obj[1], obj[2] }
end)

exports('CreateHouseRobbery', function(spawn)
    local exit = json.decode('{"x": 1.46, "y": -10.33, "z": 1.06, "h": 0.39}')
    local model = "furnitured_midapart"
    return CreateShell(spawn, exit, model)
end)

-- Shells (in order by tier starting at 1)

exports('CreateApartmentShell', function(spawn)--fix this
    local exit = json.decode('{"x": 4.693, "y": -6.015, "z": 1.11, "h":358.634}')
    local model = "shell_v16low"
    return CreateShell(spawn, exit, model)
end)

exports('CreateTier1House', function(spawn)
    local exit = json.decode('{"x": 1.561, "y": -14.305, "z": 1.147, "h":2.263}')
    local model = "shell_v16mid"
    return CreateShell(spawn, exit, model)
end)

exports('CreateTrevorsShell', function(spawn)
    local exit = json.decode('{"x": 0.374, "y": -3.789, "z": 2.428, "h":358.633}')
    local model = "shell_trevor"
    return CreateShell(spawn, exit, model)
end)

exports('CreateCaravanShell', function(spawn)
    local exit = json.decode('{"z":3.3, "y":-2.1, "x":-1.4, "h":358.633972168}')
    local model = "shell_trailer"
    return CreateShell(spawn, exit, model)
end)

exports('CreateLesterShell', function(spawn)
    local exit = json.decode('{"x":-1.780, "y":-0.795, "z":1.1,"h":270.30}')
    local model = "shell_lester"
    return CreateShell(spawn, exit, model)
end)

exports('CreateRanchShell', function(spawn)
    local exit = json.decode('{"x":-1.257, "y":-5.469, "z":2.5, "h":270.57,}')
    local model = "shell_ranch"
    return CreateShell(spawn, exit, model)
end)

exports('CreateContainer', function(spawn)
    local exit = json.decode('{"x": 0.08, "y": -5.73, "z": 1.24, "h": 359.32}')
    local model = "container_shell"
    return CreateShell(spawn, exit, model)
end)

exports('CreateFurniMid', function(spawn)
    local exit = json.decode('{"x": 1.46, "y": -10.33, "z": 1.06, "h": 0.39}')
    local model = "furnitured_midapart"
    return CreateShell(spawn, exit, model)
end)

exports('CreateFurniMotelModern', function(spawn)
    local exit = json.decode('{"x": 4.98, "y": 4.35, "z": 1.16, "h": 179.79}')
    local model = "modernhotel_shell"
    return CreateShell(spawn, exit, model)
end)

exports('CreateFranklinAunt', function(spawn)
    local exit = json.decode('{"x": -0.36, "y": -5.89, "z": 1.70, "h": 358.21}')
    local model = "shell_frankaunt"
    return CreateShell(spawn, exit, model)
end)

exports('CreateGarageMed', function(spawn)
    local exit = json.decode('{"x": 13.90, "y": 1.63, "z": 1.0, "h": 87.05}')
    local model = "shell_garagemed"
    return CreateShell(spawn, exit, model)
end)

exports('CreateMichael', function(spawn)
    local exit = json.decode('{"x": -9.49, "y": 5.54, "z": 9.91, "h": 270.86}')
    local model = "shell_michael"
    return CreateShell(spawn, exit, model)
end)

exports('CreateOffice1', function(spawn)
    local exit = json.decode('{"x": 1.88, "y": 5.06, "z": 2.05, "h": 180.07}')
    local model = "shell_office1"
    return CreateShell(spawn, exit, model)
end)

exports('CreateStore1', function(spawn)
    local exit = json.decode('{"x": -2.61, "y": -4.73, "z": 1.08, "h": 1.0}')
    local model = "shell_store1"
    return CreateShell(spawn, exit, model)
end)

exports('CreateWarehouse1', function(spawn)
    local exit = {x = -8.95, y = 0.51, z = 1.04, h = 268.82}
    local model = "shell_warehouse1"
    return CreateShell(spawn, exit, model)
end)
