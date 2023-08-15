CreateThread(function()
QBCore = exports[Config.CoreFolderName]:GetCoreObject()
    for k, v in pairs(Config.Books) do
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            TriggerClientEvent("qb-books:client:OpenBook", source, k, item)
        end)
    end
end)