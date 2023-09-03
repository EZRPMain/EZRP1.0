local isInPlaceItemMode = false
local animationDict = "pickup_object"
local animation = "pickup_low"

local spawnedEntity = {}
local zoneName = {}

RegisterNetEvent("QBCore:Client:OnPlayerLoaded", function()
    TriggerServerEvent("ez-gangflags:loadFlags")
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    TriggerServerEvent("ez-gangflags:loadFlags")
end)

AddEventHandler("scuff-fix", function()
    for entity in pairs(spawnedEntity) do
        if DoesEntityExist(entity) then
            SetEntityAsMissionEntity(entity, 1, 1)
            DeleteEntity(entity)
            SetEntityAsNoLongerNeeded(entity)
            spawnedEntity[entity] = nil
        end
    end
    for name, zone in pairs(zoneName) do
        exports['qb-target']:RemoveZone(name)
        zoneName[name] = nil
    end
    Wait(1000)
    TriggerServerEvent("ez-gangflags:loadFlags")

end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    -- print('The resource ' .. resourceName .. ' has been started.')
    -- CreateThread(function()
        for entity in pairs(spawnedEntity) do
            -- print(entity)
            if DoesEntityExist(entity) then
                SetEntityAsMissionEntity(entity, 1, 1)
                DeleteEntity(entity)
                SetEntityAsNoLongerNeeded(entity)
                spawnedEntity[entity] = nil
            end
        end
    -- end)

    -- CreateThread(function()
        for name, zone in pairs(zoneName) do
            -- print(json.encode(zoneName[name]))
            -- zoneName[name]:destory()
            -- print(name, zone)
            exports['qb-target']:RemoveZone(name)
            zoneName[name] = nil
        end
        
    -- end)
end)


function RequestNetworkControlOfObject(netId, itemEntity)
    if NetworkDoesNetworkIdExist(netId) then
        NetworkRequestControlOfNetworkId(netId)
        while not NetworkHasControlOfNetworkId(netId) do
            Wait(100)
            NetworkRequestControlOfNetworkId(netId)
        end
    end

    if DoesEntityExist(itemEntity) then
        NetworkRequestControlOfEntity(itemEntity)
        while not NetworkHasControlOfEntity(itemEntity) do
            Wait(100)
            NetworkRequestControlOfEntity(itemEntity)
        end
    end
end

function LoadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end


local function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
        RequestModel(GetHashKey(model))
        Wait(10)
    end
end


RegisterNetEvent("ez-gangflags:loadProps", function(result)
    local ped = PlayerPedId()
    for k, data in pairs(result) do 
        -- print(k, data.coords)
        local d = json.decode(data.coords)
        local itemModel = data.model
        local coords = vector3(d.x, d.y, d.z)
        local name = data.coords
        -- print(name)
        local heading = data.heading*1.0
        -- print(type(heading))
        LoadPropDict(itemModel)

        -- local name = json.encode(coords)
        -- print(name)
        if not zoneName[name] then
            -- zoneName[name] = name
            zoneName[name] = exports['qb-target']:AddCircleZone(name, coords, 0.75, {
                name = name,
                debugPoly = false,
                useZ = true,
            }, {
                options =  {
                    {
                        event = "ez-gangflags:destroy",
                        icon = "fas fa-hand-holding",
                        label = "Destroy Flag",
                        targetName = name,
                        coords = coords,
                        model = itemModel,
                    },
                },
                distance = Shared.PlacementRadius
            })
            -- print(zoneName[name])
        end
        -- Spawn prop on ground at the provided coords and heading
        -- TriggerServerEvent("ez-gangflags:placeFlag", item, coords, heading, shouldSnapToGround)
    
        local obj = CreateObject(itemModel, GetEntityCoords(ped), false)
        if obj ~= 0 then
            SetEntityRotation(obj, 0.0, 0.0, heading, false, false)
            SetEntityHeading(obj, heading)
            SetEntityCoords(obj, coords)
    
            if shouldFreezeItem then
                FreezeEntityPosition(obj, true)
            end
    
    
            -- TriggerServerEvent("ez-gangflags:TargetData", coords, itemModel)
            -- print(itemModel)
            -- TriggerServerEvent("ez-gangflags:Save", coords, itemModel, heading)
            spawnedEntity[obj] = obj
        end
    
        SetModelAsNoLongerNeeded(itemModel)

    end
end)


-- Gets the direction the camera is looking for the raycast function
local function RotationToDirection(rotation)
	local adjustedRotation = {
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction = {
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

-- Uses a RayCast to get the entity, coords, and whether we "hit" something with the raycast
-- Object passed in, is the current object that we want the raycast to ignore
local function RayCastGamePlayCamera(distance, object)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination = {
		x = cameraCoord.x + direction.x * distance,
		y = cameraCoord.y + direction.y * distance,
		z = cameraCoord.z + direction.z * distance
	}

    local traceFlag = 1 -- 1 means the raycast will only intersect with the world (ignoring other entities like peds, cars, etc)
	local a, hit, coords, d, entity = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, traceFlag, object, 0))
	return hit, coords, entity
end

-- Used to Draw the text on the screen
local function Draw2DText(content, font, colour, scale, x, y)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(colour[1],colour[2],colour[3], 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(x, y)
end

-- This handles placing the actual item that is network synced
local function placeItem(item, coords, heading, shouldSnapToGround)
    local ped = PlayerPedId()
    local itemName = item.name
    local itemModel = item.model
    local shouldFreezeItem = true

    -- Cancel any active animation
    ClearPedTasks(ped)

    Framework:Progressbar("flag_pacing", "Placing "..item.label, 750, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = animationDict,
        anim = animation,
        flags = 0,
    }, nil, nil, function() -- Done
        -- Stop playing the animation
        StopAnimTask(ped, animationDict, animation, 1.0)

        -- Remove the item from the inventory
        TriggerServerEvent("ez-gangflags:removeFlag", itemName)

        LoadPropDict(itemModel)

        -- Spawn prop on ground at the provided coords and heading
        -- TriggerServerEvent("ez-gangflags:placeFlag", item, coords, heading, shouldSnapToGround)

        local obj = CreateObject(itemModel, GetEntityCoords(ped), false)
        if obj ~= 0 then
            SetEntityRotation(obj, 0.0, 0.0, heading, false, false)
            SetEntityCoords(obj, coords)

            if shouldFreezeItem then
                FreezeEntityPosition(obj, true)
            end

            local name = json.encode(coords)
            -- print(name)
            if not zoneName[name] then
                -- zoneName[name] = name
                zoneName[name] = exports['qb-target']:AddCircleZone(name, coords, 0.75, {
                    name = name,
                    debugPoly = false,
                    useZ = true,
                }, {
                    options =  {
                        {
                            event = "ez-gangflags:destroy",
                            icon = "fas fa-hand-holding",
                            label = "Destroy Flag",
                            targetName = name,
                            coords = coords,
                            model = itemModel,
                        },
                    },
                    distance = Shared.PlacementRadius
                })
                -- print(zoneName[name])
            end
            -- TriggerServerEvent("ez-gangflags:TargetData", coords, itemModel)
            -- print(itemModel)
            TriggerServerEvent("ez-gangflags:Save", coords, itemModel, heading)
            spawnedEntity[obj] = obj
            -- Some items dont go to the ground properly with this, and it actually makes them hover
            -- if shouldSnapToGround then
            --     PlaceObjectOnGroundProperly(obj)
            -- end

            -- -- Use statebag property itemNameOverride if `shouldUseItemNameState` is true for the item (defined in items.lua)
            -- -- This is used for items that use the same model, but need to grant different items when picked up
            -- -- This is necessary because we use AddTargetModel to provide the options per model and can only apply one set of options per model
            -- if item.shouldUseItemNameState then
            --     Entity(obj).state:set('itemNameOverride', itemName, true)
            -- end

            -- createLog(itemName, true) 
        end

        SetModelAsNoLongerNeeded(itemModel)
    end, function() -- Cancel
        StopAnimTask(ped, animationDict, animation, 1.0)
        Framework:Notify("Canceled..", "error")
	end)
end

RegisterNetEvent("ez-gangflags:syncObject", function(coords, model, heading)
    LoadPropDict(model)
    local ped = PlayerPedId()
    local name = json.encode(coords)
    -- print(name)
    if not zoneName[name] then
        -- zoneName[name] = name
        zoneName[name] = exports['qb-target']:AddCircleZone(name, coords, 0.75, {
            name = name,
            debugPoly = false,
            useZ = true,
        }, {
            options =  {
                {
                    event = "ez-gangflags:destroy",
                    icon = "fas fa-hand-holding",
                    label = "Destroy Flag",
                    targetName = name,
                    coords = coords,
                    model = model,
                },
            },
            distance = Shared.PlacementRadius
        })
        -- print(zoneName[name])
    end
    -- Spawn prop on ground at the provided coords and heading
    -- TriggerServerEvent("ez-gangflags:placeFlag", item, coords, heading, shouldSnapToGround)

    local obj = CreateObject(model, GetEntityCoords(ped), false)
    if obj ~= 0 then
        SetEntityRotation(obj, 0.0, 0.0, heading, false, false)
        SetEntityCoords(obj, coords)

        if shouldFreezeItem then
            FreezeEntityPosition(obj, true)
        end


        -- TriggerServerEvent("ez-gangflags:TargetData", coords, itemModel)
        -- print(itemModel)
        -- TriggerServerEvent("ez-gangflags:Save", coords, itemModel, heading)
        spawnedEntity[obj] = obj
    end

    SetModelAsNoLongerNeeded(model)

end)


-- Starts a thread that puts the player into item placement mode
-- This will spawn a local object that only the player can see and move around to position it
-- Once the player places the object it will delete the local one and then create a new network synced object
local function startPlacement(item)
    -- This is to prevent entering place mode multiple times if its already active
    if isInPlaceItemMode then
        Framework:Notify('Already placing an item', 'error', 5000)
        return
    end

    isInPlaceItemMode = true
    local ped = PlayerPedId()
    local itemModel = item.model

    -- Create a local object for only this client (not synced to network) and make it transparent
    local obj = CreateObject(itemModel, GetEntityCoords(ped), false, false)
    SetEntityAlpha(obj, 150, false)
    SetEntityCollision(obj, false, false)

    local zOffset = 0

    CreateThread(function()
        while isInPlaceItemMode do
            -- Use raycast based on where the camera is pointed
            local hit, coords, entity = RayCastGamePlayCamera(Shared.PlacementRadius, obj)

            -- Move the object to the coords from the raycast
            SetEntityCoords(obj, coords.x, coords.y, coords.z + zOffset)

            -- Display the controls
            Draw2DText('[E] Place\n[Scroll Up/Down] Rotate', 4, {255, 255, 255}, 0.4, 0.85, 0.85)
            Draw2DText('[Right Click / Backspace] Exit place mode', 4, {255, 255, 255}, 0.4, 0.85, 0.945)


            -- Handle various key presses and actions

            -- Controls for placing item

            -- Pressed Shift + E - Place object on ground
            -- if IsControlJustReleased(0, 38) and IsControlPressed(0, 21)then
            --     isInPlaceItemMode = false

            --     local objHeading = GetEntityHeading(obj)
            --     local snapToGround = true

            --     DeleteEntity(obj)
            --     placeItem(item, vector3(coords.x, coords.y, coords.z + zOffset), objHeading, snapToGround)

            -- -- Pressed E - Place object at current position
            -- else
            if IsControlJustReleased(0, 38) then
                isInPlaceItemMode = false

                local objHeading = GetEntityHeading(obj)
                local snapToGround = false

                DeleteEntity(obj)
                placeItem(item, vector3(coords.x, coords.y, coords.z + zOffset), objHeading, snapToGround)
            end

            -- Controls for rotating item

            -- Mouse Wheel Up (and Shift not pressed), rotate by +10 degrees
            if IsControlJustReleased(0, 241) and not IsControlPressed(0, 21) then
                local objHeading = GetEntityHeading(obj)
                SetEntityRotation(obj, 0.0, 0.0, objHeading + 10, false, false)
            end

            -- Mouse Wheel Down (and shift not pressed), rotate by -10 degrees
            if IsControlJustReleased(0, 242) and not IsControlPressed(0, 21) then
                local objHeading = GetEntityHeading(obj)
                SetEntityRotation(obj, 0.0, 0.0, objHeading - 10, false, false)
            end

            -- Controls for raising/lowering item

            -- -- Shift + Mouse Wheel Up, move item up
            -- if IsControlPressed(0, 21) and IsControlJustReleased(0, 241) then
            --     zOffset = zOffset + 0.1
            --     if zOffset > Shared.maxZOffset then
            --         zOffset = Shared.maxZOffset
            --     end
            -- end

            -- -- Shift + Mouse Wheel Down, move item down
            -- if IsControlPressed(0, 21) and IsControlJustReleased(0, 242) then
            --     zOffset = zOffset - 0.1
            --     if zOffset < Shared.minZOffset then
            --         zOffset = Shared.minZOffset
            --     end
            -- end

            -- Right click or Backspace to exit out of placement mode and delete the local object
            if IsControlJustReleased(0, 177) then
                isInPlaceItemMode = false
                DeleteEntity(obj)
            end

            Wait(1)
        end
    end)
end

RegisterNetEvent("ez-gangflags:placeFlag", function(item)
    local item = item
    local hasItem = Inventory:HasItem(item) or true

    if IsPedInAnyVehicle(PlayerPedId(), true) then return Framework:Notify("You cannot place items while in a vehicle", "error") end

    if hasItem then 
        -- if not IsPedInAnyVehicle(PlayerPedId(), true) then
            startPlacement(item)
        -- end
    end
end)

RegisterNetEvent("ez-sync:client:deleteWorldObject", function(object)
    print(object.model, object.coords.x, object.coords.y, object.coords.z)
    local entity = GetClosestObjectOfType(object.coords.x, object.coords.y, object.coords.z, 0.1, object.model, false, false, false)
    print(entity, GetEntityModel(entity))
    -- if DoesEntityExist(entity) then
    --     print("my G")
    --     SetEntityAsMissionEntity(entity, 1, 1)
    --     -- DeleteObject(entity)
    --     DeleteEntity(entity)
    --     SetEntityAsNoLongerNeeded(entity)
    -- end
    if DoesEntityExist(entity) then
        print(spawnedEntity[entity])
        print("make me choke")
        SetEntityAsMissionEntity(entity, 1, 1)
        DeleteEntity(entity)
        SetEntityAsNoLongerNeeded(entity)
        spawnedEntity[entity] = nil
    end
end)

-- TO DO: Create Dick Pics ()

-- Burn / Destroy Flag

-- RegisterNetEvent("ez-gangflags:CreateTarget", function(coords, model)
--     -- local name = json.encode(coords)
--     -- -- print(name)
--     -- if not zoneName[name] then
--     --     -- zoneName[name] = name
--     --     zoneName[name] = exports['qb-target']:AddCircleZone(name, coords, 0.75, {
--     --         name = name,
--     --         debugPoly = false,
--     --         useZ = true,
--     --     }, {
--     --         options =  {
--     --             {
--     --                 event = "ez-gangflags:destroy",
--     --                 icon = "fas fa-hand-holding",
--     --                 label = "Destroy Flag",
--     --                 targetName = name,
--     --                 coords = coords,
--     --                 model = model,
--     --             },
--     --         },
--     --         distance = Shared.PlacementRadius
--     --     })
--     --     print(zoneName[name])
--     -- end

--     -- exports['qb-target']:AddTargetModel(prop.model, {
--     --     options =  {
--     --         {
--     --             event = "ez-gangflags:destroy",
--     --             icon = "fas fa-hand-holding",
--     --             label = "Destroy Flag",
--     --         },
--     --     },
--     --     distance = Shared.PlacementRadius
--     -- })
-- end)

RegisterNetEvent("ez-gangflags:removeZone", function(name)
    if zoneName[name] then
        -- print(json.encode(zoneName[name]))
        -- zoneName[name]:destory()
        exports['qb-target']:RemoveZone(name)
        zoneName[name] = nil
    end
end)

-- Handles picking up the prop, deleting it from the world and adding it to the players inventory
local function pickUpItem(itemData)
    local ped = PlayerPedId()
    -- local itemEntity2 = itemData.entity

    local itemEntity = GetClosestObjectOfType(itemData.coords.x, itemData.coords.y, itemData.coords.z, 0.1, itemData.model, false, false, false)
    -- local entity = GetClosestObjectOfType(object.coords.x, object.coords.y, object.coords.z, 0.1, object.model, false, false, false)

    -- local itemEntity = GetObjectOffsetFromCoords()

    -- print(itemEntity)
    -- print(itemEntity2, 2)
    -- local itemName = itemData.itemName
    local itemModel = itemData.model
    local name = itemData.targetName
    -- print(name)

    -- if itemName then
    -- Cancel any active animation
    ClearPedTasks(ped)

    Framework:Progressbar("destory_flag", "Destroying Flag", 4000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = animationDict,
        anim = animation,
        flags = 0,
    }, nil, nil, function() -- Done
        -- Stop playing the animation
        StopAnimTask(ped, animationDict, animation, 1.0)

        -- When picking up the item, check if it has a state.itemNameOverride and use that instead of itemName
        -- This is used for items that share a prop model, but are different items. By using the statebag override name instead,
        -- we make sure the player gets the correct item back when they pick it up.
        -- if Entity(itemEntity).state.itemNameOverride then
        --     itemName = Entity(itemEntity).state.itemNameOverride
        -- end

        -- Add the item to the inventory
        -- TriggerServerEvent("wp-placeables:server:AddItem", itemName)

        -- First request control of networkId and wait until have control of netId before deleting it
        -- Item will not properly delete if the client doesn't have control of the networkId
        local coords = GetEntityCoords(itemEntity)
        -- local netId = NetworkGetNetworkIdFromEntity(itemEntity)
        -- RequestNetworkControlOfObject(netId, itemEntity)
        SetEntityAsMissionEntity(itemEntity, true, true)
        DeleteEntity(itemEntity)

        local object = {coords = coords, model = itemModel}
        TriggerServerEvent("ez-sync:server:deleteWorldObject", object)
        TriggerServerEvent("ez-gangflags:RemoveTargetZone", name)
        TriggerServerEvent("ez-gangflags:delete", name)
        -- Framework:Notify("")
        -- createLog(itemName, false)
    end, function() -- Cancel
        StopAnimTask(ped, animationDict, animation, 1.0)
        Framework:Notify("Canceled..", "error")
    end)
    -- end
end

RegisterNetEvent('ez-gangflags:destroy', function(data)
    pickUpItem(data)
end)