local driftModeEnabled = false
local currentVeh = nil
local all_part = {}

exports("GetVehicleTier", GetVehicleTier)

RegisterNetEvent('ez:vehicletier', function()
    vehtier = exports("GetVehicleTier", GetVehicleTier)
end)

if config.vehicletier = true then
    TriggerCallback('ez:vehicletier')
    tier = vehClass
    else
    
    end
end

local function disableDrift(pedVehicle)
    SetDriftTyresEnabled(pedVehicle, 0)
    SetReduceDriftVehicleSuspension(pedVehicle, 0)
    driftModeEnabled = not driftModeEnabled
end

local function notify(message)
    TriggerEvent('chat:addMessage', {
        color = {255, 0, 0},
        multiline = true,
        args = {"Drift Mode", message}
    })
end

function ToggleDriftMode()
    local ped = PlayerPedId()
    local pedVehicle = GetVehiclePedIsIn(ped)
    currentVeh = pedVehicle

    if Config.vehicletier and
        not vehClass = tier then
        notify('This vehicle tier is not valid for drift mode.')
        return
    end

    if driftModeEnabled then
        disableDrift(pedVehicle)
        notify('Drift mode is now ' ..
                   (driftModeEnabled and "enabled" or "disabled") .. '.')
        return
    else
        driftModeEnabled = not driftModeEnabled
        notify('Drift mode is now ' ..
                   (driftModeEnabled and "enabled" or "disabled") .. '.')
    end

    SetDriftTyresEnabled(pedVehicle, 1)
    SetReduceDriftVehicleSuspension(pedVehicle, 1)

    Citizen.CreateThread(function()
        while driftModeEnabled do
            Citizen.Wait(0)
            if driftModeEnabled == false then break end
            local speed = GetEntitySpeed(pedVehicle) * 3.6 -- Convert speed to km/h
            if IsPedInAnyVehicle(ped) then
                if pedVehicle ~= currentVeh then
                    currentVeh = pedVehicle
                    disableDrift(pedVehicle)
                    break
                end
                local RPM = GetVehicleCurrentRpm(pedVehicle)
                if GetPedInVehicleSeat(pedVehicle, -1) == ped and speed > 5 then
                    for i = 0, 20 do -- Increased density to 20
                        UseParticleFxAssetNextCall("core")
                        local W1 = StartParticleFxLoopedOnEntityBone(
                                       "exp_grd_bzgas_smoke", pedVehicle, 0.2,
                                       0, 0, 0, 0, 0, GetEntityBoneIndexByName(
                                           pedVehicle, "wheel_lr"), 1.0, 0, 0, 0) -- Increased size to 1.0
                        UseParticleFxAssetNextCall("core")
                        local W2 = StartParticleFxLoopedOnEntityBone(
                                       "exp_grd_bzgas_smoke", pedVehicle, 0.2,
                                       0, 0, 0, 0, 0, GetEntityBoneIndexByName(
                                           pedVehicle, "wheel_rr"), 1.0, 0, 0, 0) -- Increased size to 1.0
                        table.insert(all_part, W1)
                        table.insert(all_part, W2)
                    end

                    Citizen.Wait(500)
                    for _, W in ipairs(all_part) do
                        StopParticleFxLooped(W, true)
                    end
                end
            else
                disableDrift(pedVehicle)
                print('broke')
                break
            end
        end
    end)

    if Config.twostep then
        Citizen.CreateThread(function()
            while driftModeEnabled do
                Citizen.Wait(0)
                if driftModeEnabled == false then break end
                if IsPedInAnyVehicle(ped) then
                    local RPM = GetVehicleCurrentRpm(pedVehicle)
                    if GetPedInVehicleSeat(pedVehicle, -1) == ped and RPM > 0.9 then
                        AddExplosion(GetEntityCoords(pedVehicle), 61, 0.0, true,
                                     true, 0.0, true)
                        Citizen.Wait(math.random(100, 400))
                    end
                end
            end
        end)
    end
end


function keybind()
    Citizen.Wait(0)
    -- Check if the key is pressed
    if IsControlJustPressed(0, Config.startKey) then
    -- Perform the action you want when the key is pressed
    TriggerServerEvent(ToggleDriftMode)
    end
end