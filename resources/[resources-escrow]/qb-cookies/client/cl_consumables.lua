RegisterNetEvent("consumables:client:UsePurpleCookiePunchBlunt")
AddEventHandler("consumables:client:UsePurpleCookiePunchBlunt", function()
    Framework:Progressbar("smoke_joint", "Lighting Blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("purplecookiepunchblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:UseThinMintCookiesBlunt")
AddEventHandler("consumables:client:UseThinMintCookiesBlunt", function()
    Framework:Progressbar("smoke_joint", "Lighting Blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("thinmintcookiesblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:UsePinkCookiesBlunt")
AddEventHandler("consumables:client:UsePinkCookiesBlunt", function()
    Framework:Progressbar("smoke_joint", "Lighting Blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("pinkcookiesblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:UseLemonCookiesBlunt")
AddEventHandler("consumables:client:UseLemonCookiesBlunt", function()
    Framework:Progressbar("smoke_joint", "Lighting Blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("lemoncookiesblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:UseCerealMilkBlunt")
AddEventHandler("consumables:client:UseCerealMilkBluntt", function()
    Framework:Progressbar("smoke_joint", "Lighting Blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("cerealmilkblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:UseCakeMixBlunt")
AddEventHandler("consumables:client:UseCakeMixBlunt", function()
    Framework:Progressbar("smoke_joint", "Lighting Blunt..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("cakemixblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Usegorrilaglueblunt")
AddEventHandler("consumables:client:Usegorrilaglueblunt", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("gorrilaglueblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:backpackboyzblunt")
AddEventHandler("consumables:client:backpackboyzblunt", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("backpackboyzblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Usegarypaytonblunt")
AddEventHandler("consumables:client:Usepurple_haze", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("garypaytonblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Useitalianiceblunt")
AddEventHandler("consumables:client:Useitalianiceblunt", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("italianiceblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Useblackcherrygelatoblunt")
AddEventHandler("consumables:client:Useblackcherrygelatoblunt", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("blackcherrygelatoblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Usepeanutbutterbreathblunt")
AddEventHandler("consumables:client:Usepeanutbutterbreathblunt", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("peanutbutterbreathblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Usepoundcakeblunt")
AddEventHandler("consumables:client:Usepoundcakeblunt", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("poundcakeblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Usejefeogblunt")
AddEventHandler("consumables:client:Usejefeogblunt", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("jefeogblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Usethraxogblunt")
AddEventHandler("consumables:client:Usethraxogblunt", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("thraxogblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Usesharklatoblunt")
AddEventHandler("consumables:client:Usesharklatoblunt", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("sharklatoblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Uselemonpeperblunt")
AddEventHandler("consumables:client:Uselemonpeperblunt", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("lemonpeperblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Usewhiteruntzblunt")
AddEventHandler("consumables:client:Usewhiteruntzblunt", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("whiteruntzblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Usesnowmontanablunt")
AddEventHandler("consumables:client:Usesnowmontanablunt", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("snowmontanablunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)

RegisterNetEvent("consumables:client:Usesorbertblunt")
AddEventHandler("consumables:client:Usesorbertblunt", function()
    Framework:Progressbar("smoke_joint", "Lighting joint..", 1500, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", Framework:GetSharedItem("sorbertblunt"), "remove")
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent('animations:client:EmoteCommandStart', {"smoke3"})
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"smokeweed2"})
        end
        TriggerEvent("evidence:client:SetStatus", "weedsmell", 300)
        TriggerEvent('animations:client:SmokeWeed')
    end, function() -- Cancel
        Framework:Notify("Canceled..", "error")
    end)
end)