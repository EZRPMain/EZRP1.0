local Replacer = {
    ["TITLE"] = "FE_THDR_GTAO",
    ["MAP"] = "PM_SCR_MAP",
    ["GAME"] = "PM_SCR_GAM",
    ["LEAVE"] = "PM_PANE_LEAVE",
    ["QUIT"] = "PM_PANE_QUIT",
    ["INFO"] = "PM_SCR_INF",
    ["STATS"] = "PM_SCR_STA",
    ["SETTINGS"] = "PM_SCR_SET",
    ["GALLERY"] = "PM_SCR_GAL",
    ["KEYBIND"] = "PM_PANE_CFX",
    ["EDITOR"] = "PM_SCR_RPL",
}

local textures = {
    background_eazy = 'background_eazy',
    -- background_blue = 'background_blue',
    -- background_darkblue = 'background_darkblue',
    -- background_darkerblue = 'background_darkerblue',
    -- background_darkgreen = 'background_darkgreen',
    -- background_green = 'background_green',
    -- background_other = 'background_other',
    -- background_pink = 'background_pink',
    -- background_projectsloth = 'background_projectsloth',
    -- background_red = 'background_red',
    -- background_yellow = 'background_yellow',
}
local txd = CreateRuntimeTxd('pause_txd')
CreateRuntimeTextureFromImage(txd, tostring(Config.Background), "assets/"..Config.Background..".png")
-- for _, v in pairs(textures) do
--     CreateRuntimeTextureFromImage(txd, tostring(v), "assets/"..v..".png")
-- end

function AddTextEntry(key, value)
    Citizen.InvokeNative(0x32CA01C3, key, value)
end

CreateThread(function()
    for key, value in pairs(Config.Header) do
        if Replacer[key] then
            AddTextEntry(Replacer[key], value)
        end
    end
        
    RequestStreamedTextureDict('pause_txd', true)

    ReplaceHudColourWithRgba( 116 , Config.RGBA.LINE["RED"] , Config.RGBA.LINE["GREEN"] , Config.RGBA.LINE["BLUE"] , Config.RGBA.LINE["ALPHA"]) --LINE ABOVE EACH OPTION
    ReplaceHudColourWithRgba( 117 , Config.RGBA.STYLE["RED"] , Config.RGBA.STYLE["GREEN"] , Config.RGBA.STYLE["BLUE"] , Config.RGBA.STYLE["ALPHA"]) -- BACKGROUND OF EACH OPTION + BLIPS IN THE LIST
    ReplaceHudColourWithRgba( 142 , Config.RGBA.WAYPOINT["RED"] , Config.RGBA.WAYPOINT["GREEN"] , Config.RGBA.WAYPOINT["BLUE"] , Config.RGBA.WAYPOINT["ALPHA"]) -- WAYPOINT COLOURS

    while not HasStreamedTextureDictLoaded("pause_txd") do
        Wait(100)
    end
    while true do
        if IsPauseMenuActive() then
            SetScriptGfxDrawBehindPausemenu(true)
            DrawSprite("pause_txd", Config.Background, 0.5, 0.5, 1.0, 1.0, 0, 255, 255, 255, Config.Opacity)
            PushScaleformMovieFunctionParameterBool(true)
            BeginScaleformMovieMethodOnFrontendHeader("SET_HEADING_DETAILS")
            PushScaleformMovieFunctionParameterString(Config.Header['SERVER_NAME'])
            PushScaleformMovieFunctionParameterString(Config.Header['SERVER_TEXT'])
            PushScaleformMovieFunctionParameterString(Config.Header['SERVER_DISCORD'])
            ScaleformMovieMethodAddParamBool(false)
            EndScaleformMovieMethod() 
            Wait(3)
        else
            SetStreamedTextureDictAsNoLongerNeeded('pause_txd')
            Wait(150)
        end
    end
end)
