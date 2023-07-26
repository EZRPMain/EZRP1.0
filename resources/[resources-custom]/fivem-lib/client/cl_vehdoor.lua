local function getNearestVeh()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)

    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
    return vehicleHandle
end exports("getNearestVeh", getNearestVeh)

local function checkDoor(closestVehicle, doorId)
    if GetVehicleDoorAngleRatio(closestVehicle, doorId) > 0 then
        return true
    end
    return false
end exports("checkDoor", checkDoor)

local vehicleParts = {
    VEH_EXT_DOOR_DSIDE_F = 0,
    VEH_EXT_DOOR_DSIDE_R = 1,
    VEH_EXT_DOOR_PSIDE_F = 2,
    VEH_EXT_DOOR_PSIDE_R = 3,
    VEH_EXT_BONNET = 4,
    VEH_EXT_BOOT = 5,
}

local function checkDoors(closestVehicle)
    local result = {}
    for key,value in pairs(vehicleParts) do
        if GetVehicleDoorAngleRatio(closestVehicle, value) > 0 then
            result[key] = value
        end
    end
    return result
end exports("checkDoors", checkDoors)