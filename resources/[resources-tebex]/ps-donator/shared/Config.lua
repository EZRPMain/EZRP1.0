Config = {}

Config.NPC = vector4(-267.8178, 234.80221, 90.574722, 357.7358) -- Location for the NPC to spawn.
Config.Model = "cs_fbisuit_01" -- NPC Model.
Config.VehicleSpawn = vector4(-295.2362, 239.13369, 87.983985, 346.55218) -- Location for car to spawn.
Config.Garage = "apartments" -- Default garage for the car to be tagged too.


Config.CoinShop = {
    [1] = {
        type = "item", -- Item/Car
        name = "crate_common", -- Name of Item.
        amount = 1, -- amount of items to give.
        cost = 10, -- Coin Cost to purchase item.
        header = "Buy Crate", -- Header Text.
        text = "Buy Normal Crate for 10 coins.", -- Sub Text.
    },
    [2] = {
        type = "item", -- Item/Car
        name = "crate_rare", -- Name of Item.
        amount = 1, -- amount of items to give.
        cost = 50, -- Coin Cost to purchase item.
        header = "Buy Crate", -- Header Text.
        text = "Buy Rare Crate for 50 coins.", -- Sub Text
    },
    [3] = {
        type = "item", -- Item/Car
        name = "crate_car", -- Name of Item.
        amount = 1, -- amount of items to give.
        cost = 100, -- Coin Cost to purchase item.
        header = "Buy Crate", -- Header Text.
        text = "Buy Car Crate for 100 coins.", -- Sub Text
    },
    [4] = {
        type = "car", -- Item/Car
        name = "baller6", -- Name of Item.
        amount = 1, -- amount of items to give.
        cost = 150, -- Coin Cost to purchase item.
        header = "Buy Armored Baller", -- Header Text.
        text = "Buy a Armored Baller for 50 coins.", -- Sub Text
    },
}

-- EXAMPLE
-- Config.CoinShop = {
--     [1] = {
--         type = "item", -- Item/Car
--         name = "weapon_pistol", -- Name of Item.
--         amount = 1, -- amount of items to give.
--         cost = 1, -- Coin Cost to purchase item.
--         header = "Buy Pistol", -- Header Text.
--         text = "Buy pistol for 1 coin.", -- Sub Text.
--     },
--     [2] = {
--         type = "car", -- Item/Car
--         name = "sultan", -- Model of the vehicle to spawn.
--         cost = 1, -- Coin Cost to purchase item.
--         header = "Buy Sultan", -- Header Text.
--         text = "Buy a Sultan for 1 coin.", -- Sub Text.
--     },
-- }


--Purchase 50 In-game store credits
Config.Packages = {
    ["10 Coins"] = 10,      -- $2
    ["50 Coins"] = 50,      -- $8
    ["100 Coins"] = 100,    -- $14
    ["250 Coins"] = 250,    -- $32
    ["500 Coins"] = 500,    -- $60
    ["750 Coins"] = 750,    -- $85
    ["1000 Coins"] = 1000,  -- $105
}