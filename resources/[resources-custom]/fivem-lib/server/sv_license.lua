function GetLicense(s, license)
    local identifiers = GetPlayerIdentifiers(s)

    for _, id in pairs(identifiers) do
        if id:find(license) then
            return id
        end
    end
end

RegisterCommand("getlicense", function(s,a)
    local player = s
    local wlicense = "license"
    if tonumber(a[1]) then
        player = tonumber(a[1])
        wlicense = tostring(a[2])
    else
        -- player = s
        wlicense = tostring[a[1]]
        -- goto continue
        -- return
    end

    ::continue::
    local license = GetLicense(player, wlicense)
    TriggerClientEvent('jay-debug:Debug', -1, GetCurrentResourceName(), (license:gsub(wlicense..":", "")))
end)