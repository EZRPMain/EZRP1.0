RegisterNetEvent('qb-businesses:server:PlayBusinessSong', function(song, Zone, volume)
    local Player = QBCore.Functions.GetPlayer(source)
    local name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    if validateJob(Player.PlayerData.job.name) then
        local coords = Config.DjBooths[Zone].play or Config.DjBooths[Zone].coords
        exports.xsound:PlayUrlPos(-1, Zone, song, 55, coords)
        exports.xsound:Distance(-1, Zone, Config.DjBooths[Zone].radius)
        exports.xsound:setVolume(-1, Zone, (volume/100))
        Config.DjBooths[Zone].playing = true
        TriggerEvent('qb-log:server:CreateLog', 'business', 'Play Song', 'green', Lang:t('logs.play_song', {
            name = ("%s(%s)"):format(name, GetPlayerName(source)),
            song = song,
            zone = Zone
        }))
    else
        TriggerEvent('qb-log:server:CreateLog', 'business', 'Play Song', 'red', Lang:t('logs.play_song_unauth', {
            name = ("%s(%s)"):format(name, GetPlayerName(source)),
            song = song,
            zone = Zone
        }))
    end
end)

RegisterNetEvent('qb-businesses:server:stopMusic', function(Zone)
    local Player = QBCore.Functions.GetPlayer(source)
    local name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    if validateJob(Player.PlayerData.job.name) then
        if Config.DjBooths[Zone].playing then
            Config.DjBooths[Zone].playing = false
            exports.xsound:Destroy(-1, Zone)
            TriggerEvent('qb-log:server:CreateLog', 'business', 'Stop Song', 'green', Lang:t('logs.stop_song', {
                name = ("%s(%s)"):format(name, GetPlayerName(source)),
                zone = Zone
            }))
        end
    else
        TriggerEvent('qb-log:server:CreateLog', 'business', 'Stop Song', 'red', Lang:t('logs.stop_song_unauth', {
            name = ("%s(%s)"):format(name, GetPlayerName(source)),
            zone = Zone
        }))
    end
end)

RegisterNetEvent('qb-businesses:server:pauseMusic', function(Zone)
    local Player = QBCore.Functions.GetPlayer(source)
    local name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    if validateJob(Player.PlayerData.job.name) then
        if Config.DjBooths[Zone].playing then
            Config.DjBooths[Zone].playing = false
            exports.xsound:Pause(-1, Zone)
            TriggerEvent('qb-log:server:CreateLog', 'business', 'Pause Song', 'green', Lang:t('logs.pause_song_unauth', {
                name = ("%s(%s)"):format(name, GetPlayerName(source)),
                zone = Zone
            }))
        end
    else
        TriggerEvent('qb-log:server:CreateLog', 'business', 'Pause Song', 'red', Lang:t('logs.pause_song_unauth', {
            name = ("%s(%s)"):format(name, GetPlayerName(source)),
            zone = Zone
        }))
    end
end)

RegisterNetEvent('qb-businesses:server:resumeMusic', function(Zone)
    local Player = QBCore.Functions.GetPlayer(source)
    local name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    if validateJob(Player.PlayerData.job.name) then
        if not Config.DjBooths[Zone].playing then
            Config.DjBooths[Zone].playing = true
            exports.xsound:Resume(-1, Zone)
            TriggerEvent('qb-log:server:CreateLog', 'business', 'Resume Song', 'green', Lang:t('logs.resume_song_unauth', {
                name = ("%s(%s)"):format(name, GetPlayerName(source)),
                zone = Zone
            }))
        end
    else
        TriggerEvent('qb-log:server:CreateLog', 'business', 'Resume Song', 'red', Lang:t('logs.resume_song_unauth', {
            name = ("%s(%s)"):format(name, GetPlayerName(source)),
            zone = Zone
        }))
    end
end)

RegisterNetEvent('qb-businesses:server:changeVolume', function(volume, Zone)
    local Player = QBCore.Functions.GetPlayer(source)
    local name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    if validateJob(Player.PlayerData.job.name) then
        if Config.DjBooths[Zone].playing then
            exports.xsound:setVolume(-1, Zone, volume)
            TriggerEvent('qb-log:server:CreateLog', 'business', 'Song Volume', 'green', Lang:t('logs.change_volume', {
                name = ("%s(%s)"):format(name, GetPlayerName(source)),
                volume = volume,
                zone = Zone
            }))
        end
    else
        TriggerEvent('qb-log:server:CreateLog', 'business', 'Song Volume', 'red', Lang:t('logs.change_volume_unauth', {
            name = ("%s(%s)"):format(name, GetPlayerName(source)),
            volume = volume,
            zone = Zone
        }))
    end
end)
