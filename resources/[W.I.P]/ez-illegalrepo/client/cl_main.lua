CreateThread(function()
    RequestModel(Shared.Ped.model)
    while not HasModelLoaded(Shared.Ped.model) do
        Wait(1)
    end
    local repoPed = CreatePed(0, Shared.Ped.model, Shared.Ped.coords.x, Shared.Ped.coords.y, Shared.Ped.coords.z - 1, true)
    FreezeEntityPosition(repoPed, true)
    SetEntityHeading(repoPed, Shared.Ped.coords.w)
    SetEntityInvincible(repoPed, true)
    SetBlockingOfNonTemporaryEvents(repoPed, true)
    TaskStartScenarioInPlace(repoPed, Shared.Ped.modelAnim, 0, true)
	exports['qb-target']:AddTargetEntity(repoPed, {
		options = {
			{
				type = 'client',
				event = "ez-repo:openMenu",
				icon = 'fas fa-user-secret',
				label = "Get Repo Contract",
			},
		},
		distance = 2.0,
	})
end)

RegisterNetEvent("ez-repo:openMenu", function()

	local canBoost = {
		["D"] = true,
		["C"] = false,
		["M"] = false,
		["B"] = false,
		["A"] = false,
		["S"] = false,
		["X"] = false,
	}

	local menu = {
        {
            header = "Repo List",
            isMenuHeader = true,
        },
        {
            header = "Class: D",
            txt = "Repo Class D Vehicles",
			disabled = not canBoost["D"],
            params = {
                event = "ez-repo:startRepo",
                args = {
                    class = "D",
                }
            }
        },
		{
            header = "Class: C",
            txt = "Repo Class C Vehicles",
			disabled = not canBoost["C"],
            params = {
                event = "ez-repo:startRepo",
                args = {
                    class = "C",
                }
            }
        },
		{
            header = "Class: M",
            txt = "Repo Class M Vehicles",
			disabled = not canBoost["M"],
            params = {
                event = "ez-repo:startRepo",
                args = {
                    class = "M",
                }
            }
        },
		{
            header = "Class: B",
            txt = "Repo Class B Vehicles",
			disabled = not canBoost["B"],
            params = {
                event = "ez-repo:startRepo",
                args = {
                    class = "B",
                }
            }
        },
		{
            header = "Class: A",
            txt = "Repo Class A Vehicles",
			disabled = not canBoost["A"],
            params = {
                event = "ez-repo:startRepo",
                args = {
                    class = "A",
                }
            }
        },
		{
            header = "Class: S",
            txt = "Repo Class S Vehicles",
			disabled = not canBoost["S"],
            params = {
                event = "ez-repo:startRepo",
                args = {
                    class = "S",
                }
            }
        },
		{
            header = "Class: X",
            txt = "Repo Class X Vehicles",
			disabled = not canBoost["X"],
            params = {
                event = "ez-repo:startRepo",
                args = {
                    class = "X",
                }
            }
        },
    }
	exports['qb-menu']:openMenu(menu)
end)

local function isGroupMember()
	local p = promise.new()
	Framework:TriggerCallback("ez-repo:isGroupMember",function(result)
		p:resolve(result)
	end)
	return Citizen.Await(p)
end

local function isGroupLeader()
	local p = promise.new()
	Framework:TriggerCallback("ez-repo:isGroupLeader",function(result)
		p:resolve(result)
	end)
	return Citizen.Await(p)
end

RegisterNetEvent("ez-repo:startRepo", function(data)
	local alreadyDidLocations = {}

	local vehicleList = {}
	local class = data.class
	local inGroup = isGroupMember()
	if not inGroup then Framework:Notify("You need to be in a group", "error") return false end

	local isLeader = isGroupLeader()
	if not isLeader then Framework:Notify("You need to be a group leader", "error") return false end
	
	-- Code to spawn vehicle :kekw:
	local vehAmount = math.random(Shared.VehicleRepo.min, Shared.VehicleRepo.max)

	for i = 1, vehAmount do
		Wait(1000)
		local chosen = math.random(#Shared.Vehicles[class])
		local vehicle = Shared.Vehicles[class][chosen]
		local vehData = Framework:GetSharedVehicle(vehicle)
		-- print(vehData.brand, vehData.name)
		local vehicleName = ("%s %s"):format(vehData.brand, vehData.name)
		::recheck::
		local randomLocation = math.random(#Shared.Locations[class])
		if not alreadyDidLocations[randomLocation] then
			alreadyDidLocations[randomLocation] = true
			goto recheck
			return
		end
		local location = Shared.Locations[class][randomLocation]
		-- Shared.Locations[class][randomLocation] = nil
		print(location)
		-- SetEntityCoords(PlayerPedId(), location.x, location.y, location.z)
		CreateThread(function() -- HOPE THIS WORKS
			Wait(1000)
			Framework:TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
				local veh = NetToVeh(netId)
				exports['LegacyFuel']:SetFuel(veh, math.random(75,100))
				local plate = Framework:GetPlate(veh)
				local blip = vector3(location.x + math.random(-40,40), location.y + math.random(-40,40), location.z)
				-- print(blip)
				vehicleList[plate] = {
					group = inGroup,
					plate = plate,
					vehicleName = vehicleName,
					vehicle = vehicle,
					location = location,
					blip = blip,
				}
				-- SetVehicleEngineOn(veh, false, true, true)
			end, vehicle, location, false)
	
		end)
		Wait(1000)
		-- Framework:TriggerCallback('qb-garage:server:spawnvehicle', function(netId, properties)
		-- 	local veh = NetToVeh(netId)
		-- 	exports['LegacyFuel']:SetFuel(veh, math.random(75,100))
		-- 	local plate = Framework:GetPlate(veh)
		-- 	print(plate)
		-- 	SetVehicleEngineOn(veh, false, true, true)
		-- end, joaat(vehicle), location, true)
	end
	TriggerServerEvent("ez-repo:sendVehicles", inGroup, vehicleList)
end)


local cached_blip = {}
local cached_list = {}
RegisterNetEvent("ez-repo:groupRecieveVehicles", function(groupId, vehList)
	cached_list[#cached_list+1] = vehList
	local inGroup = isGroupMember()
	if not inGroup then return false end
	if groupId ~= inGroup then return false end

	for plate, data in pairs(vehList) do 
		local plate = data.plate
		local BlipLocation = data.blip
	
		cached_blip[plate] = AddBlipForRadius(BlipLocation.x, BlipLocation.y, BlipLocation.z, 100.0)
	
		SetBlipColour(cached_blip[plate], 1)
		SetBlipAlpha(cached_blip[plate], 80)
	end
end)

RegisterCommand("a", function()
	for k,v in pairs(cached_list) do
		print(k, v)
		print(json.encode(v))
	end
end)

-- RegisterNetEvent("lockpicks:UseLockpick", function(isAdvanced)
-- 	local vehicle = Framework:GetClosestVehicle()
-- 	local vPlate = Framework:GetPlate(vehicle)
-- 	local vehData = cached_list[vPlate]
-- 	if not vehData then return end
-- 	local inGroup = isGroupMember()
-- 	print("lockpick?")
-- 	if vehData.group == inGroup then
-- 		print("bobby")
-- 		TriggerServerEvent("ez-repo:LockPick", inGroup, vPlate)
-- 	end
-- end)

RegisterNetEvent("ez-repo:DeleteBlip", function(groupId, plate)
	print("Test")
	local inGroup = isGroupMember()
	local vehData = cached_list[plate]
	print(vehData)
	if not vehData then return end

	-- if not inGroup then return false end
	-- if groupId ~= inGroup then return false end
	-- if vehData.group == inGroup then
		print("bye cunt")
		RemoveBlip(cached_blip[plate])
		cached_blip[plate] = nil
	-- end
end)
