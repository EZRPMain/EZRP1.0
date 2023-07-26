QBCore = {}
QBCore.Config = QBConfig
QBCore.Shared = QBShared
QBCore.ClientCallbacks = {}
QBCore.ServerCallbacks = {}

exports('GetCoreObject', function()
    return QBCore
end)

-- To use this export in a script instead of manifest method
-- Just put this line of code below at the very top of the script
-- local QBCore = exports['qb-core']:GetCoreObject()

-- Check if Module Exists
function DoesModuleExist(mod)
    if not QBCore[mod] then return false end
    return true
end
exports('DoesModuleExist', DoesModuleExist)

-- Create New Modules
function CreateModule(mod, table)
    print(GetInvokingResource())
    if DoesModuleExist(mod) then return false end
    QBCore[mod] = table
    return true
end

exports("CreateModule", CreateModule)

-- Get Module
function GetModule(mod)
    if not QBCore[mod] then return false end
    return QBCore[mod]
end
exports('GetModule', GetModule)

function LoadModule(mod)
    local mod = mod
    local result = false
    CreateThread(function()
        local tenSec = 0
        repeat
            tenSec = tenSec + 1
            Wait(1000)
        until DoesModuleExist(mod) or tenSec >= 10
        -- while not DoesModuleExist(mod) do
        --     Wait(1000)
        -- end
        result = GetModule(mod)
    end)
    return result
end
exports("LoadModule",LoadModule)
-- To use this export in a script instead of GetCoreObject method
-- Just put these lines of code below at the very top of the script
--[[
    local QBConfig = exports['qb-core']:LoadModule("Config")
    local QBShared = exports['qb-core']:LoadModule("Shared")
    local Player = exports['qb-core']:LoadModule("Player")
    local Functions = exports['qb-core']:LoadModule("Functions")
]]

-- Export added for all functions
-- Example:
--[[
    local QBCore = exports['qb-core']
]]