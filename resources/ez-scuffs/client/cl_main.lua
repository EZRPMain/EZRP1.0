RegisterNetEvent("scuff-fix", function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    if IsEntityDead(ped) then
        print("Dead Scuff Fix")
        CreateThread(function()
            local timeout = 0
            repeat
                Wait(0)
                timeout = timeout + 1
                SetEntityCoords(ped, coords)
            until timeout > = 1000
            timeout = 0
        end)
        -- SetEntityCoords(ped, coords)
    end
end)

RegisterCommand("scuff-fix", function()
    TriggerEvent("scuff-fix")
end)