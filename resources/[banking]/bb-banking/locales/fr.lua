-- Translated by @ClydyBoy#0001 

Locales = {
    -- NUI
    Nui = {
        -- LeftNav
        leftNav = {
            actions = 'Actions',
            savingAccountCont = 'Compte d\'épargne',
            creditCardsCont = 'Cartes de crédit/débit',
            cryptoCurrencyCont = "Crypto-monnaie <sup class='text-danger'>HOT</sup>",
            statisticsCont = 'Statistiques',
            loggedInTxt = 'Enregistré en tant que',
            accountIdTxt = 'ID du compte :',
        },

        -- Modals
        modals = {
            error = 'Erreur !',
            success = 'Succès !',
            confirm = 'Confirmer',
            cancel = 'Annuler',
            continue = 'Continuer',

            widtrawModal = {
                header = 'Entrez le montant à retirer',
                willget = 'Vous obtiendrez',
                fees = 'Les frais de retrait sont actuellement de',
            },

            depoModal = {
                header = 'Entrez le montant à déposer',
                willget = 'Vous déposerez',
            },

            transferModal = {
                header = 'Entrez le montant à transférer',
                willget = 'Ils obtiendront',
                fees = 'Les frais de transfert sont actuellement de',
            },
            
            cryptosModal = {
                header = 'Entrez le montant à vendre (En $)',
                willget = 'Vous allez vendre',
            },
            
            cryptobModal = {
                header = 'Entrez le montant à acheter (En $)',
                willget = 'Vous allez acheter',
            }
        },
        
        -- Main Page
        accBalance = 'Solde du compte',
        accRevenueLast = 'Revenus (dernières 24 heures)',
        accCards = 'Cartes actives',
        accRevenue = 'Revenu du compte',
        accQActions = 'Actions rapides',
        Withdraw = 'Retirer',
        Deposit = 'Déposer',
        Transfer = 'Transférer',
        accCrypt = 'Crypto-monnaie',
        accCryptBalance = 'SOLDE :',
        accCryptWaller = 'Votre portefeuille',

        -- Crypto
        cryptPrice = 'PRIX DU BBCOIN',
        cryptPriceLast = 'Prix du BBCoin (30 derniers jours)',
        cryptBalance = 'SOLDE DU BBCOIN',

        -- Saving 
        svingNoAcc = "Vous n'avez pas encore de compte épargne",
        svingCreate = "CRÉEZ EN UN",
        svingBalance = "Solde du compte d'épargne",
        svingActions = "Actions sur le compte d'épargne",

        -- Stats
        stsWithLast = 'Retraits (dernières 24 heures)',
        stsDepoLast = 'Dépôts (dernières 24 heures)',
        stsHeader = 'Déclarations',
        stsTable = {
            'Compte',
            'Source',
            'Action',
            'Montant',
            'Description'
        },

        -- ATM
        atmEnterPin = 'Entrez le code PIN de la carte de crédit [4 chiffres]',
        atmCards = 'Vos cartes',
        atmBalance = 'Solde actuel',

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
        sWithdrawnS = '$ ont été retirés de votre compte principal.',
        sWithdrawnT = '$ ont été retirés de votre compte principal.',
        sDepoT = '$ ont été déposés sur votre compte.',
        sDepoS = '$ ont été déposés sur votre compte d\'épargne',
        sTransT = '$ ont été transférés à ',
        sTrans_ERR_SRC = 'Une erreur s\'est produite, la source ne correspond pas ?',
        sTrans_ERR_IBAN = 'Une erreur s\'est produite, Iban n\'existe pas.',
        sCardNew = 'Création d\'une nouvelle carte de crédit',
    
        sATMWith = 'Vous avez retiré $',
        sATM_ERR_IBAN = 'IBAN incorrect',
        sATM_ERR_LIMIT = 'Vous avez dépassé la limite quotidienne',
        sATM_ERR_AMOUNT = 'Montant incorrect',
    }
}
