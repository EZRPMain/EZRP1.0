RegisterNetEvent("ez-hall:buyLicense", function(data)
    local source = source
    local Player = Framework:GetPlayer(source)
    local info = {}
    if data.item == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif data.item == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Class C Driver License"
    elseif data.item == "weaponlicense" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
    end
    if Player.Functions.RemoveMoney("cash", data.price) or Player.Functions.RemoveMoney('bank', data.price) then
        if Player.Functions.AddItem(data.item, 1, false, info) then
            TriggerClientEvent("QBCore:Notify", source, ("Successfully purchased %s"):format(data.name))
        end
    end
end)