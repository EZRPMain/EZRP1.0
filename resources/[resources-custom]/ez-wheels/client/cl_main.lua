local highestZ = 0
CreateThread(function()
    local waittime = 100
    while true do
        Wait(waittime)
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        if DoesEntityExist(veh) and not IsEntityDead(veh) then
            local model = GetEntityModel(veh)
            if not IsThisModelABoat(model) and not IsThisModelAHeli(model) and not IsThisModelAPlane(model) then
                local vehpos = GetEntityCoords(veh)
                if IsEntityInAir(veh) then
                    waittime = 0
                    if vehpos.z > highestZ then
                        highestZ = vehpos.z
                    end
                    DisableControlAction(0, 59)
                    DisableControlAction(0, 60)
                else
                    if highestZ - vehpos.z >= 16 then
                        local wheels = {0, 1, 4, 5}
                        for i = 1, math.random(2) do
                            local wheel = math.random(#wheels)
                            SetVehicleTyreBurst(veh, wheels[wheel], false, 1000.0)
                            if highestZ - vehpos.z >= 32 then
                                BreakOffVehicleWheel(veh, wheels[wheel], true, false, true, false)
                            end                      
                            table.remove(wheels, wheel)
                        end
                        highestZ = 0
                        waittime = 100
                    end
                    if highestZ - vehpos.z >= 16 then
                        for i = 0, 5 do
                            if not IsVehicleTyreBurst(veh, i, true) or IsVehicleTyreBurst(veh, i, false) then
                                SetVehicleTyreBurst(veh, i, false, 1000.0)
                            end
                        end
                        highestZ = 0
                        waittime = 100
                    else
                        highestZ = 0
                        waittime = 100
                    end
                end
            end
        end
    end
end)
