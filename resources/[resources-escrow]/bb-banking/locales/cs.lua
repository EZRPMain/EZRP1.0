-- Translated by @𝕲𝖔𝖌𝖔𝖒𝖆𝖑𝖈𝖍𝖊𝖛#4710 
Locales = {
    -- NUI
    Nui = {
        -- LeftNav
        leftNav = {
            actions = 'Akce',
            savingAccountCont = 'Sporici ucet',
            creditCardsCont = 'Kreditni/Debetni Karta',
            cryptoCurrencyCont = "Kryptomena <sup class='text-danger'>HOT</sup>",
            statisticsCont = 'Statistiky',
            loggedInTxt = 'Prihlden za:',
            accountIdTxt = 'Cislo uctu:',
        },

        -- Modals
        modals = {
            error = 'Chyba!',
            success = 'Uspesne!',
            confirm = 'Potvrdit',
            cancel = 'Zrusit',
            continue = 'Pokracovat',

            widtrawModal = {
                header = 'Zadejte hodnotu pro vyber',
                willget = 'Dostanete',
                fees = 'Poplatek za vyber',
            },

            depoModal = {
                header = 'Zadejte hodnotu pro vlozeni',
                willget = 'Vlozte',
            },

            transferModal = {
                header = 'Zadejte hodnotu pro prevod',
                willget = 'Osoba dostane',
                fees = 'Poplatek za prevod',
            },
            
            cryptosModal = {
                header = 'Zadejte castku k prodeji (V $)',
                willget = 'Prodate',
            },
            
            cryptobModal = {
                header = 'Zadejte castku ke koupi (V $)',
                willget = 'Koupite',
            }
        },
        
        -- Main Page
        accBalance = 'Stav bankovniho uctu',
        accRevenueLast = 'Prijmy (Poslednich 24 hodin)',
        accCards = 'Aktivni Karty',
        accRevenue = 'Vynosy z uctu',
        accQActions = 'Rychle Akce',
        Withdraw = 'Vybrat',
        Deposit = 'Vlozit',
        Transfer = 'Prevest',
        accCrypt = 'Prevest',
        accCryptBalance = 'Zutatek:',
        accCryptWaller = 'Vase Penezenka',

        -- Crypto
        cryptPrice = 'BBCOIN CENA',
        cryptPriceLast = 'BBCoin Cena (Poslednich 30 dni)',
        cryptBalance = 'BBCOIN ZUSTATEK',

        -- Saving 
        svingNoAcc = "Nemate zalozeny sporici ucet",
        svingCreate = "VYTVORIT",
        svingBalance = "Zustatek na sporicim uctu",
        svingActions = "Sporici ucet akce",

        -- Stats
        stsWithLast = 'Vybrano (Poslednich 24 hodin)',
        stsDepoLast = 'Vlozeno (Poslednich 24 hodin)',
        stsHeader = 'Prohlaseni',
        stsTable = {
            'Ucet',
            'Zdroj',
            'Akce',
            'Castka',
            'Popis'
        },

        -- ATM
        atmEnterPin = 'Zadej PIN od karty [4 cisla]',
        atmCards = 'Vase Karty',
        atmBalance = 'Aktualni Zustatek',

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
        sWithdrawnS = '$ Vybery z vaseho sporiciho uctu.',
        sWithdrawnT = '$ Vybery z vaseho hlavniho uctu',
        sDepoT = '$ Vlozeno na vas ucet.',
        sDepoS = '$ Vlozeno na vas sporici ucet',
        sTransT = '$ Prevedeno na',
        sTrans_ERR_SRC = 'Vyskytla se chyba, zdroj neni spravny!',
        sTrans_ERR_IBAN = 'Vyskytla se chyba, Iban neni spravny!',
        sCardNew = 'Vytvorit novou kartu',
    
        sATMWith = 'Vybrali jste $',
        sATM_ERR_IBAN = 'Spatny IBAN',
        sATM_ERR_LIMIT = 'Prekrocil jste denni limit',
        sATM_ERR_AMOUNT = 'Spatna castka',
    }
}