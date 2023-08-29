Sync = {}

function RequestSyncExecution(native, entity, ...)
    if DoesEntityExist(entity) then
        TriggerServerEvent('sync:request', GetInvokingResource(), native, GetPlayerServerId(NetworkGetEntityOwner(entity)), NetworkGetNetworkIdFromEntity(entity), ...)
    end
end

Sync.DeleteVehicle = function (vehicle)
    if NetworkHasControlOfEntity(vehicle) then
        DeleteVehicle(vehicle)
    else
        RequestSyncExecution("DeleteVehicle", vehicle)
    end
end
exports("DeleteVehicle", Sync.DeleteVehicle)

Sync.DeleteEntity = function (entity)
    if NetworkHasControlOfEntity(entity) then
        DeleteEntity(entity)
    else
        RequestSyncExecution("DeleteEntity", entity)
    end
end
exports("DeleteEntity", Sync.DeleteEntity)

Sync.DeletePed = function (ped)
    if NetworkHasControlOfEntity(ped) then
        DeletePed(ped)
    else
        RequestSyncExecution("DeletePed", ped)
    end
end
exports("DeletePed", Sync.DeletePed)

Sync.DeleteObject = function (object)
    if NetworkHasControlOfEntity(object) then
        DeleteObject(object)
    else
        RequestSyncExecution("DeleteObject", object)
    end
end
exports("DeleteObject", Sync.DeleteObject)

Sync.SetVehicleFuelLevel = function (vehicle, level)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleFuelLevel(vehicle, level)
    else
        RequestSyncExecution("SetVehicleFuelLevel", vehicle, level)
    end
end
exports("SetVehicleFuelLevel", Sync.SetVehicleFuelLevel)


Sync.SetVehicleTyreBurst = function (vehicle, index, onRim, p3)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleTyreBurst(vehicle, index, onRim, p3)
    else
        RequestSyncExecution("SetVehicleTyreBurst", vehicle, index, onRim, p3)
    end
end
exports("SetVehicleTyreBurst", Sync.SetVehicleTyreBurst)

Sync.SetVehicleDoorShut = function (vehicle, doorIndex, closeInstantly)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleDoorShut(vehicle, doorIndex, closeInstantly)
    else
        RequestSyncExecution("SetVehicleDoorShut", vehicle, doorIndex, closeInstantly)
    end
end
exports("SetVehicleDoorShut", Sync.SetVehicleDoorShut)

Sync.SetVehicleDoorOpen = function (vehicle, doorIndex, loose, openInstantly)
  if NetworkHasControlOfEntity(vehicle) then
      SetVehicleDoorOpen(vehicle, doorIndex, loose, openInstantly)
  else
      RequestSyncExecution("SetVehicleDoorOpen", vehicle, doorIndex, loose, openInstantly)
  end
end
exports("SetVehicleDoorOpen", Sync.SetVehicleDoorOpen)

Sync.SetVehicleDoorBroken = function (vehicle, doorIndex, deleteDoor)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleDoorBroken(vehicle, doorIndex, deleteDoor)
    else
        RequestSyncExecution("SetVehicleDoorBroken", vehicle, doorIndex, deleteDoor)
    end
end
exports("SetVehicleDoorBroken", Sync.SetVehicleDoorBroken)

Sync.SetVehicleEngineOn = function(vehicle, value, instantly, noAutoTurnOn)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleEngineOn(vehicle, value, instantly, noAutoTurnOn)
    else
        RequestSyncExecution("SetVehicleEngineOn", vehicle, value, instantly, noAutoTurnOn)
    end
end
exports("SetVehicleEngineOn", Sync.SetVehicleEngineOn)

Sync.SetVehicleUndriveable = function(vehicle, toggle)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleUndriveable(vehicle, toggle)
    else
        RequestSyncExecution("SetVehicleUndriveable", vehicle, toggle)
    end
end
exports("SetVehicleUndriveable", Sync.SetVehicleUndriveable)

Sync.SetVehicleHandbrake = function(vehicle, toggle)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleHandbrake(vehicle, toggle)
    else
        RequestSyncExecution("SetVehicleHandbrake", vehicle, toggle)
    end
end
exports("SetVehicleHandbrake", Sync.SetVehicleHandbrake)

Sync.DecorSetFloat = function (entity, propertyName, value)
    if NetworkHasControlOfEntity(entity) then
        DecorSetFloat(entity, propertyName, value)
    else
        RequestSyncExecution("DecorSetFloat", entity, propertyName, value)
    end
end
exports("DecorSetFloat", Sync.DecorSetFloat)

Sync.DecorSetBool = function (entity, propertyName, value)
    if NetworkHasControlOfEntity(entity) then
        DecorSetBool(entity, propertyName, value)
    else
        RequestSyncExecution("DecorSetBool", entity, propertyName, value)
    end
end
exports("DecorSetBool", Sync.DecorSetBool)

Sync.DecorSetInt = function (entity, propertyName, value)
    if NetworkHasControlOfEntity(entity) then
        DecorSetInt(entity, propertyName, value)
    else
        RequestSyncExecution("DecorSetInt", entity, propertyName, value)
    end
end
exports("DecorSetInt", Sync.DecorSetInt)

Sync.DetachEntity = function (entity, p1, collision)
    if NetworkHasControlOfEntity(entity) then
        DetachEntity(entity, p1, collision)
    else
        RequestSyncExecution("DetachEntity", entity, p1, collision)
    end
end
exports("DetachEntity", Sync.DetachEntity)

Sync.SetEntityCoords = function (entity, xPos, yPos, zPos, xAxis, yAxis, zAxis, clearArea)
    if NetworkHasControlOfEntity(entity) then
        SetEntityCoords(entity, xPos, yPos, zPos, xAxis, yAxis, zAxis, clearArea)
    else
        RequestSyncExecution("SetEntityCoords", entity, xPos, yPos, zPos, xAxis, yAxis, zAxis, clearArea)
    end
end
exports("SetEntityCoords", Sync.SetEntityCoords)

Sync.SetEntityHeading = function (entity, heading)
    if NetworkHasControlOfEntity(entity) then
        SetEntityHeading(entity, heading)
    else
        RequestSyncExecution("SetEntityHeading", entity, heading)
    end
end
exports("SetEntityHeading", Sync.SetEntityHeading)

Sync.FreezeEntityPosition = function (entity, freeze)
    if NetworkHasControlOfEntity(entity) then
        FreezeEntityPosition(entity, freeze)
    else
        RequestSyncExecution("FreezeEntityPosition", entity, freeze)
    end
end
exports("FreezeEntityPosition", Sync.FreezeEntityPosition)

Sync.SetVehicleDoorsLocked = function (entity, status)
    if NetworkHasControlOfEntity(entity) then
        SetVehicleDoorsLocked(entity, status)
    else
        RequestSyncExecution("SetVehicleDoorsLocked", entity, status)
    end
end
exports("SetVehicleDoorsLocked", Sync.SetVehicleDoorsLocked)

Sync.NetworkExplodeVehicle = function (vehicle, isAudible, isInvisible, p3)
    if NetworkHasControlOfEntity(vehicle) then
        NetworkExplodeVehicle(vehicle, isAudible, isInvisible, p3)
    else
        RequestSyncExecution("NetworkExplodeVehicle", vehicle, isAudible, isInvisible, p3)
    end
end
exports("NetworkExplodeVehicle", Sync.NetworkExplodeVehicle)

Sync.SetBoatAnchor = function (vehicle, state)
    if NetworkHasControlOfEntity(vehicle) then
        SetBoatAnchor(vehicle, state)
    else
        RequestSyncExecution("SetBoatAnchor", vehicle, state)
    end
end
exports("SetBoatAnchor", Sync.SetBoatAnchor)

Sync.SetBoatFrozenWhenAnchored = function (vehicle, state)
    if NetworkHasControlOfEntity(vehicle) then
        SetBoatFrozenWhenAnchored(vehicle, state)
    else
        RequestSyncExecution("SetBoatFrozenWhenAnchored", vehicle, state)
    end
end
exports("SetBoatFrozenWhenAnchored", Sync.SetBoatFrozenWhenAnchored)

Sync.SetForcedBoatLocationWhenAnchored = function (vehicle, state)
    if NetworkHasControlOfEntity(vehicle) then
        SetForcedBoatLocationWhenAnchored(vehicle, state)
    else
        RequestSyncExecution("SetForcedBoatLocationWhenAnchored", vehicle, state)
    end
end
exports("SetForcedBoatLocationWhenAnchored", Sync.SetForcedBoatLocationWhenAnchored)

Sync.SetVehicleOnGroundProperly = function (vehicle)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleOnGroundProperly(vehicle)
    else
        RequestSyncExecution("SetVehicleOnGroundProperly", vehicle)
    end
end
exports("SetVehicleOnGroundProperly", Sync.SetVehicleOnGroundProperly)

Sync.SetVehicleTyreFixed = function (vehicle, index)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleTyreFixed(vehicle, index)
    else
        RequestSyncExecution("SetVehicleTyreFixed", vehicle, index)
    end
end
exports("SetVehicleTyreFixed", Sync.SetVehicleTyreFixed)

Sync.SetVehicleEngineHealth = function (vehicle, health)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleEngineHealth(vehicle, health + 0.0)
    else
        RequestSyncExecution("SetVehicleEngineHealth", vehicle, health  + 0.0)
    end
end
exports("SetVehicleEngineHealth", Sync.SetVehicleEngineHealth)

Sync.SetVehicleBodyHealth = function (vehicle, health)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleBodyHealth(vehicle, health + 0.0)
    else
        RequestSyncExecution("SetVehicleBodyHealth", vehicle, health  + 0.0)
    end
end
exports("SetVehicleBodyHealth", Sync.SetVehicleBodyHealth)

Sync.SetVehicleDeformationFixed = function (vehicle)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleDeformationFixed(vehicle)
    else
        RequestSyncExecution("SetVehicleDeformationFixed", vehicle)
    end
end
exports("SetVehicleDeformationFixed", Sync.SetVehicleDeformationFixed)

Sync.SetVehicleFixed = function (vehicle)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleFixed(vehicle)
    else
        RequestSyncExecution("SetVehicleFixed", vehicle)
    end
end
exports("SetVehicleFixed", Sync.SetVehicleFixed)

Sync.SetEntityAsNoLongerNeeded = function (entity)
    if NetworkHasControlOfEntity(entity) then
        SetEntityAsNoLongerNeeded(entity)
    else
        RequestSyncExecution("SetEntityAsNoLongerNeeded", entity)
    end
end
exports("SetEntityAsNoLongerNeeded", Sync.SetEntityAsNoLongerNeeded)

Sync.SetPedKeepTask = function (ped, keepTask)
    if NetworkHasControlOfEntity(ped) then
        SetPedKeepTask(ped, keepTask)
    else
        RequestSyncExecution("SetPedKeepTask", ped, keepTask)
    end
end
exports("SetPedKeepTask", Sync.SetPedKeepTask)

-- Sync.SetVehicleMods = function (vehicle, mods)
--     if NetworkHasControlOfEntity(vehicle) then
--         exports['ez-vehicles']:SetVehicleMods(vehicle, mods)
--     else
--         RequestSyncExecution("SetVehicleMods", vehicle, mods)
--     end
-- end

-- Sync.SetVehicleAppearance = function (vehicle, appearance)
--     if NetworkHasControlOfEntity(vehicle) then
--         exports['ez-vehicles']:SetVehicleAppearance(vehicle, appearance)
--     else
--         RequestSyncExecution("SetVehicleAppearance", vehicle, appearance)
--     end
-- end

Sync.SetVehicleTyresCanBurst = function (vehicle, enabled)
    if NetworkHasControlOfEntity(vehicle) then
        SetVehicleTyresCanBurst(vehicle, enabled)
    else
        RequestSyncExecution("SetVehicleTyresCanBurst", vehicle, enabled)
    end
end
exports("SetVehicleTyresCanBurst", Sync.SetVehicleTyresCanBurst)