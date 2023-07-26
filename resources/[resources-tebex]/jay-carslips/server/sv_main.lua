local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("carslip", function(source, item)
    local source = source
    UseItem(source, item)
end)

local function GeneratePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        return GeneratePlate()
    else
        return plate:upper()
    end
end

local function GenerateCarslip(source, car)
    local source = source
    -- print(source)
    local info = {}
    info.car = QBCore.Shared.Vehicles[car].name
    info.vehicle = car
    info.plate = GeneratePlate()
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.AddItem("carslip", 1, nil, info) then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['carslip'], "add")
        TriggerClientEvent('QBCore:Notify', source, 'You Won a '.. QBCore.Shared.Vehicles[car].name ..'!', 'success')
    end
end exports('GenerateCarslip', GenerateCarslip)

local function Carslip(source, car, plate)
    local info = {}
    info.car = car
    info.plate = plate
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.AddItem("carslip", 1, nil, info) then
        TriggerClientEvent('QBCore:Notify', src, 'You Won a '.. QBCore.Shared.Vehicles[car].name ..'!', 'success')
    end
end exports('Carslip', Carslip)

function UseItem(source,item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)

    local data = item.info
    if not data then return end
    if not data.vehicle then return end
    if not data.car then return end
    if not data.plate then return end

    local vehicle = data.vehicle
    local plate = data.plate


    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, garage) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
            Player.PlayerData.license,
            Player.PlayerData.citizenid,
            vehicle,
            GetHashKey(vehicle),
            '{"engineHealth":1000.00,"bodyHealth":1000.00,"fuelLevel":100.0,"tankHealth":1000.00,}',
            plate,
            1,
            "altaparking",
        })
    end
end

-- RegisterCommand("carslip", function(source,args)
--     GenerateCarslip(source, "adder")
-- end)
