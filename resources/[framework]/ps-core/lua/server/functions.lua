PSCore.Functions = {}

function PSCore.Functions.Notify(framework, nMessage, nType, nTitle)
    TriggerClientEvent('PSCore:Notify', framework, nMessage, nType, nTitle)
end
