Callbacks = {
    Await = function(name, ...)
        local Event = '__gangphone:callback:'.. name

        TriggerServerEvent(Event, ...)
        local await = promise.new()
        local d 
        RegisterNetEvent(Event, function(...)
            d = (...)
            await:resolve(...)
        end)
        Citizen.Await(await)
        return d
    end,
    Callback = function(name, callback, ...)
        local Event = '__gangphone:callback:'.. name
  
        TriggerServerEvent(Event, ...)
        local p = promise.new()

        RegisterNetEvent(Event, function(...)
            p:resolve(...)
            return callback(...)
        end)
        Citizen.Await(p)
    end
}

-- RegisterCommand('cbtest', function()
    -- local string = Callbacks.Await('pringles', {'hi', 'bye'})

    -- print(string)

    -- Callbacks.Callback('pringles', function(info)
    --     print(json.encode(info))
    -- end, {'hi', 'bye'})
-- end)