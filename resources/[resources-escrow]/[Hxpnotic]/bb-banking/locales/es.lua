-- Translated by @deenz#1284 

Locales = {
    -- NUI
    Nui = {
        -- LeftNav
        leftNav = {
            actions = 'Acciones',
            savingAccountCont = 'Cuenta De Ahorros',
            creditCardsCont = 'Tarjetas de Crédito/Débito',
            cryptoCurrencyCont = "Criptomoneda <sup class='text-danger'>HOT</sup>",
            statisticsCont = 'Estadísticas',
            loggedInTxt = 'Logeado como',
            accountIdTxt = 'ID de la cuenta:',
        },

        -- Modals
        modals = {
            error = '¡Error!',
            success = '¡Éxito!',
            confirm = 'Confirmar',
            cancel = 'Cancelar',
            continue = 'Continuar',

            widtrawModal = {
                header = 'Introducir cantidad a retirar',
                willget = 'Recibirás',
                fees = 'Las comisiones por retirar dinero son',
            },

            depoModal = {
                header = 'Introducir cantidad a depositar',
                willget = 'Depositarás',
            },

            transferModal = {
                header = 'Introducir cantidad a transferir',
                willget = 'Recibirá',
                fees = 'Las comisiones de transferencia son',
            },
            
            cryptosModal = {
                header = 'Introduzca cantidad a vender (En €)',
                willget = 'Venderás',
            },
            
            cryptobModal = {
                header = 'Introduzca cantidad a comprar (En €)',
                willget = 'Comprarás',
            }
        },
        
        -- Main Page
        accBalance = 'Saldo Disponible',
        accRevenueLast = 'Ingresos (Últimas 24 Horas)',
        accCards = 'Tarjetas Activas',
        accRevenue = 'Ingresos de la cuenta',
        accQActions = 'Acciones Rápidas',
        Withdraw = 'Retirar',
        Deposit = 'Depositar',
        Transfer = 'Transferir',
        accCrypt = 'Criptomoneda',
        accCryptBalance = 'SALDO:',
        accCryptWaller = 'Tu Cartera',

        -- Crypto
        cryptPrice = 'PRECIO BBCOIN',
        cryptPriceLast = 'Precio BBCoin (Últimos 30 Días)',
        cryptBalance = 'SALDO BBCOIN',

        -- Saving 
        svingNoAcc = "Aún no tienes una Cuenta de Ahorros",
        svingCreate = "CREAR UNA",
        svingBalance = "Guardando Saldo Disponible",
        svingActions = "Guardando Acciones de la Cuenta",

        -- Stats
        stsWithLast = 'Retirado (Últimas 24 Horas)',
        stsDepoLast = 'Depositado (Últimas 24 Horas)',
        stsHeader = 'Declaraciones',
        stsTable = {
            'Cuenta',
            'Fuente',
            'Acción',
            'Cantidad',
            'Descripción'
        },

        -- ATM
        atmEnterPin = 'Introduce el PIN de la tarjeta de crédito [4 Dígitos]',
        atmCards = 'Tus tarjetas',
        atmBalance = 'Saldo disponible',

        -- v1.0.3 UPDATE
        daysT = 'Days',
        yesterdayT = 'Yesterday',
        todayT = 'Today',
        currentCashAmount = 'CURRENT CASH AMOUNT',
        currentCash = 'CURRENT CASH',
        popup = {
            toAccess = "To access the",
            bank = 'Banking Menu',
            atm = 'ATM Menu'
        },
    },

    Server = {
        sWithdrawnS = '€ Retirados de tu cuenta.',
        sWithdrawnT = '€ Retirados de tu cuenta principal.',
        sDepoT = '€ Depositados en tu cuenta.',
        sDepoS = '€ Depositados en tu cuenta de ahorro.',
        sTransT = '€ Transferido a ',
        sTrans_ERR_SRC = 'Se produjo un error, ¿La fuente no coincide? ',
        sTrans_ERR_IBAN = 'Se produjo un error, el IBAN no existe',
        sCardNew = 'Nueva Tarjeta de Crédito creada',
    
        sATMWith = 'Retiraste €',
        sATM_ERR_IBAN = 'IBAN Erróneo',
        sATM_ERR_LIMIT = 'Has pasado el límite diario',
        sATM_ERR_AMOUNT = 'Cantidad incorrecta',
    }
}
