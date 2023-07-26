local Entered = {}



RegisterNetEvent('qb-businesses:server:EnteredBusiness', function(business)
    local src = source
    if not Config.SitBuff then return end

    local Player = QBCore.Functions.GetPlayer(src)
    local CID = Player.PlayerData.citizenid

    if not business then return end

    if not Config.BusinessManager[business] then return end

    local Ped = GetPlayerPed(src)
    local Coords = GetEntityCoords(Ped)

    if #(Coords - Config.BusinessManager[business].coords) >= 100 then return end

    Entered[CID] = {
        business = business,
        entered = os.time()
    }

    if Config.Debug then print("Entered: "..business) end
end)

RegisterNetEvent('qb-businesses:server:LeftBusiness', function()
    local src = source
    if not Config.SitBuff then return end

    local Player = QBCore.Functions.GetPlayer(src)
    local CID = Player.PlayerData.citizenid

    if not Entered[CID] then return end

    Entered[CID] = nil
end)

local function useSitBuff(business, sitting, sitTime, CID)
    if Config.SitBuff and sitting then
        if business and sitTime then
            if Entered[CID] and Entered[CID].business == business then
                local timePassed = os.time() - Entered[CID].entered
                if timePassed >= sitTime and timePassed >= Config.SitTimer then
                    if Config.Debug then print("Has sit in business for over %s seconds and will now activate the Sitting Buff") end

                    return true
                else
                    if Config.Debug then print("User hasnt sit long enough to recieve a Sitting Buff") end
                    return false
                end
            else
                if Config.Debug then print("Someone tried to eject shit into the server I guess lol kekw") end
                return false
            end
        else
            return false
        end
    else
        return false
    end
end

RegisterNetEvent('qb-businesses:server:EatMyFuckingFood', function(name, inBusiness, sitting, sitTime)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(name, 1) then
        local result = MySQL.query.await('SELECT recipe FROM business_items WHERE name = @name', {["@name"] = name})
        local RecipeInfo = json.decode(result[1].recipe)
        local CID = Player.PlayerData.citizenid
        local recipe = {}

        for _, v in pairs(RecipeInfo) do
            if recipe[v] then recipe[v].amount = recipe[v].amount + 1 end
            if recipe[v] then
                recipe[v] = {
                    amount = recipe[v].amount,
                    name = v
                }
            else
                recipe[v] = {
                    amount = 1,
                    name = v
                }
            end
        end

        local sitBuff = useSitBuff(inBusiness, sitting, sitTime, CID)

        local sitBuffPer = sitBuff and Config.SitBuffPercent or 1.0

        local value = 0
        local sugar = 0
        local protein = 0
        local healthy = 0
        local dairy = 0
        local grain = 0
        local seasoning = 0

        for _, v in pairs(recipe) do
            if Config.Ingredients["Main"][v.name] then
                local Amount = Config.IngredientsSpam and recipe[v.name].amount >= Config.IngredientSpamLimit and (recipe[v.name].amount / 2) or recipe[v.name].amount

                value = value + (Config.Ingredients["Main"][v.name].Value * Amount)
                if Config.Ingredients["Main"][v.name].sugarAmt then
                    sugar = sugar + (Config.Ingredients["Main"][v.name].sugarAmt * Amount)
                end

                if Config.Ingredients["Main"][v.name].proteinAmt then
                    protein = protein + (Config.Ingredients["Main"][v.name].proteinAmt * Amount)
                end

                if Config.Ingredients["Main"][v.name].healthyAmt then
                    healthy = healthy + (Config.Ingredients["Main"][v.name].healthyAmt * Amount)
                end

                if Config.Ingredients["Main"][v.name].dairyAmt then
                    dairy = dairy + (Config.Ingredients["Main"][v.name].dairyAmt * Amount)
                end

                if Config.Ingredients["Main"][v.name].grainAmt then
                    grain = grain + (Config.Ingredients["Main"][v.name].grainAmt * Amount)
                end

                if Config.Ingredients["Main"][v.name].falvouringAmt then
                    seasoning = seasoning + (Config.Ingredients["Main"][v.name].falvouringAmt * Amount)
                end
            end
        end

        local table = {
            hunger = Config.SitEffectHunger and value * sitBuffPer or value,
            sugarAmt = sugar * sitBuffPer,
            proteinAmt = protein * sitBuffPer,
            healthyAmt = healthy * sitBuffPer,
            dairyAmt = dairy * sitBuffPer,
            grainAmt = grain * sitBuffPer,
            seasoningAmt = seasoning * sitBuffPer,
        }

        if Config.Debug then print("Eaten: "..name.." With the diary amount of "..json.encode(table)) end

        TriggerEvent('qb-businesses:server:foodBuffsAmt', src, CID, table)
    end
end)

RegisterNetEvent('qb-businesses:server:DrinkMyFuckingShit', function(name, inBusiness, sitting, sitTime)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(name, 1) then
        local result = MySQL.query.await('SELECT recipe FROM business_items WHERE name = @name', {["@name"] = name})
        local RecipeInfo = json.decode(result[1].recipe)
        local CID = Player.PlayerData.citizenid
        local recipe = {}
        if RecipeInfo then
            for _, v in pairs(RecipeInfo) do
                if recipe[v] then recipe[v].amount = recipe[v].amount + 1 end
                if recipe[v] then
                    recipe[v] = {
                        amount = recipe[v].amount,
                        name = v
                    }
                else
                    recipe[v] = {
                        amount = 1,
                        name = v
                    }
                end
            end

            local sitBuff = useSitBuff(inBusiness, sitting, sitTime, CID)

            local sitBuffPer = sitBuff and Config.SitBuffPercent or 1.0

            local value = 0
            local sugar = 0
            local alcohol = 0
            for _, v in pairs(recipe) do
                if Config.Ingredients["Drinks"][v.name] then

                    local Amount = Config.IngredientsSpam and recipe[v.name].amount >= Config.IngredientSpamLimit and (recipe[v.name].amount / 2) or recipe[v.name].amount
                    value = value + (Config.Ingredients["Drinks"][v.name].Value * Amount)

                    if Config.Ingredients["Drinks"][v.name].sugarAmt and Config.Ingredients["Drinks"][v.name].sugarAmt > 0 then
                        sugar = sugar + (Config.Ingredients["Drinks"][v.name].sugarAmt * Amount)
                    end

                    if Config.Ingredients["Drinks"][v.name].alcoholAmt and Config.Ingredients["Drinks"][v.name].alcoholAmt > 0 then
                        alcohol = alcohol + (Config.Ingredients["Drinks"][v.name].alcoholAmt * Amount)
                    end
                end
            end

            local Table = {
                alcoholAmt = alcohol * sitBuffPer,
                sugarAmt = sugar * sitBuffPer,
                thirst = Config.SitEffectWater and value * sitBuffPer or value,
            }

            TriggerEvent('qb-businesses:server:DrinkBuffsAmt', src, CID, Table)

            if Config.Debug then print("Drank: "..name.." With the diary amount of "..json.encode(Table)) end
        end
    end
end)