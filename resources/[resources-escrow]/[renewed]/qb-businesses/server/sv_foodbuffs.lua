
-- ** Releases stress of the src on the server side ** ----
local function RelieveStress(src, amount)
    local Player = QBCore.Functions.GetPlayer(src)
    local Stress = Player.PlayerData.metadata['stress']
    if not Stress then
        Player.PlayerData.metadata['stress'] = 0

        Stress = Player.PlayerData.metadata['stress']
    end

    if Stress - amount < 0 then
        Stress = 0
    else
        Stress = Player.PlayerData.metadata['stress'] - amount
    end


    Player.Functions.SetMetaData('stress', Stress)
    TriggerClientEvent('hud:client:UpdateStress', src, Stress)
    TriggerClientEvent('QBCore:Notify', src, 'You feel more relaxed', 4500, "success")
end

---- ** Updates the src needs server side ** ---
local function GiveFood(src, amount)
    local Player = QBCore.Functions.GetPlayer(src)
    local Thirst = Player.PlayerData.metadata["thirst"]
    local newFood = Player.PlayerData.metadata["hunger"]

    newFood = newFood + amount

    Player.Functions.SetMetaData('hunger', newFood)
    TriggerClientEvent("hud:client:UpdateNeeds", src, newFood, Thirst)
end

RegisterNetEvent('qb-businesses:server:foodBuffsAmt', function(src, CID, Table)
    if source ~= '' then return false end -- Safety check if the event was not called from the server.
    local hunger, sugar, protein, healthy, dairy, grain, seasoning = Table.hunger, Table.sugarAmt, Table.proteinAmt, Table.healthyAmt, Table.dairyAmt, Table.grainAmt, Table.seasoningAmt


    -- Hunger is the amount of food value the food contains. --
    -- Sugar is the amount of sugar the food contains. --
    -- Protein is the amount of protein the food contains. --
    -- Healthy is the amount of healthy the food contains. --
    -- Dairy is the amount of dairy the food contains. --
    -- Grain is the amount of grain the food contains. --
    -- Seasoning is the amount of seasoning the food contains. --


    GiveFood(src, hunger)

    -- If you don't use buffs tnj Buffs, you can then still use these numbers to whatever you'd like.

    if Config.EnableBuffs then
        local buffTable = {}

        -- ** Here's all the healthy buffs that excists, we call these server side as we dont want people to have them client side ** --
        if healthy >= 5 and healthy < 15 or seasoning >= 5 or healthy + seasoning >= 5 then
            exports['ps-buffs']:AddBuff(src, CID, 'luck', 10*60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel more lucky', "success",  4500)
        end

        if healthy >= 15 then
            exports['ps-buffs']:AddBuff(src, CID, 'luck', 35*60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel more lucky', "success", 4500)
        end

        -- ** Here's the relief stress part of the buffs, you can add or increase it however you'd like ** --
        if dairy >= 5 and dairy < 15 then
            RelieveStress(src, math.random(1,3))
        end

        if dairy >= 15 then
            RelieveStress(src, math.random(5,10))
        end

        -- ** Here's the grain buff which makes it so people dont need to eat as often, make sure to read the TNJ install guide to make sure this is correctly implemented ** --
        if grain >= 5 and grain < 15 then
            exports['ps-buffs']:AddBuff(src, CID, 'super-hunger', math.random(10, 15) * 60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel more full', "success", 4500)
        end

        if grain >= 15 then
            exports['ps-buffs']:AddBuff(src, CID, 'super-hunger', math.random(25, 35) * 60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel more full', "success", 4500)
        end

        -- ** Here's the sugar buff, makes it so people run slightly faster for a period of time, you can change the duration and amount, the amount cannot be higher than 1.49. ** --
        if sugar >= 5 and sugar < 15 then
            buffTable[#buffTable+1] = {
                buff = "stamina",
                duration = math.random(5, 10) * 1000,
                amount = 1.10
            }
            TriggerClientEvent('QBCore:Notify', src, 'You feel the sugar running through you', "success", 4500)
        end

        if sugar >= 15 then
            buffTable[#buffTable+1] = {
                buff = "stamina",
                duration = math.random(10, 20) * 1000,
                amount = 1.20
            }
            TriggerClientEvent('QBCore:Notify', src, 'You feel the sugar running through you', "success", 4500)
        end

        -- ** Here's the super buff, you can change this fi you'd like but this is gonna make it slightly easier to hack. ** --
        if (protein + healthy + dairy + grain + seasoning) >= 24 then -- Super food effective for hacking, means they needs atleast 6 ingredients with 4 values of each.
            exports['ps-buffs']:AddBuff(src, CID, 'intelligence', 20*60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel smarter', "success", 4500)
        end

        TriggerClientEvent('qb-businesses:client:SendClientBuffs', src, buffTable)
    end
end)

local function GiveWater(src, amount)
    local Player = QBCore.Functions.GetPlayer(src)
    local newThirst = Player.PlayerData.metadata["thirst"]
    local Food = Player.PlayerData.metadata["hunger"]

    newThirst = newThirst + amount

    Player.Functions.SetMetaData('thirst', newThirst)
    TriggerClientEvent("hud:client:UpdateNeeds", src, Food, newThirst)
end

RegisterNetEvent('qb-businesses:server:DrinkBuffsAmt', function(src, CID, Table)
    if source ~= '' then return false end -- Safety check if the event was not called from the server.
    local thirst, sugar, alcohol = Table.thirst, Table.sugarAmt, Table.alcoholAmt


    -- Thirst is the amount of food value the food contains. --
    -- Sugar is the amount of sugar the food contains. --
    -- Alcohol is the amount of protein the food contains. --


    GiveWater(src, thirst)

    if alcohol > 0 then
        TriggerClientEvent('qb-businesses:client:BecomeDrunk', src, alcohol)
    end

    if Config.EnableBuffs then
        local buffTable = {}

        -- ** Here's the grain buff which makes it so people dont need to eat as often, make sure to read the TNJ install guide to make sure this is correctly implemented ** --
        if thirst >= 5 and thirst < 15 then
            exports['ps-buffs']:AddBuff(src, CID, 'super-thirst', math.random(10, 15) * 60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel less thirsty', "success", 4500)
        end

        if thirst >= 15 then
            exports['ps-buffs']:AddBuff(src, CID, 'super-thirst', math.random(25, 35) * 60000)
            TriggerClientEvent('QBCore:Notify', src, 'You feel less thirsty', "success", 4500)
        end

        -- ** Here's the sugar buff, makes it so people run slightly faster for a period of time, you can change the duration and amount, the amount cannot be higher than 1.49. ** --
        if sugar >= 5 and sugar < 15 then
            buffTable[#buffTable+1] = {
                buff = "swimming",
                duration = math.random(5, 10) * 1000,
                amount = 1.10
            }
            TriggerClientEvent('QBCore:Notify', src, 'You feel the sugar running through you', "success", 4500)
        end

        if sugar >= 15 then
            buffTable[#buffTable+1] = {
                buff = "swimming",
                duration = math.random(10, 20) * 1000,
                amount = 1.20
            }
            TriggerClientEvent('QBCore:Notify', src, 'You feel the sugar running through you', "success", 4500)
        end

        TriggerClientEvent('qb-businesses:client:SendClientBuffs', src, buffTable)
    end
end)


---- REGISTERS ----

QBCore.Functions.CreateCallback("qb-businesses:server:getNearbyPlayers", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local nearbyPlayers = {}
    if validateJob(Player.PlayerData.job.name) then
        for k, v in pairs(QBCore.Functions.GetPlayers()) do
            local otherPlayer = QBCore.Functions.GetPlayer(v)
            if #(GetEntityCoords(GetPlayerPed(source))-GetEntityCoords(GetPlayerPed(v))) < 5 then
                nearbyPlayers[#nearbyPlayers+1] = {
                    value = v,
                    text = otherPlayer.PlayerData.charinfo.firstname .. ' ' .. otherPlayer.PlayerData.charinfo.lastname,
                }
            end
        end
    end
    cb(nearbyPlayers)
end)

RegisterNetEvent('qb-businesses:server:sendBillRequest', function(billData)
    billData.billed = tonumber(billData.billed)
    billData.amount = tonumber(billData.amount)
    local Player = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(billData.billed)
    if billData.billtype == 'cash' then
        TriggerClientEvent('qb-businesses:client:recievePayRequest', billData.billed, billData, source)
        TriggerClientEvent('QBCore:Notify', source, 'Cash Request Sent', 'success', 4500)
        TriggerClientEvent('QBCore:Notify', billData.billed, 'New Invoice Received', 4500)
    else
        MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (?, ?, ?, ?, ?)',{
            billed.PlayerData.citizenid,
            billData.amount,
            Player.PlayerData.job.name,
            (Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname),
            Player.PlayerData.citizenid
        })

        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success', 4500)
        TriggerClientEvent('QBCore:Notify', billData.billed, 'New Invoice Received', 'success', 4500)
    end
end)

RegisterNetEvent('qb-businesses:server:confirmPaymment', function(data)
    local billData = data.billData
    if data.accept then
        local biller = QBCore.Functions.GetPlayer(data.biller)
        local billed = QBCore.Functions.GetPlayer(billData.billed)
        if Config.EnableCommission then
            local commission = math.floor(billData.amount * (Config.PlayerCommission / 100))
            if billed.Functions.RemoveMoney("cash", billData.amount, "Restaurant Purchase")  then
                biller.Functions.AddMoney("cash", commission, "Restaurant Commission")
                billData.amount -= commission
                TriggerClientEvent('QBCore:Notify', data.biller, ('You have paid $%s!'):format(billData.amount), 'success', 4500)
                TriggerClientEvent('QBCore:Notify', billData.billed, ('You have earned $%s from Commissions!'):format(commission), 'success', 4500)
            else
                TriggerClientEvent('QBCore:Notify', data.biller, 'The citizen does not have enough money!', 'error')
                TriggerClientEvent('QBCore:Notify', billData.billed, 'You do not have enough money!', 'error')
                return
            end
        else
            if billed.Functions.RemoveMoney("cash", billData.amount, "Restaurant Purchase")  then
                TriggerClientEvent('QBCore:Notify', data.biller, ('You have paid $%s!'):format(billData.amount), 'success', 4500)
                TriggerClientEvent('QBCore:Notify', billData.billed, 'The citizen has paid the bill!', 'success', 4500)
            else
                TriggerClientEvent('QBCore:Notify', data.biller, 'The citizen does not have enough money!', 'error')
                TriggerClientEvent('QBCore:Notify', billData.billed, 'You do not have enough money!', 'error')
                return
            end
        end
        if Config.Society == 'qb-management' then
            exports['qb-management']:AddMoney(biller.PlayerData.job.name, billData.amount)
        elseif Config.Society == 'qb-bossmenu' then
            TriggerEvent('qb-bossmenu:server:addAccountMoney', biller.PlayerData.job.name, billData.amount)
        elseif Config.Society == "simplebanking" then
            TriggerEvent('qb-banking:society:server:DepositMoney', data.biller, billData.amount, biller.PlayerData.job.name)
        elseif Config.Society == "Renewed-Banking" then
            local billerName = ("%s %s"):format(biller.PlayerData.charinfo.firstname, biller.PlayerData.charinfo.lastname)
            local billedName = ("%s %s"):format(billed.PlayerData.charinfo.firstname, billed.PlayerData.charinfo.lastname)

            exports['Renewed-Banking']:handleTransaction(biller.PlayerData.job.name, "Product Purchase", billData.amount, billedName.." Has purchased a business product worth $"..billData.amount, billedName, billerName, "deposit")
            exports['Renewed-Banking']:addAccountMoney(biller.PlayerData.job.name, billData.amount)
        else
            print(("Society '%s' is not found"):format(Config.Society))
        end
    else
        TriggerClientEvent('QBCore:Notify', data.biller, 'The citizen Declined Payment!', 'error')
    end
end)