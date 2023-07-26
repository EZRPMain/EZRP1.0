RegisterCommand("spacestrike", function(source,args)
    local source = source
    TriggerClientEvent("client:spacestrike", source)
    -- TriggerClientEvent("client:spacestrike", -1) -- solution if not server sided.
end)