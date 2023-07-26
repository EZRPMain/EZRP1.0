-- local QBCore = exports['qb-core']:GetCoreObject()
local RadiusBlip = nil
local BlipLocation = nil

local weapheist = BoxZone:Create(vector3(1116.85, -2178.1, 38.24), 300, 300, {
    name="weapheist",
    heading=0,
    --debugPoly=true,
    minZ=29.44,
    maxZ=43.44
})

weapheist:onPlayerInOut(function(isPointInside)
    if isPointInside then
        -- exports['qb-core']:Notify("You are nearby the area")
        TriggerServerEvent("weapheist:SpawnHeist")
    else
        -- exports['qb-core']:Notify("")
    end
end)

RegisterNetEvent("weapheist:spawnGang", function(netIds)
    local PlayerData = exports['qb-core']:GetPlayerData()
    Wait(1000)
    for i = 1, #netIds, 1 do
        local guard = NetworkGetEntityFromNetworkId(netIds[i])
        SetPedDropsWeaponsWhenDead(guard, false)
        SetEntityHealth(guard, 200)
        SetCanAttackFriendly(guard, false, true)
        SetPedCombatAttributes(guard, 46, true)
        SetPedCombatAttributes(guard, 0, false)
        SetPedCombatAbility(guard, 100)
        SetPedAsCop(guard, true)
        SetPedRelationshipGroupHash(guard, `HATES_PLAYER`)
        SetPedAccuracy(guard, 60)
        SetPedFleeAttributes(guard, 0, 0)
        SetPedKeepTask(guard, true)
        SetBlockingOfNonTemporaryEvents(guard, true)
        TaskCombatPed(guard, ped, 0, 16)
    end
end)

--vector4(2641.66, 4235.43, 45.49, 213.2)
exports['qb-target']:SpawnPed({
    model = 'g_m_m_chicold_01',
    coords = vector4(2016.91, 4987.84, 42.1, 132.92),
    minusOne = true,
    freeze = true,
    invincible = true, 
    spawnNow = true,
    blockevents = true,
    target = {
        useModel = false,
        options = {
            {
                type = "client",
                icon = 'fas fa-circle',
                label = 'Talk',
                action = function(entity)
                    exports['qb-core']:Progressbar("talking_man", "Talking..", 10000, false, true, {
                        disableMovement = false,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() -- Done
                        TriggerServerEvent("weapheist:StartHeist")
                    end)
                end,
            }
        },
        distance = 2.5,
    },
})

exports['qb-target']:AddTargetModel(`p_secret_weapon_02`, {
    options = {
        {
            type = "client",
            icon = "fas fa-user-secret",
            label = "Loot",
            action = function(entity)
                print("netid", ObjToNet(entity))
                print("normal id", entity)
                exports['qb-core']:Progressbar("lotting_wh", "Looting..", 10000, false, true, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    RemoveBlip(RadiusBlip)
                    RemoveBlip(Blip)
                    TriggerServerEvent("weapheist:loot", ObjToNet(entity))
                end)
            end,
            canInteract = function(entity)
                local ped = PlayerPedId()
                local coord = GetEntityCoords(ped)
                local dist = #(coord - vector3(1120.27, -2173.53, 31.85))
                if dist < 25 then return true end
                return false
            end,
        },
    },
    distance = 2.5
})

RegisterNetEvent("weapheist:AddBlip", function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local dist = #(coords - vector3(2641.66, 4235.43, 45.49))
    if dist < 4 then 
        local cord = vector3(1116.85, -2178.1, 38.24)
        BlipLocation = vector3(cord.x + math.random(-40,40), cord.y + math.random(-40,40), cord.z)
        RadiusBlip = AddBlipForRadius(BlipLocation.x, BlipLocation.y, BlipLocation.z, 400.0)
        SetBlipColour(RadiusBlip, 1)
        SetBlipAlpha(RadiusBlip, 80)
    end
end)