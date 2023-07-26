local tint = nil
Display = false

function SetDisplay(bool)
    Display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
    SendNUIMessage({
        type = "data",
        tint = 'None',
        textColor = '--color-black'
    })
end)

RegisterNetEvent('cl_displayTint')
AddEventHandler('cl_displayTint', function(tint, color)
    SendNUIMessage({
        type = "data",
        tint = tint,
        textColor = color
    })
end)

function GetEntityInFrontOfPlayer(distance, ped)
	local coords = GetEntityCoords(ped, 1)
	local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, distance, 0.0)
	local rayHandle = StartShapeTestRay(coords.x, coords.y, coords.z, offset.x, offset.y, offset.z, -1, ped, 0)
	local a, b, c, d, entity = GetRaycastResult(rayHandle)
	return entity
end

RegisterNetEvent('cl_checkTint')
AddEventHandler('cl_checkTint', function()
    local vehicle = GetEntityInFrontOfPlayer(3.0, PlayerPedId())
    if DoesEntityExist(vehicle) then
        local eType = GetEntityType(vehicle)
        if eType == 2 then
            SetDisplay(true)
            if GetVehicleWindowTint(vehicle) == -1  then
                SendNUIMessage({    
                    type = "data",
                    tint = '50%',--'None',
                    textColor = '--color-black'
                })
            elseif GetVehicleWindowTint(vehicle) == 0 then
                SendNUIMessage({
                    type = "data",
                    tint = '100%', --'Stock',
                    textColor = '--color-black'
                })
            elseif GetVehicleWindowTint(vehicle) == 1 then
                SendNUIMessage({
                    type = "data",
                    tint = '5%',--'Pure Black',
                    textColor = '--color-red'
                })
            elseif GetVehicleWindowTint(vehicle) == 2 then
                SendNUIMessage({
                    type = "data",
                    tint = '15%',--'Dark Smoke',
                    textColor = '--color-black'
                })
            elseif GetVehicleWindowTint(vehicle) == 3 then
                SendNUIMessage({
                    type = "data",
                    tint = '20%',--'Light Smoke',
                    textColor = '--color-black'
                })
            elseif GetVehicleWindowTint(vehicle) == 4 then
                SendNUIMessage({
                    type = "data",
                    tint = '35%',--'Limo',
                    textColor = '--color-black'
                })
            elseif GetVehicleWindowTint(vehicle) == 5 then
                SendNUIMessage({
                    type = "data",
                    tint = '30%', --'Green',
                    textColor = '--color-black'
                })
            end
        end

    end
end)