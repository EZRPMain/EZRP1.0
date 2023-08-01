local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("security_card_04", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("qb-truckrobbery:client:UseBlackCard", src)
end)

QBCore.Functions.CreateUseableItem("thermite", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.GetItemBySlot(item.slot) then
        TriggerClientEvent("thermite:UseThermite", source)
    end
end)

QBCore.Functions.CreateCallback('qb-truckrobbery:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

RegisterServerEvent("qb-truckrobbery:server:removeItem", function() 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["security_card_04"], "remove")  
    Player.Functions.RemoveItem("security_card_04", 1) 
end)

RegisterServerEvent('qb-truckrobbery:server:callCops', function(type, bank, streetLabel, coords)
    local cameraId = nil
    local bankLabel = "Banktruck"
    local msg = "Money transport being hit"
    local alertData = {
        title = "Banktruck",
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = msg,
    }
    TriggerClientEvent("qb-truckrobbery:client:robberyCall", -1, type, bank, streetLabel, coords)
    TriggerClientEvent("qb-phone:client:addPoliceAlert", -1, alertData)
end)

RegisterServerEvent('qb-truckrobbery:server:UpdatePlates', function(plate)
    Config.RobbedPlates[plate] = true
    TriggerClientEvent('qb-truckrobbery:client:UpdatePlates', -1, plate)
end)

RegisterServerEvent('qb-truckrobbery:server:RemoveDoors', function(truck)
    TriggerClientEvent('qb-truckrobbery:client:RemoveDoors', -1, truck)
end)

RegisterServerEvent('qb-truckrobbery:server:ThermitePtfx', function(coords)
    TriggerClientEvent('qb-truckrobbery:client:ThermitePtfx', -1, coords)
end)

RegisterServerEvent('qb-truckrobbery:server:addItem', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(source)

    -- inked money bags
    local info = {
        worth = math.random(12000, 14000)
    }
    Player.Functions.AddItem("markedbills", 2, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["markedbills"], "add") 
    TriggerEvent("qb-log:server:CreateLog", "truckrobbery", "Banktruck Rewards", "default", "**".. GetPlayerName(src) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."2".. ' x '.. "markedbills")

    -- cash rolls
    local amount = math.random(4000,6000)
    Player.Functions.AddItem("cash_roll", amount)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cash_roll"], "add")  
    TriggerEvent("qb-log:server:CreateLog", "truckrobbery", "Banktruck Rewards", "default", "**".. GetPlayerName(src) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '..amount.. ' x '.. "cash rolls")

    -- cards
    local tierChance = math.random(1, 100)
    local tier = 1
    if tierChance < 25 then tier = 1 elseif tierChance >= 25 and tierChance < 50 then tier = 2 elseif tierChance >= 50 and tierChance < 75 then tier = 3 else tier = 4 end
    if tier == 1 then
        Player.Functions.AddItem("security_card_01", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["security_card_01"], "add") 
        TriggerEvent("qb-log:server:CreateLog", "truckrobbery", "Banktruck Rewards", "green", "**".. GetPlayerName(src) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "security_card_01")
    elseif tier == 2 then
        Player.Functions.AddItem("security_card_02", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["security_card_02"], "add") 
        TriggerEvent("qb-log:server:CreateLog", "truckrobbery", "Banktruck Rewards", "green", "**".. GetPlayerName(src) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "security_card_02")
    elseif tier == 3 then
        Player.Functions.AddItem("security_card_03", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["security_card_03"], "add") 
        TriggerEvent("qb-log:server:CreateLog", "truckrobbery", "Banktruck Rewards", "green", "**".. GetPlayerName(src) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "security_card_03")
    elseif tier == 4 then
        Player.Functions.AddItem("security_card_04", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["security_card_04"], "add") 
        TriggerEvent("qb-log:server:CreateLog", "truckrobbery", "Banktruck Rewards", "green", "**".. GetPlayerName(src) .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the bank truck. **Loot**: '.."1".. ' x '.. "security_card_04")
    end
end)