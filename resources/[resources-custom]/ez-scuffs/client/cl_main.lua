RegisterNetEvent("scuff-fix", function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    if IsEntityDead(ped) or IsPedRagdoll(ped) then
        print("Dead Scuff Fix")
        SetEntityCoords(ped, coords)
    end
end)

RegisterCommand("scuff-fix", function()
    TriggerEvent("scuff-fix")
end)

function normalize(vec)
    local length = math.sqrt(vec.x * vec.x + vec.y * vec.y + vec.z * vec.z)
    if length ~= 0 then
        return vector3(vec.x / length, vec.y / length, vec.z / length)
    else
        return vector3(0.0, 0.0, 0.0)
    end
end

AddEventHandler('entityDamaged', function(victim, culprit, weapon, damage)
    if IsPedInAnyVehicle(PlayerPedId()) and GetEntityType(victim) == 2 then
        local playerVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        local driver = GetPedInVehicleSeat(playerVehicle, -1)
        if driver ~= PlayerPedId() then
            local victimVehicle = victim

            local playerCoords = GetEntityCoords(playerVehicle)
            local victimCoords = GetEntityCoords(victimVehicle)


            SetEntityCoords(victimVehicle, -14204.15,-1923.68,-161.7)
        end


        -- local forceDirection = (victimCoords - playerCoords) * vector3(1.0, 1.0, 0.0)
        -- local normalizedForce = normalize(forceDirection)

        -- local forceMultiplier = 10.0 -- Adjust this value to change force of velocity

        -- local victimVelocity = GetEntityVelocity(victimVehicle)
        -- local newVelocity = victimVelocity + normalizedForce * forceMultiplier
        -- SetEntityVelocity(victimVehicle, newVelocity.x, newVelocity.y, newVelocity.z)
    end
end)