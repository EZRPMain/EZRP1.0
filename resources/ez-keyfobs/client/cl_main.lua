CreateThread(function()
    for k, v in pairs(Shared.Zones) do
        exports["ps-zones"]:CreateBoxZone("keyfobs_"..v.name, v.coords, v.length, v.width, v.data)
    end
end)

local eventHandler = nil

local MenuItemId = nil

local doorLockStates = {}

local jobType = nil
local PlayerData = nil
local doorlock = nil

RegisterNetEvent("ez-keyfobs:garageDoor", function()
    TriggerEvent("keyfobs", PlayerData, doorlock, jobType)
end)

RegisterCommand("+keyfobs", function()
    TriggerEvent("keyfobs", PlayerData, doorlock, jobType)
end)
RegisterCommand("-keyfobs", function()

end)
Keybinds:AddKeyMapping("Doorlock", "+keyfobs", "-keyfobs", "Keyfobs")

RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "keyfobs_") then
        if eventHandler then 
            eventHandler = RemoveEventHandler(eventHandler)
        end
        PlayerData = Framework:GetPlayerData()
        doorlock = ZoneData.doorlock
        if not doorLockStates[doorlock] then 
            doorLockStates[doorlock] = true
        end

        jobType = ZoneData.jobType

        if jobType == PlayerData.job.type then
            MenuItemId = Radial:AddOption({
                id = 'ezrp_keyfobs',
                title = 'Key Fob',
                icon = 'key',
                type = 'client',
                event = 'ez-keyfobs:garageDoor',
                shouldClose = true,
            }, MenuItemId)
            eventHandler = AddEventHandler("keyfobs", function(PlayerData, doorlock, jobType)
                -- print("test3")
                -- eventHandler = RemoveEventHandler(eventHandler)
                local PlayerData = PlayerData
                local doorlock = doorlock
                -- print("test2")
                local jobType = jobType
                -- print(jobType, PlayerData.job.type)
                if jobType == PlayerData.job.type then
                    -- print("test")
                    doorLockStates[doorlock] = not doorLockStates[doorlock]
                    PlaySoundFrontend(-1, "Enter_On_Foot", "GTAO_ImpExp_Enter_Exit_Garage_Sounds", 1)
                    TriggerServerEvent('qb-doorlock:server:updateState', doorlock, doorLockStates[doorlock], false, false, true, false, false)
                end
            end)
        end
    end
end)

RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "keyfobs_") then
        if eventHandler then 
            eventHandler = RemoveEventHandler(eventHandler)
        end
        if MenuItemId ~= nil then
            Radial:RemoveOption(MenuItemId)
            MenuItemId = nil
        end
    end
end)