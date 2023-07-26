local Snipers = {
    [`weapon_sniperrifle`] = true,
    [`weapon_heavysniper`] = true,
    [`weapon_heavysniper_mk2`] = true,
    [`weapon_marksmanrifle`] = true,
    [`weapon_marksmanrifle_mk2`] = true,
    [`weapon_precisionrifle`] = true,
}

CreateThread(function()
	while true do
		local sleep = 10
        Wait(sleep)
        if IsControlJustPressed(0,25) and Snipers[GetSelectedPedWeapon(PlayerPedId())] then
            SendNUIMessage({
                display = true,
            })
            HideHudComponentThisFrame(14)
        elseif IsControlJustReleased(0,25) and Snipers[GetSelectedPedWeapon(PlayerPedId())] then
            SendNUIMessage({
                display = false,
            })
        end
    end
end)