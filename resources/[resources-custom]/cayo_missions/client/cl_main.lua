QBCore = exports['qb-core']:GetCoreObject()

-- restart chat bc its broken on my dev server
-- AddEventHandler('onResourceStart', function(resourceName)
--     if (resourceName == "chat") then
--       return
--     end
--     ExecuteCommand("ensure chat")
-- end)


StartedQuest = false
Return = false
HasPackage = false
Prop = 0

function AttachPackage()
    local ad = "anim@heists@box_carry@" 
    local anim = "idle"
    while not HasAnimDictLoaded(ad) do
        RequestAnimDict(ad)
        Wait(1)
    end
    CreateThread(function()
        while HasPackage do
            local ped = PlayerPedId()
            if not IsEntityPlayingAnim(ped,ad, anim, 3) then
                TaskPlayAnim(ped, ad, anim, 8.00, -8.00, -1, (2 + 16 + 32), 0.00, 0, 0, 0)
            end
            Wait(500)
        end
    end)
end

QuestsType = ''
Quests = {
    [1] = function()
        QuestsType = 'package'
        local RandomPackageLocation = {
            vector4(4809.63, -4310.32, 7.92, 327.73),
            vector4(4536.61, -4705.4, 1.66, 224.65),
            vector4(5618.53, -5656.35, 10.05, 234.84),
            vector4(5423.04, -5240.93, 35.47, 230.96),
            vector4(5180.85, -4657.62, 2.53, 127.99),
        }
        local RandomPackageProp = {
            `prop_cs_package_01`,
            `prop_drug_package`,
            `prop_drug_package_02`,
            `prop_cs_cardbox_01`,
            `prop_cs_rub_box_02`,
            `prop_cs_rub_box_01`,
        }
        local RandomSayings = {
            "Can you look for my missing package?",
            "You will find my missing packge,",
            "I LOST MY FUCKING PACKAGE, HELP ME!!",
        }
        local SelectedPackageLocation = RandomPackageLocation[math.random(1,#RandomPackageLocation)]
        local SelectedPackageProp = RandomPackageProp[math.random(1,#RandomPackageProp)]
        --print(SelectedPackageLocation, SelectedPackageProp)
        Prop = CreateObject(SelectedPackageProp, SelectedPackageLocation.x, SelectedPackageLocation.y, SelectedPackageLocation.z, true, true, true)
        SetEntityAsMissionEntity(Prop, true, true)
        PlaceObjectOnGroundProperly(Prop)
        FreezeEntityPosition(Prop, true)
        local BlipLocation = vector3(SelectedPackageLocation.x + math.random(-40,40), SelectedPackageLocation.y + math.random(-40,40), SelectedPackageLocation.z)
        local RadiusBlip = AddBlipForRadius(BlipLocation.x, BlipLocation.y, BlipLocation.z, 50.0)
        local Blip = AddBlipForCoord(BlipLocation.x, BlipLocation.y, BlipLocation.z)
        SetBlipColour(RadiusBlip, 1)
        SetBlipAlpha(RadiusBlip, 80)
        SetBlipSprite(Blip, 501)
        -- print(Prop)
        local SelectedSaying = RandomSayings[math.random(#RandomSayings)]
        TriggerEvent('QBCore:Notify', SelectedSaying)
        exports['qb-target']:AddEntityZone("quest",Prop, {
            name = "quest",
            debugPoly = false, 
        },{
            options = { 
                {
                    type = "client",
                    icon = 'fas fa-example',
                    label = 'Pickup Package',
                    action = function(entity)
                        -- FreezeEntityPosition(Prop, false)
                        -- if IsPedAPlayer(entity) then return false end
                        HasPackage = true
                        AttachPackage()
                        RemoveBlip(RadiusBlip)
                        RemoveBlip(Blip)
                        TriggerEvent("QBCore:Notify", "You have picked up the package, Bring it back to the man.")
                        AttachEntityToEntity(entity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 60309), 0.025, 0.08, 0.255, -145.0, 290.0, 0.0, true, true, false, true, 1, true)
                        -- exports['qb-target']:RemoveTargetEntity(entity)
                        exports['qb-target']:RemoveZone("quest")
                    end,
                    -- canInteract = function(entity, distance, data)
                    --     if IsPedAPlayer(entity) then return false end
                    --     return true
                    -- end,
                }
            },
            distance = 2.5,
        })
    end,
    -- [2] = function()
    --     TriggerEvent('QBCore:Notify', "I need me a good joint, Can you get me one?")
    -- end,
}

CreateThread(function() 
    local Location = vector3(4863.24, -4633.92, 14.29)
    local BlipLocation = vector3(Location.x + math.random(-40,40), Location.y + math.random(-40,40), Location.z)
    local RadiusBlip = AddBlipForRadius(BlipLocation.x, BlipLocation.y, BlipLocation.z, 50.0)
    local Blip = AddBlipForCoord(BlipLocation.x, BlipLocation.y, BlipLocation.z)
    SetBlipColour(RadiusBlip, 2)
    SetBlipAlpha(RadiusBlip, 80)
    SetBlipSprite(Blip, 280)
    SetBlipAsShortRange(Blip, true)
    SetBlipScale(Blip, 0.8)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Man in Need")
    EndTextCommandSetBlipName(Blip)
end)
CreateThread(function()
    exports['qb-target']:SpawnPed({
        spawnNow = true,
        model = 'u_m_y_militarybum',
        coords = vector4(4863.24, -4633.92, 14.29, 168.77),
        minusOne = true,
        freeze = true,
        invincible = true,
        blockevents = true,
        -- animDict = 'abigail_mcs_1_concat-0',
        -- anim = 'csb_abigail_dual-0',
        -- flag = 1,
        scenario = 'WORLD_HUMAN_BUM_STANDING',
        target = {
            useModel = false,
            options = {
                {
                    type = "client",
                    icon = 'fas fa-example',
                    label = 'Start Quest',
                    action = function(entity)
                        if IsPedAPlayer(entity) then return false end
                        -- TriggerEvent('QBCore:Notify', "Can you look for my missing package?")
                        StartedQuest = true
                        Return = true
                        Quests[math.random(#Quests)]()
                    end,
                    canInteract = function(entity, distance, data)
                        if IsPedAPlayer(entity) then return false end
                        return not StartedQuest
                    end,
                },
                {
                    type = "client",
                    icon = 'fas fa-example',
                    label = 'Return Package',
                    action = function(entity)
                        if IsPedAPlayer(entity) then return false end
                        if not HasPackage then TriggerEvent("QBCore:Notify", "Boy I dont see no fucking package, GO BACK AND LOOK!") return end
                        DeleteEntity(Prop)
                        StopAnimTask(PlayerPedId(), "anim@heists@box_carry@" , "idle", 1.0)
                        TriggerServerEvent("server:Reward", QuestsType)
                        StartedQuest = false
                        HasPackage = false
                        Return = false
                    end,
                    canInteract = function(entity, distance, data)
                        if IsPedAPlayer(entity) then return false end
                        return Return
                    end,
                }
            },
            distance = 2.5,
        },
        -- currentpednumber = 0,
    })
end)

