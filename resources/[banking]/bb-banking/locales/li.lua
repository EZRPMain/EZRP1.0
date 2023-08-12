--Translated by @𝕯𝖊𝖒𝖔𝖓#3753 

Locales = {
    -- NUI
    Nui = {
        -- LeftNav
        leftNav = {
            actions = 'Veiksmai',
            savingAccountCont = 'Taupomoji sąskaita',
            creditCardsCont = 'Banko kortelės',
            cryptoCurrencyCont = "Kripto valiuta <sup class='text-danger'>investuok</sup>",
            statisticsCont = 'Statistika',
            loggedInTxt = 'Banko sąskaita:',
            accountIdTxt = 'Sąskaita:',
        },

        -- Modals
        modals = {
            error = 'Klaida!',
            success = 'Atlikta!',
            confirm = 'Patvirtinti',
            cancel = 'Atšaukti',
            continue = 'Tęsti',

            widtrawModal = {
                header = 'Įveskite norimą išgryninti sumą.',
                willget = 'Atskaičius mokesčius gausite:',
                fees = 'Aptarnavimo mokestis:',
            },

            depoModal = {
                header = 'Įveskite norimą įnešti sumą.',
                willget = 'Įnešite:',
            },

            transferModal = {
                header = 'Įveskite norimą pervesti sumą.',
                willget = 'Atskaičius mokesčius gaus:',
                fees = 'Aptarnavimo mokestis:',
            },
            
            cryptosModal = {
                header = 'Įveskite kiek norite parduoti (In $)',
                willget = 'Pardavę gausite:',
            },
            
            cryptobModal = {
                header = 'Įveskite kiek norite pirkti (In $)',
                willget = 'Nusipirksite už:',
            }
        },
        
        -- Main Page
        accBalance = 'Sąskaitoje:',
        accRevenueLast = '24 valandų išrašas',
        accCards = 'Aktyvios kortelės',
        accRevenue = 'Sąskaitos išrašas',
        accQActions = 'Greitieji veiksmai',
        Withdraw = 'Išgryninti',
        Deposit = 'Įnešti',
        Transfer = 'Pervesti',
        accCrypt = 'Kripto valiuta',
        accCryptBalance = 'Balansas:',
        accCryptWaller = 'Piniginėje:',

        -- Crypto
        cryptPrice = 'Bitcoin kaina',
        cryptPriceLast = 'Bitcoin 30 dienų kaina',
        cryptBalance = 'Bitcoin balansas',

        -- Saving 
        svingNoAcc = "Neturite taupomosios sąskaitos",
        svingCreate = "Atidaryti taupomaja sąskaita",
        svingBalance = "Taupomosios sąskaitos balansas",
        svingActions = "Taupomosios sąskaitos veiksmai",

        -- Stats
        stsWithLast = '24 valandų išgryninimai',
        stsDepoLast = '24 valandų įnešimai',
        stsHeader = 'Statements',
        stsTable = {
            'Account',
            'Source',
            'Action',
            'Amount',
            'Description'
        },

        -- ATM
        atmEnterPin = 'Įveskite PIN kodą',
        atmCards = 'Turimos kortelės',
        atmBalance = 'Sąskaitoje:',

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
        sWithdrawnS = '$ Withdrawn from your account',
        sWithdrawnT = '$ Withdrawn to your Main Account.',
        sDepoT = '$ Deposited to your account.',
        sDepoS = '$ Deposited to your Saving Account',
        sTransT = '$ Transfered to ',
        sTrans_ERR_SRC = 'Error occurred, Source doesn\'t match?',
        sTrans_ERR_IBAN = 'Error occurred, Iban doesn\'t exists',
        sCardNew = 'Created New Credit Card',
    
        sATMWith = 'You withdrew $',
        sATM_ERR_IBAN = 'Wrong IBAN',
        sATM_ERR_LIMIT = 'You passed the Daily Limit',
        sATM_ERR_AMOUNT = 'Wrong amount',
    }
}
