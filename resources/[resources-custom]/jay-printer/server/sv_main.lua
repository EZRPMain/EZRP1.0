local QBCore = exports['qb-core']:GetCoreObject()

local ValidExtensions = {
    [".png"] = true,
    [".gif"] = true,
    [".jpg"] = true,
    [".jpeg"] = true,
}

local ValidExtensionsText = '.png, .gif, .jpg, .jpeg'

QBCore.Functions.CreateUseableItem("printerdocument", function(source, item)
    TriggerClientEvent('jay-printer:useItem', source, item)
end)

RegisterNetEvent('jay-printer:savePaperDocument', function(info, printer)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local printerItems = exports['qb-inventory']:GetStashItems(printer)
    if not printerItems then return end
    if not printerItems[1] then return end
    local itemName = printerItems[1].name
    if itemName ~= "paper" then TriggerClientEvent('QBCore:Notify', src, 'There be no paper in the printer.', "error") return end
    local extension = string.sub(info.url, -4)
    local validexts = ValidExtensions
    if not info then return end
    if not validexts[extension] then TriggerClientEvent('QBCore:Notify', src, 'Thats not a valid extension, only '..ValidExtensionsText..' extension links are allowed.', "error") return end
    if (printerItems[1].amount - 1) <= 0 then printerItems = {} goto save return end
    printerItems[1].amount = printerItems[1].amount - 1
    -- TODO, make sure everything works

    -- goto save
    -- return
    ::save::
    Player.Functions.AddItem('printerdocument', 1, nil, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['printerdocument'], "add", 1)
    TriggerEvent('qb-inventory:server:SaveStashItems', printer, printerItems)
end)