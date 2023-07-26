business = nil

function log(text)
    print(json.encode(text, { pretty = true, indent = "  ", align_keys = true }))
end

RegisterNetEvent('qb-businesses:client:ManagerMenu', function()
    if PlayerData.job.name == business then
        local openMainMenu = {
            {
                header = business:sub(1,1):upper()..business:sub(2).." "..Lang:t("menu.management"),
                isMenuHeader = true,
                icon = "fa-solid fa-circle-info",
            },
            {
                header = Lang:t("header.new_item"),
                txt = Lang:t("header.newmenu_item"),
                icon = "fa-solid fa-circle-plus",
                params = {
                    event = "qb-business:client:CreateItemsMenu",
                }
            },
            {
                header = Lang:t("header.manage_menu"),
                txt = Lang:t("subtext.recipes"),
                icon = "fa-solid fa-people-roof",
                params = {
                    event = "qb-business:client:ManageItems",
                }
            },
        }



        if Config.UseQBManagement then
            openMainMenu[#openMainMenu+1] = {
                header = Lang:t("header.boss"),
                txt = Lang:t("subtext.hire"),
                icon = "fa-solid fa-user-tie",
                params = {
                    event = "qb-bossmenu:client:OpenMenu",
                }
            }
        end

        openMainMenu[#openMainMenu+1] = {
            header = Lang:t("header.closemenu"),
            icon = "fa-solid fa-circle-xmark",
            params = {
                event = "qb-menu:closeMenu",
            }
        }


        exports[Config.Menu]:openMenu(openMainMenu)
    end
end)

RegisterNetEvent('qb-businesses:client:MakeComboMeals', function()
    if not business or not Config.BusinessManager[business] then return end
    local menuTable = {}
    local Loaded = false

    QBCore.Functions.TriggerCallback("qb-businesses:server:GetBusinessMenu", function(items)
        if not items then return end
        for _, v in pairs(items) do
            if tonumber(v.active) == 1 and QBCore.Shared.Items[v.name] then
                menuTable[#menuTable+1] = {
                    text = QBCore.Shared.Items[v.name].label,
                    value = v.name,
                }
            end
        end

        Loaded = true
    end, business)

    while not Loaded do Wait(25) end


    if #menuTable == 0 then return end

    menuTable[#menuTable+1] = {
        text = "none",
        value = "none",
    }

    local menu = {
        header = "Create new Combo Meal Item",
        submitText = "Create Combo Meal",
        inputs = {
            {
                text = Lang:t("input.cap_name"),
                name = 'name',
                type = "text",
                isRequired = true
            }
        }
    }

    for k=1, 6 do
        menu.inputs[#menu.inputs+1] = {
            text = Lang:t("header.ingredients"):format(k),
            name = ("ingredient%s"):format(k),
            type = 'select',
            options = menuTable
        }
    end

    local dialog = exports[Config.Input]:ShowInput(menu)

    if dialog then

        local name = dialog.name
        local ingredients = {
            dialog.ingredient1,
            dialog.ingredient2,
            dialog.ingredient3,
            dialog.ingredient4,
            dialog.ingredient5,
            dialog.ingredient6,
        }

        TriggerServerEvent('qb-businesses:server:CreateCombo', business, name, ingredients)
    end
end)

RegisterNetEvent('qb-business:client:CreateItemsMenu', function()
    local openMainMenu = {
        {
            header = Lang:t("header.new_item"),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
        },
    }
    if Config.BusinessManager[business].type.Food then
        openMainMenu[#openMainMenu+1] ={
            header = Lang:t("header.newfood_item"),
            txt = Lang:t("header.newmenu_item"),
            icon = "fa-solid fa-circle-plus",
            params = {
                event = "qb-business:client:NewBusinessItem",
                args = "food"
            }
        }
    end
    if Config.BusinessManager[business].type.Drink then
        openMainMenu[#openMainMenu+1] ={
            header = Lang:t("header.newdrink_item"),
            txt = Lang:t("header.newmenu_item"),
            icon = "fa-solid fa-circle-plus",
            params = {
                event = "qb-business:client:NewBusinessItem",
                args = "drink"
            }
        }
    end

    openMainMenu[#openMainMenu+1] = {
        header = Lang:t("header.goback"),
        icon = "fa-solid fa-angle-left",
        params = {
            event = "qb-businesses:client:ManagerMenu",
        }
    }

    exports[Config.Menu]:openMenu(openMainMenu)
end)

RegisterNetEvent('qb-business:client:NewBusinessItem', function(data)
    local EmoteOption = {}
    if data == "drink" then
        local menu = {
            header = Lang:t("header.createdrink"),
            submitText = ("Create %s"):format(data),
            inputs = {
                {
                    text = Lang:t("input.cap_name"),
                    name = 'name',
                    type = "text",
                    isRequired = true
                },
                {
                    text = Lang:t("input.cap_description"),
                    name = 'description',
                    type = "text",
                    isRequired = true
                },
                {
                    text = Lang:t("input.img_size"),
                    name = "image",
                    type = "text",
                    isRequired = true
                },
            },
        }

        for _,v in pairs(Config.Ingredients["EmotesD"]) do
            EmoteOption[#EmoteOption+1] = {
                value = v,
                text = v,
            }
        end

        menu.inputs[#menu.inputs+1] = {
            text = Lang:t("input.emotemenu"),
            name = 'emote',
            type = 'select',
            options = EmoteOption
        }

        local dialog = exports[Config.Input]:ShowInput(menu)

        if (dialog and dialog.name and dialog.description and dialog.image and dialog.emote) then
            TriggerServerEvent('qb-businesses:server:CreateItem', dialog, business, "drinks")
            Wait(100)
            TriggerEvent('qb-businesses:client:ManagerMenu')
        end
    elseif data == "food" then
        local openMainMenu = {
            {
                header = business:sub(1,1):upper()..business:sub(2).." Food Creation",
                isMenuHeader = true,
                icon = "fa-solid fa-circle-info",
            },
            {
                header = Lang:t("header.create_main"),
                txt = Lang:t("subtext.main_text"),
                icon = "fa-solid fa-circle-plus",
                params = {
                    event = "qb-businesses:client:CreateNewItem",
                    args = "main"
                }
            },
            {
                header = Lang:t("header.create_side"),
                txt = Lang:t("subtext.side_text"),
                icon = "fa-solid fa-circle-plus",
                params = {
                    event = "qb-businesses:client:CreateNewItem",
                    args = "side"
                }
            },
            {
                header = Lang:t("header.create_dessert"),
                txt = Lang:t("subtext.dessert_text"),
                icon = "fa-solid fa-circle-plus",
                params = {
                    event = "qb-businesses:client:CreateNewItem",
                    args = "dessert"
                }
            },
            {
                header = Lang:t("header.goback"),
                icon = "fa-solid fa-angle-left",
                params = {
                    event = "qb-business:client:CreateItemsMenu",
                }
            },
        }
        exports[Config.Menu]:openMenu(openMainMenu)
    end
end)

RegisterNetEvent('qb-businesses:client:CreateNewItem', function(data)
    local EmoteOption = {}
    local menu = {
        header = "Create new "..data.. " Item",
        submitText = ("Create %s"):format(data),
        inputs = {
            {
                text = Lang:t("input.cap_name"),
                name = "name",
                type = 'text',
                isRequired = true
            },
            {
                text = Lang:t("input.cap_description"),
                name = "description",
                type = 'text',
                isRequired = true
            },
            {
                text = Lang:t("input.img_size"),
                name = "image",
                type = 'text',
                isRequired = true
            },
        },
    }

    for _,v in pairs(Config.Ingredients["EmotesF"]) do
        EmoteOption[#EmoteOption+1] = {
            value = v,
            text = v,
        }
    end

    menu.inputs[#menu.inputs+1] = {
        text = Lang:t("input.emotemenu"),
        name = ("emote"),
        type = "select",
        options = EmoteOption
    }

    local dialog = exports[Config.Input]:ShowInput(menu)
    if (dialog and dialog.name and dialog.description and dialog.image and dialog.emote)  then
        TriggerServerEvent('qb-businesses:server:CreateItem', dialog, business, data)
    end
end)

-----------------------------------------------------
-----------------------------------------------------
--                 Manage Food Item                --
-----------------------------------------------------
-----------------------------------------------------


RegisterNetEvent('qb-business:client:ManageItems', function()
    local OpenManageMenu = {
        {
            header = Lang:t("header.manage_food"),
            isMenuHeader = true,
            icon = "fa-solid fa-circle-info",
        },
        {
            header = Lang:t("header.manage_main"),
            txt = Lang:t("subtext.alter_recipes"),
            icon = "fa-solid fa-user-pen",
            params = {
                event = "qb-businesses:client:AlterFoodItem",
                args = "main"
            }
        },
        {
            header = Lang:t("header.manage_side"),
            txt = Lang:t("subtext.alter_recipes"),
            icon = "fa-solid fa-user-pen",
            params = {
                event = "qb-businesses:client:AlterFoodItem",
                args = "side"
            }
        },
        {
            header = Lang:t("header.manage_desserts"),
            txt = Lang:t("subtext.alter_recipes"),
            icon = "fa-solid fa-user-pen",
            params = {
                event = "qb-businesses:client:AlterFoodItem",
                args = "dessert"
            }
        },
        {
            header = Lang:t("header.manage_drinks"),
            txt = Lang:t("subtext.alter_recipes"),
            icon = "fa-solid fa-user-pen",
            params = {
                event = "qb-businesses:client:AlterFoodItem",
                args = "drinks"
            }
        },
        {
            header = Lang:t("header.goback"),
            icon = "fa-solid fa-angle-left",
            params = {
                event = "qb-businesses:client:ManagerMenu",
                args = ""
            }
        },
    }
    exports[Config.Menu]:openMenu(OpenManageMenu)
end)

RegisterNetEvent("qb-businesses:client:AlterFoodItem", function(data)
    local MenuItems = {}
    local inuse

    QBCore.Functions.TriggerCallback("qb-businesses:server:GetMenuItems",function(food)
        MenuItems = food
        local label = (
            data == "main" and "header.manage_main" or
            data == "side" and "header.manage_side" or
            data == "dessert" and "header.manage_desserts" or
            data == "drinks" and "header.manage_drinks"
        )
        local Menuadd = {
            {
                header = Lang:t(label),
                isMenuHeader = true,
                icon = "fa-solid fa-circle-info"
            }
        }
        if#MenuItems>1 then
            table.sort(MenuItems,function(a,b)
                return a.label:upper() < b.label:upper()
            end)
        end
        for _, v in pairs(MenuItems) do
            Menuadd[#Menuadd + 1] = {
                header = v.label,
                txt = v.active == 1 and Lang:t("input.using") or Lang:t("input.notusing"),
                icon = v.image,
                params = {
                    event = 'qb-businesses:client:AlterItem',
                    args = {
                        name = v.label,
                        id = v.id,
                        menu = data,
                        active = v.active,
                        image = v.image,
                        desc = v.description
                    }
                }
            }
        end
        Menuadd[#Menuadd + 1] = {
            header = Lang:t("header.goback"),
            icon = "fa-solid fa-angle-left",
            params = {
                event = "qb-business:client:ManageItems",
            }
        }
        exports[Config.Menu]:openMenu(Menuadd)
    end, business, data)
end)

RegisterNetEvent('qb-businesses:client:AlterItem', function(data)

    local AlterFood

    if data.active == 1 then
        AlterFood = {
            {
                header = data.name,
                txt = data.desc,
                isMenuHeader = true,
                icon = data.image,
            },
            {
                header = Lang:t("header.alter_recipe"),
                txt = Lang:t("subtext.recipe_text"):format(data.name),
                icon = "fa-solid fa-file-pen",
                params = {
                    event = "qb-businesses:client:AlterRecipe",
                    args = {
                        id = data.id,
                        type = data.menu,
                        name = data.name
                    }
                }
            },
            {
                header = Lang:t("header.remove_menu"),
                txt = Lang:t("subtext.remove_text"):format(data.name),
                icon = "fa-solid fa-xmark",
                params = {
                    event = "qb-businesses:client:Deactivate",
                    args = {
                        id = data.id,
                        menu = data.menu,
                        name = data.name
                    }
                }
            },
        }
    else
        AlterFood = {
            {
                header = data.name,
                txt = data.desc,
                isMenuHeader = true,
                icon = data.image,
            },
            {
                header = Lang:t("header.alter_recipe"),
                txt = Lang:t("subtext.recipe_text"):format(data.name),
                icon = "fa-solid fa-file-pen",
                params = {
                    event = "qb-businesses:client:AlterRecipe",
                    args = {
                        id = data.id,
                        type = data.menu,
                        name = data.name
                    }
                }
            },
            {
                header = Lang:t("header.make_active"),
                txt = Lang:t("subtext.active_item"):format(data.name),
                icon = "fa-solid fa-circle-plus",
                params = {
                    event = "qb-businesses:client:MakeActive",
                    args = {
                        id = data.id,
                        menu = data.menu,
                        name = data.name
                    }
                }
            },
        }
    end


    exports[Config.Menu]:openMenu(AlterFood)
end)

RegisterNetEvent("qb-businesses:client:MakeActive", function(data)
    QBCore.Functions.TriggerCallback("qb-businesses:server:GetActiveAmount",function(canActivate)
        if canActivate then
            QBCore.Functions.Notify(Lang:t("success.available"):format(data.name), "success", 4500)
            TriggerServerEvent('qb-businesses:server:MadeActive', data.id, 1)

            Wait(250)
            TriggerEvent('qb-businesses:client:ManagerMenu')
        else
            QBCore.Functions.Notify(Lang:t("error.maxium"), "error", 4500)
        end
    end, business, data.menu)
end)

RegisterNetEvent("qb-businesses:client:Deactivate", function(data)
    QBCore.Functions.Notify(Lang:t("success.removed"), "success", 4500)
    TriggerServerEvent('qb-businesses:server:MadeActive', data.id, 0)
    Wait(250)
    TriggerEvent('qb-businesses:client:ManagerMenu')
end)


RegisterNetEvent('qb-businesses:client:NewRecipe', function(data)
    local options = {}
    local PrepOptions = {}
    local menu = {
        header = Lang:t("header.new_recipe"),
        submitText = (Lang:t("header.create_new_recipe")),
        inputs = {
            {
                text = Lang:t("subtext.note"),
                name = 'description',
                type = 'text',
                isRequired = false
            },
        }
    }

    if data.type == "drinks" then
        for _,v in pairs(Config.Ingredients["Drinks"]) do
            if v.name ~= "none" then
                options[#options+1] = {
                    value = v.name,
                    text = QBCore.Shared.Items[v.name].label,
                }
            else
                options[#options+1] = {
                    text = "No Ingredient",
                }
            end
        end
    else
        for k,v in pairs(Config.Ingredients["Main"]) do
            if v.name ~= "none" then
                options[#options+1] = {
                    value = v.name,
                    text = QBCore.Shared.Items[v.name].label,
                }
            else
                options[#options+1] = {
                      text = "No Ingredient",
                }
            end
        end
    end

    for k,v in pairs(Config.Stations[business]) do
        PrepOptions[#PrepOptions+1] = {
            value = v.name,
            text = v.name,
        }
    end

    if data.type == "main" then
        for k=1, 6 do
            menu.inputs[#menu.inputs+1] = {
                text = Lang:t("header.ingredients"):format(k),
                name = ("ingredient%s"):format(k),
                type = 'select',
                options = options
            }
        end
    else
        for k=1, 4 do
            menu.inputs[#menu.inputs+1] = {
                text = Lang:t("header.ingredients"):format(k),
                name = ("ingredient%s"):format(k),
                type = 'select',
                options = options
            }
        end
    end

    menu.inputs[#menu.inputs+1] = {
        text = Lang:t("subtext.station"),
        name = 'prep',
        type = 'select',
        options = PrepOptions
    }

    local dialog = exports[Config.Input]:ShowInput(menu)

    if dialog then
        local recipe = {}
        for k=1,  6 do
            local label = ('ingredient%s'):format(k)
            if dialog[label] ~= "undefined" then
                recipe[#recipe+1] = dialog[label]
            end
        end
        TriggerServerEvent('qb-businesses:server:AlterRecipe', recipe, data.id, dialog.prep, dialog.description)
    end
end)

RegisterNetEvent('qb-businesses:client:AlterRecipe', function(data)
    local options = {}
    local PrepOptions = {}
    QBCore.Functions.TriggerCallback("qb-businesses:server:GetItemInfo", function(itemInfo)
        local itemIng = itemInfo.RecipeInfo
        local itemDescription = itemInfo.Description
        local itemStation = itemInfo.StationInfo

        local menu = {
            header = Lang:t("header.alter_recipe"),
            submitText = (Lang:t("header.alter_recipe")),
            inputs = {
                {
                    text = Lang:t("subtext.note"),
                    name = 'description',
                    type = 'text',
                    isRequired = false,
                    default = itemDescription,
                },
            }
        }

        if data.type == "drinks" then
            for _, v in pairs(Config.Ingredients["Drinks"]) do
                if v.name ~= "none" then
                    if QBCore.Shared.Items[v.name] then
                        options[#options+1] = {
                            value = v.name,
                            text = QBCore.Shared.Items[v.name].label,
                        }
                    else
                        if Config.Debug then log(("Missing Ingredient %s"):format(v.name)) end
                    end
                else
                    options[#options+1] = {
                        text = "No Ingredient",
                    }
                end
            end
        else
            for _, v in pairs(Config.Ingredients["Main"]) do
                if v.name ~= "none" then
                    if QBCore.Shared.Items[v.name] then
                        options[#options+1] = {
                            value = v.name,
                            text = QBCore.Shared.Items[v.name].label,
                        }
                    else
                        if Config.Debug then log(("Missing Ingredient %s"):format(v.name)) end
                    end
                else
                    options[#options+1] = {
                        text = "No Ingredient",
                    }
                end
            end
        end

        table.sort(options,function(a,b)
            return a.text:upper() < b.text:upper()
        end)

        for _, v in pairs(Config.Stations[business]) do
            PrepOptions[#PrepOptions+1] = {
                value = v.name,
                text = v.name,
            }
        end



        if #options == 0 then return QBCore.Functions.Notify("No ingredients found!", "error", 4500) end

        if data.type == "main" then
            for k=1, 6 do
                if itemIng then
                    menu.inputs[#menu.inputs+1] = {
                        text = Lang:t("header.ingredients"):format(k),
                        name = ("ingredient%s"):format(k),
                        type = 'select',
                        options = options,
                        default = itemIng[k]
                    }
                    itemIng.k = nil
                else
                    menu.inputs[#menu.inputs+1] = {
                        text = Lang:t("header.ingredients"):format(k),
                        name = ("ingredient%s"):format(k),
                        type = 'select',
                        options = options
                    }
                end
            end
        else
            for k=1, 4 do
                if itemIng then
                    menu.inputs[#menu.inputs+1] = {
                        text = Lang:t("header.ingredients"):format(k),
                        name = ("ingredient%s"):format(k),
                        type = 'select',
                        options = options,
                        default = itemIng[k]
                    }
                    itemIng.k = nil
                else
                    menu.inputs[#menu.inputs+1] = {
                        text = Lang:t("header.ingredients"):format(k),
                        name = ("ingredient%s"):format(k),
                        type = 'select',
                        options = options
                    }
                end
            end
        end

        menu.inputs[#menu.inputs+1] = {
            text = Lang:t("subtext.station"),
            name = 'prep',
            type = 'select',
            options = PrepOptions,
            default = itemStation
        }

        local dialog = exports[Config.Input]:ShowInput(menu)

        if dialog then
            local recipe = {}
            for k=1,  6 do
                local label = ('ingredient%s'):format(k)
                if dialog[label] ~= "undefined" then
                    recipe[#recipe+1] = dialog[label]
                end
            end
            TriggerServerEvent('qb-businesses:server:AlterRecipe', recipe, data.id, dialog.prep, dialog.description)
            Wait(math.random(200,350))
            local openItem = {
                id = data.id,
                menu = data.type,
                name = data.name,
            }
            TriggerEvent('qb-businesses:client:AlterItem', openItem)
        end
    end, data.id)
end)

CreateThread(function()
    for k, v in pairs(Config.BusinessManager) do
        exports['qb-target']:AddCircleZone("ManagerMenu"..k, v.coords , v.polysize,
        {
            name="ManagerMenu"..k,
            useZ = true,
            debugPoly = Config.debugPoly,
        }, {
            options = {
                {
                    event = "qb-businesses:client:ManagerMenu",
                    icon = v.icon,
                    label = v.label,
                    job = v.job,
                },
            },
            distance = 2.5
        })
    end
end)