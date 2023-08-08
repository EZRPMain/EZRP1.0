local QBCore = exports['qb-core']:GetCoreObject()
local VinscratchBusy = false
local boostingBusy = false
local vinnum = {}
local timer = false

-- Set Vinscratch Busy
RegisterNetEvent('qb-vinscratch:server:SetVinJobBusy')
AddEventHandler('qb-vinscratch:server:SetVinJobBusy', function()
    if not VinscratchBusy then
        TriggerEvent('qb-vinscratch:server:BusyState')
        VinscratchBusy = true
    else
        TriggerClientEvent("QBCore:Notify", source, "I don't have a job for you right now", "error", 5000)
    end
end)

RegisterNetEvent('qb-vinscratch:server:BusyState')
AddEventHandler('qb-vinscratch:server:BusyState', function()
    if not VinscratchBusy then
        SetTimeout(Config.Cooldown * (60 * 1000), function() -- 20 Min cooldown for other Vehicles to be Scratched
            timeOut = false
            VinscratchBusy = false
        end)
    end
end)

QBCore.Functions.CreateCallback('qb-vinscratching:server:IsVinScratchBusy', function(source, cb)
    cb(VinscratchBusy)
end)

-- Set Boosting Busy
RegisterNetEvent('qb-vinscratch:server:SetBoostingBusy')
AddEventHandler('qb-vinscratch:server:SetBoostingBusy', function()
    if not boostingBusy then
        TriggerEvent('qb-vinscratch:server:BoostingBusyState')
        boostingBusy = true
    else
        TriggerClientEvent("QBCore:Notify", source, "I don't have a job for you right now", "error", 5000)
    end
end)

RegisterNetEvent('qb-vinscratch:server:BoostingBusyState')
AddEventHandler('qb-vinscratch:server:BoostingBusyState', function()
    if not boostingBusy then
        SetTimeout(Config.BoostingCooldown * (60 * 1000), function() -- 10 Min cooldown for other Vehicles to be Scratched
            timeOut = false
            boostingBusy = false
        end)
    end
end)

QBCore.Functions.CreateCallback('qb-vinscratching:server:IsBoostingBusy', function(source, cb)
    cb(boostingBusy)
end)

-- Money check works for both jobs and set them busy
RegisterNetEvent('qb-vinscratch:server:MoneyCheck')
AddEventHandler('qb-vinscratch:server:MoneyCheck', function(job)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.PlayerData.money.cash >= Config.StartPrice then
        Player.Functions.RemoveMoney('cash', Config.StartPrice)
        TriggerClientEvent('qb-vinscratch:RecievingJob', source)
    else
        TriggerClientEvent("QBCore:Notify", source, "Not enough money for me", "error", 5000)
    end

    if job == vinscratch then 
        TriggerEvent('qb-vinscratch:server:SetVinJobBusy')
    else 
        TriggerEvent('qb-vinscratch:server:SetBoostingBusy')
    end
end)

-- Vinscratching event to own the vehicle
RegisterNetEvent('qb-vinscratch:server:GetVehicleWhenDone')
AddEventHandler('qb-vinscratch:server:GetVehicleWhenDone', function(vehicle, licenseplate)
    -- Player Data stuff
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)

    -- Reputation reward system
    local CurRep = pData.PlayerData.metadata["boostingrep"]
    local BoostingReward = math.random(10, 45) 

    pData.Functions.SetMetaData('boostingrep', (CurRep - BoostingReward))

    -- Database
    local vinnum = "scratched"
    local cid = pData.PlayerData.citizenid
    local plate = licenseplate

    if Config.Wrapper == "ox" then
        exports.oxmysql:insert('INSERT INTO player_vehicles (license, citizenid, vehicle, vinnum, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
            pData.PlayerData.license,
            cid,
            vehicle,
            vinnum,
            GetHashKey(vehicle),
            '{}',
            plate,
            0
        })
        TriggerEvent('qb-log:server:CreateLog', 'boosting', 'Vehicle Scratched', 'green', '**Vehicle**:\n'..vehicle..'\n\n**Person**:\n'..GetPlayerName(src))
    elseif Config.Wrapper == "ghm" then 
        exports.ghmattimysql:execute('INSERT INTO player_vehicles (steam, citizenid, vehicle, vinnum, hash, mods, plate, state) VALUES (@steam, @citizenid, @vehicle, @vinnum, @hash, @mods, @plate, @state)', {
            ['@steam'] = pData.PlayerData.steam,
            ['@citizenid'] = cid,
            ['@vehicle'] = vehicle,
            ['@vinnum'] = vinnum,
            ['@hash'] = GetHashKey(vehicle),
            ['@mods'] = '{}',
            ['@plate'] = plate,
            ['@state'] = 0
        })
        TriggerEvent('qb-log:server:CreateLog', 'boosting', 'Vehicle Scratched', 'green', '**Vehicle**:\n'..vehicle..'\n\n**Person**:\n'..GetPlayerName(src))
    end
end)

-- Create useable item for the electronickit, will change this item later with uses.
QBCore.Functions.CreateUseableItem(Config.HackItem , function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName(Config.HackItem) ~= nil then
        TriggerClientEvent("qb-vinscratch:client:trackremover", source)
    end
end)


        -- ALl the cop triggers server side
    -- GPS Update server side so cops get update
RegisterServerEvent('qb-vinscratch:gps')
AddEventHandler('qb-vinscratch:gps', function(coords)
	TriggerClientEvent('qb-vinscratch:vehblip',-1,coords)
end)

    -- Callback to send all cops a notification upon someone going near the vehicle
RegisterServerEvent('qb-vinscratch:server:callCops')
AddEventHandler('qb-vinscratch:server:callCops', function(streetLabel, coords, job, LicensePlate, vehname)
    local LicensePLate = LicensePlate
    if job == 'boosting' then
        local msg
        msg = vehname.." with plate "..LicensePLate.." Is getting stolen!"
        local alertData = {
            title = "Advanced Vehicle Robbery",
            coords = {x = coords.x, y = coords.y, z = coords.z},
            description = msg,
        }
        TriggerClientEvent("qb-vinscratch:client:robberyCall", -1, streetLabel, coords, LicensePLate, vehname)
        TriggerClientEvent("qb-phone:client:addPoliceAlert", -1, alertData)
    elseif job == 'vinscratch' then 
        local msg 
        msg = vehname.." with plate "..LicensePLate.." Is getting stolen!"
        local alertData = {
            title = "Advanced Vehicle Robbery",
            coords = {x = coords.x, y = coords.y, z = coords.z},
            description = msg,
        }
        TriggerClientEvent("qb-vinscratch:client:robberyCall", -1, streetLabel, coords, LicensePLate, vehname)
        TriggerClientEvent("qb-phone:client:addPoliceAlert", -1, alertData)
    end
end)

    -- Cop/Mechanic trigger to see if the whether or not the vehicle is Scrated. 
RegisterNetEvent('qb-vinscratch:server:testVINS')
AddEventHandler('qb-vinscratch:server:testVINS', function(CloestVehiclePlate)
    local src = source
    local ped = GetPlayerPed(src)
    local plate = CloestVehiclePlate
    if Config.Wrapper == "ox" then
        local Vinnumber = exports.oxmysql:scalarSync('SELECT vinnum FROM player_vehicles WHERE plate = ?', {plate})
        if Vinnumber == "scratched" then
            TriggerClientEvent('QBCore:Notify', src, 'Vinnumber is Destroyed', 'error')
        else 
            TriggerClientEvent('QBCore:Notify', src, 'Vinnumber is Intact', 'success')
        end
    elseif Config.Wrapper == "ghm" then 
        local Vinnumber = exports['ghmattimysql']:execute('SELECT vinnum FROM player_vehicles WHERE plate = ?', {plate})
        if Vinnumber == "scratched" then
            TriggerClientEvent('QBCore:Notify', src, 'Vinnumber is Destroyed', 'error')
        else 
            TriggerClientEvent('QBCore:Notify', src, 'Vinnumber is Intact', 'success')
        end
    end
end) 


RegisterNetEvent('qb-vinscratch:server:GetMonitaryReward')
AddEventHandler('qb-vinscratch:server:GetMonitaryReward', function(vehicle, damage, job, tier)
    -- Player stuff for functions
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    -- Money Bits
    local pay = Config.BasePrice
    local DamagePay = pay*Config.LessMoney
    -- Rep Stuff
    local CurRep = Player.PlayerData.metadata["boostingrep"]
    local BoostingReward = math.random(10,30) 
    local DamagedBoosting = math.random(5,20)
    -- If statements
    if job == 'boosting' or 'vinscratch' then
        if damage <= 710 and Config.CarDamage == true then 
            if tier == "C" then
                Player.Functions.AddMoney('cash', DamagePay)
                Player.Functions.SetMetaData('boostingrep', (CurRep + DamagedBoosting))
                TriggerClientEvent("QBCore:Notify", source, "You got a reward of $ "..DamagePay.." from a "..vehicle,"success", 5000)
            elseif tier == "B" then 
                Player.Functions.AddMoney('cash', DamagePay*1.3)
                Player.Functions.SetMetaData('boostingrep', (CurRep + DamagedBoosting))
                TriggerClientEvent("QBCore:Notify", source, "You got a reward of $ "..DamagePay.." from a "..vehicle,"success", 5000)
            elseif tier == "A" then
                Player.Functions.AddMoney('cash', DamagePay*1.6)
                Player.Functions.SetMetaData('boostingrep', (CurRep + DamagedBoosting))
                TriggerClientEvent("QBCore:Notify", source, "You got a reward of $ "..DamagePay.." from a "..vehicle,"success", 5000)
            elseif tier == "S" then 
                Player.Functions.AddMoney('cash', DamagePay*1.9)
                Player.Functions.SetMetaData('boostingrep', (CurRep + DamagedBoosting))
                TriggerClientEvent("QBCore:Notify", source, "You got a reward of $ "..DamagePay.." from a "..vehicle,"success", 5000)
            elseif tier == "S+" then
                Player.Functions.AddMoney('cash', DamagePay*2.5)
                Player.Functions.SetMetaData('boostingrep', (CurRep + DamagedBoosting))
                TriggerClientEvent("QBCore:Notify", source, "You got a reward of $ "..DamagePay.." from a "..vehicle,"success", 5000)
            end
            TriggerEvent('qb-log:server:CreateLog', 'boosting', 'Boosting Cash', 'green', '**Cash**:\n'..DamagePay..'\n\n**Rep Given**:\n'..DamagedBoosting..'\n**Person**:\n'..GetPlayerName(src))
        else
            if tier == "C" then
                Player.Functions.AddMoney('cash', pay)
                Player.Functions.SetMetaData('boostingrep', (CurRep + BoostingReward))
                TriggerClientEvent("QBCore:Notify", source, "You got a reward of $ "..pay.." from a "..vehicle,"success", 5000)
            elseif tier == "B" then 
                Player.Functions.AddMoney('cash', pay*1.3)
                Player.Functions.SetMetaData('boostingrep', (CurRep + BoostingReward))
                TriggerClientEvent("QBCore:Notify", source, "You got a reward of $ "..pay.." from a "..vehicle,"success", 5000)
            elseif tier == "A" then
                Player.Functions.AddMoney('cash', pay*1.6)
                Player.Functions.SetMetaData('boostingrep', (CurRep + BoostingReward))
                TriggerClientEvent("QBCore:Notify", source, "You got a reward of $ "..pay.." from a "..vehicle,"success", 5000)
            elseif tier == "S" then 
                Player.Functions.AddMoney('cash', pay*1.9)
                Player.Functions.SetMetaData('boostingrep', (CurRep + BoostingReward))
                TriggerClientEvent("QBCore:Notify", source, "You got a reward of $ "..pay.." from a "..vehicle,"success", 5000)
            elseif tier == "S+" then
                Player.Functions.AddMoney('cash', pay*2.5)
                Player.Functions.SetMetaData('boostingrep', (CurRep + BoostingReward))
                TriggerClientEvent("QBCore:Notify", source, "You got a reward of $ "..pay.." from a "..vehicle,"success", 5000)
            end
            TriggerEvent('qb-log:server:CreateLog', 'boosting', 'Boosting Cash', 'green', '**Cash**:\n'..pay..'\n\n**Rep Given**:\n'..BoostingReward..'\n**Person**:\n'..GetPlayerName(src))
        end
    else 
        -- Put a ban trigger here as modders will try to claim here. 
        -- It's impossible for a normal human to be banned as they would have either job
    end
end)

RegisterNetEvent('qb-vinscratch:server:JobPunishment')
AddEventHandler('qb-vinscratch:server:JobPunishment', function(job)
    -- Player stuff for functions
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local CurRep = Player.PlayerData.metadata["boostingrep"]
    local BoostingPunishment = math.random(5,25) 

    if job == 'boosting' then
        if CurRep >= BoostingPunishment then
            Player.Functions.SetMetaData('boostingrep', (CurRep - BoostingPunishment))
        else 
            Player.Functions.SetMetaData('boostingrep', 0)
        end
        TriggerEvent('qb-log:server:CreateLog', 'boosting', 'Boosting Rep Lost', 'red', '**Lost Rep**:\n'..BoostingPunishment..'\n\n**Person**:\n'..GetPlayerName(src))
    elseif job == 'vinscratch' then
        if CurRep >= BoostingPunishment then
            Player.Functions.SetMetaData('boostingrep', (CurRep - BoostingPunishment))
        else 
            Player.Functions.SetMetaData('boostingrep', 0)
        end
        TriggerEvent('qb-log:server:CreateLog', 'boosting', 'Boosting Rep Lost', 'red', '**Lost Rep**:\n'..BoostingPunishment..'\n\n**Person**:\n'..GetPlayerName(src))
    end
end)

RegisterNetEvent('qb-vinscratch:server:GetRareItem')
AddEventHandler('qb-vinscratch:server:GetRareItem', function(vehicle, job)
    -- Player stuff for functions
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    -- Item Bits
    local item = Config.RareItem
    local amount = 1

    if job == 'boosting' or 'vinscratch' then
        Player.Functions.AddItem(item, amount, false, info)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")

        TriggerClientEvent("QBCore:Notify", source, "You got a "..item.." from the "..vehicle, "success", 5000)

        TriggerEvent('qb-log:server:CreateLog', 'boosting', 'Boosting Rare Item', 'green', '**Item Given**:\n'..item..'\n\n**Person**:\n'..GetPlayerName(src))
    else 

    end
end)

RegisterNetEvent('qb-vinscratch:server:GetHackingItem')
AddEventHandler('qb-vinscratch:server:GetHackingItem', function(job)
    -- Player stuff for functions
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    -- Item Bits
    local item = Config.HackItem
    local amount = 1

    if job == 'boosting' or 'vinscratch' then
        Player.Functions.AddItem(item, amount, false)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")

        TriggerClientEvent("QBCore:Notify", source, "You got a "..item.." from the "..vehicle, "success", 5000)

        TriggerEvent('qb-log:server:CreateLog', 'boosting', 'Boosting Hacking Item', 'green', '**Item Given**:\n'..item..'\n\n**Person**:\n'..GetPlayerName(src))
    else 
        -- Put a ban trigger here as modders will try to claim here. 
        -- It's impossible for a normal human to be banned as they would have either job
    end
end)

QBCore.Functions.CreateCallback('qb-vinscratch:server:GetItem', function(source, cb, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then 
        local itemz = Player.Functions.GetItemByName(item)
        if itemz ~= nil then
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)