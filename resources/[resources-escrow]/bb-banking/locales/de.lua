-- Translated by @Enigma#6714

Locales = {
    -- NUI
    Nui = {
        -- LeftNav
        leftNav = {
            actions = 'Aktionen',
            savingAccountCont = 'Sparkonto',
            creditCardsCont = 'Kredit/Bank Karte',
            cryptoCurrencyCont = "Bitcoins <sup class='text-danger'>HEIß</sup>",
            statisticsCont = 'Statistiken',
            loggedInTxt = 'Eingeloggt als',
            accountIdTxt = 'Account ID:',
        },

        -- Modals
        modals = {
            error = 'Fehler!',
            success = 'Erfolgreich!',
            confirm = 'Bestätigen',
            cancel = 'Abbrechen',
            continue = 'Fortfahren',

            widtrawModal = {
                header = 'Wieviel möchtest du abheben?',
                willget = 'Du erhältst',
                fees = 'Aktuelle Transaktionsgebühr ',
            },

            depoModal = {
                header = 'Wieviel möchtest du einzahlen',
                willget = 'Betrag der eingezahlt wird',
            },

            transferModal = {
                header = 'Wieviel möchtest du überweißen',
                willget = 'Die Person erhält',
                fees = 'Die Transaktionsgebühr für das Überweißen sind derzeit',
            },
            
            cryptosModal = {
                header = 'Geben Sie den zu verkaufenden Betrag ein (In $)',
                willget = 'Sie verkaufen',
            },
            
            cryptobModal = {
                header = 'Geben Sie den zu zahlenden Betrag ein (In $)',
                willget = 'Sie werden erhalten',
            }
        },
        
        -- Main Page
        accBalance = 'Kontostand',
        accRevenueLast = 'Einnahmen (Letzte 24 Stunden)',
        accCards = 'Aktive Karten',
        accRevenue = 'Kontoeinnahmen',
        accQActions = 'Schnellaktionen',
        Withdraw = 'Auszahlen',
        Deposit = 'Einzahlen',
        Transfer = 'Überweißen',
        accCrypt = 'Bitcoin Wert',
        accCryptBalance = 'Bitcoin Kontostand:',
        accCryptWaller = 'Ihr Geldbeutel',

        -- Crypto
        cryptPrice = 'Bitcoin Preis',
        cryptPriceLast = 'Bitcoin Preis (Letzte 30 Tage)',
        cryptBalance = 'Bitcoin Kontostand',

        -- Saving 
        svingNoAcc = "Du hast kein Sparkonto",
        svingCreate = "ERSTELLEN",
        svingBalance = "Sparkonto Kontostand",
        svingActions = "Sparkonto Aktionen",

        -- Stats
        stsWithLast = 'Ausgezahlt (Letzte 24 Stunden)',
        stsDepoLast = 'Eingezahlt (Letzte 24 Stunden)',
        stsHeader = 'Übersicht',
        stsTable = {
            'Account',
            'Quelle',
            'Aktion',
            'Menge',
            'Beschreibung'
        },

        -- ATM
        atmEnterPin = 'Gebe den Kreditkarten-Pin ein [4 Ziffern]',
        atmCards = 'Deine Karten',
        atmBalance = 'Aktueller Kontostand',

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
        sWithdrawnS = '$ Von Ihrem Konto abgehoben',
        sWithdrawnT = '$ Auf ihr Hauptkonto Überwiesen.',
        sDepoT = '$ Einzahlung auf Ihr Konto.',
        sDepoS = '$ Einzahlung auf Ihr Sparkonto',
        sTransT = '$ Übertragen an ',
        sTrans_ERR_SRC = 'Fehler aufgetreten, Quelle stimmt nicht überein?',
        sTrans_ERR_IBAN = 'Fehler aufgetreten, IBAN ist nicht vorhanden',
        sCardNew = 'Neue Kreditkarte Erstellen',
    
        sATMWith = 'Du hast abgehoben $',
        sATM_ERR_IBAN = 'Ungültige IBAN',
        sATM_ERR_LIMIT = 'Sie haben das Tageslimit überschritten',
        sATM_ERR_AMOUNT = 'Ungültiger Betrag',
    }
}
