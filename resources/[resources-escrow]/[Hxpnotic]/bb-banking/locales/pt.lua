-- Translated by @vtONE#2390 

Locales = {
    -- NUI
    Nui = {
        -- LeftNav
        leftNav = {
            actions = 'Acções',
            savingAccountCont = 'Conta Poupança',
            creditCardsCont = 'Cartões Crédito/Débito',
            cryptoCurrencyCont = "Cryptos <sup class='text-danger'>HOT</sup>",
            statisticsCont = 'Estatisticas',
            loggedInTxt = 'Registado como',
            accountIdTxt = 'ID da conta:',
        },

        -- Modals
        modals = {
            error = 'Erro!',
            success = 'Successo!',
            confirm = 'Confirmar',
            cancel = 'Cancelar',
            continue = 'Continuar',

            widtrawModal = {
                header = 'Introduzir a quantidade a retirar',
                willget = 'Irá retirar',
                fees = 'A taxa do dinheiro retirado é',
            },

            depoModal = {
                header = 'Introduza a quantidade a depositar',
                willget = 'Depositará',
            },

            transferModal = {
                header = 'Introduza a quantidade para transferência',
                willget = 'Irá receber',
                fees = 'As taxas de transferência são',
            },
            
            cryptosModal = {
                header = 'Introduza quantidade para vender (Em $)',
                willget = 'Vai vender',
            },
            
            cryptobModal = {
                header = 'Introduza quantidade para comprar (Em $)',
                willget = 'Vai comprar',
            }
        },
        
        -- Main Page
        accBalance = 'Balanço da conta',
        accRevenueLast = 'Rendimento (Ultimas 24 Horas)',
        accCards = 'Cartões ativos',
        accRevenue = 'Rendimento da conta',
        accQActions = 'Acçoes rápidas',
        Withdraw = 'Retirar',
        Deposit = 'Depositar',
        Transfer = 'Transferir',
        accCrypt = 'Moeda crypto',
        accCryptBalance = 'Balanço:',
        accCryptWaller = 'Na sua carteira',

        -- Crypto
        cryptPrice = 'Preço da BBCOIN',
        cryptPriceLast = 'Preço da BBCoin (Ultimos 30 Dias)',
        cryptBalance = 'Balanço da BBCOIN',

        -- Saving 
        svingNoAcc = "Ainda não tens uma conta de poupança",
        svingCreate = "Criar",
        svingBalance = "Saldo na conta de poupança",
        svingActions = "Saldo da conta de acções",

        -- Stats
        stsWithLast = 'Retirou (Ultimas 24 Horas)',
        stsDepoLast = 'Depositou (Ultimas 24 Horas)',
        stsHeader = 'Movimento da Conta',
        stsTable = {
            'Conta',
            'Fonte',
            'Acções',
            'Quantidade',
            'Descrição'
        },

        -- ATM
        atmEnterPin = 'Digite o Pin do Cartão de Crédito [4 Digitos]',
        atmCards = 'Cartões em uso',
        atmBalance = 'Saldo atual',

        -- v1.0.3 UPDATE
        daysT = 'Days',
        yesterdayT = 'Yesterday',
        todayT = 'Today1',
        currentCashAmount = 'CURRENT CASH AMOUNT',
        currentCash = 'CURRENT CASH',
        popup = {
            toAccess = "To access the",
            bank = 'Banking Menu',
            atm = 'ATM Menu'
        },
    },

    Server = {
        sWithdrawnS = '$ Retirou da sua conta',
        sWithdrawnT = '$ Retirou para a conta principal.',
        sDepoT = '$ Depositado na sua conta.',
        sDepoS = '$ Depositado na sua conta de poupança',
        sTransT = '$ Transferido para ',
        sTrans_ERR_SRC = 'Ocorreu um erro, fonte não corresponde?',
        sTrans_ERR_IBAN = 'Ocorreu um erro, IBAN não existe',
        sCardNew = 'Criando um novo cartão de credito',
    
        sATMWith = 'Retirou $',
        sATM_ERR_IBAN = 'Errado de IBAN',
        sATM_ERR_LIMIT = 'Passou o limite diário',
        sATM_ERR_AMOUNT = 'Valor errado',
    }
}
