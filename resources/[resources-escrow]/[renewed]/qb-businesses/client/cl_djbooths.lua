CreateThread(function()
    if Config.EnableDJ then
        for k, v in pairs(Config.DjBooths) do
            if v.job then
                exports['qb-target']:AddCircleZone("BusinessBooth"..k, v.coords, 0.5,
                {
                    name = "BusinessBooth"..k,
                    useZ = true,
                    debugPoly = Config.DebugPoly,
                }, {
                    options =
                    { {
                        event = "qb-businesses:client:OpenDJMenu",
                        icon = "fa-solid fa-microphone",
                        label = Lang:t('target.chairs_sitdown'),
                        job = v.job
                    }, },
                    distance = 2.5
                })
            else
                exports['qb-target']:AddCircleZone("BusinessBooth"..k, v.coords, v.pSize,
                {
                    name = "BusinessBooth"..k,
                    useZ = true,
                    debugPoly = false,
                }, {
                    options =
                    { {
                        event = "qb-businesses:client:OpenDJMenu",
                        icon = "fa-solid fa-microphone",
                        label = Lang:t('target.dj_booth'),
                    }, },
                    distance = 2.5
                })
            end
        end
    end
end)

-- Main Menu

RegisterNetEvent('qb-businesses:client:OpenDJMenu', function()
    local DjBoothShit = {
        {
            isHeader = true,
            icon = "fa-solid fa-compact-disc",
            header = 'DJ Booth'
        },

        {
            header = 'Play a song',
            icon = "fa-solid fa-music",
            txt = 'Enter a youtube URL',
            params = {
                event = 'qb-businesses:client:PlaySong',
                args = {
                    place = business
                }
            }
        },

        {
            header = 'Pause Music',
            icon = "fa-solid fa-pause",
            txt = 'Pause currently playing music',
            params = {
                isServer = true,
                event = 'qb-businesses:server:pauseMusic',
                args = business
            }
        },

        {
            header = 'Resume Music',
            icon = "fa-solid fa-forward",
            txt = 'Resume playing paused music',
            params = {
                isServer = true,
                event = 'qb-businesses:server:resumeMusic',
                args = business
            }
        },

        {
            header = 'Change Volume',
            icon = "fa-solid fa-volume-low",
            txt = 'Change volume of music',
            params = {
                event = 'qb-businesses:client:changeVolume',
                args = {
                    place = business
                }
            }
        },

        {
            header = 'Turn off music',
            icon = "fa-solid fa-volume-xmark",
            txt = 'Stop the music & choose a new song',
            params = {
                isServer = true,
                event = 'qb-businesses:server:stopMusic',
                args = business
            }
        }
    }

    exports[Config.Menu]:openMenu(DjBoothShit)
end)

RegisterNetEvent('qb-businesses:client:PlaySong', function()
    local dialog = exports[Config.Input]:ShowInput({
        header = 'Song Selection',
        submitText = "Submit",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'song',
                text = 'YouTube URL'
            },
            {
                type = 'number',
                isRequired = true,
                name = 'volume',
                text = 'Min: 1[Off] - Max: 100[Max]'
            }
        }
    })
    if dialog then
        if not dialog.song then return end
        Wait(500) -- Just incase shit happens
        if not dialog.volume then dialog.volume = 75 end
        TriggerServerEvent('qb-businesses:server:PlayBusinessSong', dialog.song, business, dialog.volume)
    end
end)

RegisterNetEvent('qb-businesses:client:changeVolume', function()
    local dialog = exports[Config.Input]:ShowInput({
        header = 'Music Volume',
        submitText = "Submit",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'volume',
                text = 'Min: 1[Off] - Max: 100[Max]'
            }
        }
    })
    if dialog then
        if not dialog.volume then return end
        TriggerServerEvent('qb-businesses:server:changeVolume', dialog.volume, business)
    end
end)