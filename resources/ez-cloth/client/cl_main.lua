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
    }


    for i = 1,#Config.Options do 
        local pig = Config.Options[i]
        menuData[#menuData+1] = pig
    end

    exports['qb-menu']:openMenu(menuData)
end)

RegisterNetEvent("ez-knit:CreateClothe", function(data)
    local hasItem = Inventory:HasItem("cloth", data.clothAmt)
    if not hasItem then return false end
    if hasItem then
        TriggerEvent('animations:client:EmoteCommandStart', {"think"})
        local input = exports['qb-input']:ShowInput({
            header = "Clothe Options",
            submitText = "Create",
            inputs = {
                {
                    text = "Clothe ID (#)",
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
            -- print(input.drawableId, input.textureId)
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
                        Framework:Progressbar("create_something", "Creating Clothes", math.random(10000, 30000), false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = true,
                            disableCombat = true,
                        }, {}, {}, {}, function() -- Done
                            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                            TriggerServerEvent("ez-knit:CreateClothe", data.item, input)
                        end)
            
                    else
                        TriggerServerEvent("ez-knit:FAILED", data.clothAmt)
                    end
                end, 1, math.random(4,7)) -- NumberOfCircles, MS

            end)
        end
    end
end)