RentalVehicle = {}
CreateThread(function()
    exports['qb-target']:SpawnPed({
        spawnNow = true,
        model = 'ig_siemonyetarian',
        coords = vector4(4520.24, -4515.56, 4.48, 30.06),
        minusOne = true,
        freeze = true,
        invincible = true,
        blockevents = true,
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        target = {
            useModel = false,
            options = {
                {
                    type = "client",
                    icon = 'fas fa-car',
                    label = 'Rent Vehicle',
                    action = function(entity)
                        if IsPedAPlayer(entity) then return false end
                        exports['qb-menu']:openMenu({
                            {
                                header = "Rental Vehicles",
                                isMenuHeader = true,
                            },
                            {
                                id = 1,
                                header = "Return Vehicle ",
                                txt = "Return your rented vehicle.",
                                params = {
                                    event = "client:RentalReturn",
                                }
                            },
                            {
                                id = 2,
                                header = "Winky",
                                txt = "$250.00",
                                params = {
                                    isServer = true,
                                    event = "server:RentalCar",
                                    args = {
                                        model = 'winky',
                                        money = 250,
                                    }
                                }
                            },
                            {
                                id = 3,
                                header = "Verus",
                                txt = "$500.00",
                                params = {
                                    isServer = true,
                                    event = "server:RentalCar",
                                    args = {
                                        model = 'verus',
                                        money = 500,
                                    }
                                }
                            },
                            {
                                id = 4,
                                header = "Vetir",
                                txt = "$750.00",
                                params = {
                                    isServer = true,
                                    event = "server:RentalCar",
                                    args = {
                                        model = 'vetir',
                                        money = 750,
                                    }
                                }
                            },
                        })
                    end,
                    canInteract = function(entity, distance, data)
                        if IsPedAPlayer(entity) then return false end
                        return true
                    end,
                }
            },
            distance = 2.5,
        },
        -- currentpednumber = 0,
    })
end)

CreateThread(function() 
    local Location = vector4(4520.24, -4515.56, 4.48, 30.06)
    local Blip = AddBlipForCoord(Location.x, Location.y, Location.z)
    SetBlipSprite(Blip, 56)
    SetBlipAsShortRange(Blip, true)
    SetBlipScale(Blip, 0.5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Cayo Car Rental")
    EndTextCommandSetBlipName(Blip)
end)

RegisterNetEvent('client:RentalCar', function(model)
    local model = model
    local player = PlayerPedId()
    local coords = vector4(4528.86, -4528.03, 4.17, 106.41)
    QBCore.Functions.SpawnVehicle(model, function(vehicle)
        local plate = GetVehicleNumberPlateText(vehicle)
        TaskWarpPedIntoVehicle(player, vehicle, -1)
        exports[Config.Fuel]:SetFuel(vehicle, 100)
        SetVehicleDirtLevel(vehicle, 0.0)
        -- TaskEnterVehicle(player, vehicle, -1, -1, 1.0, 1, 0)
        TriggerEvent("vehiclekeys:client:SetOwner", plate)
        SetVehicleEngineOn(vehicle, true, true)
        RentalVehicle[plate] = true
    end, coords, true)
end)

RegisterNetEvent('client:RentalReturn', function()
    local player = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(player, true)
    local plate = GetVehicleNumberPlateText(vehicle)
    if RentalVehicle[plate] then
        RentalVehicle[plate] = false
        QBCore.Functions.Notify('Returned vehicle!', 'success')
        NetworkFadeOutEntity(vehicle, true,false)
        Wait(2000)
        QBCore.Functions.DeleteVehicle(vehicle)
    else 
        QBCore.Functions.Notify("No vehicle to return", "error")
    end
end)