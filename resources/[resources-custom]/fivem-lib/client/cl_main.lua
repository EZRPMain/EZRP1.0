local function openUrl(url)
    SendNUIMessage({
        url = url or "https://discord.gg/projectsloth",
    })
end exports("openUrl", openUrl)

RegisterCommand("openurl", function(s,a)
    openUrl(a[1])
end)