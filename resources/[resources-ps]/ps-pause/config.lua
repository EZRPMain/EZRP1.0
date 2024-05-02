Config = Config or {}

----------------------------------------------------------------------------------------------------
-- # BACKGROUND SECTION # --
----------------------------------------------------------------------------------------------------
-- Allows you to set the preferred background Color from a list of available options.
Config.Background = "background_eazy"

-- Available Options --
-- background_blue
-- background_darkblue
-- background_darkerblue
-- background_darkgreen
-- background_green
-- background_other
-- background_pink
-- background_projectsloth
-- background_red
-- background_yellow

-- Allows you to change the opactiy of the Background
Config.Opacity = 40

----------------------------------------------------------------------------------------------------
-- # HEADER and OPTIONS SECTION # --
----------------------------------------------------------------------------------------------------

Config.Header = {
    -- LEFT MENU CONFIG
    ["TITLE"] = "Eazy Roleplay",
    ["SUBTITLE"] = "This little Script was made by Jay <3",

    ["MAP"] = "Map",
    ["GAME"] = "Exit Game",
    ["LEAVE"] = "Return to Server List",
    ["QUIT"] = "Return to Desktop",
    ["INFO"] = "Information",
    ["STATS"] = "Statistics",
    ["SETTINGS"] = "Settings",
    ["GALLERY"] = "Gallery",
    ["KEYBIND"] = "Eazy Keybinds",
    ["EDITOR"] = "Rockstar Editor",

    -- RIGHT MENU CONFIG
    ["SERVER_NAME"] = "Eazy Roleplay",
    ["SERVER_TEXT"] = "San Andreas State ",
    ["SERVER_DISCORD"] = "https://discord.gg/GvBbpHkvA2"
}

--Allows you to Change the Colour ( Use this Website: https://rgbacolorpicker.com/ )
Config.RGBA = {
    LINE = { -- Line over the Options
        ["RED"] = 81,
        ["GREEN"] = 119,
        ["BLUE"] = 170,
        ["ALPHA"] = 255,
    },
    STYLE = { -- Pause Menu Options
        ["RED"] = 0,
        ["GREEN"] = 0,
        ["BLUE"] = 0,
        ["ALPHA"] = 186,
    },
    WAYPOINT = { -- Waypoint
        ["RED"] = 81,
        ["GREEN"] = 119,
        ["BLUE"] = 170,
        ["ALPHA"] = 255,
    },
}
