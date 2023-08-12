RegisterCommand("hat", function()
    TriggerEvent("ez-usables:client:ToggleHat")
end, false)

RegisterCommand("abla", function()
    print(GetPedPropIndex(PlayerPedId(), 0))
end)

RegisterNetEvent('ez-usables:client:ToggleHat', function()
    local ped = PlayerPedId()
    local hat = GetPedPropIndex(ped, 0)
    local tex = GetPedPropTextureIndex(ped, 0)

    if hat == 0 then
        TriggerServerEvent("ez-usables:server:HatOnByCommand")
    else
        TriggerEvent("ez-usables:client:HatOff", hat, tex)
    end
end)

RegisterNetEvent('ez-usables:client:HatOn', function(item)
    local ped = PlayerPedId()
    if item.info.drawableId == nil then print("This hat has no data. Do not spawn it in. Instead go to a clothing store then remove the hat") end
    -- print(GetPedPropIndex(ped, 0))
    if GetPedPropIndex(ped, 0) ~= 0 then Framework:Notify("You are already wearing a hat", "error") return end

    Framework:Progressbar("haton", "Putting Hat On..", 600, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = "mp_masks@standard_car@ds@",
        anim = "put_on_mask",
        flags = 49,
    }, {}, {}, function() -- Done
        SetPedPropIndex(ped, 0, item.info.drawableId, item.info.textureId)
        print(item.name)
        TriggerServerEvent("ez-usables:server:RemoveHatItem", item)
    end, function() -- Cancel

    end)
end)

RegisterNetEvent('ez-usables:client:HatOff', function(hat, tex)
    local ped = PlayerPedId()
    if GetPedPropIndex(ped, 0) == 0 then Framework:Notify("You are not wearing a hat", "error") return end

    Framework:Progressbar("hatoff", "Taking Hat Off..", 600, false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = "missfbi4",
        anim = "takeoff_mask",
        flags = 49,
    }, {}, {}, function() -- Done
        SetPedPropIndex(ped, 0, 0)
        TriggerServerEvent("ez-usables:server:GiveHatItem", hat, tex)
    end, function() -- Cancel

    end)
end)