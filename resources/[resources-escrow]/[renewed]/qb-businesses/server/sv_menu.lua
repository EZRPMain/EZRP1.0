
QBCore = exports[Config.Core]:GetCoreObject()

validateJob = function(job)
    return Config.Stations[job] and true or false
end

RegisterNetEvent('QBCore:Server:UpdateObject', function()
    QBCore = exports[Config.Core]:GetCoreObject()
end)

local BusinessCached = {}

CreateThread(function()

    Wait(2000)

    while not QBCore do Wait(25) end

    MySQL.Async.fetchAll('SELECT * FROM business_items', {}, function(menu)
        local AllItems = menu
        local NewItems = {}
        local itemsNumb = 0
        for _, v in pairs(AllItems) do
            local item = {}
            if not QBCore.Shared.Items[v.name] then
                item = {
                    ['name'] = v.name,
                    ['label'] = v.label,
                    ['weight'] = v.menu == "drinks" and 750 or 1500, --v.menu == "main" and 1500 or v.menu == "side" and 1000 or 750
                    ['type'] = 'item',
                    ['image'] = v.image,
                    ['unique'] = false,
                    ['useable'] = true,
                    ['shouldClose'] = true,
                    ['combinable'] = nil,
                    ['description'] = v.description,
                    ["created"] = nil,
                    ["decay"] = 28
                }

                itemsNumb = itemsNumb + 1
                NewItems[v.name] = item
            end

            QBCore.Functions.CreateUseableItem(v.name, function(source, _)
                local Player = QBCore.Functions.GetPlayer(source)
                if Player.Functions.GetItemByName(v.name) then
                    if v.menu == "drinks" then
                        TriggerClientEvent('qb-businesses:client:DrinkBusinesses', source, v.name, v.emote, v.label)
                    else
                        TriggerClientEvent('qb-businesses:client:EatBusinessFood', source, v.name, v.emote, v.label)
                    end
                end
            end)

            if not BusinessCached[v.business] then BusinessCached[v.business] = {} end

            if v.active then
                BusinessCached[v.business][v.id] = {
                    name = v.name,
                    label = v.label,
                    id = v.id,
                    description = v.description,
                    image = v.image,
                    recipe = json.decode(v.recipe),
                    station = v.station,
                    menu = v.menu,
                    active = tonumber(v.active) == 1 and true or false
                }
            end
        end

        if itemsNumb == 0 then return end

        local success, message = exports[Config.Core]:AddItems(NewItems)

        if success then
            if Config.Debug then print(("%s business items has been loaded "):format(itemsNumb)) end
        else
            if Config.Debug then print(("An issue with loading in business items has occoured %s"):format(message)) end
        end
    end)
end)

RegisterNetEvent('qb-businesses:server:RefreshedCached', function()
    BusinessCached = {}
    MySQL.Async.fetchAll('SELECT * FROM business_items WHERE active = @active', {["@active"] = 1}, function(menu)
        for _, v in pairs(menu) do
            if not BusinessCached[v.business] then BusinessCached[v.business] = {} end
            if v.active then
                BusinessCached[v.business][v.id] = {
                    name = v.name,
                    label = v.label,
                    id = v.id,
                    description = v.description,
                    image = v.image,
                    recipe = json.decode(v.recipe),
                    station = v.station,
                    menu = v.menu,
                    active = tonumber(v.active) == 1 and true or false
                }
            end
        end
        TriggerClientEvent('qb-businesses:client:RefreshTable', -1)
    end)
end)

---- ** DRINKS CALLBACK ** ----
QBCore.Functions.CreateCallback('qb-businesses:server:GetDrinks', function(source, cb, restaurant, type)
    MySQL.Async.fetchAll('SELECT * FROM business_items WHERE business = @business AND menu = @menu', {["@business"] = restaurant, ["@menu"] = type}, function(menu)
        cb(menu)
    end)
end)


---- ** Item creation event ** ----
RegisterNetEvent('qb-businesses:server:CreateItem', function(data, restaurant, type)
    local Player = QBCore.Functions.GetPlayer(source)
    local name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    if validateJob(Player.PlayerData.job.name) then
        local ItemName = restaurant.."_"..tostring(QBCore.Shared.RandomStr(5) .. QBCore.Shared.RandomInt(5)):lower()
        if QBCore.Shared.Items[ItemName] then
            TriggerClientEvent('QBCore:Notify', Lang:t("error.exist"), "error", 4500)
        else
            local item = {
                ['name'] = ItemName,
                ['label'] = tostring(data.name),
                ['weight'] = type == "main" and 1500 or type == "side" and 1000 or 750,
                ['type'] = 'item',
                ['image'] = tostring(data.image),
                ['unique'] = false,
                ['useable'] = true,
                ['shouldClose'] = true,
                ['combinable'] = nil,
                ['description'] = tostring(data.description),
                ["created"] = nil,
                ["decay"] = 28
            }

            QBCore.Functions.CreateUseableItem(ItemName, function(source, item)
                if Player.Functions.GetItemByName(ItemName) then
                    if type == "drinks" then
                        TriggerClientEvent('qb-businesses:client:DrinkBusinesses', source, ItemName, data.emote, data.name)
                    else
                        TriggerClientEvent('qb-businesses:client:EatBusinessFood', source, ItemName, data.emote, data.name)
                    end
                end
            end)

            exports['qb-core']:AddItem(ItemName, item)

            MySQL.Async.insert('INSERT INTO business_items (name, label, image, description, menu, business, emote) VALUES (?, ?, ?, ?, ?, ?, ?)', {
                ItemName,
                data.name,
                data.image,
                data.description,
                type,
                restaurant,
                data.emote,
            })

            TriggerEvent('qb-businesses:server:RefreshedCached')

            TriggerEvent('qb-log:server:CreateLog', 'business', 'Create Item', 'green', Lang:t('logs.create_item', {
                name = ("%s(%s)"):format(name, GetPlayerName(source)),
                item = ("%s(%s)"):format(ItemName, data.name),
                image = data.image,
                desc = data.description,
                type = type,
                zone = restaurant
            }))
        end
    else
        TriggerEvent('qb-log:server:CreateLog', 'business', 'Create Item', 'red', Lang:t('logs.create_item_unauth', {
            name = ("%s(%s)"):format(name, GetPlayerName(source)),
            item = ("%s(%s)"):format(ItemName, data.name),
            image = data.image,
            desc = data.description,
            type = type,
            zone = restaurant
        }))
    end
end)

---- ** Alter Recipe Event ** ----

RegisterNetEvent('qb-businesses:server:AlterRecipe', function(data, id, station, description)
    if validateJob(QBCore.Functions.GetPlayer(source).PlayerData.job.name) then
        local recipe = json.encode(data)
        MySQL.Sync.execute('UPDATE business_items SET recipe = @recipe, station = @station, description = @description WHERE id = @id', {["@id"] = id, ["@recipe"] = recipe, ["@station"] = tostring(station), ["@description"] = tostring(description)})
        TriggerEvent('qb-businesses:server:RefreshedCached')
    end
end)

---- ** Search Food Items ** ----
QBCore.Functions.CreateCallback('qb-businesses:server:GetMenuItems', function(_, cb, restaurant, type)
    MySQL.Async.fetchAll('SELECT * FROM business_items WHERE business = @business AND menu = @menu', {["@business"] = restaurant, ["@menu"] = type}, function(menu)
        cb(menu)
    end)
end)

QBCore.Functions.CreateCallback('qb-businesses:server:GetBusinessMenu', function(_, cb, restaurant)
    MySQL.Async.fetchAll('SELECT * FROM business_items WHERE business = @business', {["@business"] = restaurant}, function(menu)
        cb(menu)
    end)
end)

---- ** Gets the item's info ** ----
QBCore.Functions.CreateCallback('qb-businesses:server:GetItemInfo', function(source, cb, id)
    local result = MySQL.query.await('SELECT * FROM business_items WHERE id = @id', {["@id"] = id})
    local itemResult = {
        StationInfo = result[1].station,
        RecipeInfo = json.decode(result[1].recipe),
        Description = result[1].description
    }
    cb(itemResult)
end)


---- ** Cut food items event ** ----
RegisterServerEvent('qb-businesses:server:CutFood', function(food)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if validateJob(Player.PlayerData.job.name) then

        local item = Player.Functions.GetItemByName(tostring(Config.CuttingBoard[food].item))

        if item then
            Player.Functions.RemoveItem(Config.CuttingBoard[food].item, 1)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.CuttingBoard[food].item], "removed")

            Player.Functions.AddItem(Config.CuttingBoard[food].cutitem, Config.CuttingBoard[food].cutAmt)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.CuttingBoard[food].cutitem], "add")
        else
            TriggerClientEvent('QBCore:Notify', Lang("error.error_food"):format(QBCore.Shared.Items[food].label), "error", 4500)
        end
    end
end)


---- ** Give food item event ** ----
RegisterNetEvent('qb-businesses:server:GetItem', function(item, recipe, business)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if validateJob(Player.PlayerData.job.name) then
        if business then
            for _, v in pairs(recipe) do
                Player.Functions.RemoveItem(v, 1)
            end

            Player.Functions.AddItem(item, 1, false)
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add", 1)
        end
    end
end)


---- ** Get amount of dishes avaible ** ----




QBCore.Functions.CreateCallback('qb-businesses:server:GetActiveAmount', function(source, cb, restaurant, menu)
    MySQL.Async.fetchAll('SELECT * FROM business_items WHERE business = @business AND active = @active AND menu = @menu', {["@business"] = restaurant, ["@active"] = 1, ["@menu"] = menu}, function(menu)
        local canActivate = false
        if #menu <= Config.MaxActiveRecipes then
            canActivate = true
        end
        cb(canActivate)
    end)
end)

RegisterNetEvent('qb-businesses:server:MadeActive', function(id, activate)
    if validateJob(QBCore.Functions.GetPlayer(source).PlayerData.job.name) then
        MySQL.Sync.execute('UPDATE business_items SET active = @active WHERE id = @id', {["@id"] = id, ["@active"] = activate})
        Wait(1000)
        TriggerEvent('qb-businesses:server:RefreshedCached')
    end
end)


---- ** More Tables Shit ** ----
QBCore.Functions.CreateCallback('qb-businesses:server:GetAllTables', function(source, cb, restaurant)
    cb(BusinessCached[restaurant])
end)


QBCore.Functions.CreateCallback('qb-businesses:server:GetItemsCreated', function(source, cb)
    cb(QBCore.Shared.Items)
end)





-- COMBO MEALS --
local ComboMeals = {}

RegisterNetEvent('qb-businesses:server:CreateCombo', function(business, name, Ingredients)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if ComboMeals[business] and ComboMeals[business][name] then return end

    if validateJob(Player.PlayerData.job.name) then
        if not ComboMeals[business] then ComboMeals[business] = {} end
        ComboMeals[business][name] = {
            Place = business,
            Name = name,
            Ingredients = Ingredients
        }

        MySQL.query("INSERT INTO business_data (id, combos) VALUES (:id, :combos) ON DUPLICATE KEY UPDATE combos = :combos",{
            ['id'] = business,
            ['combos'] = json.encode(ComboMeals[business])
        })

        TriggerClientEvent('qb-businesses:client:RefreshTable', -1)
    end
end)

RegisterNetEvent('qb-businesses:server:MakeComboMeal', function(business, name)
    local src = source

    if not business or not name then return end
    if not ComboMeals[business] or not ComboMeals[business][name] then return end

    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    if not validateJob(Player.PlayerData.job.name) then return end

    local reorGanize = {}

    for _, v in pairs(ComboMeals[business][name].Ingredients) do
        if not reorGanize[v.item] then reorGanize[v.item] = 0 end
        reorGanize[v.item] += v.amount
    end

    local txt = ""
    for k, v in pairs(reorGanize) do
        if k ~= "none" and QBCore.Shared.Items[k] then
            if Player.Functions.RemoveItem(k, v) then
                txt = (txt.."<br> %sx - %s"):format(v, QBCore.Shared.Items[k].label)
            end
        end
    end

    local description = ("%s Combo Meal from %s Containing: %s"):format(name, QBCore.Shared.Jobs[business].label, txt)

    Player.Functions.AddItem("foodbag", 1, false, {description = description})
end)


CreateThread(function()
    MySQL.Async.fetchAll('SELECT * FROM business_data', {}, function(result)
        for _,i in pairs(result) do
            local business = i.id
            if i.dui then
                for k,v in pairs(json.decode(i.dui)) do
                    Config.DUI[business][k].url = v
                end
            end
            if i.combos then
                ComboMeals[business] = json.decode(i.combos)
            end
        end
    end)
end)

QBCore.Functions.CreateCallback('qb-businesses:server:GetBusinessCombos', function(_, cb, restaurant)
    cb(ComboMeals[restaurant])
end)
