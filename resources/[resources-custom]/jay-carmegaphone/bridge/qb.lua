local QBCore = exports['qb-core']:GetCoreObject()
local policeJobs = {
    ["police"] = true,
    ["sheriff"] = true,
}
function canUseCarMegaphone()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped) then
        local job = QBCore.Functions.GetPlayerData().job.name
        local vehicle = GetVehiclePedIsIn(ped)
        local vehicleClass = GetVehicleClass(vehicle)
        if DoesEntityExist(vehicle) and vehicleClass == 18 and policeJobs[job] then
            return true
        end
    end
    return false
end
