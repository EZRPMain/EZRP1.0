QBCore = {}
QBCore.PlayerData = {}
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

function DoesModuleExist(mod)
    if not QBCore[mod] then return false end
    return true
end
exports('DoesModuleExist', DoesModuleExist)

-- Create New Modules
function CreateModule(mod, func)
    print(GetInvokingResource())
    if DoesModuleExist(mod) then return false end
    QBCore[mod] = func
    return true
end

exports("CreateModule", CreateModule)

-- Get Module
function GetModule(mod)
    if not QBCore[mod] then return false end
    return QBCore[mod]
end
exports('GetModule', GetModule)

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