local Framework = exports['qb-core']

Framework:CreateUseableItem("wheelchair", function(source)
    local source = source
    TriggerClientEvent('tnj-vehicles:wheelchair', source)
end)

Framework:CreateUseableItem("hoverboard", function(source)
    local source = source
    TriggerClientEvent('tnj-vehicles:hoverboard', source)
end)
