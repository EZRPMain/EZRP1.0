RegisterNetEvent('server:RentalCar', function(data)
    local source = source
    local money = data.money
    local model = data.model
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveMoney('bank', money, "vehicle-rental") then
        TriggerClientEvent("client:RentalCar", source, model)
    end
end)
