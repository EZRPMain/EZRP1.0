local QBCore = exports['qb-core']:GetCoreObject()

-- todo create script :kekw:
CreateThread(function()

    for item, data in pairs(Config.RadioItems) do

        -- RegisterCommand(item, function(source, args)
        --     TriggerClientEvent('jay-drivethru:connect', source, item)
        -- end)

        QBCore.Functions.CreateUseableItem(item, function(source)
            TriggerClientEvent('jay-drivethru:connect', source, item)
        end)
    end

    -- QBCore.Functions.CreateUseableItem("radio", function(source)
    --     TriggerClientEvent('qb-radio:use', source)
    -- end)
    
end)