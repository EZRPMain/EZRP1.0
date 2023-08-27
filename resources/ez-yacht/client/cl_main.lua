currentBox, GoldCard, robbedBoxes, panel, lower_panel, last_door, last_last_door, panel_hit2 = 'None', false, {}, false, false, false, false, false
local tabletObject = nil

Citizen.CreateThread(function()
    local boxZones = remoteCalls.execute('yacht:fetchBoxData')
    robbedBoxes = remoteCalls.execute('ez-vault:boxRobbed')

    for _, zone in ipairs(boxZones) do
        exports['ez-zones']:AddBoxZone(zone.id, zone.center, zone.width, zone.height, zone.options)
    end
end)

RegisterNetEvent('ez-yacht:startYacht')
AddEventHandler('ez-yacht:startYacht', function()
    local police = exports["isPed"]:isPed("countpolice") >= 4
    if not police then
        TriggerEvent("DoLongHudText", "Not Enough Police In The City!")
    else
    if GoldCard then

        TriggerEvent("animation:PlayAnimation","id")
        local finished = exports['ez-hud']:beginProgress(2,"Placing Card",false)
        if (finished) then
        TriggerEvent("utk_fingerprint:Start", 4, 6, 2, function(outcome, reason)
            if outcome == true then -- reason will be nil if outcome is true
            TriggerEvent("DoLongHudText", "Success!")
            TriggerServerEvent("ez-doors:alterlockstate", 124)
            TriggerServerEvent("ez-yacht:panelHit")
            TriggerEvent("ez-dispatch:yacht")
            elseif outcome == false then
            TriggerEvent("DoLongHudText", "Failed, "..reason..".")
            TriggerEvent("ez-dispatch:yacht")
    end
end)
end
end
end
end)

RegisterNetEvent('ez-yacht:cl_panelHit')
AddEventHandler('ez-yacht:cl_panelHit', function(state)
    panel_hit2 = state
end)

RegisterNetEvent('ez-yacht:electronic')
AddEventHandler('ez-yacht:electronic', function()

    if (currentBox == 'None') then return end
    SendNUIMessage({openSection = "toolSelect", tool = 'none', card = 1})
    
    local playerPed = PlayerPedId()
        local dict = "amb@world_human_seat_wall_tablet@female@base"
        RequestAnimDict(dict)
        if tabletObject == nil then
            tabletObject = CreateObject(GetHashKey('prop_cs_tablet'), GetEntityCoords(playerPed), 1, 1, 1)
            AttachEntityToEntity(tabletObject, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end
        while not HasAnimDictLoaded(dict) do Citizen.Wait(100) end
        if not IsEntityPlayingAnim(playerPed, dict, 'base', 3) then
            TaskPlayAnim(playerPed, dict, "base", 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
        end

      TriggerEvent('inventory:removeItem', 'electronickit', 1)
      
      exports["ez-robbery"]:Start(2)
end)


AddEventHandler("datacrack", function(output)
    if output then
        TriggerEvent("loot2")
        TriggerEvent("DoLongHudText", "Success!")
        ClearPedTasks(GetPlayerPed(-1))
        DeleteEntity(tabletObject)
        ClearPedTasks(playerPed)
        tabletObject = nil
       SafeDrillStopEvent(k,v)
        remoteCalls.execute('ez-vault:boxRobbed', currentBox)
    else
        TriggerEvent("DoLongHudText", "Failed!")
        ClearPedTasks(GetPlayerPed(-1))
        SafeDrillStopEvent(k,v)
        DeleteEntity(tabletObject)
        ClearPedTasks(playerPed)
        tabletObject = nil
    end
end)

RegisterNetEvent("ez-yacht:Tablet")
AddEventHandler("ez-yacht:Tablet", function()
    local playerPed = PlayerPedId()
    if not isVisible then
        local dict = "amb@world_human_seat_wall_tablet@female@base"
        RequestAnimDict(dict)
        if tabletObject == nil then
            tabletObject = CreateObject(GetHashKey('prop_cs_tablet'), GetEntityCoords(playerPed), 1, 1, 1)
            AttachEntityToEntity(tabletObject, playerPed, GetPedBoneIndex(playerPed, 28422), 0.0, 0.0, 0.03, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
        end
        while not HasAnimDictLoaded(dict) do Citizen.Wait(100) end
        if not IsEntityPlayingAnim(playerPed, dict, 'base', 3) then
            TaskPlayAnim(playerPed, dict, "base", 8.0, 1.0, -1, 49, 1.0, 0, 0, 0)
        end
    else
        DeleteEntity(tabletObject)
        ClearPedTasks(playerPed)
        tabletObject = nil
    end
end)

function SafeDrillStopEvent(k,v)
    local ped = GetPlayerPed(-1)
    local x,y,z = table.unpack(GetEntityCoords(ped, true))
	ClearPedTasksImmediately(ped)
	StopSound(drillSound)
	ReleaseSoundId(drillSound)
    DeleteEntity(attachedDrill)
    FreezeEntityPosition(ped, false)
    StopGameplayCamShaking(true)
end

 RegisterNetEvent("loot2")
 AddEventHandler("loot2", function()
  -- print'd')
  local roll = math.random(5)
  if roll == 1 then
      TriggerEvent("player:receiveItem", "band", math.random(60, 80))
      TriggerEvent("player:receiveItem", "rollcash", math.random(90, 100))
  elseif roll == 2 then
      TriggerEvent("player:receiveItem", "band", math.random(90, 110))
      TriggerEvent("player:receiveItem", "rollcash", math.random(90, 100))
    elseif roll == 3 then
        TriggerEvent("player:receiveItem", "band", math.random(90, 110))
        TriggerEvent("player:receiveItem", "rollcash", math.random(90, 100))
    elseif roll == 4 then
        TriggerEvent("player:receiveItem", "band", math.random(90, 110))
        TriggerEvent("player:receiveItem", "rollcash", math.random(90, 100))
  elseif roll == 5 then
      TriggerEvent("player:receiveItem", "Bankbox", 1)
  end
end)

AddEventHandler('ez-zones:enter', function(zone)
    if (not string.find(zone, 'yacht')) then return end

    -- printzone)

    if (string.find(zone, 'box') and not tableContains(robbedBoxes, zone)) then
        SendNUIMessage({openSection = "toolSelect", tool = 'electronic', card = 1})
        -- printzone)
        currentBox = zone
    end

    if (zone == 'yacht_first_panel') and not panel_hit2 then
		-- print"d")
        SendNUIMessage({openSection = "toolSelect", tool = 'goldcard', card = 1})
        GoldCard = true
    end

    if (zone == 'vault_lower_first_door') then
        SendNUIMessage({openSection = "toolSelect", tool = 'physicalPick', card = 1})
        last_door = true
    end

    if (zone == 'vault_lower_second_door') then
        SendNUIMessage({openSection = "toolSelect", tool = 'physicalPick', card = 1})
        last_last_door = true
    end

    if (zone == 'vault_upper_first_panel') then
        SendNUIMessage({openSection = "toolSelect", tool = 'card', card = 1})
        panel = true
    end

    if (zone == 'vault_lower_first_panel') then
        SendNUIMessage({openSection = "toolSelect", tool = 'card', card = 1})
        lower_panel = true
    end
end)

AddEventHandler('ez-zones:exit', function(zone)
    if (not string.find(zone, 'yacht')) then return end

    if (string.find(zone, 'box')) then
        SendNUIMessage({openSection = "toolSelect", tool = 'none', card = 1})
        currentBox = 'None'
    end

    if (zone == 'yacht_first_panel') then
        SendNUIMessage({openSection = "toolSelect", tool = 'none', card = 1})
        GoldCard = false
    end

    if (zone == 'vault_lower_first_door') then
        SendNUIMessage({openSection = "toolSelect", tool = 'none', card = 1})
        last_door = false
    end

    if (zone == 'vault_lower_second_door') then
        SendNUIMessage({openSection = "toolSelect", tool = 'none', card = 1})
        last_last_door = false
    end

    if (zone == 'vault_upper_first_panel') then
        SendNUIMessage({openSection = "toolSelect", tool = 'none', card = 1})
        panel = false
    end

    if (zone == 'vault_lower_first_panel') then
        SendNUIMessage({openSection = "toolSelect", tool = 'none', card = 1})
        lower_panel = false
    end
end)

tableContains = function(tbl, val)
    for i = 1, #tbl do
        if tbl[i] == val then return true end
    end

    return false
end

RegisterNetEvent('ez-vault:boxUpdate')
AddEventHandler('ez-vault:boxUpdate', function(boxes)
    robbedBoxes = boxes
end)

-- RegisterCommand("ped", function()
-- 	local ped = GetPlayerPed(-1)
-- 	modelHash = GetHashKey("s_m_y_blackops_02")
-- 	RequestModel(modelHash)
-- 	while not HasModelLoaded(modelHash) do
-- 		 Wait(1)
-- 	end
-- 	created_ped = CreatePed(0, modelHash , -2023.0501708984, -1031.2786865234, 2.5614459514618,true)
-- 	created_ped2 = CreatePed(0, modelHash , -2065.7893066406, -1027.7685546875, 3.0614664554596,true)
-- 	created_ped3 = CreatePed(0, modelHash , -2070.4545898438, -1020.9528808594, 3.051451921463,true)
-- 	created_ped4 = CreatePed(0, modelHash , -2054.4938964844, -1022.0614624023, 3.1491055488586,true)
-- 	created_ped5 = CreatePed(0, modelHash , -2045.0462646484, -1025.3193359375, 2.5833420753479,true)
-- 	created_ped6 = CreatePed(0, modelHash , -2035.0723876953, -1041.3286132812, 2.5676193237305,true)
-- 	SetPedRelationshipGroupHash(ped, GetHashKey("PLAYER"))
-- 	AddRelationshipGroup('HeistGuards')
-- 	SetEntityHeading(created_ped,  222.662109375)
-- 	SetPedArmour(created_ped, 100)
-- 	SetPedAccuracy(created_ped, 60)
-- 	SetPedRelationshipGroupHash(created_ped, GetHashKey("HeistGuards"))	
-- 	SetPedRelationshipGroupHash(created_ped2, GetHashKey("HeistGuards"))	
-- 	SetPedRelationshipGroupHash(created_ped3, GetHashKey("HeistGuards"))	
-- 	SetPedRelationshipGroupHash(created_ped4, GetHashKey("HeistGuards"))	
-- 	SetPedRelationshipGroupHash(created_ped5, GetHashKey("HeistGuards"))
-- 	SetPedRelationshipGroupHash(created_ped6, GetHashKey("HeistGuards"))		
-- 	SetEntityInvincible(created_ped, false)
-- 	SetEntityVisible(created_ped, true)
-- 	GiveWeaponToPed(created_ped, GetHashKey("WEAPON_MICROSMG"), 255, true, false)
-- 	GiveWeaponToPed(created_ped2, GetHashKey("WEAPON_MICROSMG"), 255, true, false)
-- 	GiveWeaponToPed(created_ped3, GetHashKey("WEAPON_MICROSMG"), 255, true, false)
-- 	GiveWeaponToPed(created_ped4, GetHashKey("WEAPON_MICROSMG"), 255, true, false)
-- 	GiveWeaponToPed(created_ped5, GetHashKey("WEAPON_MICROSMG"), 255, true, false)
-- 	GiveWeaponToPed(created_ped6, GetHashKey("WEAPON_MICROSMG"), 255, true, false)
-- 	SetCurrentPedWeapon(created_ped, GetHashKey("WEAPON_MICROSMG"), true)
-- 	SetCurrentPedWeapon(created_ped2, GetHashKey("WEAPON_MICROSMG"), true)
-- 	SetCurrentPedWeapon(created_ped3, GetHashKey("WEAPON_MICROSMG"), true)
-- 	SetCurrentPedWeapon(created_ped4, GetHashKey("WEAPON_MICROSMG"), true)
-- 	SetCurrentPedWeapon(created_ped5, GetHashKey("WEAPON_MICROSMG"), true)
-- 	SetCurrentPedWeapon(created_ped6, GetHashKey("WEAPON_MICROSMG"), true)
-- 	SetPedRelationshipGroupHash(ped, GetHashKey("PLAYER"))
-- 	AddRelationshipGroup('HeistGuards')
-- 	SetRelationshipBetweenGroups(0, GetHashKey("HeistGuards"), GetHashKey("HeistGuards"))
-- 	SetRelationshipBetweenGroups(0, GetHashKey("HeistGuards"), GetHashKey("PLAYER"))
-- 	SetRelationshipBetweenGroups(0, GetHashKey("PLAYER"), GetHashKey("HeistGuards"))
-- end)

-- Citizen.CreateThread(function()
-- 	local ped = GetPlayerPed(-1)
-- 	modelHash = GetHashKey("s_m_y_blackops_02")
-- 	RequestModel(modelHash)
-- 	while not HasModelLoaded(modelHash) do
-- 		 Wait(1)
-- 	end
-- 	created_ped = CreatePed(4, modelHash , -2030.4594726562, -1041.7943115234, 5.8821177482605,true)
-- 	created_ped2 = CreatePed(4, modelHash , -2025.7218017578, -1032.0634765625, 5.8823804855347,true)
-- 	created_ped3 = CreatePed(4, modelHash , -2045.5812988281, -1037.5185546875, 5.8828859329224,true)
-- 	created_ped4 = CreatePed(4, modelHash , -2073.0698242188, -1023.7737426758, 5.8841557502747,true)
-- 	created_ped5 = CreatePed(4, modelHash , -2078.7067871094, -1016.0535888672, 5.8841547966003,true)
-- 	created_ped6 = CreatePed(4, modelHash , -2084.9643554688, -1019.3208007812, 12.798115730286,true)
-- 	SetPedRelationshipGroupHash(ped, GetHashKey("PLAYER"))
-- 	AddRelationshipGroup('HeistGuards')
-- 	SetPedArmour(created_ped, 100)
-- 	SetPedAccuracy(created_ped, 60)
-- 	SetPedRelationshipGroupHash(created_ped, GetHashKey("HeistGuards"))	
-- 	SetPedRelationshipGroupHash(created_ped2, GetHashKey("HeistGuards"))	
-- 	SetPedRelationshipGroupHash(created_ped3, GetHashKey("HeistGuards"))	
-- 	SetPedRelationshipGroupHash(created_ped4, GetHashKey("HeistGuards"))	
-- 	SetPedRelationshipGroupHash(created_ped5, GetHashKey("HeistGuards"))
-- 	SetPedRelationshipGroupHash(created_ped6, GetHashKey("HeistGuards"))		
-- 	GiveWeaponToPed(created_ped, GetHashKey("WEAPON_MICROSMG"), 255, true, false)
-- 	GiveWeaponToPed(created_ped2, GetHashKey("WEAPON_MICROSMG"), 255, true, false)
-- 	GiveWeaponToPed(created_ped3, GetHashKey("WEAPON_MICROSMG"), 255, true, false)
-- 	GiveWeaponToPed(created_ped4, GetHashKey("WEAPON_MICROSMG"), 255, true, false)
-- 	GiveWeaponToPed(created_ped5, GetHashKey("WEAPON_MICROSMG"), 255, true, false)
-- 	GiveWeaponToPed(created_ped6, GetHashKey("WEAPON_MICROSMG"), 255, true, false)
-- 	SetCurrentPedWeapon(created_ped, GetHashKey("WEAPON_MICROSMG"), true)
-- 	SetCurrentPedWeapon(created_ped2, GetHashKey("WEAPON_MICROSMG"), true)
-- 	SetCurrentPedWeapon(created_ped3, GetHashKey("WEAPON_MICROSMG"), true)
-- 	SetCurrentPedWeapon(created_ped4, GetHashKey("WEAPON_MICROSMG"), true)
-- 	SetCurrentPedWeapon(created_ped5, GetHashKey("WEAPON_MICROSMG"), true)
-- 	SetCurrentPedWeapon(created_ped6, GetHashKey("WEAPON_MICROSMG"), true)
-- 	NetworkRegisterEntityAsNetworked(created_ped)
-- 	NetworkRegisterEntityAsNetworked(created_ped2)
-- 	NetworkRegisterEntityAsNetworked(created_ped3)
-- 	NetworkRegisterEntityAsNetworked(created_ped4)
-- 	NetworkRegisterEntityAsNetworked(created_ped5)
-- 	NetworkRegisterEntityAsNetworked(created_ped6)
-- 	SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(created_ped), true)
-- 	SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(created_ped2), true)
-- 	SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(created_ped3), true)
-- 	SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(created_ped4), true)
-- 	SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(created_ped5), true)
-- 	SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(created_ped6), true)
-- 	SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(created_ped), true)
-- 	SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(created_ped2), true)
-- 	SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(created_ped3), true)
-- 	SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(created_ped4), true)
-- 	SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(created_ped5), true)
-- 	SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(created_ped6), true)
-- 	SetEntityAsMissionEntity(created_ped)
-- 	SetEntityAsMissionEntity(created_ped2)
-- 	SetEntityAsMissionEntity(created_ped3)
-- 	SetEntityAsMissionEntity(created_ped4)
-- 	SetEntityAsMissionEntity(created_ped5)
-- 	SetEntityAsMissionEntity(created_ped6)
-- 	SetPedRelationshipGroupHash(ped, GetHashKey("PLAYER"))
-- 	AddRelationshipGroup('HeistGuards')
-- 	SetRelationshipBetweenGroups(0, GetHashKey("HeistGuards"), GetHashKey("HeistGuards"))
-- 	SetRelationshipBetweenGroups(0, GetHashKey("HeistGuards"), GetHashKey("PLAYER"))
-- 	SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), GetHashKey("HeistGuards"))
--     SetPedDropsWeaponsWhenDead(created_ped,false)
--     SetPedDropsWeaponsWhenDead(created_ped2,false)
--     SetPedDropsWeaponsWhenDead(created_ped3,false)
--     SetPedDropsWeaponsWhenDead(created_ped4,false)
--     SetPedDropsWeaponsWhenDead(created_ped5,false)
--     SetPedDropsWeaponsWhenDead(created_ped6,false)
-- end)