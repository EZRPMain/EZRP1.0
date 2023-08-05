Framework = exports['qb-core']
Manager = exports['ez-manager']
Keybinds = exports['jay-interactions']
Inventory  = exports['lj-inventory']

Config = Config or {}

Config.Options = {
    {
        header = "Mask",
        txt = "2x Cloth",
        params = {
            event = "ez-knit:CreateClothe",
            args = {
                item = "mask",
                clothAmt = 2,
            }
        }
    },
}