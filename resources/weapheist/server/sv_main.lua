local xSound = exports['xsound']
local QBCore = exports['qb-core']:GetCoreObject()
local heist = false
local inheist = false

RegisterNetEvent("weapheist:StartHeist", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        if not inheist[source] then
            if Player.Functions.RemoveMoney("cash", 15000) then
                inheist[source] = true
                TriggerClientEvent("weapheist:AddBlip", source)
            else
                TriggerClientEvent("QBCore:Notify", source, "You don't have enough money", 'error')
            end
        end
    end
end)

local pedcoords = {
    vector4(1112.5, -2140.1, 30.94, 260.59),
    vector4(1127.03, -2141.47, 30.87, 90.21),
    vector4(1128.77, -2169.86, 30.76, 85.72),
    vector4(1128.27, -2176.79, 30.74, 76.63),
    vector4(1126.62, -2206.51, 30.6, 254.47),
    vector4(1107.63, -2199.71, 30.7, 351.75),
    vector4(1107.24, -2201.36, 30.7, 174.78),
    vector4(1108.46, -2174.95, 30.93, 52.59),
    vector4(1102.0, -2158.28, 31.06, 205.73),
    vector4(1131.37, -2167.03, 30.84, 350.68),
    vector4(1127.76, -2206.92, 30.6, 171.75),
    vector4(1120.72, -2166.63, 31.85, 159.27),
    vector4(1119.84, -2168.48, 31.85, 270.55),
    vector4(1121.66, -2168.75, 31.85, 81.0),
    vector4(1119.96, -2177.47, 31.85, 346.89),
    vector4(1120.08, -2165.11, 30.77, 353.25),
    vector4(1117.6, -2197.5, 30.7, 175.17),
    vector4(1120.19, -2194.52, 30.71, 261.08),
    vector4(1110.66, -2162.79, 30.86, 280.75),
    vector4(1100.36, -2147.92, 31.32, 254.82),
    vector4(1113.33, -2139.76, 36.63, 52.05),
    vector4(1109.81, -2168.95, 36.35, 112.68),
}

local randomweapons = {
    `weapon_assaultrifle`,
    `weapon_compactrifle`,
    `weapon_pistol`,
    `weapon_pistol50`,
    `weapon_microsmg`,
    `weapon_machinepistol`,
    `weapon_pumpshotgun`,
    `weapon_gusenberg`,
}

local pedtypes = {
    `g_m_y_mexgang_01`,
    `g_m_y_mexgoon_01`,
    `g_m_y_mexgoon_02`,
    `g_m_y_mexgoon_03`,
    `a_m_y_mexthug_01`,
    `csb_ramp_mex`,
    `g_m_m_mexboss_02`,
}

local trolnetIds = {}
local moneytrol = {
    vector4(1119.86, -2178.59, 30.85, 358.33)
}

RegisterNetEvent("weapheist:SpawnHeist", function()
    local source = source
    if not heist and inheist[source] then
        heist = true
        local netIds = {}
        local netId
        local playerPed = GetPlayerPed(source)
        for i=1,#pedcoords do
            local ped = CreatePed(30, pedtypes[math.random(1,#pedtypes)], pedcoords[i].x, pedcoords[i].y, pedcoords[i].z, pedcoords[i].w, true, false)
            GiveWeaponToPed(ped, randomweapons[math.random(1,#randomweapons)], 250, false, true)
            SetPedArmour(ped, 100)
            TaskCombatPed(ped, playerPed, 0, 16)
            while not DoesEntityExist(ped) do Wait(25) end
            netId = NetworkGetNetworkIdFromEntity(ped)
            netIds[#netIds+1] = netId
        end

        local trolnetId
        for i=1,#moneytrol do
            local trol = CreateObject(`p_secret_weapon_02`, moneytrol[i].x, moneytrol[i].y, moneytrol[i].z, true, true, false)
            SetEntityHeading(trol, moneytrol[i].w)
            -- PlaceObjectOnGroundProperly(trol)
            while not DoesEntityExist(trol) do Wait(25) end
            trolnetId = NetworkGetNetworkIdFromEntity(trol)
            trolnetIds[#trolnetIds+1] = trolnetId
            
        end

        TriggerClientEvent("weapheist:spawnGang", source, netIds)
    end
end)

local looted = false
RegisterNetEvent("weapheist:loot", function(netid)
    local ped = GetPlayerPed(source)
    local coords = GetEntityCoords(ped)
    local dist = #(coords - vector3(1120.27, -2173.53, 31.85))
    if dist < 25 then
        if not looted then 
            looted = true
            local loot = {
                "weapon_assaultrifle",
                "weapon_compactrifle",
                "weapon_pistol",
                "weapon_pistol50",
                "weapon_microsmg",
                "weapon_machinepistol",
                "weapon_pumpshotgun",
                "weapon_gusenberg",
            }
            
            for i = 1,math.random(1,#loot) do
                local item = loot[math.random(1,#loot)]
                exports["lj-inventory"]:AddItem(source,item, 1)
                TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add', 1)
            end
        end
    end
end)