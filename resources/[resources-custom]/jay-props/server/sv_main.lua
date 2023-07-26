local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()

    for item, data in pairs(Config.Items) do

        -- RegisterCommand(item, function(source, args)
        --     TriggerClientEvent('cl_attachProp', source, item)
        -- end)

        QBCore.Functions.CreateUseableItem(item, function(source)
            TriggerClientEvent('cl_attachProp', source, item)
        end)
    end
end)