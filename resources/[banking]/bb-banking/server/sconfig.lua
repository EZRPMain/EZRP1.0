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
    ['webhooksURL']        = "https://discord.com/api/webhooks/1139799290429055056/50Z-Fz5EVfvjmv-U7RsUE3BVfF3lzjgzFPOyy9hWw5MOKXtYhcvw1grDfgK0-Y0k4lPt", -- Webhooks URL for logs

    ['nui'] = {
        ['enableCustomColor']       = true,  -- Do not touch for now
        ['customColor']             = 'blue',  -- Available - [lightblue, red, green, yellow, blue]
        ['logo']                    = 'https://cdn.discordapp.com/attachments/1139799273077223556/1139806151911952475/image.png' -- Bank logo [818x482 recommended]
    }
}