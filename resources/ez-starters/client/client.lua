local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ez-starter:client:givestarteritem')
AddEventHandler('ez-starter:client:givestarteritem', function()
    local ped       = GetPlayerPed(PlayerId())
    local pedcoords = GetEntityCoords(ped)
    local dict      = "scr_rcbarry1"
    local effect    = "scr_alien_teleport"

    if not HasNamedPtfxAssetLoaded(dict) then
        RequestNamedPtfxAsset(dict)
        while not HasNamedPtfxAssetLoaded(dict) do
            Wait(1)
        end
    end
    
    UseParticleFxAssetNextCall(dict)
    local part = StartParticleFxLoopedAtCoord(effect, pedcoords.x, pedcoords.y, pedcoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)


    TriggerServerEvent('ez-starter:server:giveitem') --Remove the item once used
end)