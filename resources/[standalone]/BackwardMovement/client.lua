local backwardModifierButton = "H"
local backwardModifier = false

RegisterCommand('+backwardModifier', function()
    local playerPed = PlayerPedId()
    if not IsPedInAnyVehicle(PlayerPedId(), true) then
        backwardModifier = true
        
        CreateThread(function()
            while backwardModifier do 
                
                if IsControlPressed(0, 33) then -- S
                    
                    TaskPlayAnim(playerPed, "move_strafe@first_person@generic", "walk_bwd_180_loop", 5.0, 1.0, -1, 1, 0.1) -- walk_trans_fwd_0_rf_bwd_180
                    while backwardModifier and not IsControlReleased(0, 33) and not IsControlPressed(0, 34) and not IsControlPressed(0, 35) do Wait(0) end
                    if IsControlPressed(0, 35) and IsControlPressed(0, 33) then
                        TaskPlayAnim(playerPed, "move_strafe@first_person@generic", "walk_bwd_135_loop", 5.0, 1.0, -1, 1, 0.1)
                        while backwardModifier and not IsControlReleased(0, 33) and not IsControlReleased(0, 35) do Wait(0) end
                        ClearPossibleActiveEmotes(playerPed)
                    elseif IsControlPressed(0, 34) and IsControlPressed(0, 33) then
                        TaskPlayAnim(playerPed, "move_strafe@first_person@generic", "walk_bwd_-135_loop", 5.0, 1.0, -1, 1, 0.1)
                        while backwardModifier and not IsControlReleased(0, 33) and not IsControlReleased(0, 34) do Wait(0) end
                        ClearPossibleActiveEmotes(playerPed)
                    else
                        ClearPossibleActiveEmotes(playerPed)
                    end
                    
                elseif IsControlPressed(0, 34) then -- A
                    
                    playerPed = PlayerPedId()
                    TaskPlayAnim(playerPed, "move_strafe@first_person@generic", "walk_bwd_-90_loop", 5.0, 1.0, -1, 1, 0.1)
                    while backwardModifier and not IsControlReleased(0, 34) and not IsControlPressed(0, 33) do Wait(0) end
                    if IsControlPressed(0, 33) and IsControlPressed(0, 34) then
                        TaskPlayAnim(playerPed, "move_strafe@first_person@generic", "walk_bwd_-135_loop", 5.0, 1.0, -1, 1, 0.1)
                        while backwardModifier and not IsControlReleased(0, 34) and not IsControlReleased(0, 33) do Wait(0) end
                        ClearPossibleActiveEmotes(playerPed)
                    else
                        ClearPossibleActiveEmotes(playerPed)
                    end
                    
                elseif IsControlPressed(0, 35) then -- D
                    
                    playerPed = PlayerPedId()
                    TaskPlayAnim(playerPed, "move_strafe@first_person@generic", "walk_fwd_90_loop", 5.0, 1.0, -1, 1, 0.1)
                    while backwardModifier and not IsControlReleased(0, 35) and not IsControlPressed(0, 33) do Wait(0) end
                    if IsControlPressed(0, 33) and IsControlPressed(0, 35) then
                        TaskPlayAnim(playerPed, "move_strafe@first_person@generic", "walk_bwd_135_loop", 5.0, 1.0, -1, 1, 0.1)
                        while backwardModifier and not IsControlReleased(0, 35) and not IsControlReleased(0, 33) do Wait(0) end
                        StopAnimTask(playerPed, "move_strafe@first_person@generic", "walk_bwd_135_loop", 2.0)
                    else
                        ClearPossibleActiveEmotes(playerPed)
                    end
                    
                end
                Wait(0)
            end
        end)
    end
end, false)

RegisterCommand('-backwardModifier', function()
    backwardModifier = false
end, false)

ClearPossibleActiveEmotes = function(playerPed)
    StopAnimTask(playerPed, "move_strafe@first_person@generic", "walk_bwd_135_loop", 2.0)
    StopAnimTask(playerPed, "move_strafe@first_person@generic", "walk_bwd_-135_loop", 2.0)
    StopAnimTask(playerPed, "move_strafe@first_person@generic", "walk_bwd_180_loop", 2.0)
    StopAnimTask(playerPed, "move_strafe@first_person@generic", "walk_bwd_-90_loop", 2.0)
    StopAnimTask(playerPed, "move_strafe@first_person@generic", "walk_fwd_90_loop", 2.0)
end


RegisterKeyMapping('+backwardModifier', 'Walking Backward Modifier', 'keyboard', backwardModifierButton)