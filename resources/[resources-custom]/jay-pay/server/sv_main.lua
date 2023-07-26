local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent("jay-collectpay:srever", function()
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    local payslip = Player.Functions.GetMoney("payslip")
    if Player.Functions.RemoveMoney("payslip", payslip, "collected-slip") then
        Player.Functions.AddMoney("cash", payslip, "collected-slip")
    end
end)