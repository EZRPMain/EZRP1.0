-- Variables
local MenuItemId = nil
local currentStorage = nil

-- Key Events
RegisterNetEvent("scuff-fix", function()
    TriggerServerEvent("ez-storage:scuffFix")
end)


RegisterNetEvent("ez-storage:loadKeys", function(storageName, cid)
    if type(cid) ~= "table" then
        print("ERROR: need to be a table to do this")
        return
    end
    Shared.Storages[storageName].hasKeys = cid
    print(json.encode(Shared.Storages[storageName].hasKeys))
end)


-- Zoning
CreateThread(function()
    for name, poly in pairs(Shared.Storages) do
        exports["ps-zones"]:CreateBoxZone("storage_"..name, poly.coords, poly.length, poly.width, poly.data)
    end
end)

RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "storage_") then
        local newName = ZoneName:gsub("storage_", "")
        local PD = Framework:GetPlayerData()
        local cid = PD.citizenid
        print(newName, cid)
        currentStorage = newName
        if Shared.Storages[newName].hasKeys[cid] then
            
            MenuItemId = Radial:AddOption({
                id = 'ezrp_storage',
                title = 'Storage Interactions',
                icon = 'warehouse',
                type = 'client',
                items = {
                    {
                        id = 'togglegaragelock',
                        title = 'Toggle Garage Lock',
                        icon = 'warehouse',
                        type = 'client',
                        event = 'ez-storage:garageDoor',
                        shouldClose = true
                    },
                    -- {
                    --     id = 'addstash',
                    --     title = 'Add Stash',
                    --     icon = 'box',
                    --     type = 'client',
                    --     event = 'ez-storage:addStashRM',
                    --     shouldClose = true
                    -- },
                },
                shouldClose = false
            }, MenuItemId)
        end

    end
end)

local garagetogglestate = true
RegisterNetEvent("ez-storage:garageDoor", function()
    local house = currentStorage
    if house then
        PlaySoundFrontend(-1, "Enter_On_Foot", "GTAO_ImpExp_Enter_Exit_Garage_Sounds", 1)
        garagetogglestate = not garagetogglestate
        TriggerServerEvent('qb-doorlock:server:updateState', Shared.Storages[house].door, garagetogglestate, false, false, true, false, false)
    end
end)

RegisterNetEvent("ez-storage:openAccessMenu", function()
    print("[W.I.P] MOTHER FUCKER")
end)

RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "storage_") then
        if MenuItemId ~= nil then
            Radial:RemoveOption(MenuItemId)
            MenuItemId = nil
        end
    end
end)