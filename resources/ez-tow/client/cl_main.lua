local MenuItemId = nil

local function GetEntityInFrontOfPlayer(distance, ped)
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

local function isVehicleImpoundable(plate)
    -- promise code shit for later :kekw:
    return "Parking Violation"
end

RegisterNetEvent("ez-tow:deleteVehicleShit", function()
    local entity = GetEntityInFrontOfPlayer(3.0, PlayerPedId())
    if DoesEntityExist(entity) and GetEntityType(entity) == 2 then
        -- Functions:DeleteVehicle(entity)
        local plate = Framework:GetPlate(entity)
        local reason = isVehicleImpoundable(plate)
        if reason then 
            local menuData = {
                {
                    header = "Impound Vehicle",
                    isMenuHeader = true,
                },
                {
                    header = ("%s"):format(reason),
                    txt = ("Plate : %s"):format(plate),
                    params = {
                        isAction = true,
                        event = function()
                            Functions:DeleteVehicle(entity)
                            TriggerServerEvent("ez-tow:updateLog", plate)
                        end,
                        args = {}
                    }
                }
            }
            exports['qb-menu']:openMenu(menuData)
        else 
            Framework:Notify("incorrect vehicle", "error")
        end
    else 
        Framework:Notify("No vehicle found", "error")
    end
end)


RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "towyard_") then
        if MenuItemId ~= nil then
            Radial:RemoveOption(MenuItemId)
            MenuItemId = nil
        end
    end
end)
