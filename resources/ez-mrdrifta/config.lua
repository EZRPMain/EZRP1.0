Framework = exports['qb-core']
Manager = exports['ez-manager']
Keybinds = exports['jay-interactions']
Inventory  = exports['lj-inventory']

Config = Config or {}

Config.Item = "driftchip"

Config.UseItem = true
Config.Keybind = {
    UseBind = true,
    RequireItem = false,
}

Config.OldSync = false

Config.ActivateTime = 2000

Config.Tiers = {
    ["S"] = true,
    ["A"] = true,
}
