Framework = exports['qb-core']
Inventory = exports['lj-inventory']

Config = Config or {}

Config.ActivePayments = {}
Config.Items = {
label = "Weed Shop Items",
    slots = 2,
    items = {
        [1] = {
            name = "backwood",
            price = 8,
            amount = 1000,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "lighter",
            price = 2,
            amount = 1000,
            info = {},
            type = "item",
            slot = 2,
        },
    },
}