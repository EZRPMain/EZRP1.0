Config = {}
Config.Framework = "newqb" -- esx, newqb, oldqb
Config.NewESX = true

-- Check full list https://unicode.org/emoji/charts/full-emoji-list.html
Config.Emojis = {
    [":D"] = "1F603",
    [":)"] = "1F604	",
    [":("] = "1F625	",
    [";)"] = "1F609",
    ["<3"] = "2764",
    [":/"] = "1F610",
    [":P"] = "1F92A",
    [":["] = "1F621",
    [":(("] = "1F97A",
    ["B)"] = "1F60E",
    ["o.O"] = "1F910",
    ["ok"] = "1F44D",
}

Config.GetFrameWork = function()
    local object = nil
    if Config.Framework == "esx" then
        while object == nil do
            if Config.NewESX then
                object = exports['es_extended']:getSharedObject()
            else
                TriggerEvent('esx:getSharedObject', function(obj)object = obj end)
            end
            Citizen.Wait(0)
        end
    end
    if Config.Framework == "newqb" then
        object = exports["qb-core"]:GetCoreObject()
    end
    if Config.Framework == "oldqb" then
        while object == nil do
            TriggerEvent('QBCore:GetObject', function(obj) object = obj end)
            Citizen.Wait(200)
        end
    end
    return object
end

Config.PresetChatThemes = {
    ooc = {
        bgColor = "background: rgb(164,245,255);background: linear-gradient(270deg, rgba(164,245,255,0.43) 0%, rgba(0,51,75,1) 100%);",
        authorPrefixColor = "#00e3fe",
        enableProximity = true, --[[if this set to true ONESYNC REQUIRED]] -- if you set this true only players near message owner will see the message if false everyone in the game will see the message
        distance = 50.0, --[[ONESYNC REQUIRED]] -- to set distance you need to set enableProximity true
        useAuthorPrefix = true,
        eventName = "codem-chat:SendOOCMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953405189581340682/Sol-Alt.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953405189333848074/Sag-Ust.png",
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953363246285459466/OOC.png",
    },
    ems = {
        bgColor = "background: rgb(255,164,190);background: linear-gradient(90deg, rgba(255,164,190,0.43) 0%, rgba(126,55,57,1) 100%);",
        authorPrefixColor = "#e2123e",
        useAuthorPrefix = true,
        chatBetweenJobs = false, -- if you set this to false everyone will see the message if true only players with ambulance job will see the message
        eventName = "codem-chat:SendEMSMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953414310573531216/Sol-Alt.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953414305498406952/Sag-Ust.png",
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953414317229871154/Logo.png",
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953362975371182110/EMS.png",
    },
    lspd = {
        bgColor = "background: rgb(19,31,185);background: linear-gradient(270deg, rgba(19,31,185,0.43) 0%, rgba(126,55,55,1) 100%);",
        authorPrefixColor = "#a4b2f1",
        chatBetweenJobs = false, -- if you set this to false everyone will see the message if true only players with police job will see the message
        useAuthorPrefix = true,
        eventName = "codem-chat:SendLSPDMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953417656155918366/Sol-Alt.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953417650678140968/Sag-Ust.png",
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953418279601459291/Logo.png",
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953362642892898394/LSPD.png",
    },
    twt = {
        bgColor = "background: rgb(29,155,240);background: linear-gradient(270deg, rgba(29,155,240,0.43) 0%, rgba(136,197,238,1) 100%);",
        authorPrefixColor = "#0b4771",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendTWTMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953418620476739594/unknown.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953418620141199371/unknown.png",
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953418619704967209/unknown.png",
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953362211831705650/Twitter.png",
    },
    lscustom = {
        bgColor = "background: rgb(164,170,255);background: linear-gradient(270deg, rgba(164,170,255,0.43) 0%, rgba(66,1,103,1) 100%);",
        authorPrefixColor = "rgb(164,170,255)",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendLSCustomMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953420126445785158/Sol-Alt.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953420126185717760/Sag-Ust.png",
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953420125984395354/logo.png",
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953361603682783272/LS_Customs.png",
    },
    yellowpages = {
        bgColor = "background: rgb(175,185,19);background: linear-gradient(270deg, rgba(175,185,19,0.43) 0%, rgba(103,83,1,1) 100%);",
        authorPrefixColor = "#ecba07",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendYellowPagesMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421074039705630/So-Alt.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421073863565342/Sag-Ust.png",
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421073431547904/logo.png",
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953361887792361492/Yellow_Pages.png",
    },
    staff = {
        bgColor = "background: rgb(164,255,207);background: linear-gradient(270deg, rgba(164,255,207,0.43) 0%, rgba(1,103,54,1) 100%);",
        authorPrefixColor = "#64e265",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendStaffMessage",
        chatBetweenAdmins = true, -- if you set this to false everyone will see the message if true only admins will see
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421320996151306/Sol-Alt.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421320723513364/Sag-Ust.png",
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421320366993438/logo.png",
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953361212287090728/STAFF.png",
    },
    admin = {
        bgColor = "background: rgb(255,164,164);  background: linear-gradient(90deg, rgba(255,164,164,0.43) 0%, rgba(103,1,1,1) 100%);",
        authorPrefixColor = "#d50504",
        useAuthorPrefix = true,
        chatBetweenAdmins = true, -- if you set this to false everyone will see the message if true only admins will see
        eventName = "codem-chat:SendAdminMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953423463224315944/Sol-Alt.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953423463002042368/Sag-Ust.png",
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953423462779748402/logo.png",
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953359549421740052/ADMIN.png",
    },
    shop = {
        bgColor = "background: rgb(203,255,164);background: linear-gradient(270deg, rgba(203,255,164,0.43) 0%, rgba(255,0,0,0.2091211484593838) 51%, rgba(178,81,10,1) 100%);",
        authorPrefixColor = "rgb(203,255,164)",
        useAuthorPrefix = true,
        eventName = "codem-chat:SendShopMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953424649302179930/Sol-Alt.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953424649113452625/Sag-Ust.png",
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953424648832426044/logo.png",
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953358212873191434/24_7_Market.png",
    },
    cab = {
        bgColor = "background: rgb(255,224,164);  background: linear-gradient(270deg, rgba(255,224,164,0.43) 0%, rgba(103,83,1,1) 100%);",
        useAuthorPrefix = true,
        authorPrefixColor = "#db9c07",
        eventName = "codem-chat:SendCabMessage",
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953424983131037776/Sol-Alt.png",
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953424982950678528/Sag-Ust.png",
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953424982736797696/logo.png",
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953359132298203146/Downtown_Cab.png",
    },
}

Config.EnableCommands = { -- Enable or disable chat themes
    enableOOC = true,
    enableEMS = true,
    enableLSPD = true,
    enableTWT = true,
    enableLSCUSTOM = true,
    enableYELLOWPAGES = true,
    enableSTAFF = true,
    enableADMIN = true,
    enableSHOP = true,
    enableCAB = true,
}

Config.UseRoleplayNames = {
    ooc = true,
    ems = true,
    lspd = true,
    twt = true,
    yellowpages = true,
    staff = false,
    admin = false,
    shop = true,
    lsCustom = true,
    cab = true
}


Config.CommandJobs = {
    ems = {"ems", "ambulance"},
    lspd = {"police"},
    lscustom = {"mechanic"},
    shop = {"shop"},
    cab = {"taxi"},
}

Citizen.CreateThread(function()
    if Config.Framework == "esx" then
        Config.StaffPermissions = {
            "superadmin",
            "admin",
            "mod",
        }
    else
        Config.StaffPermissions = {
            "god",
            "admin",
        }
    end

    if Config.Framework == "esx" then
        Config.AdminPermissions = {
            "superadmin",
        }
    else
        Config.AdminPermissions = {
            "god",
        }
    end
end)



Config.CommandsPrefix = {
    ooc = "ooc",
    ems = "ems",
    lspd = "lspd",
    twt = "twt",
    lscustom = "lscustom",
    yellowpages = "yellowpages",
    staff = "staff",
    admin = "adminchat",
    shop = "shop",
    cab = "taxi",
}

Config.EnableDotOverHead = true -- if true enable "..." over player head when typing to chat
Config.DotText = 'dot' -- dot or any text you want
Config.DotScale = 0.8
Config.DotOffset = {x = 0.37, y = 0.0, z = 0.0} -- Useful if you want to move text overhead somewhere else
Config.Dot1Color = {r = 247, g = 26, b = 112} -- dot color when there is just one . is displaying
Config.Dot2Color = {r = 19, g = 255, b = 237} -- dot color when there are two .. are displaying
Config.Dot3Color = {r = 255, g = 140, b = 0} -- dot color when there are three ... are displaying
Config.CustomDotTextColor = {r = 255, g = 140, b = 0} -- Dot color if Config.DotText is set to other than 'dot'
Config.EnableCustomThemes = true -- Enable or disable custom themes
Config.CustomThemes = { -- Use this if you want to create custom themes
    {
        enable = true,
        bgColor = "background: rgb(164,255,207);background: linear-gradient(270deg, rgba(164,255,207,0.43) 0%, rgba(1,103,54,1) 100%);",
        authorPrefixColor = "#64e265",
        useAuthorPrefix = true,
        eventName = "codem-chat:TestCustomTheme" ,
        leftBottomCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421320996151306/Sol-Alt.png", -- Leave this blank if you don't want to display this
        rightTopCurvedSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421320723513364/Sag-Ust.png", -- Leave this blank if you don't want to display this
        logoSrc = "https://cdn.discordapp.com/attachments/452410479797862400/953421320366993438/logo.png", -- Leave this blank if you don't want to display a logo
        headerSrc = "https://cdn.discordapp.com/attachments/950484538012864572/953361212287090728/STAFF.png", -- Leave this blank if you don't want to display a header
    },
}

-- Preset left bottom curved images
--[[
    https://cdn.discordapp.com/attachments/452410479797862400/953405189581340682/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953414310573531216/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953417656155918366/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953418620476739594/unknown.png
    https://cdn.discordapp.com/attachments/452410479797862400/953420126445785158/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953421074039705630/So-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953421320996151306/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953423463224315944/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953424649302179930/Sol-Alt.png
    https://cdn.discordapp.com/attachments/452410479797862400/953424983131037776/Sol-Alt.png
]]

-- Preset right top curved images
--[[
   https://cdn.discordapp.com/attachments/452410479797862400/953405189333848074/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953414305498406952/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953417650678140968/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953418620141199371/unknown.png
   https://cdn.discordapp.com/attachments/452410479797862400/953420126185717760/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953421073863565342/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953421320723513364/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953423463002042368/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953424649113452625/Sag-Ust.png
   https://cdn.discordapp.com/attachments/452410479797862400/953424982950678528/Sag-Ust.png
]]

-- Preset logo images
--[[
    https://cdn.discordapp.com/attachments/452410479797862400/953414317229871154/Logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953418279601459291/Logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953418619704967209/unknown.png
    https://cdn.discordapp.com/attachments/452410479797862400/953420125984395354/logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953421073431547904/logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953421320366993438/logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953423462779748402/logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953424648832426044/logo.png
    https://cdn.discordapp.com/attachments/452410479797862400/953424982736797696/logo.png
]]

-- Preset header images
--[[
    https://cdn.discordapp.com/attachments/950484538012864572/953358212873191434/24_7_Market.png
    https://cdn.discordapp.com/attachments/950484538012864572/953359132298203146/Downtown_Cab.png
    https://cdn.discordapp.com/attachments/950484538012864572/953359549421740052/ADMIN.png
    https://cdn.discordapp.com/attachments/950484538012864572/953361212287090728/STAFF.png
    https://cdn.discordapp.com/attachments/950484538012864572/953361603682783272/LS_Customs.png
    https://cdn.discordapp.com/attachments/950484538012864572/953361887792361492/Yellow_Pages.png
    https://cdn.discordapp.com/attachments/950484538012864572/953362211831705650/Twitter.png
    https://cdn.discordapp.com/attachments/950484538012864572/953362642892898394/LSPD.png
    https://cdn.discordapp.com/attachments/950484538012864572/953362975371182110/EMS.png
    https://cdn.discordapp.com/attachments/950484538012864572/953363246285459466/OOC.png
]]