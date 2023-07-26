local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    exports['qb-target']:SpawnPed({
        model = 'ig_bankman',
        coords = vector4(243.775, 226.18566, 106.28769, 161.42852), 
        minusOne = true,
        freeze = true,
        invincible = true, 
        blockevents = true,
        spawnNow = true,
        target = { 
            useModel = false,
            options = { 
                { 
                    num = 1, 
                    --   type = "client",
                    --   event = "Test:Event",
                    icon = 'fas fa-circle',
                    label = 'Check Payslip',
                    --   item = 'handcuffs', 
                    action = function(entity) 
                        local pd = QBCore.Functions.GetPlayerData()
                        local payslip = pd.money.payslip
                        QBCore.Functions.Notify(("You have $%s in the payslip"):format(payslip))
                    end,
                },
                { 
                    num = 2, 
                      type = "server",
                      event = "jay-collectpay:srever",
                    icon = 'fas fa-circle',
                    label = 'Collect Payslip',
                    --   item = 'handcuffs', 
                    -- action = function(entity) 
                        -- 
                    -- end,
                }
            },
            distance = 2.5,
        },
    })
end)