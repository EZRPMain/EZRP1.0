Framework = exports['qb-core']
Manager = exports['ez-manager']
Keybinds = exports['jay-interactions']
Inventory  = exports['lj-inventory']

Config = Config or {}

Config.Peds = {
    [`mp_m_freemode_01`] = {
        ["mask"] = {
            defaultNoMask = 0, -- ??
        },
    },
    [`papag`] = {
        ["mask"] = {
            defaultNoMask = 4,
        },
    },
}

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
    {
        header = "Hat",
        txt = "1x Cloth",
        params = {
            event = "ez-knit:CreateClothe",
            args = {
                item = "hat",
                clothAmt = 1,
            }
        }
    },
}