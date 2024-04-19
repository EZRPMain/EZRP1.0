local CurrentWeather = Config.StartWeather
local lastWeather = CurrentWeather
local baseTime = Config.BaseTime
local timeOffset = Config.TimeOffset
local timer = 0
local freezeTime = Config.FreezeTime
local blackout = Config.Blackout
local blackoutVehicle = Config.BlackoutVehicle
local disable = Config.Disabled

-- Config.AvailableWeatherTypes = { -- DON'T TOUCH EXCEPT IF YOU KNOW WHAT YOU ARE DOING
--     'EXTRASUNNY',
--     'CLEAR',
--     'NEUTRAL',
--     'SMOG',
--     'FOGGY',
--     'OVERCAST',
--     'CLOUDS',
--     'CLEARING',
--     'RAIN',
--     'THUNDER',
--     'SNOW',
--     'BLIZZARD',
--     'SNOWLIGHT',
--     'XMAS',
--     'HALLOWEEN',
-- }

-- vector2(4916.67, 1134.85),
--  vector2(-3204.55, 5098.48),

local function IsInSandyShores(x, y, z)
	return x >= 4916 and y >= -1134 and x <= 3204 and y >= -5098
end

local function getWeatherZone(weather, x,y,z)

    if weather == "SMOG" or weather == "FOGGY" or weather == "OVERCAST" or weather == "CLOUDS" then
        print(IsInSandyShores(x,y,z))
        if IsInSandyShores(x,y,z) then
            return "SNOWLIGHT"
        end
    end

    return weather
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    disable = false
    TriggerServerEvent('qb-weathersync:server:RequestStateSync')
end)

RegisterNetEvent('qb-weathersync:client:EnableSync', function()
    disable = false
    TriggerServerEvent('qb-weathersync:server:RequestStateSync')
end)

RegisterNetEvent('qb-weathersync:client:DisableSync', function()
	disable = true
	CreateThread(function()
		while disable do
			SetRainLevel(0.0)
			SetWeatherTypePersist('CLEAR')
			SetWeatherTypeNow('CLEAR')
			SetWeatherTypeNowPersist('CLEAR')
			NetworkOverrideClockTime(18, 0, 0)
			Wait(5000)
		end
	end)
end)

RegisterNetEvent('qb-weathersync:client:DisableContainer', function()
	disable = true
	CreateThread(function()
		while disable do
			SetRainLevel(0.0)
			SetWeatherTypePersist('FOGGY')
			SetWeatherTypeNow('FOGGY')
			SetWeatherTypeNowPersist('FOGGY')
			NetworkOverrideClockTime(23, 0, 0)
			Wait(5000)
		end
	end)
end)

RegisterNetEvent('qb-weathersync:client:SyncWeather', function(NewWeather, newblackout)
    CurrentWeather = NewWeather
    blackout = newblackout
end)

RegisterNetEvent('qb-weathersync:client:SyncTime', function(base, offset, freeze)
    freezeTime = freeze
    timeOffset = offset
    baseTime = base
end)

CreateThread(function()
    while true do
        if not disable then 
            local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
            if lastWeather ~= CurrentWeather then
                lastWeather = CurrentWeather
                SetWeatherTypeOverTime(CurrentWeather, 15.0)
                Wait(15000)
            end
            Wait(100) -- Wait 0 seconds to prevent crashing.
            resetWeather = getWeatherZone(lastWeather, x,y,z)
            SetArtificialLightsState(blackout)
            SetArtificialLightsStateAffectsVehicles(blackoutVehicle)
            ClearOverrideWeather()
            ClearWeatherTypePersist()
            SetWeatherTypePersist(resetWeather)
            SetWeatherTypeNow(resetWeather)
            SetWeatherTypeNowPersist(resetWeather)
            if resetWeather == 'XMAS' then
                SetForceVehicleTrails(true)
                SetForcePedFootstepsTracks(true)
            else
                SetForceVehicleTrails(false)
                SetForcePedFootstepsTracks(false)
            end
            if resetWeather == 'RAIN' then
                SetRainLevel(0.3)
            elseif resetWeather == 'THUNDER' then
                SetRainLevel(0.5)
            else
                SetRainLevel(0.0)
            end
        else
            Wait(1000)
        end
    end
end)

CreateThread(function()
    local hour
    local minute = 0
    local second = 0        --Add seconds for shadow smoothness
    while true do
        if not disable then
            Wait(0)
            local newBaseTime = baseTime
            if GetGameTimer() - 22  > timer then    --Generate seconds in client side to avoid communiation
                second = second + 1                 --Minutes are sent from the server every 2 seconds to keep sync
                timer = GetGameTimer()
            end
            if freezeTime then
                timeOffset = timeOffset + baseTime - newBaseTime
                second = 0
            end
            baseTime = newBaseTime
            hour = math.floor(((baseTime+timeOffset)/60)%24)
            if minute ~= math.floor((baseTime+timeOffset)%60) then  --Reset seconds to 0 when new minute
                minute = math.floor((baseTime+timeOffset)%60)
                second = 0
            end
            NetworkOverrideClockTime(hour, minute, second)          --Send hour included seconds to network clock time
        else
            Wait(1000)
        end
    end
end)
