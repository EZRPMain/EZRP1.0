RegisterNetEvent("ez-scrap:openScrap", function()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local dist = #(coords - vector3(262.63, -1796.93, 27.11))
	if dist > 5 then return end

	local menuData = {
		{
            header = "Recyclables Trader",
            isMenuHeader = true,
        },
	}
	for i = 1, #Config.Recyclables do 
		local item = Config.Recyclables[i]
		menuData[#menuData+1] = {
			header = Framework:GetSharedItem(item).label,
			icon = item,
			txt = ("Trade %s for %s"):format(Framework:GetSharedItem("recyclablematerial").label,Framework:GetSharedItem(item).label),
			params = {
				event = "ez-scrap:openInput",
				args = {
					item = item,
				}
			}
		}
	end


	exports['qb-menu']:openMenu(menuData)
end)

RegisterNetEvent("ez-scrap:openInput", function(data)

	local item = data.item

	local dialog = exports['qb-input']:ShowInput({
        header = "Trade Amount",
        submitText = "Trade",
        inputs = {
            {
                text = "Amount (#)",
                name = "amount",
                type = "number",
                isRequired = true, 
                -- default = "CID-1234", -- Default text option, this is optional
            },
		},
	})
	
	if dialog ~= nil then
		local amount = tonumber(dialog.amount)
		if Inventory:HasItem("recyclablematerial", amount) then
			TriggerServerEvent("ez-scrap:trade",  item, amount)
		else
			Framework:Notify("You don't have enough recycables", "error")
		end
	end

end)