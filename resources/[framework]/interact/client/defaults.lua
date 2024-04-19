if GetConvar('interact_disabledefault', 'false') == 'true' then
    return
end

local api = require 'client.interactions'

api.addGlobalVehicleInteraction({
    distance = 5.0,
    interactDst = 1.5,
    offset = vec3(0.0, 1.0, 0.0),
    bone = 'boot',
    id = 'interact:defaultTrunk',
    name = 'interact:defaultTrunk', -- optional
    options = {
        {
            name = 'interact:trunk',
            label = 'Toggle Trunk',
            action = function(entity)
                local coords = GetEntityCoords(entity)
                TaskTurnPedToFaceCoord(cache.ped, coords.x, coords.y, coords.z, 0)
                if GetVehicleDoorAngleRatio(entity, 5) > 0.0 then
                    SetVehicleDoorShut(entity, 5, false)
                else
                    SetVehicleDoorOpen(entity, 5, false, false)
                end
            end,
        },
        {
            name = 'interact:trunk',
            label = 'View Trunk',
            canInteract = function(entity)
                if GetVehicleDoorAngleRatio(entity, 5) <= 0.0  then
                    return false
                end
                return true
            end,
            action = function(entity)
                local coords = GetEntityCoords(entity)
                TaskTurnPedToFaceCoord(cache.ped, coords.x, coords.y, coords.z, 0)
                ExecuteCommand("inventory")
            end,
        },
        {
            name = 'interact:getin',
            label = 'Get In',
            canInteract = function(entity)
                if GetVehicleDoorAngleRatio(entity, 5) <= 0.0  then
                    return false
                end
                return true
            end,
            action = function(entity)
                local coords = GetEntityCoords(entity)
                TaskTurnPedToFaceCoord(cache.ped, coords.x, coords.y, coords.z, 0)
                ExecuteCommand("getintrunk")
            end,
        },
        {
            name = 'interact:corner',
            label = 'Toggle Corner Selling',
            canInteract = function(entity)
                local playerData = exports['qb-core']:GetCoreObject().Functions.GetPlayerData()   
                if GetVehicleDoorAngleRatio(entity, 5) <= 0.0  then
                    return false
                end
                if playerData.job.type == "leo" or playerData.job.type == "ems" then 
                    return false 

                end
                return true
            end,
            action = function(entity)
                local coords = GetEntityCoords(entity)
                TriggerEvent("jay-corner:client:cornerselling")
            end,
        },
    }
})