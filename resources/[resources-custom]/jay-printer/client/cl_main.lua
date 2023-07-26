RegisterNetEvent('jay-printer:useItem', function(ItemData)
    local DocumentUrl = ItemData.info.url ~= nil and ItemData.info.url or false
    if not DocumentUrl then return end
    exports['ps-ui']:ShowImage(DocumentUrl)
end)

RegisterNetEvent('jay-printer:usePrinter', function(data)
    local keyboard = exports['qb-input']:ShowInput({
        header = "Printer",
        submitText = "Confirm",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                text = "Title",
                name = 'title',
            },
            {
                type = 'text',
                isRequired = true,
                text = "Image (URL)",
                name = 'url',
            },
            {
                type = 'text',
                isRequired = true,
                text = "Description",
                name = 'description',
            },
        }
    })
    if keyboard then
        TriggerServerEvent("jay-printer:savePaperDocument", keyboard,data.name)
    end
end)

RegisterNetEvent("jay-printer:fillPrinter", function(data)

    local printer = {}
    printer.label = "Printer"
    printer.slots = 1

    TriggerServerEvent("inventory:server:OpenInventory", "stash", data.name, printer)
    TriggerEvent("inventory:client:SetCurrentStash",  data.name)
end)

exports["qb-target"]:AddBoxZone("gabzmrpdpdprinter", vector3(463.65, -984.25, 30.73), 0.5, 0.5, {
    name="gabzmrpdpdprinter",
    heading=0,
    --debugPoly=true,
    minZ=27.13,
    maxZ=31.13,
}, {
	options = {
		{
			event = "jay-printer:usePrinter",
			icon = "fas fa-print",
			label = "Print Document",
			job = "police",
            name = "BossPrinterMRPD"
		},
        {
			event = "jay-printer:fillPrinter",
			icon = "fas fa-print",
			label = "Add Paper",
			job = "police",
            name = "BossPrinterMRPD"
		}
	},
	distance = 2
});