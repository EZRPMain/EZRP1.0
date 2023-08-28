-- Variables
local MenuItemId = nil
local currentStorage = nil

-- Key Events
RegisterNetEvent("scuff-fix", function()
    TriggerServerEvent("ez-storage:scuffFix")
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
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

CreateThread(function()
    exports['qb-target']:AddBoxZone("ez_storage_checkava", vector3(-1718.359, -747.119, 10.39), 1.3, 1.0, {
        name = "ez_storage_checkava",
        heading = 45.0,
        debugPoly = false,
        minZ = 9.44,
        maxZ = 11.34,
    }, {
        options = { 
            { 
                num = 1,
                type = "server",
                event = "ez-storage:CheckAva",
                icon = 'fas fa-circle',
                label = 'Storange Rental',
                -- action = function(entity)
                --     if IsPedAPlayer(entity) then return false end
                --     TriggerEvent('testing:event', 'test')
                -- end
            }
        },
        distance = 2.5,
    })
end)

RegisterNetEvent("ez-storage:openBuyMenu", function(data)
    local garage = data.name
    local PD = Framework:GetPlayerData()
    local menuData = {}
    if Shared.Storages[garage].owner then 
        if Shared.Storages[garage].owner == PD.citizenid then 
            menuData = {
                {
                    header = "Manage Storage Rental",
                    isMenuHeader = true,
                },
                {
                    header = "More Time",
                    txt = "Rent more time to have the storage rental for",
                    params = {
                        event = "ez-storage:openTimeDialog",
                        args = {
                            name = garage,
                            isAdd = true,
                        }
                    }
                },
                {
                    header = "Key Holders",
                    txt = "View Access",
                    params = {
                        event = "ez-storage:keyHolders",
                        args = {
                            name = garage,
                        }
                    }
                },
            }
        end
    else
        menuData = {
            {
                header = "Buy Storage Rental",
                isMenuHeader = true,
            },
            {
                header = "Rent",
                txt = "Select amount of time to rent for",
                params = {
                    event = "ez-storage:openTimeDialog",
                    args = {
                        name = garage,
                    }
                }
            },
        }
    end
    exports['qb-menu']:openMenu(menuData)
end)

RegisterNetEvent("ez-storage:openTimeDialog", function(data)
    local garage = data.name
    local isAdd = data.isAdd or false
    local dialog = exports['qb-input']:ShowInput({
        header = "Storage Rental",
        submitText = "Confirm",
        inputs = {
            {
                text = "Add Time",
                name = "timeadd",
                type = "select",
                options = {
                    { value = "oneweek", text = ("1 Week ($%s)"):format(Shared.RentUtil["oneweek"].price) },
                    { value = "twoweek", text = ("2 Weeks ($%s)"):format(Shared.RentUtil["twoweek"].price) },
                    { value = "threeweek", text = ("3 Weeks ($%s)"):format(Shared.RentUtil["threeweek"].price) },
                },
                -- default = 'other3', -- Default select option, must match a value from above, this is optional
            }
        },
    })

    if dialog ~= nil then
        TriggerServerEvent("ez-storage:rentCheck", garage, dialog.timeadd, isAdd)
        -- if data.isAdd then 
        --     print(dialog.timeadd)
        -- else
        --     print(dialog.timeadd)
        -- end
    end

end)

RegisterNetEvent("ez-storage:syncOwners", function(cid, garage)
    Shared.Storages[garage].owner = cid
end)

RegisterNetEvent("ez-storage:keyHolders", function(data)
    local garage = data.name
    TriggerServerEvent("ez-storage:keyHolders_sv", garage)
  
end)

RegisterNetEvent("ez-storage:AddPlayerDialog", function(data)

    local garage = data.name
    local dialog = exports['qb-input']:ShowInput({
        header = "Test",
        submitText = "Bill",
        inputs = {
            {
                text = "Citizen ID (#)", -- text you want to be displayed as a place holder
                name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true, -- Optional [accepted values: true | false] but will submit the form if no value is inputted
                -- default = "CID-1234", -- Default text option, this is optional
            },
           
        },
    })

    if dialog ~= nil then
        for k,v in pairs(dialog) do
            print(k .. " : " .. v)
        end
    end
end)