 ______     ______        ______     ______     __   __     __  __     __     __   __     ______   
/\  == \   /\  == \      /\  == \   /\  __ \   /\ "-.\ \   /\ \/ /    /\ \   /\ "-.\ \   /\  ___\  
\ \  __<   \ \  __<      \ \  __<   \ \  __ \  \ \ \-.  \  \ \  _"-.  \ \ \  \ \ \-.  \  \ \ \__ \ 
 \ \_____\  \ \_____\     \ \_____\  \ \_\ \_\  \ \_\\"\_\  \ \_\ \_\  \ \_\  \ \_\\"\_\  \ \_____\
  \/_____/   \/_____/      \/_____/   \/_/\/_/   \/_/ \/_/   \/_/\/_/   \/_/   \/_/ \/_/   \/_____/
                                                                                                   
    QBUS Instructions.

1.  Install SQL:
    Inject "bb-banking > data.sql" Into your Database.
    Make sure it all went in without errors.

2.  Core edits:
    In order to get Statements fully working, you will have to add few lines to your core,
    Following the following steps carefully!

    qb-core > server > player.lua:

        Add:
            exports['bb-banking']:RegisterNewAction(self.PlayerData.source, moneytype, 'deposit', amount, (reason ~= nil and reason or 'Unknown'))
        To your "self.Functions.AddMoney" function.
        Should look like: https://prnt.sc/119egq5 after.

        Add:
            exports['bb-banking']:RegisterNewAction(self.PlayerData.source, moneytype, 'withdraw', amount, (reason ~= nil and reason or 'Unknown'))
        To your "self.Functions.RemoveMoney" function.
        Should look like: https://prnt.sc/119ehap after.

        Add:
            exports['bb-banking']:RegisterNewAction(self.PlayerData.source, moneytype, 'reset', amount, (reason ~= nil and reason or 'Unknown'))
        To your "self.Functions.SetMoney" function.
        Should look like: https://prnt.sc/119ehkn after.

3.  Auth
    Join barbaronn scripts discord server in order to get your script activated - 
    barbaroNNs Scripts Discord - https://discord.gg/MunpyUPmxx
    ModIT Discord - https://discord.com/invite/8afXRrA

Best of luck!
barbaroNN.