Framework = exports['qb-core']
Manager = exports['ez-manager']
Config = Config or {}

Config.OldSync = false

Config.ActivateTime = 2000

Config.Tiers = {
    ["S"] = true,
    ["A"] = true,
}

Config.Notify = function(...)
    Framework:Notify(...)
end