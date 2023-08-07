local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    local Zone = Config.ClothingZones
    for i=1,#Zone do 
        local Current = Zone[i]
        print(i, Current)
        exports["ps-zones"]:CreateBoxZone("clothing_"..i, Current.coords, Current.length, Current.width, Current.data)
    end
end)

local openClothing = false

RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "clothing_") then
        exports['qb-core']:DrawText("[E]")

    end
end)

RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "clothing_") then
        exports['qb-core']:HideText()
    end
end)