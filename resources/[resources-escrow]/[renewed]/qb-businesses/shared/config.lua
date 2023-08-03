Config = {}

Config.debugPoly = false ---- ** Will Debug every single business
Config.Debug = false -- Turns to true and it will enable f8 prints to debug issues with Ingredients
Config.FileDict = "lj-inventory/html/"

---- ** Types of products for food ** ----
-- Oil
-- Protein
-- Vegetables
-- Leavening
-- Diary
-- Grain
-- Seasoning
-- Sugar

Config.WashCounter = 15 -- How much food can they make before their hands get dirty
Config.ZoneDuty = true -- This will automatically make an employee go on duty when they enter the zone and off duty when they leave the zone

Config.LimitChecks = 3 -- How many times does the Config.Limits have to be passed before getting a buff
Config.Limits = 25 -- How many Value points should a product type have before it affects diet? Default 25

Config.EnableRegister = true -- Enable or disable cash registers for payment systems
Config.EnableCommission = true -- Enable or disable commission for sales
Config.PlayerCommission = 5 -- % of the total sale the player recieves as commission

Config.Society = "Renewed-Banking" -- qb-managment or qb-bossmenu or simplebanking or Renewed-Banking
Config.UseQBManagement = false -- Set to TRUE if you are using qb-management as it will give the manager menu more options

Config.Menu = "qb-menu" -- Change this if you renamed qb-menu or use a different menu that is compatible with qb-menu
Config.Input = "qb-input" -- Change this if you renamed qb-input or use a different input that is compatible with qb-input
Config.Core = "qb-core" -- Change this if you use a renamed core MUST be up to date with latest qb-core

Config.MaxActiveRecipes = 4 -- How many recipes can the player have active at the same time

Config.EnableBuffs = true -- Whether or not you want buff active for food and water (MUST USE PS HUD AND PS BUFFS)

Config.SitBuff = true -- If you want people to get better buffs and food/water when sitting down
Config.SitTimer = 0 -- How long should the player sit down for to get the buff (seconds)
Config.SitEffectHunger = true -- Weather or not sitting should only effect buffs and NOT hunger
Config.SitEffectWater = true -- Weather or not sitting should only effect buffs and NOT water
Config.SitBuffPercent = 1.25 -- How much should the buff be increased by NORMAL 1.25 WHICH MEANS 25% MORE BUFFS AND FOOD AND WATER if enabled


Config.IngredientsSpam = true -- Makes it so spamming the same ingredient in a recipe will make x ingredient worse
Config.IngredientSpamLimit = 3 -- How many times can you spam the same ingredient before it gets worse

Config.TimeToCook = {
    ["drinks"] = 5000,
    ["main"] = 5000,
    ["side"] = 5000,
    ["dessert"] = 5000,
}

Config.Ingredients = { -- Value = food points that it replenish,  sugarAmt is used for buffs etc too much sugar bad right amount speed buff etc.
    ["Main"] = {
        -- Read server/foodbuffs, to see when these gets triggered.

        -- Currently supports the following types for doing buffs (requires ps-buffs), and their hud made by Silent#2021
        -- healthy // BUFF, $ makes it so you can make more $ when consuming healthy food
        -- dairy // BUFF, destresses you when consuming dairy
        -- protein // Buff, more inventory space after consuming protein ** // Not implemented yet as this requires inventory edits.
        -- grain // BUFF, makes it so your food dont deteriate that quick.
        -- seasoning // BUFF, $ makes it so you can make more $ when consuming flavourfull food
        -- sugar // BUFF, makes it so you run faster for a limited time period.
        -- Super foods // Makes hacking easier for a small period of time

        -- RP Buffs, makes it so buffs last longer by being arround businesses you dont own.



        -- Also ordered all the secondary values in number order that way you can change it however you'd like.
        ---- ALL THE HEALTHY FOOD ----
        ["apples"]          = {       name = "apples",          Value = 4,       healthyAmt = 4},
        ["pineapple"]       = {       name = "pineapple",       Value = 4,       healthyAmt = 4},
        ["lettuce"]         = {       name = "lettuce",         Value = 3,       healthyAmt = 4},
        ["pumpkin"]         = {       name = "pumpkin",         Value = 5,       healthyAmt = 4},
        ["blueberry"]       = {       name = "blueberry",       Value = 3,       healthyAmt = 3},
        ["tomato"]          = {       name = "tomato",          Value = 3,       healthyAmt = 3},
        ["basil"]           = {       name = "basil",           Value = 4,       healthyAmt = 2},
        ["pickle"]          = {       name = "pickle",          Value = 3,       healthyAmt = 2},
        ["orange"]          = {       name = "orange",          Value = 3,       healthyAmt = 2},
        ["slicedpotato"]    = {       name = "slicedpotato",    Value = 3,       healthyAmt = 2},
        ["slicedonion"]     = {       name = "slicedonion",     Value = 3,       healthyAmt = 1},


        ---- ALL THE DAIRY PRODUCTS ----
        ["icecream"]        = {       name = "icecream",        Value = 4,       dairyAmt = 3},
        ["milk"]            = {       name = "milk",            Value = 4,       dairyAmt = 3},
        ["cheddar"]         = {       name = "cheddar",         Value = 4,       dairyAmt = 3},
        ["mozz"]            = {       name = "mozz",            Value = 4,       dairyAmt = 3},
        ["cream"]           = {       name = "cream",           Value = 3,       dairyAmt = 2},


        ---- ALL THE PROTEIN PRODUCTS ----
        ["beef"]            = {       name = "beef",            Value = 7,       proteinAmt = 4},
        ["salami"]          = {       name = "salami",          Value = 8,       proteinAmt = 4},
        ["packagedchicken"] = {       name = "packagedchicken", Value = 7,       proteinAmt = 4},
        ["wholeham"]        = {       name = "wholeham",        Value = 8,       proteinAmt = 3},
        ["tofu"]            = {       name = "tofu",            Value = 9,       proteinAmt = 3},
        ["fish"]            = {       name = "fish",            Value = 8,       proteinAmt = 2},
        ["peperoni"]        = {       name = "peperoni",        Value = 8,       proteinAmt = 1},

        ---- ALL THE GRAIN PRODUCTS ----
        ["flour"]           = {       name = "flour",           Value = 3,       grainAmt = 4},
        ["noodles"]         = {       name = "noodles",         Value = 5,       grainAmt = 3},
        ["pasta"]           = {       name = "pasta",           Value = 5,       grainAmt = 3},

        ---- ALL THE SEASONING ----
        ["flavouring"]      = {       name = "flavouring",      Value = 1,       falvouringAmt = 5}, -- Pack of flavouring

        ---- ALL THE SUGAR // HUNHEALTHY STUFF ----
        ["sugar"]           = {       name = "sugar",           Value = 3,       sugarAmt = 10},
        ["chocolate"]       = {       name = "chocolate",       Value = 2,       sugarAmt = 6},
        ["ketchup"]         = {       name = "ketchup",         Value = 2,       sugarAmt = 4},
        ["crisps"]          = {       name = "crisps",          Value = 2,       sugarAmt = 3},
        ["nachos"]          = {       name = "nachos",          Value = 3,       sugarAmt = 3},



        ---- ALL THE OTHER STUFF THAT HAS NO BUFF EFFECTS ----
        ["boba"]            = {       name = "boba",            Value = 3},
        ["coffeebean"]      = {       name = "coffeebean",      Value = 4},
        ["eggs"]            = {       name = "eggs",            Value = 5},
        ["frozennugget"]    = {       name = "frozennugget",    Value = 4},
        ["granola"]         = {       name = "granola",         Value = 4},
        ["mint"]            = {       name = "mint",            Value = 3},
        ["nori"]            = {       name = "nori",            Value = 5},
        ["rice"]            = {       name = "rice",            Value = 3},
        ["rose_oil"]        = {       name = "rose_oil",        Value = 1},
        ["rum"]             = {       name = "rum",             Value = 5},
        ["sauce"]           = {       name = "sauce",           Value = 1},
        ["yeast"]           = {       name = "yeast",           Value = 3},


                --["pizzadough"]      = {       name = "pizzadough",      Value = 5,       sugarAmt = 3},
        [42]                = {       name = "none",            Value = 0},
    },

    ["Drinks"] = {
        ["vodka"]                = {       name = "vodka",           Value = 6,      sugarAmt = 2,       alcoholAmt = 3},
        ["curaco"]               = {       name = "curaco",          Value = 6,      sugarAmt = 2,       alcoholAmt = 2},
        ["schnapps"]             = {       name = "schnapps",        Value = 7,      sugarAmt = 3,       alcoholAmt = 2},
        ["gin"]                  = {       name = "gin",             Value = 5,      sugarAmt = 3,       alcoholAmt = 2},
        ["scotch"]               = {       name = "scotch",          Value = 6,      sugarAmt = 3,       alcoholAmt = 2},
        ["rum"]                  = {       name = "rum",             Value = 5,      sugarAmt = 3,       alcoholAmt = 2},
        ["amaretto"]             = {       name = "amaretto",        Value = 5,      sugarAmt = 3,       alcoholAmt = 2},
        ["icream"]               = {       name = "icream",          Value = 6,      sugarAmt = 5},
        ["cranberry"]            = {       name = "cranberry",       Value = 2,      sugarAmt = 2},
        ["strawberry"]           = {       name = "strawberry",      Value = 4,      sugarAmt = 2},
        ["apples"]               = {       name = "apples",          Value = 4,      sugarAmt = 2},
        ["pineapple"]            = {       name = "pineapple",       Value = 5,      sugarAmt = 2},
        ["blueberry"]            = {       name = "blueberry",       Value = 3,      sugarAmt = 2},
        ["orange"]               = {       name = "orange",          Value = 3,      sugarAmt = 2},
        ['water_bottle']         = {       name = "water_bottle",    Value = 12},
        ['coffeebean']           = {       name = "coffeebean",      Value = 5},
        ['milk']                 = {       name = "milk",            Value = 7},
        ['cream']                = {       name = "cream",           Value = 5},
        ['icecream']             = {       name = "icecream",        Value = 5},

        ['none']                 = {       name = "none",            Value = 0},
    },

    ["EmotesF"] = { -- all the EATING emotes
        "donut",
        "burger",
        "sandwich",
        "egobar",
    },

    ["EmotesD"] = { -- all the DRINKING emotes
        "coffee",
        "whiskey",
        "beer",
        "cup",
        "soda",
        "wine",
        "flute",
        "champagne",
    },
}

Config.Blips = { -- https://wiki.rage.mp/index.php?title=Blips
    [1] = {
        label = "Vanilla Unicorn", -- Blip name
        coords = vector3(127.25, -1296.62, 29.27), -- Blip location
        blip = 121, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 40 -- Blip color
    },
    [2] = {
        label = "Burgershot", -- Blip name
        coords = vector3(-1190.31, -888.4, 13.97), -- Blip location
        blip = 106, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 5 -- Blip color
    },
    [3] = {
        label = "Pops Diner", -- Blip name
        coords = vector3(1587.9038, 6457.25, 26.013969), -- Blip location
        blip = 267, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 3 -- Blip color
    },
    [4] = {
        label = "Yellow Jack", -- Blip name
        coords = vector3(1982.5886, 3050.2868, 47.214988), -- Blip location
        blip = 311, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 5 -- Blip color
    },
    [5] = {
        label = "Taco", -- Blip name
        coords = vector3(14.031192, -1602.21, 29.37544), -- Blip location
        blip = 79, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 2 -- Blip color
    },
}

Config.BusinessManager = {
    ["burgershot"] = {
        coords = vector3(vector3(-1200.53, -902.65, 13.89)), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 1.00, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["burgershot"] = 3}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    },

    ["vu"] = {
        coords = vector3(95.76, -1293.15, 29.07), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.56, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["vu"] = 3}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    },

    ["tequilala"] = {
        coords = vector3(-562.91, 279.02, 83.3), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.56, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["tequilala"] = 3}, -- Which job and grade should have access to change and access menu?
        type = {Food = false, Drink = true} -- Type of items the business is authorized to sell
    },

    ["popsdiner"] = {
        coords = vector3(1595.33, 6455.4, 25.91), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.56, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["popsdiner"] = 3}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    },
    ["yellowjack"] = {
        coords = vector3(1983.098, 3051.119, 47.215), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.56, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["yellowjack"] = 4, ["yellowjack"] = 3}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    },
    ["taco"] = {
        coords = vector3(8.192, -1607.272, 29.671), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.56, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["taco"] = 3, ["taco"] = 2}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    }
}

Config.DUI = {
    ["popsdiner"] = { -- Match this with business zone and job name (Case Sensitive!)
        [1] = { -- UwU Café paintings
            coords = vector3(1589.26, 6458.5, 26.85), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 1.2,
            ytd = 'gabz_diner_mtxdict', -- This has to be the Dictionsiary YTD File t_m_catcafe_imageatlas02
            ytdname = "Gabz_diner_menuboard_base_A", -- This will be the name of the object INSIDE the YTD File
            width = 1024, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 1024, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 1, -- This is the ID of the shop, has to be unique
            job = {["popsdiner"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },
    },

    ["burgershot"] = { -- Match this with business zone and job name (Case Sensitive!)
        [1] = { -- UwU Café paintings
            coords = vector3(-1193.86, -898.55, 15.29), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 1.5,
            ytd = 'gn_burgershot_graphi', -- This has to be the Dictionsiary YTD File gn_burgershot_graphi
            ytdname = "gn_tv_screen_b", -- This will be the name of the object INSIDE the YTD File
            width = 1024, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 1024, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 1, -- This is the ID of the shop, has to be unique
            job = {["burgershot"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },
        [2] = { -- UwU Café paintings
            coords = vector3(-1194.84, -897.2, 15.29), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 1.5,
            ytd = 'gn_burgershot_graphi', -- This has to be the Dictionsiary YTD File gn_burgershot_graphi
            ytdname = "gn_tv_screen_scrolling", -- This will be the name of the object INSIDE the YTD File
            width = 1024, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 1024, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 2, -- This is the ID of the shop, has to be unique
            job = {["burgershot"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },
        [3] = { -- UwU Café paintings
            coords = vector3(-1195.97, -895.84, 15.45), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 1.5,
            ytd = 'gn_burgershot_graphi', -- This has to be the Dictionsiary YTD File gn_burgershot_graphi
            ytdname = "gn_tv_screen_c", -- This will be the name of the object INSIDE the YTD File
            width = 1024, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 1024, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 3, -- This is the ID of the shop, has to be unique
            job = {["burgershot"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },
        [4] = { -- UwU Café paintings
            coords = vector3(-1196.7, -894.44, 15.47), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 1.5,
            ytd = 'gn_burgershot_graphi', -- This has to be the Dictionsiary YTD File gn_burgershot_graphi
            ytdname = "gn_tv_screen_d", -- This will be the name of the object INSIDE the YTD File
            width = 1024, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 1024, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 4, -- This is the ID of the shop, has to be unique
            job = {["burgershot"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },
    },
}

Config.Stations = {
    ["burgershot"] = {
        ["Grill"] = { coords = vector3(-1195.82, -897.38, 13.89), pSize = 0.60, name = "Grill", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "bbq" },
        ["Grill2"] = { coords = vector3(-1194.95, -897.59, 13.89), pSize = 0.60, name = "Grill", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "bbq" },
        ["Frier"] = { coords = vector3(-1196.16, -900.04, 13.89), pSize = 0.70, name = "Frier", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "uncuff" },
        ["Assembly Line"] = { coords = vector3(-1201.3, -895.15, 13.89), pSize = 0.5, name = "Assembly Line", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Drinks"] = { coords = vector3(-1190.74, -899.1, 13.89), pSize = 0.5, name = "Drinks", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
    },

    ["vu"] = {
        ["Snacks"] = { coords = vector3(131.1, -1282.84, 29.33), pSize = 0.60, name = "Snacks", job = { ["vu"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Drinks"] = { coords = vector3(128.38, -1282.94, 29.31), pSize = 0.60, name = "Drinks", job = { ["vu"] = 0}, icon = "fa-solid fa-circle", emote = "dispenser" },

        ["Stove"] = { coords = vector3(136.53, -1287.77, 29.17), pSize = 0.60, name = "Stove", job = { ["vu"] = 0}, icon = "fa-solid fa-circle", emote = "bbq" },
       -- vector3(135.902, -1286.741, 29.269) --[vector4(135.902, -1286.741, 29.269, 300.0)]--
        ["Frier"] = { coords = vector3(135.902, -1286.741, 29.269), pSize = 0.60, name = "Frier", job = { ["vu"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
    },

    ["tequilala"] = {
        ["Drinks"] = { coords = vector3(-560.91, 288.11, 82.27), pSize = 0.52, name = "Drinks", job = { ["tequilala"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Drinks2"] = { coords = vector3(-561.24, 285.4, 82.43), pSize = 0.52, name = "Drinks", job = { ["tequilala"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
    },

    ["popsdiner"] = {
        ["coffee"] = { coords = vector3(1592.29, 6456.87, 26.21), pSize = 0.52, name = "Coffee", job = { ["popsdiner"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Stove Prep"] = { coords = vector3(1587.76, 6459.22, 26.14), pSize = 0.52, name = "Stove Prep", job = { ["popsdiner"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Drinks"] = { coords = vector3(1586.13, 6459.93, 26.49), pSize = 0.52, name = "Drinks", job = { ["popsdiner"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Slushee"] = { coords = vector3(1585.3, 6460.16, 26.3), pSize = 0.52, name = "Slushee", job = { ["popsdiner"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Slushee2"] = { coords = vector3(1594.21, 6456.0, 26.3), pSize = 0.52, name = "Slushee", job = { ["popsdiner"] = 0 }, icon = "fa-solid fa-circle", emote = "mechanic4" },
    },

    --
    ["yellowjack"] = {
        ["Stove"] = { coords = vector3(1984.439, 3050.298, 47.285), pSize = 0.60, name = "Stove", job = { ["yellowjack"] = 0}, icon = "fa-solid fa-circle", emote = "bbq" },
        --vector3(1981.423, 3052.945, 47.285) --[vector4(1981.423, 3052.945, 47.285, 333.5)]--
        ["Drinks"] = { coords = vector3(1981.423, 3052.945, 47.285), pSize = 0.52, name = "Drinks", job = { ["yellowjack"] = 0 }, icon = "fa-solid fa-circle", emote = "dispenser" },
    },
    -- taco man
    ["taco"] = {
        --vector3(10.831, -1598.917, 29.476) --[vector4(10.831, -1598.917, 29.476, 320.0)]--
        ["Stove"] = { coords = vector3(10.831, -1598.917, 29.476), pSize = 0.60, name = "Stove", job = { ["taco"] = 0}, icon = "fa-solid fa-circle", emote = "bbq" },
        --vector3(13.71, -1595.695, 29.478) --[vector4(13.71, -1595.695, 29.478, 320.0)]--
        ["Drinks"] = { coords = vector3(13.71, -1595.695, 29.478), pSize = 0.52, name = "Drinks", job = { ["taco"] = 0 }, icon = "fa-solid fa-circle", emote = "dispenser" },
    }
}

Config.Registers = {
    vu = {
        [1] = { coords = vector3(129.09, -1285.0, 29.27), polysize = 0.25, icon = "fa-solid fa-circle" },
        [2] = { coords = vector3(133.03, -1286.04, 29.27), polysize = 0.25, icon = "fa-solid fa-circle" }
    },
    popsdiner = {
        [1] = { coords = vector3(1589.11, 6458.2, 26.1), polysize = 0.30, icon = "fa-solid fa-circle" },
        [2] = { coords = vector3(1595.22, 6455.28, 26.12), polysize = 0.30, icon = "fa-solid fa-circle" }
    },
    burgershot = {
        [1] = { coords = vector3(-1197.48, -892.51, 13.89), polysize = 0.25, icon = "fa-solid fa-circle" },
        [2] = { coords = vector3(-1195.44, -893.07, 13.89), polysize = 0.25, icon = "fa-solid fa-circle" },
        [3] = { coords = vector3(-1193.44, -893.64, 13.89), polysize = 0.25, icon = "fa-solid fa-circle" },
        --vector3(6881.226, 429.879, 58.285) --[vector4(6881.226, 429.879, 58.285, 45.0)]--
        [4] = { coords = vector3(-1191.51, -894.17, 13.89), polysize = 0.25, icon = "fa-solid fa-circle" },
        --vector3(6879.987, 431.132, 58.226) --[vector4(6879.987, 431.132, 58.226, 45.0)]--
    },
    tequilala = {
        [1] = { coords = vector3(-562.98, 287.51, 82.23), polysize = 0.25, icon = "fa-solid fa-circle" }
    },
    yellowjack = {
        --vector3(1981.974, 3053.666, 47.375) --[vector4(1981.974, 3053.666, 47.375, 333.5)]--
        [1] = { coords = vector3(1981.974, 3053.666, 47.375), polysize = 0.25, icon = "fa-solid fa-circle" }
    },
    taco = {
        --vector3(9.767, -1605.582, 29.671) --[vector4(9.767, -1605.582, 29.671, 320.0)]--
        [1] = { coords = vector3(9.767, -1605.582, 29.671), polysize = 0.25, icon = "fa-solid fa-circle" }
    }
}


Config.CuttingBoardCoords = {
    -- burgershot
    [1]  = { coords = vector3(-1194.01, -900.6, 13.89), job = "burgershot", polysize = 0.45, icon = "fa-solid fa-circle" },
    -- VU
    [2]  = { coords = vector3(130.29, -1281.31, 29.43), job = "vu", polysize = 0.45, icon = "fa-solid fa-circle" },
    [3]  = { coords = vector3(135.32, -1289.97, 29.27), job = "vu", polysize = 0.45, icon = "fa-solid fa-circle" },
    --Pops Diner
    [4] = { coords = vector3(1587.15, 6459.29, 26.16), job = "popsdiner", polysize = 0.45, icon = "fa-solid fa-circle" },
    --Yellowjack
    [5] =  { coords = vector3(1982.438, 3049.556, 47.215), job = "yellowjack", polysize = 0.45, icon = "fa-solid fa-circle" }, --vector3(1982.438, 3049.556, 47.215) --[vector4(1982.438, 3049.556, 47.215, 333.5)]--
    -- taco job
    [6]  = { coords = vector3(15.735, -1597.48, 29.378), job = "taco", polysize = 0.45, icon = "fa-solid fa-circle" },
}

Config.HandWash = {
     ---- ** Burger Shot ** ----
    [1] = { coords = vector3(-1202.3, -899.22, 13.89), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
      ---- ** Vanilla Unicorn ** ----
    [2] = { coords = vector3(130.31, -1286.34, 29.17), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
    [3] = { coords = vector3(131.65, -1290.56, 29.07), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
    --PopsDiner
    [4] = {coords = vector3(1596.42, 6454.42, 26.0), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
    --Yellojack
    [5] = {coords = vector3(1980.962, 3050.653, 47.215), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
    -- Taco
    [6] = {coords = vector3(12.032, -1597.534, 29.377), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
    [7] = {coords = vector3(18.476, -1605.793, 29.291), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
}

Config.BusinessZone = {
    [1] = {
        label = "vu",
        zones = {
            vector2(85.401397705078, -1289.8188476562),
            vector2(94.191635131836, -1284.6760253906),
            vector2(100.38751220703, -1282.2069091797),
            vector2(134.11404418945, -1275.4494628906),
            vector2(145.65016174316, -1293.9051513672),
            vector2(102.88576507568, -1320.5509033203)
        },
        minz = 25,
        maxz = 35
    },

    [2] = {
        label = "burgershot",
        zones = {
            vector2(-1189.3524169922, -871.67938232422),
            vector2(-1215.9440917969, -889.21130371094),
            vector2(-1198.2188720703, -914.12475585938),
            vector2(-1169.4241943359, -899.88031005859)
        },
        minz = 11,
        maxz = 19
    },

    [3] = {
        label= "tequilala",
        zones = {
            vector2(-580.28, 271.2),
            vector2(-555.58, 268.98),
            vector2(-551.51, 269.8),
            vector2(-546.5, 272.94),
            vector2(-544.36, 277.01),
            vector2(-543.86, 279.87),
            vector2(-542.65, 297.58),
            vector2(-580.28, 301.58)
        },
        minz = 77.8,
        maxz = 92.8
    },

    [4] = {
        label= "popsdiner",
        zones = {
            vector2(1596.73, 6438.41),
            vector2(1598.54, 6438.8),
            vector2(1601.88, 6441.39),
            vector2(1603.75, 6443.72),
            vector2(1604.58, 6445.82),
            vector2(1606.92, 6458.94),
            vector2(1578.72, 6474.49),
            vector2(1568.61, 6450.25)
        },
        minz = 22.05,
        maxz = 32.72
    },
   
    [5] = {
        label= "yellowjack",
        zones = {
            vector2(1978.41, 3085.23),
            vector2(2036.36, 3046.97),
            vector2(1988.26, 2985.98),
            vector2(1931.06, 3022.35)
        },
        minz = 42.26216,
        maxz = 62.26216,
    },
    [6] = {
        --vector3(11.728116, -1585.047, 29.146127)
        label = "taco",
        zones = {
            vector2(-6.96049, -1604.905),
            vector2(13.437917, -1621.928),
            vector2(31.792806, -1600.995),
            vector2(11.728116, -1585.047)
        },
        minz = 25.0,
        maxz = 35.0
    },
}
