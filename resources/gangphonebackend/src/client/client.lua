local notifications, gangs = {}, {}

local myGang = {
    gang = {
        id = 1,
        owner = "Svdden",
        name = "GSF",
        gangUrl = 'https://files.catbox.moe/pa51ul.png',
        rank = 10,
        rankLabel = "Your Gang",
        description = 'My gang is the best gang in the world!',
        wins = 55,
        losses = 32,
        members = {
            {
                id = 1,
                name = "Svdden",
                rank = {
                    level = 10,
                    label = "Something"
                },
                online = true,
            },
        },
        activeWar = {
            userGang = {
                name = "GSF",
                gangUrl = 'https://files.catbox.moe/pa51ul.png',
                score = 22,
            },
            enemyGang = {
                name = "Ballas",
                gangUrl = 'https://files.catbox.moe/apvvhz.png',
                score = 9,
            },
            totalRounds = 50,
        },
    }
}

RegisterCommand('gphone', function()
    SendNUIMessage({
        action = 'setVisible',
        data = {
            visible = true,
            gang = myGang,
            gangs = Callbacks.Await('fetchGangs')
        }
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback('hideUI', function(_, cb)
    cb({})
    SetNuiFocus(false, false)
end)

RegisterNUICallback('submitWarDeclaration', function(data, cb)
    local enemyGangIds = {}
    for i = 1, #gangs do
        if i == data.enemyGangId + 1 then
            for j = 1, #gangs[i].members do
                enemyGangIds[#enemyGangIds + 1] = gangs[i].members[j].id
            end
            break
        end
    end

    TriggerServerEvent('gangphone:server:submitWarDeclaration', {
        attackingGangId = myGang.gang.id,
        defendingGangId = data.enemyGangId,
        wager = {
            kills = data.kills,
            amount = data.amount
        },
        enemyGangIds = enemyGangIds
    })
    cb(true)
end)

RegisterNUICallback('promoteMember', function(memberId, cb)
    print('member with id ' .. memberId .. ' was promoted')
    cb(true)
end)

RegisterNUICallback('demoteMember', function(memberId, cb)
    print('member with id ' .. memberId .. ' was demoted')
    cb(true)
end)

RegisterNUICallback('acceptNotification', function(notificationId, cb)
    table.remove(notifications, notificationId)
    cb(notifications)
end)

RegisterNUICallback('declineNotification', function(notificationId, cb)
    table.remove(notifications, notificationId)
    cb(notifications)
end)

RegisterNUICallback('getMembers', function(_, cb) -- This is for the hire menu
    local members = {
        {
            name = "Svdden Devs",
            gang = "No Gang",
        },
        {
            name = "Deezy",
            gang = "No Gang"
        }
    }

    cb(members)
end)

RegisterNUICallback("getMyGang", function(_, cb)
    cb(myGang)
end)

RegisterNUICallback("getGangs", function(_, cb)
    local gangsData = Callbacks.Await('fetchGangs')
    cb(gangsData)
end)

RegisterNUICallback("getGangById", function(gangId, cb)
    local gangsData = Callbacks.Await('fetchGangs')
    cb(gangsData[gangId + 1])
end)

RegisterNUICallback("getNotifications", function(_, cb)
    cb(notifications)
end)

RegisterNetEvent('gangphone:client:reciveNotification', function(data)
    notifications[#notifications + 1 ] = { type = data.type, name = data.name, description = data.description, wager = data.wager, enemyGangUrl = data.enemyGangUrl }

    SendNUIMessage({ action = 'updateNotifications', data = notifications })
end)