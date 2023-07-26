-- QBCORE Variables
local QBCore = exports['qb-core']:GetCoreObject()
local stashes = {}

-- state bags

-- AddStateBagChangeHandler('treasureboxes', ('player:%s'):format(GetPlayerServerId(PlayerId())), function(bagName, key, value)
AddStateBagChangeHandler('treasureboxes', nil, function(bagName, key, value)
    print(bagName, key, value)
    stashes = value --?
end)


-- functions

local holdingMetal = false
local prop = nil

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(1)
    end
end

local function LoadPropDict(model)
    while not HasModelLoaded(GetHashKey(model)) do
        RequestModel(GetHashKey(model))
        Wait(10)
    end
end

local function AddPropToPlayerAndAnim(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
    loadAnimDict("amb@world_human_mobile_film_shocking@female@base")
    local Player = PlayerPedId()
    local x,y,z = table.unpack(GetEntityCoords(Player))
    if not HasModelLoaded(prop1) then
        LoadPropDict(prop1)
    end
    prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, true)
    AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
    SetModelAsNoLongerNeeded(prop1)
    TaskPlayAnim(Player, "amb@world_human_mobile_film_shocking@female@base", "base", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end


-- evenets

-- metal detector
RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    if holdingMetal then
        local _hasMetal = false
        for _, item in pairs(val.items) do
            if item.name == Config.MetalDetector then
                _hasMetal = true
                break
            end
        end
        if not _hasMetal then
            holdingMetal = false
            ClearPedTasksImmediately(PlayerPedId())
        end
    end
end)

RegisterNetEvent("ps-treasureboxes:client:useMetal", function()
    if not holdingMetal then
        holdingMetal = true
        CreateThread(function()
            while holdingMetal do
                Wait(1000) 
                if not IsEntityPlayingAnim(PlayerPedId(),"amb@world_human_mobile_film_shocking@female@base", "base", 3) and holdingMetal then
                    holdingMetal = false
                    ClearPedTasksImmediately(PlayerPedId())
                    DeleteEntity(prop)
                end
            end
        end)
        AddPropToPlayerAndAnim("prop_megaphone_01", 28422, 0.0, 0.0, 0.0, 0.0, 0.0, 80.0)
    else
        holdingMetal = false
        ClearPedTasksImmediately(PlayerPedId())
        DeleteEntity(prop)
    end
end)

RegisterNetEvent("ps-treasureboxes:client:placeStash", function(data)
    print(data)
end)