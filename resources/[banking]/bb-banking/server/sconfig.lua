BBBankingCore = {}
BBBankingCore['config'] = {
    ['enableHud']           = true, -- Enables HUD - /cash command, notifications etc.. 
    ['enableATMs']          = true, -- Enables /atm Command.
    ['enableWallet']        = true, -- Enables wallet - ATTENTION: Without it, players will not be able to transfer cards between each other.
    ['enableAC']            = false, -- Enables BBAC and the global blacklist - ATTENTION: Do NOT restart or ensure scripts while its running - if you want to restart script, stop and start it.
    ['enableStatements']    = true, -- Enables statements tab

    ['server']              = '2', -- Auth server, [Available: 1, 2]

    ['fees']                = { transfer = 4, withdraw = 2 }, -- Fees on transfers/witdraws [Min 1, Max 100]
    ['startingMoney']       = 4000, -- Starting money on the core
    ['ATMDaily']            = 3600000, -- Time to reset ATM Withdraw daily limit [Default 1 Hour]
    ['ATMDailyLimit']       = 3000, -- Max withdraw amount for each session
    ['cryptoPresentage']    = 1, -- Determines the presentage of the real BTC price [Exapmle - If BTC is 60k atm and you set it to 0.5, crypto will be 30K on your server][Min 0.1]
    ['webhooksURL']        = "https://canary.discord.com/api/webhooks/830649480897888317/v7jr1nahcYRHacENNFsNZM5Vo0e89vEtk2NaT4B2OYOPzxDl51lk2UevViElBvuzHmfa", -- Webhooks URL for logs

    ['nui'] = {
        ['enableCustomColor']       = true,  -- Do not touch for now
        ['customColor']             = 'lightblue',  -- Available - [lightblue, red, green, yellow, blue]
        ['logo']                    = 'https://cdn.discordapp.com/attachments/553260308475674688/830339865916473365/BBBANKINGv2.png' -- Bank logo [818x482 recommended]
    }
}