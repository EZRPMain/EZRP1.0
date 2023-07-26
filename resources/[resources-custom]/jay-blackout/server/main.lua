local QBCore = exports['qb-core']:GetCoreObject()

local started = not Config.Contract

RegisterServerEvent('jay-blackout:setBlackout', function(state)
    exports['qb-weathersync']:setBlackout(state)
    TriggerClientEvent("jay-blackout:setBlackout", -1, state)
    if state then
        if Config.Attack then
            exports['jay-attacks']:Spawn(source, "powerstation")
        end
    elseif not state then
        if Config.Contract then
            started = false
            exports['jay-contracts']:enableContract("powerstation")
        end
    end
end)

local timeout = false
local function SetTimeout()
    timeout = true
    local min = Config.Minutes * 60
    Citizen.SetTimeout(min * 1000, function()
        timeout = false
    end)
end

RegisterServerEvent('jay-blackout:setTimeout', function()
    SetTimeout()
end)

QBCore.Functions.CreateCallback('jay-blackout:getTimeout', function(source,cb)
    cb(timeout)
end)

AddEventHandler('explosionEvent', function(source, coords)
    local vector = vector3(coords.posX, coords.posY, coords.posZ)
    local distance = #(Config.BombSite - vector)
    if started and (distance < 3) then 
        TriggerClientEvent('jay-blackout:Explosions', source, vector)
    end
end)

-- Start Contract

if Config.Contract then
    RegisterNetEvent("jay-contracts:startContract", function(data)
        local source = source
        if data.contract == "powerstation" then
            started = true
            TriggerClientEvent("QBCore:Notify", source, "Contract Started")
            if Config.Patrol then
                exports['jay-patrols']:Spawn(source, 6, `s_m_m_security_01`, vector4(715.05615, 136.15304, 80.754486, 348.05642), 'miss_powerstation_walk')
                exports['jay-patrols']:Spawn(source, 6, `s_m_m_security_01`, vector4(711.28271, 150.90623, 80.754531, 262.78869), 'miss_powerstation_test')
                exports['jay-patrols']:Spawn(source, 6, `s_m_m_security_01`, vector4(726.00299, 146.55435, 80.754493, 128.40267), 'miss_powerstation_test_2')
            end
        end
    end)
end