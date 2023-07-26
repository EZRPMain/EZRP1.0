QBCore = exports['qb-core']:GetCoreObject()

PSCore.Functions = {}

function PSCore.Functions.AddItem(source, item, amount, framework)
    if not framework then
        PSCore.Print('Please provide framework being either "qb" or "ox"', "error")
        return
    end

    -- qb-inventory (or alike)
    if framework == "qb" then
        QBCore.Functions.GetPlayer(source).Functions.AddItem(item, amount, nil)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
        return
    end

    -- ox inventory
    if framework == "ox" then
        local ox_inventory = exports.ox_inventory

        if not ox_inventory:CanCarryItem(source, item, amount) then
            PSCore.Notify("ox", "Can not carry " .. item .. "!", "error", "Notice!")
            return TriggerClientEvent('QBCore:Notify', source, "Can not carry" .. item .. "!", "error")
        end

        ox_inventory:AddItem(source, item, amount)
        return
    end
end

function PSCore.Notify(framework, nMessage, nType, nTitle)
    if not framework then
        return
    end

    if framework == "ox" then
        lib.notify({
            title = nTitle,
            description = nMessage,
            type = nType
        })

        return
    end

    if framework == "qb" then
        TriggerEvent('QBCore:Notify', nMessage, nType)
        return
    end
end
