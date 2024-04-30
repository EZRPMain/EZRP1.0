-- MySQL.ready(function()
--     MySQL.Async.execute([[
--         CREATE TABLE IF NOT EXISTS svdden_gangs (
--             gangid VARCHAR(255), ############ gang leader
--             player_uid VARCHAR(255), ############ gang leader
--             members LONGTEXT, members json field
--             data LONGTEXT,
--         )
--     ]])
-- end)
--[[
    MySQL.query([[CREATE TABLE IF NOT EXISTS `svdden_gangs` (
        `id` INT(11) NOT NULL AUTO_INCREMENT,
        `leader` varchar(100) DEFAULT NULL,
        `name` varchar(100) NOT NULL,
        `members` longtext DEFAULT NULL,
        `data` longtext DEFAULT NULL,
        `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
        UNIQUE KEY `leader` (`leader`,`name`)
    )]]--)
--]]


MySQL.ready(function()
    MySQL.query([[CREATE TABLE IF NOT EXISTS `svdden_gangs` (
        `id` INT(11) NOT NULL AUTO_INCREMENT,
        `owner` VARCHAR(255) NOT NULL COLLATE 'utf8_general_ci',
        `name` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
        `gangUrl` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
        `rank` INT(11) NULL DEFAULT NULL,
        `rankLabel` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
        `description` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
        `wins` INT(11) NULL DEFAULT NULL,
        `losses` INT(11) NULL DEFAULT NULL,
        `members` LONGTEXT NOT NULL COLLATE 'utf8_general_ci',
        `activeWar` LONGTEXT NULL DEFAULT NULL COLLATE 'utf8_general_ci',
        `last_updated` TIMESTAMP NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
        PRIMARY KEY (`name`) USING BTREE,
        INDEX `id` (`id`) USING BTREE,
        INDEX `last_updated` (`last_updated`) USING BTREE
    )
    COLLATE='utf8_general_ci'
    ENGINE=InnoDB
    ;
    
    ]])
    print("Database Created")
end)

local gangs = {
    {
        -- id = 1,
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
            {
                id = 12,
                name = "rDWAD",
                rank = {
                    level = 2,
                    label = "Something"
                },
                online = true,
            },
            {
                id = 1322,
                name = "312312",
                rank = {
                    level = 2,
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
    },
    {
        -- id = 2,
        owner = "Tony",
        name = "Ballas",
        gangUrl = 'https://files.catbox.moe/apvvhz.png',
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
    },
    {
        -- id = 3,
        owner = "Fdwa",
        name = "GSF",
        gangUrl = 'https://files.catbox.moe/pa51ul.png',
        rank = 10,
        rankLabel = "Your Gang",
        description = 'dwadawdawdad!',
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
    },
}

function getGangNameById(gangId)
    for i = 1, #gangs do
        if gangs[i].id == gangId then
            return gangs[i].name
        end
    end
    return nil
end

function getGangUrlById(gangId)
    for i = 1, #gangs do
        if gangs[i].id == gangId then
            return gangs[i].gangUrl
        end
    end
    return nil
end

RegisterNetEvent('gangphone:server:submitWarDeclaration', function(warData)
    local enemyGangUrl = getGangUrlById(warData.attackingGangId)
    local name = getGangNameById(warData.attackingGangId)

    for i = 1, #warData.enemyGangIds do
        TriggerClientEvent('gangphone:client:reciveNotification', warData.enemyGangIds[i], {
            type = "WagerInvitation",
            name = name,
            description = "War Declaration",
            wager = {
                kills = warData.wager.kills,
                amount = warData.wager.amount,
            },
            enemyGangUrl = enemyGangUrl,
        })
    end
end)

RegisterCallback('fetchGangs', function()
    return gangs
end)