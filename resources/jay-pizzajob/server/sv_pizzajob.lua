RegisterNetEvent("pizzajob:Deliver", function(plate)
    local source = source
    local Player = Framework:GetPlayer(source)
    local chance1 = math.random(1,3)
    if chance1 == 1 then
        Inv:AddItem(source, "twerks_candy", math.random(1,2), false)
        --Player.Functions.AddItem("twerks_candy", math.random(1,2), false)
    elseif chance1 == 3 then
        Player.Functions.AddMoney("cash", math.random(20,40), "pizza-job")
    end
end)

RegisterNetEvent("pizzajob:ReturnStickynote", function(plate)
    local source = source
    local items = Inv:GetItemsByName(source, "stickynote")
    for i=1,#items do
        if (items[i].info.label):match(plate) then
            Inv:RemoveItem(source, items[i].name, 1, items[i].slot)
            break
        end
    end
end)

RegisterNetEvent("pizzajob:RentalPapers", function(plate)
    local source = source
    local Player = Framework:GetPlayer(source)
    local info = {
        label = ("This Vehicle belongs to \"Pizza This\"<br><br>The current driver of this vehicle is: %s %s<br><br>The vehicle plate is: %s"):format(Player.PlayerData.charinfo.firstname,Player.PlayerData.charinfo.lastname, plate)
    }
    -- Player.Functions.AddItem("stickynote", 1, false, info)
    Inv:AddItem(source, "stickynote", 1, false, info)
end)

RegisterServerEvent('jay-pizza:server:Payment', function(jobsDone, repairCost)
	local source = source
    local payment = Config.Payment * jobsDone - repairCost
	local Player = Framework:GetPlayer(source)
    jobsDone = tonumber(jobsDone)
    if jobsDone > 0 then
        if payment > 0 then
            Player.Functions.AddMoney("payslip", payment)
            TriggerClientEvent('qb-phone:client:CustomNotification', source, 'PIZZA THIS', "You have a recieved a payslip of $"..payment, 'fas fa-pizza-slice', '#FF0000', 8000)
        else
            TriggerClientEvent('qb-phone:client:CustomNotification', source, 'PIZZA THIS', "You're Payment has gone to fix this vehicle, FUCK YOU!", 'fas fa-pizza-slice', '#FF0000', 8000)
        end
        -- TriggerClientEvent("QBCore:Notify", source, "You received $"..payment, "success")
        -- TriggerClientEvent('qb-phone:client:CustomNotification', source, 'Payslip', "You have a recieved a payslip of $"..payment, 'fas fa-pizza-slice', '#FF0000', 8000)
    end
end)



