local QBCore = exports['qb-core']:GetCoreObject()

local cached_radio = nil

local cached_toggle = false

-- todo create script :kekw:

function string.starts(String,Start)    
    return string.sub(String,1,string.len(Start))==Start 
end
CreateThread(function()
    for k, v in pairs(Config.DrivethruZones) do
        exports["ps-zones"]:CreateBoxZone("drivethru_"..v.name, v.coords, v.length, v.width, v.data)
    end
end)

RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "drivethru_") then
        if exports['qb-radio']:IsRadioOn() then 
            cached_radio = LocalPlayer.state.radioChannel
        end
        exports["pma-voice"]:setRadioChannel(ZoneData.radio)
        exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
    end
end)

RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "drivethru_") then
        if cached_radio == nil then cached_radio = 0 end
        if cached_radio ~= 0 or cached_radio ~= nil then
            exports["pma-voice"]:setRadioChannel(cached_radio)
            exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
            cached_radio = nil
        else
            exports["pma-voice"]:setRadioChannel(0)
            exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
        end
    end
end)


RegisterCommand("dtfix", function()
    exports["pma-voice"]:setRadioChannel(0)
    exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
end)

RegisterNetEvent("jay-dt:resetLeave", function() -- this actually needs to be tested lmao | not gonna test it tho so fuck u
    if cached_radio == nil then cached_radio = 0 end
    if cached_radio ~= 0 or cached_radio ~= nil then
        exports["pma-voice"]:setRadioChannel(cached_radio)
        exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
        cached_radio = nil
    else
        exports["pma-voice"]:setRadioChannel(0)
        exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
    end
end)

local function RadioCheck(item, coords)
    local drivethru = Config.RadioItems[item]

    for k,v in pairs(drivethru) do
        local dist = #(coords - v.coords)
        if dist < v.distance then 
            return v.radio
        end
    end
    return false
end

RegisterNetEvent("jay-drivethru:connect", function(item)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local radio = RadioCheck(item, coords)
    if not radio then 
        return QBCore.Functions.Notify("Cannot find drivethru frequency", "error")
    end

    if not cached_toggle then
        cached_toggle = true
        exports["pma-voice"]:setRadioChannel(radio)
        exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
    elseif cached_toggle then
        cached_toggle = false
        exports["pma-voice"]:setRadioChannel(0)
        exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
    end
    -- todo distance check
end)