function RegisterCallback(name, callback)
    local Event = '__gangphone:callback:'.. name
    RegisterNetEvent(Event, function(...)
        local data = callback(source, ...)
        TriggerClientEvent(Event, source, data)
    end)
end

-- RegisterCallback('pringles', function(source, data)
--     print(json.encode(data))
--     local data = {
--         testData1 = 'Are we here yet?',
--         testData2 = 'No son stfu we will get there when we get there',
--     }
--     return 'Are we here yet?'
-- end)