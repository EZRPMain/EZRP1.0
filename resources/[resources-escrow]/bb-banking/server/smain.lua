
local bbcoinData = {}

CreateThread(function()
    while not Core do Wait(0) end

    BBBankingCore['functions'].ExecuteSql(false, "SELECT * FROM `bbanking_cards`", function(cards)
        if cards then
            for k, v in pairs(cards) do
                v['data'] = json.decode(v['data'])
                v['daily'] = 0
            end
            BBBankingCore['functions'].SetCards(cards)
        else
            BBBankingCore['functions'].SetCards({})
        end
    end)
    if BBBankingCore['config']['enableHud'] then
        RegisterCommand('cash', function(source, args)
            local src = source
            local player = Core.Functions.GetPlayer(src)
            TriggerClientEvent('bb-banking:client:refreshNui', src, {type = 'cash', casheData = {amount = player.PlayerData.money.cash}})
        end)
    end

    if BBBankingCore['config']['enableWallet'] then
        RegisterCommand('wallet', function(source, args)
            local src = source
            local player = Core.Functions.GetPlayer(src)
            local ply = BBBankingCore['functions'].GetPlayerData(src)
            TriggerClientEvent('bb-banking:client:triggerWallet', src, {
                type =  'wallet',
                wallet = GetCurrentCards(ply.identifier),
                iban = ply.iban,
                nui = BBBankingCore['config']['nui'],
                cash = player.PlayerData.money.cash
            })
        end)
    end

    if BBBankingCore['config']['enableATMs'] then
        RegisterCommand('atm', function(source, args)
            local src = source
            local id = BBBankingCore['functions'].GetPlayerData(src).identifier
            TriggerClientEvent('bb-banking:client:triggerAtm', src, {
                cards = GetCurrentCards(id),
                nui = BBBankingCore['config']['nui'],
                fees = BBBankingCore['config']['fees']
            })
        end)
    end
    
    print('^5[barbaroNNs Banking] ^7Loading crypto..')
    -- Crypto
    CreateThread(function()
        Wait(1000)
        while true do
            bbcoinData = {}
            bbcoinData['chart'] = {}
            PerformHttpRequest("https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD", function(err, text, headers) 
                if text then
                    local data = json.decode(text)
                    local pric = data['USD']
                    bbcoinData['price'] = tonumber(pric) * BBBankingCore['config']['cryptoPresentage']
                    PerformHttpRequest("https://min-api.cryptocompare.com/data/v2/histoday?fsym=BTC&tsym=USD&limit=30", function(err, text, headers) 
                        if text then
                            local data = json.decode(text)
                            local rates = data['Data']['Data']
                            local chart = bbcoinData['chart']
                            for _, v in pairs(rates) do
                                local day = os.date("%d", v.time)
                                local month = os.date("%m", v.time)
                                table.insert(chart, {
                                    date = {day, month},
                                    price = tonumber(v.close) * BBBankingCore['config']['cryptoPresentage']
                                })
                            end
                            table.sort(chart, function(a, b)
                                if a.date[2] ~= b.date[2] then
                                    return a.date[2] < b.date[2]
                                end
                            
                                return a.date[1] < b.date[1]
                            end)
                            print('^5[barbaroNNs Banking] ^7Refreshed crypto prices, Current value: ' .. bbcoinData['price'])
                            bbcoinData['presentage'] = ((tonumber(bbcoinData['price']) - tonumber(chart[30]['price'])) / tonumber(chart[30]['price'])) * 100
                            TriggerClientEvent('bb-banking:client:refreshNui', -1, {
                                type = 'crypto',
                                crypto = {
                                    price = bbcoinData['price'],
                                    presantage = bbcoinData['presentage'],
                                    chart = bbcoinData['chart']
                                }
                            })
                        end
                    end)
                end
            end)
            Wait(900000) -- 15 mins
        end
    end)
    while not bbcoinData['presentage'] do Wait(0) end

    print('^5[barbaroNNs Banking] ^7Successfully loaded BB-BANKING_FULL_QBUS_FINAL')
end)

RegisterServerEvent('bb-banking:server:setNui', function()
    local src = source
    print('sending', BBBankingCore['config']['nui']['customColor'])
    if not bbcoinData['price'] then return end

    TriggerClientEvent('bb-banking:client:setNui', src, '', {
        logo = BBBankingCore['config']['nui']['logo'],
        stats = BBBankingCore['config']['enableStatements'],
        color = BBBankingCore['config']['nui']['customColor'],
    }, {
        type = 'crypto',
        crypto = {
            price = bbcoinData['price'],
            presantage = bbcoinData['presentage'],
            chart = bbcoinData['chart']
        }
    })

    print('here')
end)

RegisterServerEvent('bb-banking:server:isRegistered')
AddEventHandler('bb-banking:server:isRegistered', function()
    local src = source
    local player = Core.Functions.GetPlayer(src)
    local identifier = BBBankingCore['functions'].GetIdentifier(src, player)

    local iban = player.PlayerData.charinfo.account
    BBBankingCore['functions'].ExecuteSql(false, "SELECT * FROM `bbanking_accounts` WHERE `type` = 'crypto' LIMIT 1", function(res)
        if not res[1] then
            BBBankingCore['functions'].ExecuteSql(false, "INSERT INTO `bbanking_accounts` (`identifier`, `type`, `amount`) VALUES ('" .. iban .. "', 'crypto', '0')")
            CreateStatment(src, iban, 'GOVERMENT_PAYOUT', 'account', 'deposit', BBBankingCore['config']['startingMoney'], 'New account')
        end

        local playerData = {}
        playerData.identifier = identifier
        local playercharname = BBBankingCore['functions'].GetCharacterName(player)
        if playercharname then
            playerData.name = playercharname
        end
        playerData.iban = iban

        BBBankingCore['functions'].ExecuteSql(false, "SELECT * FROM `bbanking_statements` WHERE `iban` = '" .. iban .. "'", function(stats)
            playerData.stats = stats

            BBBankingCore['functions'].ExecuteSql(false, "SELECT * FROM `bbanking_accounts` WHERE `identifier` = '" .. iban .. "'", function(acc)
                local accounts = {}
                for k, v in pairs(acc) do
                    accounts[v.type] = v
                end

                playerData.accounts = accounts
                BBBankingCore['functions'].SetPlayerData(src, playerData)
                TriggerClientEvent('bb-banking:client:registerPlayer', src)
                Embed(src, 'Player Loaded', "Successfully loaded player", 0)
            end)
        end)
    end)
end)

Core.Functions.CreateCallback('bb-banking:server:getPlayerData', function(source, cb)
    local src = source
    cb(getPlayerData(src))
end)

RegisterServerEvent('bb-banking:server:createSavingAccount')
AddEventHandler('bb-banking:server:createSavingAccount', function()
    local src = source
    local playerData = BBBankingCore['functions'].GetPlayerData(src)
    BBBankingCore['functions'].ExecuteSql(false, "INSERT INTO `bbanking_accounts` (`identifier`, `type`, `amount`) VALUES ('" .. playerData['iban'] .. "', 'saving', '0')")

    PlayersData[src]['accounts']['saving'] = {
        id = -1,
        identifier = playerData['iban'],
        type = 'saving',
        amount = 0,
    }
    Embed(src, 'Created Saving Account', "Successfully created saving account", 0)
end)

RegisterServerEvent('bb-banking:server:withdrawEvent')
AddEventHandler('bb-banking:server:withdrawEvent', function(data)
    local src = source
    local xPlayer = Core.Functions.GetPlayer(src)
    local playerData = BBBankingCore['functions'].GetPlayerData(src)
    local actionType = data['account']

    if actionType == 'account' then
        local currentBalance = xPlayer.PlayerData.money.bank
        local amount = tonumber(data['amount'])
        
        if amount <= currentBalance then
            xPlayer.Functions.RemoveMoney('bank', amount, 'BANK_WITHDRAW')
            xPlayer.Functions.AddMoney('cash', math.floor(amount * ((100 - BBBankingCore['config']['fees']['withdraw']) / 100)), 'BANK_WITHDRAW')

            TriggerClientEvent('bb-banking:client:refreshNui', src, {
                data = getPlayerData(src),
                message = {'success', tostring(amount) .. Locales['Server']['sWithdrawnS'], ''},
            })
            Embed(src, 'Account Withdraw', "Successfully withdrawn $" .. amount, 0)
        end
    elseif actionType == 'saving' then
        local currentBalance = playerData['accounts']['saving']['amount']
        local amount = tonumber(data['amount'])
        
        if amount <= currentBalance then
            BBBankingCore['functions'].ExecuteSql(false, "UPDATE `bbanking_accounts` SET `amount` = '" .. (currentBalance - amount) .. "' WHERE `identifier` = '" .. playerData['iban'] .. "' AND `type` = 'saving'")
            playerData['accounts']['saving']['amount'] = currentBalance - amount
            xPlayer.Functions.AddMoney('bank', amount, 'Saving Withdraw To ' .. playerData['iban'])

            TriggerClientEvent('bb-banking:client:refreshNui', src, {
                data = getPlayerData(src),
                message = {'success', tostring(amount) .. Locales['Server']['sWithdrawnT'], ''},
            })
            Embed(src, 'Saving Withdraw', "Successfully withdrawn $" .. amount, 0)
        end
    end
end)

RegisterServerEvent('bb-banking:server:depositEvent')
AddEventHandler('bb-banking:server:depositEvent', function(data)
    local src = source
    local xPlayer = Core.Functions.GetPlayer(src)
    local playerData = BBBankingCore['functions'].GetPlayerData(src)
    local actionType = data['account']

    if actionType == 'account' then
        local currentCash = xPlayer.PlayerData.money.cash
        local amount = tonumber(data['amount'])
        
        if amount <= currentCash then
            xPlayer.Functions.RemoveMoney('cash', amount)
            xPlayer.Functions.AddMoney('bank', amount, 'DEPOSIT_FROMCASH')
            
            TriggerClientEvent('bb-banking:client:refreshNui', src, {
                data = getPlayerData(src),
                message = {'success', tostring(amount) .. Locales['Server']['sDepoT'], ''},
            })
            Embed(src, 'Account Deposit', "Successfully deposited $" .. amount, 0)
        end
    elseif actionType == 'saving' then
        local currentBalance = xPlayer.PlayerData.money.bank
        local currentSaving = playerData['accounts']['saving']['amount']
        local amount = tonumber(data['amount'])
        
        if amount <= currentBalance then
            xPlayer.Functions.RemoveMoney('bank', amount, 'Saving Deposit From ' .. playerData['iban'])
            BBBankingCore['functions'].ExecuteSql(false, "UPDATE `bbanking_accounts` SET `amount` = '" .. (currentSaving + amount) .. "' WHERE `identifier` = '" .. playerData['iban'] .. "' AND `type` = 'saving'")
            playerData['accounts']['saving']['amount'] = currentSaving + amount
            
            TriggerClientEvent('bb-banking:client:refreshNui', src, {
                data = getPlayerData(src),
                message = {'success', tostring(amount) .. Locales['Server']['sDepoS'], ''},
            })
            Embed(src, 'Saving Deposit', "Successfully deposited $" .. amount, 0)
        end
    end
end)

RegisterServerEvent('bb-banking:server:transferEvent')
AddEventHandler('bb-banking:server:transferEvent', function(data)
    local src = source
    local xPlayer = Core.Functions.GetPlayer(src)
    local playerData = BBBankingCore['functions'].GetPlayerData(src)
    local currentBalance = xPlayer.PlayerData.money.bank
    local amount = tonumber(data['amount'])
    
    if currentBalance >= amount then
        local rIban = data['account']
        local rSource = GetSourceFromIban(rIban)
        if rSource then
            local rPlayer = Core.Functions.GetPlayer(rSource)
            if rPlayer then
                xPlayer.Functions.RemoveMoney('bank', amount, 'Transfered to ' .. rIban)
                rPlayer.Functions.AddMoney('bank', amount, 'Transfered from ' .. playerData['iban'])

                TriggerClientEvent('bb-banking:client:refreshNui', src, {
                    data = getPlayerData(src),
                    message = {'success', tostring(amount) .. Locales['Server']['sTransT'] .. rIban, ''},
                })
                Embed(src, 'Account Transfer', "Successfully transfered $" .. amount .. ' to [Identifier: ' .. rIban .. '] Online', 0)
            else
                TriggerClientEvent('bb-banking:client:refreshNui', src, {
                    data = getPlayerData(src),
                    message = {'error', Locales['Server']['sTrans_ERR_SRC'], ''},
                })
                Embed(src, 'Account Transfer', "Wrong source, Tried to transfer $" .. amount .. ' to [Identifier: ' .. rIban .. ']', 1)
            end
        else
            BBBankingCore['functions'].ExecuteSql(false, "SELECT * FROM `players` WHERE `charinfo` LIKE '%".. iban .."%' LIMIT 1", function(account)
                local rAccountDB = account[1]
                if rAccountDB then
                    local rAccounts = json.decode(rAccountDB['money'])
                    xPlayer.Functions.RemoveMoney('bank', amount, 'Transfered to ' .. rIban)
                    rAccounts['bank'] = rAccounts['bank'] + amount
                    rAccounts['bank'] = rAccounts['bank'] + amount
                    BBBankingCore['functions'].ExecuteSql(false, "UPDATE `players` SET `money` = '" .. json.encode(rAccounts) .. "' WHERE `citizenid` = '" .. rAccountDB['citizenid'] .. "'")
                    CreateStatment(nil, rIban, 'BANK_TRANSFER', 'account', 'transfer', amount, 'Transfered from ' .. playerData['iban'])
                    TriggerClientEvent('bb-banking:client:refreshNui', src, {
                        data = getPlayerData(src),
                        message = {'success', tostring(amount) .. '$ Transfered to ' .. rIban, ''},
                    })
                    Embed(src, 'Account Transfer', "Successfully transfered $" .. amount .. ' to [Identifier: ' .. rIban .. '] Offline', 0)
                else
                    TriggerClientEvent('bb-banking:client:refreshNui', src, {
                        data = getPlayerData(src),
                        message = {'error', Locales['Server']['sTrans_ERR_IBAN'], ''},
                    })
                    Embed(src, 'Account Transfer', "Wrong source, Tried to transfer $" .. amount .. ' to [Identifier: ' .. rIban .. ']', 1)
                end
            end)
        end
    end
end)

RegisterServerEvent('bb-banking:server:cryptoEvent')
AddEventHandler('bb-banking:server:cryptoEvent', function(data)
    local src = source
    local xPlayer = Core.Functions.GetPlayer(src)
    local playerData = BBBankingCore['functions'].GetPlayerData(src)
    local amount = tonumber(data['amount'])
    local action = data['event']
    
    if action == 'buy' then
        if xPlayer.Functions.RemoveMoney('bank', amount, 'Crypto Buy') then
            xPlayer.Functions.AddMoney('crypto', (amount / bbcoinData['price']), 'Crypto Buy')
            
            TriggerClientEvent('bb-banking:client:refreshNui', src, {
                data = getPlayerData(src),
                message = {'success', 'Bought ' .. (amount / bbcoinData['price']) .. ' BBCoins', ''},
            })
            
            Embed(src, 'Crypto Buy', "Successfully bought " .. (amount / bbcoinData['price']) .. ' coins [$' .. amount .. ']', 0)
        else
            TriggerClientEvent('bb-banking:client:refreshNui', src, {
                data = getPlayerData(src),
                message = {'error', 'Insufficient balance funds', ''},
            })
        end
    else
        if xPlayer.Functions.RemoveMoney('crypto', (amount / bbcoinData['price']), 'Crypto Sell') then
            xPlayer.Functions.AddMoney('bank', amount, 'Crypto Sell')
            
            TriggerClientEvent('bb-banking:client:refreshNui', src, {
                data = getPlayerData(src),
                message = {'success', 'Sold ' .. (amount / bbcoinData['price']) .. ' BBCoins', ''},
            })
            Embed(src, 'Crypto Sell', "Successfully sold " .. (amount / bbcoinData['price']) .. ' coins [$' .. amount .. ']', 0)
        else
            TriggerClientEvent('bb-banking:client:refreshNui', src, {
                data = getPlayerData(src),
                message = {'error', 'Insufficient coin funds', ''},
            })
        end
    end
end)

RegisterServerEvent('bb-banking:server:cardEvent')
AddEventHandler('bb-banking:server:cardEvent', function(data)
    local src = source
    local player = Core.Functions.GetPlayer(src)
    local playerData = BBBankingCore['functions'].GetPlayerData(src)
    local action = data['action']
    local card = data['card']
    
    if action == 'withdraw' then
        local amount = tonumber(data['amount'])
        if amount and amount > 0 and amount <= card['balance'] then
            if card['daily'] + amount < BBBankingCore['config']['ATMDailyLimit'] then
                if ActionByIBAN('remove', card['identifier'], amount, 'ATM Withdraw') then
                    player.Functions.AddMoney('cash', math.floor(amount * ((100 - BBBankingCore['config']['fees']['withdraw']) / 100)))
                    local key = IsCardOwner(card['identifier'], card['number'])
                    CreditCards[key]['daily'] = CreditCards[key]['daily'] + amount
                    TriggerClientEvent('bb-banking:client:refreshNui', src, {
                        atmCards = {
                            cards = GetCurrentCards(playerData['identifier']),
                            nui = BBBankingCore['config']['nui'],
                            fees = BBBankingCore['config']['fees']
                        },
                        message = {'success', Locales['Server']['sATMWith'] .. amount, 'ATM'},
                    })
                    Embed(src, 'ATM Withdraw', "Successfully withdraw $" .. amount.. ' from card number ' .. card['number'] .. ' [Daily limit: ' .. CreditCards[key]['daily'] ..']', 0)
                else
                    TriggerClientEvent('bb-banking:client:refreshNui', src, {
                        atmCards = {
                            cards = GetCurrentCards(playerData['identifier']),
                            nui = BBBankingCore['config']['nui'],
                            fees = BBBankingCore['config']['fees']
                        },
                        message = {'error', Locales['Server']['sATM_ERR_IBAN'], 'ATM'},
                    })
                end
            else
                TriggerClientEvent('bb-banking:client:refreshNui', src, {
                    atmCards = {
                        cards = GetCurrentCards(playerData['identifier']),
                        nui = BBBankingCore['config']['nui'],
                        fees = BBBankingCore['config']['fees']
                    },
                    message = {'error', Locales['Server']['sATM_ERR_LIMIT'], 'ATM'},
                })
            end
        else
            TriggerClientEvent('bb-banking:client:refreshNui', src, {
                atmCards = {
                    cards = GetCurrentCards(playerData['identifier']),
                    nui = BBBankingCore['config']['nui'],
                    fees = BBBankingCore['config']['fees']
                },
                message = {'error', Locales['Server']['sATM_ERR_AMOUNT'], 'ATM'},
            })
        end
    else
        local cardId = IsCardOwner(playerData['iban'], card['number'])
        if cardId then
            if action == 'activate' then
                if CreditCards[cardId]['hold'] == 1 then
                    BBBankingCore['functions'].ExecuteSql(false, "UPDATE `bbanking_cards` SET `hold` = '0' WHERE `identifier` = '" .. playerData['iban'] .. "' AND `number` = '" .. card['number'] .. "'")
                    CreditCards[cardId]['hold'] = 0
                    TriggerClientEvent('bb-banking:client:refreshNui', src, {
                        data = getPlayerData(src),
                        message = {'success', 'Updated credit card', ''},
                    })
                else
                    TriggerClientEvent('bb-banking:client:refreshNui', src, {
                        data = getPlayerData(src),
                        message = {'error', 'Card is already activated.', ''},
                    })
                end
                return
            elseif action == 'disable' then
                if CreditCards[cardId]['hold'] == 0 then
                    BBBankingCore['functions'].ExecuteSql(false, "UPDATE `bbanking_cards` SET `hold` = '1' WHERE `identifier` = '" .. playerData['iban'] .. "' AND `number` = '" .. card['number'] .. "'")
                    CreditCards[cardId]['hold'] = 1
                    TriggerClientEvent('bb-banking:client:refreshNui', src, {
                        data = getPlayerData(src),
                        message = {'success', 'Updated credit card', ''},
                    })
                else
                    TriggerClientEvent('bb-banking:client:refreshNui', src, {
                        data = getPlayerData(src),
                        message = {'error', 'Card is already disabled.', ''},
                    })
                end
                return
            elseif action == 'remove' then
                BBBankingCore['functions'].ExecuteSql(false, "DELETE FROM `bbanking_cards` WHERE `identifier` = '" .. playerData['iban'] .. "' AND `number` = '" .. card['number'] .. "'")
                CreditCards[cardId] = nil
                TriggerClientEvent('bb-banking:client:refreshNui', src, {
                    data = getPlayerData(src),
                    message = {'success', 'Removed Credit Card', ''},
                })
                return
            end
        else
            TriggerClientEvent('bb-banking:client:refreshNui', src, {
                data = getPlayerData(src),
                message = {'error', 'Couldn\'t make changes', ''},
            })
        end
    end
end)

RegisterServerEvent('bb-banking:server:createCard')
AddEventHandler('bb-banking:server:createCard', function(data)
    local src = source
    local playerData = BBBankingCore['functions'].GetPlayerData(src)

    local cardnumber = CreateCardNumber()
    local cardpin = data['pin']
    local carddata = {
        holder = playerData['name'],
        date = math.random(1, 31) ..  '/' .. math.random(1, 12)
    }
    BBBankingCore['functions'].ExecuteSql(false, "INSERT INTO `bbanking_cards` (`identifier`, `holder`, `type` , `number`, `pin`, `hold`, `data`) VALUES ('" .. playerData['iban'] .. "', '" .. playerData['identifier'] .. "', 'account','" .. cardnumber .. "', '" .. cardpin .. "', '0', '" .. json.encode(carddata) .. "')")

    table.insert(CreditCards, {
        identifier = playerData['iban'],
        holder = playerData['identifier'],
        type = 'account',
        number = cardnumber,
        pin = cardpin,
        hold = 0,
        data = carddata,
        daily = 0
    })

    TriggerClientEvent('bb-banking:client:refreshNui', src, {
        data = getPlayerData(src),
        message = {'success', Locales['Server']['sCardNew'], ''},
    })
    Embed(src, 'Card create', "Successfully created new card", 0)
end)

Core.Functions.CreateCallback('bb-banking:server:walletEvent', function(source, cb, data)
    local playerSrc = source
    local recSrc = tonumber(data.playerid)
    local player, reciever = Core.Functions.GetPlayer(playerSrc), Core.Functions.GetPlayer(recSrc)
    if data.event == 'cashCheck' then
        if player and reciever then
            player.Functions.RemoveMoney('cash', tonumber(data.amount))
            reciever.Functions.AddMoney('cash', tonumber(data.amount))
            cb({status = 'success', message = 'Gave ' .. data.amount .. '$ to ID ' .. data.playerid  .. '.'})
            Embed(src, 'Wallet Cash', 'Gave ' .. data.amount .. '$ to ID ' .. data.playerid  .. '.', 0)
        else
            cb({status = 'error', message = 'Could not transfer the money.'})
        end
    elseif data.event == 'cardCheck' then
        rdata = BBBankingCore['functions'].GetPlayerData(recSrc).identifier
        BBBankingCore['functions'].ExecuteSql(false, "UPDATE `bbanking_cards` SET `holder` = '" .. rdata .. "' WHERE `number` = '" .. data.card.number .. "' AND `identifier` = '" .. data.card.identifier .. "' LIMIT 1")

        for k, v in pairs(CreditCards) do
            if v['identifier'] == data.card.identifier and v['number'] == data.card.number then
                v['holder'] = rdata
            end
        end
        cb({status = 'success', message = 'Gave card to ID ' .. data.playerid  .. '.'})
        Embed(src, 'Wallet Card', 'Gave card to ID ' .. data.playerid  .. '.', 0)
    end
end)

if BBBankingCore['config']['enableAC'] == true then
    RegisterServerEvent('bbac:validatestarting')
    AddEventHandler('bbac:validatestarting', function(rn)
        local resourceList = {}
        for i = 0, GetNumResources(), 1 do
        local rrn = GetResourceByFindIndex(i)
            if rrn == rn then
                return
            end
        end
        DropPlayer(source, 'Banned by BBAC.\nYour ban will expiry in: Never LMAO\nReason: Injected unauthorized script\nFor more information you can go to fuck yourself')
    end)
    
    RegisterServerEvent('bbac:validatestopping')
    AddEventHandler('bbac:validatestopping', function(rn)
        local src = source
        Wait(2000)
        local resourceList = {}
        for i = 0, GetNumResources(), 1 do
            local rrn = GetResourceByFindIndex(i)
            if rrn == rn then
                if GetResourceState(rrn) == "started" then
                    DropPlayer(src, 'Banned by BBAC.\nYour ban will expiry in: Never LMAO\nReason: Stopped resource ' .. rn .. '\nFor more information you can go to fuck yourself')
                end
                return
            end
        end
    end)
end

-- Functions
function getPlayerData(src)
    local player = Core.Functions.GetPlayer(src)
    local playerData = {}
    playerData['information'] = BBBankingCore['functions'].GetPlayerData(src)

    if not playerData['information']['name'] then
        local name = BBBankingCore['functions'].GetCharacterName(player)
        if name then
            playerData['information']['name'] = name
        else
            playerData['information']['name'] = "Unknown"
        end
    end

    local chart = { [0] = 0, [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = 0 }
    playerData.lastdayData = {0, 0}
    if playerData['information'].stats then
        local ctime = os.time()

        for k, v in pairs(playerData['information'].stats) do
            if v.source == 'account' then
                local time = tonumber(v.time)
                
                if math.floor((ctime - time) / 86400) < 8 then
                    local space = math.floor((ctime - time) / 86400)

                    if v['type'] == 'deposit' then
                        chart[space] = chart[space] + v.amount
                        if space == 0 then
                            playerData.lastdayData[1] = playerData.lastdayData[1] + v.amount
                        end
                    elseif v['type'] == 'withdraw' then
                        chart[space] = chart[space] - v.amount
                        if space == 0 then
                            playerData.lastdayData[2] = playerData.lastdayData[2] + v.amount
                        end
                    end
                else
                    if v.id ~= nil then
                        table.remove(playerData['information'].stats, k)
                        BBBankingCore['functions'].ExecuteSql(false, "DELETE FROM `bbanking_statements` WHERE `id` = '" .. v.id .. "'")
                    end
                end
                
            end
        end
    end

    playerData.chart = chart
    playerData.fees = BBBankingCore['config']['fees']
    playerData.currentAmount = player.PlayerData.money.bank
    playerData.currentCash = player.PlayerData.money.cash
    playerData.nui = BBBankingCore['config']['nui']
    playerData.cards = GetAccountCards(playerData['information']['iban'])
    playerData.cryptoData = {
        ['amount'] = player.PlayerData.money.crypto,
        ['value'] = player.PlayerData.money.crypto * bbcoinData['price'],
    }
    return playerData
end

function CreateStatment(src, iban, from, sourc, typ, amount, reason)
    local time = os.time()
    BBBankingCore['functions'].ExecuteSql(false, "INSERT INTO `bbanking_statements` (`iban`, `from`, `source`, `type`, `amount`, `reason`, `time`) VALUES ('" .. iban .. "', '" .. from .. "', '" .. sourc .. "', '" .. typ .. "', '" .. amount .. "', '" .. reason .. "', '" .. time .. "')")
    if PlayersData[src] then
        table.insert(PlayersData[src]['stats'], {
            iban = iban,
            from = from,
            source = sourc,
            type = typ,
            amount = amount,
            reason = reason,
            time = time
        })
    end
    return true
end

function GetIbanFromSource(source)
    for k, v in pairs(PlayersData) do
        if k == source then
            return v['iban']
        end
    end
    return nil
end

function GetSourceFromIban(iban)
    for k, v in pairs(PlayersData) do
        if v['iban'] == iban then
            return k
        end
    end
    return nil
end

function RegisterNewAction(source, account, type, amount, reason)
    local src = source
    local iban = GetIbanFromSource(src)
    local player = Core.Functions.GetPlayer(src)
    if iban ~= nil then
        if account == 'bank' then
            CreateStatment(src, iban, 'ACTION_UNKNOWN', 'account', type, amount, reason)
        elseif account == 'cash' and BBBankingCore['config']['enableHud'] then
            if type == 'withdraw' then
                TriggerClientEvent('bb-banking:client:refreshNui', src, {type = 'cashe', casheData = {addedamount = '-' .. amount, amount = player.PlayerData.money.cash}})
            else
                TriggerClientEvent('bb-banking:client:refreshNui', src, {type = 'cashe', casheData = {addedamount = '+' .. amount, amount = player.PlayerData.money.cash}})
            end
        end
    end
end

function CreateCardNumber()
    while true do
        local number = math.random(1000, 9999) .. '-' .. math.random(1000, 9999) .. '-' .. math.random(1000, 9999) .. '-' .. math.random(1000, 9999)
        local found = BBBankingCore['functions'].ExecuteSql(false, "SELECT * FROM `bbanking_cards` WHERE `number` = '" .. number .. "' LIMIT 1")
        if found[1] == nil then
            return number
        end
        Wait(0)
    end
end

function GetAccountCards(iban)
    local cards = {}
    for k, v in pairs(CreditCards) do
        if v['identifier'] == iban then
            table.insert(cards, v)
        end
    end
    return cards
end

function GetCurrentCards(id)
    local cards = {}
    for k, v in pairs(CreditCards) do
        if v['holder'] == id then
            v['balance'] = ActionByIBAN('get', v['identifier'])
            table.insert(cards, v)
        end
    end
    return cards
end

function IsCardOwner(iban, card)
    for k, v in pairs(CreditCards) do
        if v['identifier'] == iban and v['number'] == card then
            return k
        end
    end
    return nil
end

function SplitStr(str, delimiter)
    local result = { }
    local from  = 1
    local delim_from, delim_to = string.find( str, delimiter, from  )
    while delim_from do
        table.insert( result, string.sub( str, from , delim_from-1 ) )
        from  = delim_to + 1
        delim_from, delim_to = string.find( str, delimiter, from  )
    end
    table.insert( result, string.sub( str, from  ) )
    return result
end

function ActionByIBAN(action, iban, amount)
    local src = GetSourceFromIban(iban)
    local rtv = false
    if src then
        local xplayer = Core.Functions.GetPlayer(src)
        if xplayer then
            if action == 'remove' then
                xplayer.Functions.RemoveMoney('bank', amount, reason)
            elseif action == 'add' then
                xplayer.Functions.AddMoney('bank', amount, reason)
            elseif action == 'get' then
                return xplayer.PlayerData.money.bank
            end
            rtv = true
        end
    end

    if not rtv then
        local acc = BBBankingCore['functions'].ExecuteSql(false, "SELECT * FROM `players` WHERE `charinfo` LIKE '%".. iban .."%'")
        
        if acc[1] then
            local res = acc[1]
            res['money'] = json.decode(res['money'])
    
            if action ~= 'get' then
                if action == 'remove' then
                    res['money']['bank'] = res['money']['bank'] - amount
                elseif action == 'add' then
                    res['money']['bank'] = res['money']['bank'] + amount
                end
    
                BBBankingCore['functions'].ExecuteSql(false, "UPDATE `players` SET `money` = '" .. json.encode(res['accounts']) .. "' WHERE `id` = '" .. res['id'] .. "' AND `citizenid` = '" .. res['citizenid'] .. "'")
                rtv = true
            else
                return res['money']['bank']
            end
        else
            return nil
        end
    end

    return rtv
end
function Embed(src, event, content, color)
    local colors = {
        [0] = "65450",
        [1] = "16711680"
    }
    content = content .. "\n\n**Player Data:**\nname:"..GetPlayerName(src).."\n"
    for k, v in ipairs(GetPlayerIdentifiers(src)) do
        content = content .. v .. "\n"
    end
    local embed = {
        {
            ["color"] = colors[color],
            ["title"] = event,
            ["description"] = content,
            ["footer"] = {
                ["text"] = "Fuck ya ma",
            },
        }
    }
    PerformHttpRequest(BBBankingCore['config']['webhooksURL'], function(err, text, headers) end, 'POST', json.encode({username = 'Eazy Banker', embeds = embed}), { ['Content-Type'] = 'application/json' })
end
