Framework = exports['qb-core']
Manager = exports['ez-manager']
Keybinds = exports['jay-interactions']
Inventory  = exports['lj-inventory']


Shared = Shared or {}

Shared.PlacementRadius = 10.0 -- Object can only be placed within this radius of the player

-- These are necessary so people can't place props far away
Shared.minZOffset = -2.0 -- The min z offset for placing objects
Shared.maxZOffset = 2.0 -- The max z offset for placing objects

Shared.Flags = {
    -- Constructions props
    {item = "flag1", model = "bzzz_bandanaflag_black_a"},
    {item = "flag2", model = "bzzz_bandanaflag_blue_a"},
    {item = "flag3", model = "bzzz_bandanaflag_brown_a"},
    {item = "flag4", model = "bzzz_bandanaflag_custom_a"},
    {item = "flag5", model = "bzzz_bandanaflag_custom_b"},
    {item = "flag6", model = "bzzz_bandanaflag_green_a"},
    {item = "flag7", model = "bzzz_bandanaflag_purple_a"},
    {item = "flag8", model = "bzzz_bandanaflag_red_a"},
    {item = "flag9", model = "bzzz_bandanaflag_skull_a"},
    {item = "flag10", model = "bzzz_bandanaflag_yellow_a"},
}

Shared.DebugShared = {
    ["flag1"]    = {["name"] = "flag1",   ["label"] = "MS-13 Flag", 	        ["weight"] = 1000, 		["type"] = "item", 		["image"] = "constructionbarrier2.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "MS-13 Gang Flag", ['model'] = "bzzz_bandanaflag_black_a", ['isFrozen'] = true},
    ["flag9"]    = {["name"] = "flag9",   ["label"] = "Skull Flag", 	        ["weight"] = 1000, 		["type"] = "item", 		["image"] = "constructionbarrier2.png", ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Skull Gang Flag", ['model'] = "bzzz_bandanaflag_skull_a", ['isFrozen'] = true},
}