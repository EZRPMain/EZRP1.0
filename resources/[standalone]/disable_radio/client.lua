CreateThread(function()
    while true do
        Wait(1000)
        if IsPedInAnyVehicle(PlayerPedId()) then
            SetUserRadioControlEnabled(false)
            if GetPlayerRadioStationName() ~= nil then
                SetVehRadioStation(GetVehiclePedIsIn(PlayerPedId()),"OFF")
            end
        end
    end
end)