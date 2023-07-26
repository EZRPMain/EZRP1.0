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
        label = "Maldinis", -- Blip name
        coords = vector3(-580.8717, -889.9176, 25.716783), -- Blip location
        blip = 78, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 46 -- Blip color
    },

    [2] = {
        label = "Bean Machine", -- Blip name
        coords = vector3(120.68, -1038.23, 29.28), -- Blip location
        blip = 106, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 56 -- Blip color
    },
    [3] = {
        label = "UwU Cafe", -- Blip name
        coords = vector3(-580.97, -1067.21, 22.34), -- Blip location
        blip = 621, -- Blip icon´
        blipScale = 0.8, -- Blip scale
        color = 41 -- Blip color
    },
    [4] = {
        label = "Vanilla Unicorn", -- Blip name
        coords = vector3(127.25, -1296.62, 29.27), -- Blip location
        blip = 121, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 40 -- Blip color
    },
    [5] = {
        label = "Burgershot", -- Blip name
        coords = vector3(-1190.31, -888.4, 13.97), -- Blip location
        blip = 106, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 5 -- Blip color
    },

    [6] = {
        label = "Hen house", -- Blip name
        coords = vector3(-294.48, 6265.72, 35.59), -- Blip location
        blip = 80, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 47 -- Blip color
    },
    [7] = {
        label = "Pops Diner", -- Blip name
        coords = vector3(1587.9038, 6457.25, 26.013969), -- Blip location
        blip = 267, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 3 -- Blip color
    },
    [8] = {
        label = "Angus Autos", -- Blip name
        coords = vector3(891.104, 3602.653, 33.475), -- Blip location
        blip = 779, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 3 -- Blip color
    },
    [9] = {
        label = "Yellow Jack", -- Blip name
        coords = vector3(1982.5886, 3050.2868, 47.214988), -- Blip location
        blip = 311, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 5 -- Blip color
    },
    [10] = {
        label = "Taco", -- Blip name
        coords = vector3(14.031192, -1602.21, 29.37544), -- Blip location
        blip = 79, -- Blip icon
        blipScale = 0.8, -- Blip scale
        color = 2 -- Blip color
    },
}

Config.BusinessManager = {
    ["pizza"] = {
        coords = vector3(-594.0481, -888.2959, 30.00568), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.3, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["pizza"] = 2}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    },

    ["catcafe"] = {
        coords = vector3(-578.34, -1066.75, 26.67), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.3, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["catcafe"] = 3}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    },

    ["beanmachine"] = {
        coords = vector3(126.37, -1034.37, 29.18), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.56, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["beanmachine"] = 3}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    },

    ["burgershot"] = {
        coords = vector3(vector3(-1200.53, -902.65, 13.89)), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 1.00, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["burgershot"] = 3}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    },

    ["henhouse"] = {
        coords = vector3(-294.48, 6265.72, 34.59), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.56, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["henhouse"] = 3}, -- Which job and grade should have access to change and access menu?
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
    ["angusautos"] = {
        coords = vector3(891.104, 3602.653, 33.475), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.56, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["angusautos"] = 4}, -- Which job and grade should have access to change and access menu?
        type = {Food = false, Drink = false} -- Type of items the business is authorized to sell
    },
    --vector3(1983.098, 3051.119, 47.215) --[vector4(1983.098, 3051.119, 47.215, 333.5)]--
    ["yellowjack"] = {
        coords = vector3(1983.098, 3051.119, 47.215), -- Coords of the place where buisnesses can create and manage menu items
        polysize = 0.56, -- How big is the Sphere?
        label = Lang:t('target.manager_menu'), -- This is the manager_menu under the locales
        icon = "fa-solid fa-laptop", -- This is the favicon Icon I use 6.0 beta so if you need to change it do it here.
        job = {["yellowjack"] = 4, ["yellowjack"] = 3}, -- Which job and grade should have access to change and access menu?
        type = {Food = true, Drink = true} -- Type of items the business is authorized to sell
    },
    -- COMEBACK

    -- taco
    --vector3(8.192, -1607.272, 29.671) --[vector4(8.192, -1607.272, 29.671, 320.0)]--
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
    ["pizza"] = { -- Match this with business zone and job name (Case Sensitive!)
        [1] = { -- Main Menu
            -- coords = vector3(814.09, -755.02, 28.20), -- Coords for the qb-target where they can change image (Circlezone)
            -- vector3(-577.405, -887.802, 27.917) --[vector4(-577.405, -887.802, 27.917, 0.0)]--
            coords = vector3(-577.405, -887.802, 27.917), --[vector4(-577.405, -887.802, 27.917, 0.0)]--
            pSize = 1.2,
            ytd = 'sm_pizzeria_txd_02', -- This has to be the Dictionsiary YTD File
            ytdname = "pizzeria_menu", -- This will be the name of the object INSIDE the YTD File
            width = 512, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 512, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 1, -- This is the ID of the shop, has to be unique
            job = {["pizza"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },

        [2] = { -- Drinks Menu
            -- coords = vector3(813.79, -751.06, 28.75), -- Coords for the qb-target where they can change image (Circlezone)
            coords =vector3(-577.505, -891.702, 27.217), --[vector4(-577.505, -891.702, 27.217, 0.0)]--
            pSize = 1.2,
            ytd = 'sm_pizzeria_txd_02', -- This has to be the Dictionsiary YTD File
            ytdname = "pizzeria_dinks", -- This will be the name of the object INSIDE the YTD File
            width = 512, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 512, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 2, -- This is the ID of the shop, has to be unique
            job = {["pizza"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },
    },

    ["catcafe"] = { -- Match this with business zone and job name (Case Sensitive!)
        [1] = { -- UwU Café paintings
            coords = vector3(-582.88, -1048.48, 23.24), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 1.2,
            ytd = 'denis3d_catcafe_txd', -- This has to be the Dictionsiary YTD File t_m_catcafe_imageatlas02
            ytdname = "t_m_catcafe_imageatlas02", -- This will be the name of the object INSIDE the YTD File
            width = 512, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 512, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 1, -- This is the ID of the shop, has to be unique
            job = {["catcafe"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },

        [2] = { -- Main Menu
            coords = vector3(-587.43, -1059.67, 24.24), -- Coords for the qb-target where they can change image (Circlezone)
            pSize = 0.95,
            ytd = 'denis3d_catcafe_txd', -- This has to be the Dictionsiary YTD File
            ytdname = "t_m_catcafe_imageatlas01", -- This will be the name of the object INSIDE the YTD File
            width = 512, -- Width of the ytdname can be found next to the ytdname inside the YTD file
            height = 512, -- height of the ytdname can be found next to the ytdname inside the YTD file
            id = 2, -- This is the ID of the shop, has to be unique
            job = {["catcafe"] = 0}, -- Which job and grade should have access to change texture?
            url = nil, -- Placeholder for current URL
            dui = nil -- Placeholder for DUI Handle
        },
    },

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
    ["pizza"] = { -- make the [] the same as the name (otherwise the you will get an error)
    --vector3(-576.89, -889.6, 25.717) --[vector4(-576.89, -889.6, 25.717, 5.0)]--
        ["Pizza Oven"] = {  coords = vector3(-576.89, -889.6, 25.717),   pSize = 0.9,    name = "Pizza Oven",    job = { ["pizza"] = 0},     icon = "fa-solid fa-circle",    emote = "bumbin",       headericon = "fa-solid fa-pizza-slice" },
       --vector3(-582.362, -899.109, 25.717) --[vector4(-582.362, -899.109, 25.717, 0.0)]--
        ["Stove Prep"] = {  coords = vector3(-582.362, -899.109, 25.717),    pSize = 0.52,   name = "Stove Prep",    job = { ["pizza"] = 0 },    icon = "fa-solid fa-circle",    emote = "mechanic4",    headericon = "fa-solid fa-fire-burner" },
        --vector3(-577.208, -886.076, 26.117) --[vector4(-577.208, -886.076, 26.117, 0.0)]--
        ["Drinks"] = {      coords = vector3(-577.208, -886.076, 26.117),   pSize = 0.52,   name = "Drinks",        job = { ["pizza"] = 0 },    icon = "fa-solid fa-circle",    emote = "mechanic4",    headericon = "fa-solid fa-bottle-droplet" },
    },

    ["beanmachine"] = {
        ["Coffee Machine"] = { coords = vector3(123.05, -1041.67, 29.28), pSize = 0.60, name = "Coffee Machine", job = { ["beanmachine"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Food"] = { coords = vector3(124.79, -1036.97, 29.43), pSize = 0.56, name = "Food", job = { ["beanmachine"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
    },

    ["catcafe"] = {
        ["Stove Prep"] = { coords = vector3(-591.1, -1056.5, 22.21), pSize = 0.60, name = "Stove Prep", job = { ["catcafe"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Oven Prep"] = { coords = vector3(-590.92, -1059.7, 22.59), pSize = 0.75, name = "Oven Prep", job = { ["catcafe"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Drinks"] = { coords = vector3(-586.67, -1061.77, 22.95), pSize = 0.75, name = "Drinks", job = { ["catcafe"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
    },

    ["burgershot"] = {
        ["Grill"] = { coords = vector3(-1195.82, -897.38, 13.89), pSize = 0.60, name = "Grill", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "bbq" },
        ["Grill2"] = { coords = vector3(-1194.95, -897.59, 13.89), pSize = 0.60, name = "Grill", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "bbq" },
        ["Frier"] = { coords = vector3(-1196.16, -900.04, 13.89), pSize = 0.70, name = "Frier", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "uncuff" },
        ["Assembly Line"] = { coords = vector3(-1201.3, -895.15, 13.89), pSize = 0.5, name = "Assembly Line", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Drinks"] = { coords = vector3(-1190.74, -899.1, 13.89), pSize = 0.5, name = "Drinks", job = { ["burgershot"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
    },

    ["henhouse"] = {
        ["Drinks"] = { coords = vector3(-297.4, 6263.92, 31.58), pSize = 0.60, name = "Drinks", job = { ["henhouse"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Coffee"] = { coords = vector3(-295.73, 6263.17, 31.48), pSize = 0.60, name = "Coffee", job = { ["henhouse"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
        ["Stove Prep"] = { coords = vector3(-297.74, 6271.09, 31.4), pSize = 0.60, name = "Stove Prep", job = { ["henhouse"] = 0}, icon = "fa-solid fa-circle", emote = "mechanic4" },
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
    catcafe = {
        [1] = { coords = vector3(-584.13, -1058.69, 22.34), polysize = 0.25, icon = "fa-solid fa-circle" },
        [2] = { coords = vector3(-584.14, -1061.38, 22.34), polysize = 0.25, icon = "fa-solid fa-circle" }
    },
    vu = {
        [1] = { coords = vector3(129.09, -1285.0, 29.27), polysize = 0.25, icon = "fa-solid fa-circle" },
        [2] = { coords = vector3(133.03, -1286.04, 29.27), polysize = 0.25, icon = "fa-solid fa-circle" }
    },
    beanmachine = {
        [1] = { coords = vector3(120.89, -1040.16, 29.28), polysize = 0.25, icon = "fa-solid fa-circle" },
        [2] = { coords = vector3(122.2, -1036.58, 29.28), polysize = 0.25, icon = "fa-solid fa-circle" }
    },
    pizza = {
        [1] = { coords = vector3(-579.856, -888.6498, 25.6753), polysize = 0.25, icon = "fa-solid fa-circle" },
        [2] = { coords = vector3(-579.856, -887.3316, 25.6753), polysize = 0.25, icon = "fa-solid fa-circle" }
    },
    henhouse = {
        [1] = { coords = vector3(-298.17, 6261.72, 31.60), polysize = 0.30, icon = "fa-solid fa-circle" }
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
    --vector3(-580.678, -901.898, 25.717) --[vector4(-580.678, -901.898, 25.717, 0.0)]--
    [1] = { coords = vector3(-580.678, -901.898, 25.717), job = "pizza", polysize = 0.5, icon = "fa-solid fa-circle" },
    --vector3(-581.844, -897.913, 25.717) --[vector4(-581.844, -897.913, 25.717, 0.0)]--
    [2] = { coords = vector3(-581.844, -897.913, 25.717), job = "pizza", polysize = 0.5, icon = "fa-solid fa-circle" },
    -- UwU Cafe
    [4]  = { coords = vector3(-591.07, -1063.04, 22.36), job = "catcafe", polysize = 0.55, icon = "fa-solid fa-circle" },

    -- burgershot
    [5]  = { coords = vector3(-1194.01, -900.6, 13.89), job = "burgershot", polysize = 0.45, icon = "fa-solid fa-circle" },

    --henhouse
    [6]  = { coords = vector3(-298.58, 6270.07, 31.5), job = "henhouse", polysize = 0.45, icon = "fa-solid fa-circle" },

    -- VU
    [7]  = { coords = vector3(130.29, -1281.31, 29.43), job = "vu", polysize = 0.45, icon = "fa-solid fa-circle" },
    [8]  = { coords = vector3(135.32, -1289.97, 29.27), job = "vu", polysize = 0.45, icon = "fa-solid fa-circle" },

    --Pops Diner
    [9] = { coords = vector3(1587.15, 6459.29, 26.16), job = "popsdiner", polysize = 0.45, icon = "fa-solid fa-circle" },

    --Yellowjack
    [10] =  { coords = vector3(1982.438, 3049.556, 47.215), job = "yellowjack", polysize = 0.45, icon = "fa-solid fa-circle" }, --vector3(1982.438, 3049.556, 47.215) --[vector4(1982.438, 3049.556, 47.215, 333.5)]--
    
    -- burgershot far far away -- vector3(6875.94, 429.396, 57.996) --[vector4(6875.94, 429.396, 57.996, 45.0)]--
    [11]  = { coords = vector3(6875.94, 429.396, 57.996), job = "burgershot", polysize = 0.45, icon = "fa-solid fa-circle" },

    -- taco job
    --vector3(15.735, -1597.48, 29.378) --[vector4(15.735, -1597.48, 29.378, 320.0)]--
    [12]  = { coords = vector3(15.735, -1597.48, 29.378), job = "taco", polysize = 0.45, icon = "fa-solid fa-circle" },
}

Config.HandWash = {
    ---- ** Pizza This ** ----
    --vector3(-581.649, -901.934, 25.717) --[vector4(-581.649, -901.934, 25.717, 0.0)]--
    [1] = { coords = vector3(-581.649, -901.934, 25.717), polysize = 0.42, icon = "fa-solid fa-hands-bubbles" },
    --vector3(-581.852, -896.833, 25.717) --[vector4(-581.852, -896.833, 25.717, 0.0)]--
    [2] = { coords = vector3(-581.852, -896.833, 25.717), polysize = 0.50, icon = "fa-solid fa-hands-bubbles" },
    --vector3(-577.776, -892.191, 25.717) --[vector4(-577.776, -892.191, 25.717, 0.0)]--
    [3] = { coords = vector3(-577.776, -892.191, 25.717), polysize = 0.36, icon = "fa-solid fa-hands-bubbles" },
   -- vector3(-589.427, -895.418, 30.202) --[vector4(-589.427, -895.418, 30.202, 0.0)]--
    [4] = { coords = vector3(-589.427, -895.418, 30.202), polysize = 0.36, icon = "fa-solid fa-hands-bubbles" },
    --vector3(-581.245, -902.055, 30.202) --[vector4(-581.245, -902.055, 30.202, 0.0)]--
    [5] = { coords = vector3(-581.245, -902.055, 30.202), polysize = 0.36, icon = "fa-solid fa-hands-bubbles" },
    --vector3(-582.236, -902.055, 30.202) --[vector4(-582.236, -902.055, 30.202, 0.0)]--
    [6] = { coords = vector3(-582.236, -902.055, 30.202), polysize = 0.36, icon = "fa-solid fa-hands-bubbles" },

    ---- ** Bean Machine ** ----
    [8] = { coords = vector3(123.76, -1039.25, 29.28), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },

    ---- UwU Cafe ** ----
    [9] = { coords = vector3(-587.79, -1062.57, 22.31), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },

    ---- ** Burger Shot ** ----
    [10] = { coords = vector3(-1197.6, -902.76, 13.67), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
    --henhouse
    [11] = { coords = vector3(185.45, -248.21, 54.07), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
    [12] = { coords = vector3(-300.02, 6270.46, 31.1), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },

    ---- ** Vanilla Unicorn ** ----
    [13] = { coords = vector3(130.31, -1286.34, 29.17), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
    [14] = { coords = vector3(131.65, -1290.56, 29.07), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },

    --PopsDiner
    [15] = {coords = vector3(1596.42, 6454.42, 26.0), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },

    --Yellojack
    --vector3(1980.962, 3050.653, 47.215) --[vector4(1980.962, 3050.653, 47.215, 333.5)]--
    [16] = {coords = vector3(1980.962, 3050.653, 47.215), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },

    --Taco
    --vector3(12.032, -1597.534, 29.377) --[vector4(12.032, -1597.534, 29.377, 320.0)]--
    [17] = {coords = vector3(12.032, -1597.534, 29.377), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
    [18] = {coords = vector3(18.476, -1605.793, 29.291), polysize = 0.5, icon = "fa-solid fa-hands-bubbles" },
    --vector3(18.476, -1605.793, 29.291) --[vector4(18.476, -1605.793, 29.291, 320.0)]--

}

Config.BusinessZone = {
    [1] = {
        label = "pizza", -- this HAS to be the same name as your Config.DUI Table for each restaurants AND has to be your JOB NAME aswell
        zones = {
            -- vector2(815.43725585938, -769.3916015625),
            -- vector2(816.32427978516, -736.61773681641),
            -- vector2(813.86578369141, -732.19110107422),
            -- vector2(803.97991943359, -720.43774414062),
            -- vector2(799.28356933594, -717.26361083984),
            -- vector2(787.95263671875, -717.04296875),
            -- vector2(788.22003173828, -769.29443359375)
            vector2(-623.48, -908.33),
            vector2(-623.86, -885.61),
            vector2(-612.12, -866.67),
            vector2(-583.33, -851.14),
            vector2(-566.29, -851.14),
            vector2(-566.67, -909.85)
        },
        minz = 20.291772,
        maxz = 40.5,
    },
    [2] = {
        label = "catcafe", -- this HAS to be the same name as your Config.DUI Table for each restaurants AND has to be your JOB NAME aswell
        zones = {
            vector2(-559.69372558594, -1087.2666015625),
            vector2(-559.77404785156, -1087.3265380859),
            vector2(-559.69268798828, -1043.4205322266),
            vector2(-616.13201904297, -1043.8450927734),
            vector2(-612.01220703125, -1085.7110595703)
        },
        minz = 21.783931732178,
        maxz = 31.199645996094,
    },

    [3] = {
        label = "beanmachine",
        zones = {
            vector2(131.08023071289, -1025.3592529297),
            vector2(121.77831268311, -1051.5631103516),
            vector2(108.08544158936, -1045.4951171875),
            vector2(118.04113006592, -1021.9342041016)
        },
        minz = 29,
        maxz = 35
    },

    [4] = {
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

    [5] = {
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

    [6] = {
        label = "henhouse",
        zones = {
            vector2(-306.78100585938, 6248.3935546875),
            vector2(-288.27365112305, 6264.498046875),
            vector2(-303.38427734375, 6280.1586914062),
            vector2(-319.02996826172, 6263.92578125)
        },
        minz = 30.444395065308,
        maxz = 38.492126464844
    },

    [7] = {
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

    [8] = {
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
    [9] = {
        label= "angusautos",
        zones = {
            vector2(920.06195, 3626.3386),
            vector2(880.71697, 3627.361),
            vector2(882.6557, 3591.105),
            vector2(920.84606, 3593.602)
        },
        minz = 30.56450,
        maxz = 38.56450
    },
    [10] = {
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
    [11] = { -- far far away
    --vector3(6877.2236, 467.91894, 57.898395)
        label = "burgershot",
        zones = {
            vector2(6878.8022, 399.07153),
            vector2(6899.5756, 432.00845),
            vector2(6877.2236, 467.91894),
            vector2(6853.8774, 458.98858),
            vector2(6848.4252, 422.6633),
        },
        minz = 53,
        maxz = 65
    },
    [12] = {
        --vector3(-500.6056, -678.8119, 33.056148)
        label = "cluckinbell",
        zones = {
            vector2(-500.6056, -678.8119),
            vector2(-500.309, -704.8537),
            vector2(-531.1093, -677.1827),
            vector2(-527.7922, -713.184)
        },
        minz = 30.0,
        maxz = 37.0
    },
    [13] = {
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
