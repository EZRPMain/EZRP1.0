local QBCore = exports['qb-core']:GetCoreObject()

-- Blackout Functions

local function Explosions()
    for i=1, #Config.ExplosionLocations do
        Wait(math.random(300,1500))
        AddExplosion(Config.ExplosionLocations[i], 29, 20.0, true, false, 2.5, true)
    end
    TriggerServerEvent('jay-blackout:setBlackout', true)
end

RegisterNetEvent('jay-blackout:Explosions', function(vector)
    local distance = #(Config.BombSite - vector)
    if distance < 3 then 
        Explosions()
    end
end)


local function GetTimeout()
    local p = promise.new()
    QBCore.Functions.TriggerCallback('jay-blackout:getTimeout', function(result)
        p:resolve(result)
    end)
    return Citizen.Await(p)
end


-- Blackout Handler

local state = false

RegisterNetEvent('qb-weathersync:client:SyncWeather', function(NewWeather, newblackout)
    state = newblackout
end)

-- Script Start

RegisterNetEvent('jay-blackout:setBlackout', function(value)
    if not value then
        if Config.PlaySound then
            PlaySoundFrontend(-1, "police_notification", "DLC_AS_VNT_Sounds", 1)
        end
        TriggerEvent('chatMessage', "LS Water & Power", "warning", "The power and electricity have both been restored. LS Water & Power thanks you for your patience.")
    else
        if Config.PlaySound then
                PlaySoundFrontend(-1, "Power_Down", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1)
        end
        TriggerEvent('chatMessage', "LS Water & Power", "warning", "City power is currently out, we're working on restoring it!")
    end
end)

exports['qb-target']:AddBoxZone("jay-blackout", vector3(712, 165.440, 80.754), 1.3, 0.35, {
	name = "jay-blackout",
	heading = 71.0,
	debugPoly = false,
}, {
	options = {
        {
			icon = "fa-solid fa-plug",
			label = "Restore Electricity",
            job = "police",
            action = function()
                local PlayerData = QBCore.Functions.GetPlayerData()
                if PlayerData.job ~= nil and PlayerData.job.type == "leo" then
                    if state then
                        local possible = GetTimeout()
                        if not possible then
                            exports['ps-ui']:Thermite(function(success)
                                if success then
                                    ClearPedTasksImmediately(PlayerPedId())    
                                    TriggerServerEvent('jay-blackout:setBlackout',false)
                                else
                                    ClearPedTasksImmediately(PlayerPedId()) 
                                    TriggerEvent('chatMessage', "SYSTEM", "warning", ("You Couldn't Restore Electricity. The System Is Restarting. The System Restart Will Take %s Minutes."):format(Config.Minutes))
                                    TriggerServerEvent('jay-blackout:setTimeout')
                                end
                            end, 10, 5, 3)
                        else
                            QBCore.Functions.Notify('Wait Before Trying Again!', 'error')
                        end
                    else
                        QBCore.Functions.Notify('Are you trying to cause a blackout?', 'error')
                    end
                end
            end,
            canInteract = function()
                return state
            end
		},
	},
	distance = 2.5
})

-- Contract Start
