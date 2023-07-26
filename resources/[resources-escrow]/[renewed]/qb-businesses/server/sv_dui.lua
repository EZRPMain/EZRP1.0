RegisterNetEvent("qb-businesses:server:SetDUI", function(business, id, url)
    local Player = QBCore.Functions.GetPlayer(source)
    local name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    if validateJob(Player.PlayerData.job.name) then
        if not Config.DUI[business] then print('^6[^3qb-businesses^6]^0 Business does not have DUI configured'); return end
        if not Config.DUI[business][id] then print(('^6[^3qb-businesses^6]^0 Business does not have a DUI with ID: %s configured'):format(id)); return end
        Config.DUI[business][id].url = url
        local newDuiData = {}
        for k=1, #Config.DUI[business] do
            newDuiData[k] = Config.DUI[business][k].url
        end
        MySQL.query("INSERT INTO business_data (id, dui) VALUES (:id, :dui) ON DUPLICATE KEY UPDATE dui = :dui",{
            ['id'] = business,
            ['dui'] = json.encode(newDuiData)
        })
        TriggerClientEvent("qb-businesses:client:updateDUI",-1, business, id, url)
        TriggerEvent('qb-log:server:CreateLog', 'business', 'DUI Set', 'green', Lang:t('logs.dui_update', {
            name = ("%s(%s)"):format(name, GetPlayerName(source)),
            id = id,
            url = url,
            zone = business
        }))
    else
        TriggerEvent('qb-log:server:CreateLog', 'business', 'DUI Set', 'red', Lang:t('logs.dui_update_unauth', {
            name = ("%s(%s)"):format(name, GetPlayerName(source)),
            id = id,
            url = url,
            zone = business
        }))
    end
end)

RegisterNetEvent('qb-businesses:server:resetPainting', function(data)
    local Player = QBCore.Functions.GetPlayer(source)
    local name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    if validateJob(Player.PlayerData.job.name) then
        local newDuiData = {}
        for k=1, #Config.DUI[data.business] do
            Config.DUI[data.business][k].url = nil
            newDuiData[k] = nil
        end
        MySQL.query("INSERT INTO business_data (id, dui) VALUES (:id, :dui) ON DUPLICATE KEY UPDATE dui = :dui",{
            ['id'] = data.business,
            ['dui'] = json.encode(newDuiData)
        })
        TriggerClientEvent("qb-businesses:client:resetPainting",-1, data)
        TriggerEvent('qb-log:server:CreateLog', 'business', 'DUI Reset', 'green', Lang:t('logs.dui_reset', {
            name = ("%s(%s)"):format(name, GetPlayerName(source)),
            zone = data.business
        }))
    else
        TriggerEvent('qb-log:server:CreateLog', 'business', 'DUI Reset', 'red', Lang:t('logs.dui_reset_unauth', {
            name = ("%s(%s)"):format(name, GetPlayerName(source)),
            zone = data.business
        }))
    end
end)

QBCore.Functions.CreateCallback('qb-businesses:server:GetDuis', function(source, cb, area)
    cb(Config.DUI)
end)