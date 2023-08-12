-- Translated by @Weszz#8553 

Locales = {
    -- NUI
    Nui = {
        -- LeftNav
        leftNav = {
            actions = 'Acties',
            savingAccountCont = 'Spaarrekening',
            creditCardsCont = 'Credit/Debit Kaarten',
            cryptoCurrencyCont = "Crypto Koers <sup class='text-danger'>HOT</sup>",
            statisticsCont = 'Statistieken',
            loggedInTxt = 'Ingelogd als:',
            accountIdTxt = 'Account ID:',
        },

        -- Modals
        modals = {
            error = 'Error!',
            success = 'Gelukt!',
            confirm = 'Bevestigen',
            cancel = 'Annuleren',
            continue = 'Doorgaan',

            widtrawModal = {
                header = 'Hoeveel wilt u opnemen?',
                willget = 'U krijgt ',
                fees = 'Huidige transactiekosten ',
            },

            depoModal = {
                header = 'Hoeveel wilt u storten?',
                willget = 'Te storten bedrag ',
            },

            transferModal = {
                header = 'Hoeveel wilt u overmaken?',
                willget = 'De persoon ontvangt ',
                fees = 'De transactiekosten voor het overboeken zijn momenteel ',
            },
            
            cryptosModal = {
                header = 'Voer het bedrag om te verkopen in (In €)',
                willget = 'U verkoopt ',
            },
            
            cryptobModal = {
                header = 'Voer het te betalen bedrag in (In €)',
                willget = 'U ontvangt ',
            }
        },
        
        -- Main Page
        accBalance = 'Bank saldo',
        accRevenueLast = 'Omzet (Laatste 24 uur)',
        accCards = 'Actieve kaarten',
        accRevenue = 'Account opbrengsten',
        accQActions = 'Snelle acties',
        Withdraw = 'Opnemen',
        Deposit = 'Storten',
        Transfer = 'Overmaken',
        accCrypt = 'Crypto Koers',
        accCryptBalance = 'Balans:',
        accCryptWaller = 'Uw rekening',

        -- Crypto
        cryptPrice = 'Bitcoin prijs',
        cryptPriceLast = 'Bitcoin prijs (Laatste 30 dagen)',
        cryptBalance = 'Bitcoin balans',

        -- Saving 
        svingNoAcc = "U heeft nog geen spaarrekening",
        svingCreate = "Activeer een spaarrekening",
        svingBalance = "Spaarrekening saldo",
        svingActions = "Spaarrekening acties",

        -- Stats
        stsWithLast = 'Opgenomen (Laatste 24 uur)',
        stsDepoLast = 'Gestort (Laatste 24 uur)',
        stsHeader = 'Overzicht',
        stsTable = {
            'Account',
            'Tegen rekening',
            'Actie',
            'Aantal',
            'Beschrijving'
        },

        -- ATM
        atmEnterPin = 'Voer uw creditcard pincode in [4 Cijfers]',
        atmCards = 'Uw kaarten',
        atmBalance = 'Huidig saldo',

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
        sWithdrawnS = '€ Opgenomen',
        sWithdrawnT = '€ Overgemaakt naar uw hoofdrekening.',
        sDepoT = '€ Gestort op uw account.',
        sDepoS = '€ Gestort op uw spaarrekening',
        sTransT = '€ Overgemaakt naar ',
        sTrans_ERR_SRC = 'Er is iets fout gegaan, Persoon bestaat niet?',
        sTrans_ERR_IBAN = 'Er is iets fout gegaan, IBAN bestaat niet?',
        sCardNew = 'U heeft een nieuwe creditcard aangemaakt',
    
        sATMWith = 'Opgenomen bedrag €',
        sATM_ERR_IBAN = 'Foutieve IBAN ingevuld',
        sATM_ERR_LIMIT = 'U heeft uw daglimit bereikt',
        sATM_ERR_AMOUNT = 'Verkeerd bedrag',
    }
}
