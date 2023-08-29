local MenuItemId = nil

function GetEntityInFrontOfPlayer(distance, ped)
	local coords = GetEntityCoords(ped, 1)
	local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, distance, 0.0)
	local rayHandle = StartShapeTestRay(coords.x, coords.y, coords.z, offset.x, offset.y, offset.z, -1, ped, 0)
	local a, b, c, d, entity = GetRaycastResult(rayHandle)
	return entity
end

CreateThread(function()
    local TowBlip = AddBlipForCoord(Shared.TowYard.coords.x, Shared.TowYard.coords.y, Shared.TowYard.coords.z)
    SetBlipSprite(TowBlip, 477)
    SetBlipDisplay(TowBlip, 4)
    SetBlipScale(TowBlip, 0.6)
    SetBlipAsShortRange(TowBlip, true)
    SetBlipColour(TowBlip, 15)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Shared.TowYard.label)
    EndTextCommandSetBlipName(TowBlip)

    exports["ps-zones"]:CreateBoxZone("towyard_1", Shared.TowYard.coords, Shared.TowYard.length, Shared.TowYard.width, Shared.TowYard.data)
end)

RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "towyard_") then
        MenuItemId = Radial:AddOption({
            id = 'ezrp_tow',
            title = 'Impound',
            icon = 'warehouse',
            type = 'client',
            event = "ez-tow:deleteVehicleShit",
            shouldClose = true
        }, MenuItemId)
    end
end)

RegisterNetEvent("ez-tow:deleteVehicleShit", function()
    local entity = GetEntityInFrontOfPlayer(3.0, PlayerPedId())
    if DoesEntityExist(entity) then
        Functions:DeleteVehicle(entity)
    end
end)

RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "storage_") then
        if MenuItemId ~= nil then
            Radial:RemoveOption(MenuItemId)
            MenuItemId = nil
        end
    end
end)
