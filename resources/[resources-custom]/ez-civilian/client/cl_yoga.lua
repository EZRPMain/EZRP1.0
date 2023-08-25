CreateThread(function()
    exports['qb-target']:AddTargetModel({-1978741854, 2057317573, -232023078}, { --Yoga mats
        options = {
            {
                type = "client",
                event = "yoga:start",
                icon = "fas fa-yin-yang",
                label = "Do yoga",
            },
        },
        distance = 2.5
    })
end)

local SucceededAttempts = 0
local NeededAttempts = 2

RegisterNetEvent('yoga:start', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    TriggerEvent('animations:client:EmoteCommandStart', {"yoga"})
    FreezeEntityPosition(ped, true)


    exports['ps-ui']:Circle(function(success)
        if success then
            ClearPedTasks(ped)
            SucceededAttempts = 0
            FreezeEntityPosition(ped, false)
            TriggerServerEvent('hud:server:RelieveStress', 5)
            Framework:Notify("You have a bit less stress", "success")
        else
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            Framework:Notify("Failed, focus..", "error")
            SetPedToRagdollWithFall(ped, 1000, 2000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
            SucceededAttempts = 0
        end
    end, math.random(8,15), math.random(50,80)) -- NumberOfCircles, MS
end)

CreateThread(function()
    local coords = vector3(-1493.59, 829.14, 181.6)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, 197)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.6)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 24)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Yoga")
    EndTextCommandSetBlipName(blip)
end)