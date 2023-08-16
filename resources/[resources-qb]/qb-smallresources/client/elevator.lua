exports['qb-target']:AddBoxZone("elevator", vector3(5011.565, -5748.293, 29.245), 0.2, 0.2, {
    name = "Cayo Elevator to Bottem",
    heading = 168.0,
    debugPoly = false,
    minZ = 28.1,
    maxZ = 28.5,
  }, {
    options = {
        {
          type = "client",
          action = function(entity) 
            TriggerEvent('cayo:callLiftdown', k)
          end,
          icon = "fas fa-chevron-circle-up",
          label = "Take the Lift Down",
        },
    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("elevator", vector3(5011.565, -5748.293, 29.245), 0.2, 0.2, { --vector3(5012.097, -5745.518, 15.484) --[vector4(5012.097, -5745.518, 15.484, 55.0)]--
    name = "Cayo Elevator to Top",
    heading = 168.0,
    debugPoly = false,
    minZ = 28.1,
    maxZ = 28.5,
  }, {
    options = {
        {
          type = "client",
          action = function(entity) 
            TriggerEvent('cayo:callLiftup', k)
          end,
          icon = "fas fa-chevron-circle-up",
          label = "Take the Lift Up",
        },
    },
    distance = 2.5
})

RegisterNetEvent('cayo:callLiftdown', function(playerId)
    Wait(1000)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
            local liftDist = #(coords - vector3(5011.565, -5748.293, 29.245))
            if liftDist <= 15 then
                inLiftRange = true
                if liftDist <= 7.5 then
                    if not IsPedInAnyVehicle(ped) then            
 if not IsPedInAnyVehicle(ped) then
   changeFloor()
                            end
                        
                    end
                end
            end
    if not inLiftRange then
        Wait(1000)
    end
end)

RegisterNetEvent('cayo:callLiftup', function(playerId)
    Wait(1000)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
            local liftDist = #(coords - vector3(5012.097, -5745.518, 15.484))
            if liftDist <= 15 then
                inLiftRange = true
                if liftDist <= 7.5 then
                    if not IsPedInAnyVehicle(ped) then            
 if not IsPedInAnyVehicle(ped) then
   changeFloor()
                            end
                        
                    end
                end
            end
    if not inLiftRange then
        Wait(1000)
    end
end)