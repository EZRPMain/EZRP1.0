-- Key Events
RegisterNetEvent("scuff-fix", function()
    TriggerServerEvent("fuckthis")
end)


RegisterNetEvent("ez-storage:loadKeys", function(storageName, cid)
    if type(cid) ~= "table" then
        print("ERROR: need to be a table to do this")
        return
    end
    Shared.Storages[storageName].hasKeys = cid
end)


-- Zoning
CreateThread(function()
    for name, poly in pairs(Shared.Storages) do
        exports["ps-zones"]:CreateBoxZone("storage_"..name, poly.coords, poly.length, poly.width, poly.data)
    end
end)

RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "storage_") then
        print(ZoneName, ZoneData.name)
    end
end)

RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "storage_") then
        
    end
end)