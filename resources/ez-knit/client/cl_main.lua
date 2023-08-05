local interiorId = GetInteriorAtCoords(vector3(716.26, -964.86, 30.4))
CreateThread(function()
    exports['qb-target']:AddTargetModel(262461191, {
        options = {
            {
                event = "ez-knit:openMenu",
                icon = "fas fa-circle",
                label = "Create Clothes",
                canInteract = function(entity)
                    local entityCoords = GetEntityCoords(entity)
                    local entityInterior = GetInteriorAtCoords(entityCoords)
                    if entityInterior == interiorId then return true end
                    return false
                end
            },
        },
        distance = 2.5,
    })
end)

CreateThread(function()
    local blip = AddBlipForCoord(717.44, -968.92, 28.57)
    SetBlipSprite(blip, 362)
    SetBlipAsShortRange(blip, true)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 40)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Frabric Co")
    EndTextCommandSetBlipName(blip)
end)

RegisterNetEvent("ez-knit:openMenu", function()
    local menuData = {
        {
            header = "Clothe Options",
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = "Mask",
            txt = "Create mask",
            params = {
                event = "ez-knit:CreateMask",
                args = {
                    number = 1,
                }
            }
        },
    }


    exports['qb-menu']:openMenu(menuData)
end)

RegisterNetEvent("ez-knit:CreateMask", function()
    TriggerEvent('animations:client:EmoteCommandStart', {"think"})
    local input = exports['qb-input']:ShowInput({
        header = "Mask Options",
        submitText = "Create",
        inputs = {
            {
                text = "Mask ID (#)",
                name = "drawableId",
                type = "number",
                isRequired = true, 
                default = 1,
            },
            {
                text = "Texture ID (#)",
                name = "textureId",
                type = "number",
                isRequired = true,
                default = "0",
            },
        }
    })
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    if input ~= nil then
        -- if not input.drawable then input.drawable = 1 end
        -- if not input.texture then input.texture = 0 end
        print(input.drawableId, input.textureId)
        TriggerEvent('animations:client:EmoteCommandStart', {"adjust"})
        Framework:Progressbar("gett_reddu", "Getting Ready", math.random(100,1000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = true,
            disableCombat = true,
        }, {}, {}, {}, function() -- Done
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            exports['ps-ui']:Circle(function(success)
                if success then
                    -- print("success")
                    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic2"})
                    Framework:Progressbar("create_something", "Creating Mask", math.random(10000, 30000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = true,
                        disableCombat = true,
                    }, {}, {}, {}, function() -- Done
                        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        TriggerServerEvent("ez-knit:CreateMask", input)
                    end)
        
                else
                    TriggerServerEvent("ez-knit:FAILED")
                end
            end, 1, math.random(4,7)) -- NumberOfCircles, MS

            -- TriggerServerEvent("ez-knit:CreateMask", input)
        end)

        -- Framework:Notify("Get ready")

        -- local Tiem = math.random(10000, 30000)
        -- TriggerEvent('animations:client:EmoteCommandStart', {"mechanic2"})
        -- Framework:Progressbar("create_something", "Creating Mask", Tiem, false, true, {
        --     disableMovement = true,
        --     disableCarMovement = true,
        --     disableMouse = true,
        --     disableCombat = true,
        -- }, {}, {}, {}, function() -- Done
        --     TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        --     TriggerServerEvent("ez-knit:CreateMask", input)
        -- end)
        
    end
end)