RegisterNetEvent('qb-cookies:client:pickpurplecookies')
AddEventHandler('qb-cookies:client:pickpurplecookies', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Purple Cookies Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:PurpleCookiesPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

-- RegisterNetEvent('qb-cookies:client:pickthinmintcookies')
-- AddEventHandler('qb-cookies:client:pickthinmintcookies', function()
--   local playerPed = PlayerPedId()
--   if Framework:GetPlayerData().job.onduty then
--     TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
--     Framework:Progressbar("search_register", "Picking Thin Mint Cookies Marijuana..", 5500, false, true, {
--       disableMovement = true,
--       disableCarMovement = true,
--       disableMouse = false,
--       disableCombat = true,
--     }, {}, {}, {}, function()
--       ClearPedTasks(GetPlayerPed(-1))
--       TriggerServerEvent('qb-cookies:server:ThinMintCookiesPick')
--     end, function()
--       ClearPedTasks(GetPlayerPed(-1))
--     end)
--   else
--     Framework:Notify("You must be Clocked into work", "error")
--   end
-- end)

RegisterNetEvent('qb-cookies:client:pickpinkcookies')
AddEventHandler('qb-cookies:client:pickpinkcookies', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Pink Cookies Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:PinkCookiesPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:picklemoncookies')
AddEventHandler('qb-cookies:client:picklemoncookies', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Lemon Cookies marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:LemonCookiesPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:pickcerealmilk')
AddEventHandler('qb-cookies:client:pickcerealmilk', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Cereal Milk Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:CerealMilkPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:pickcakemix')
AddEventHandler('qb-cookies:client:pickcakemix', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Cake Mix Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:CakeMixPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:pickgorillaglue')
AddEventHandler('qb-cookies:client:pickgorillaglue', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Gorilla Glue Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:GorillaGluePick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:pickbackpackboyz')
AddEventHandler('qb-cookies:client:pickbackpackboyz', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Back Pack Boyz Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:BackPackBoyzPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:pickgarypayton')
AddEventHandler('qb-cookies:client:pickgarypayton', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Gary Payton Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:GaryPaytonPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:pickitalianice')
AddEventHandler('qb-cookies:client:pickitalianice', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Italian Ice Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:ItalianIcePick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:pickblackcherrygelato')
AddEventHandler('qb-cookies:client:pickblackcherrygelato', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Black Cherry Gelato Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:BlackCheryGelatoPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:pickpeanutbutterbreath')
AddEventHandler('qb-cookies:client:pickpeanutbutterbreath', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Peanut Butter Breath Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:PeanutButterBreathPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:pickpoundcake')
AddEventHandler('qb-cookies:client:pickpoundcake', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Pound Cake Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:PoundCakePick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:pickthraxog')
AddEventHandler('qb-cookies:client:pickthraxog', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Thrax OG Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:ThraxOgPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:pickjefeog')
AddEventHandler('qb-cookies:client:pickjefeog', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Jefe OG Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:JefeOgPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:picksharklato')
AddEventHandler('qb-cookies:client:picksharklato', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking SharkLato Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:SharklatoPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:picklemonpeper')
AddEventHandler('qb-cookies:client:picklemonpeper', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Lemon Pepper Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:LemonPeperPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:pickwhiteruntz')
AddEventHandler('qb-cookies:client:pickwhiteruntz', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking White Runtz Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:WhiteRuntzPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:picksnowmontana')
AddEventHandler('qb-cookies:client:picksnowmontana', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Snow Montana Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:SnowMontanaPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:picksorbert')
AddEventHandler('qb-cookies:client:picksorbert', function()
  local playerPed = PlayerPedId()
  if Framework:GetPlayerData().job.onduty then
    TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant')
    Framework:Progressbar("search_register", "Picking Sorbert Marijuana..", 5500, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
    }, {}, {}, {}, function()
      ClearPedTasks(GetPlayerPed(-1))
      TriggerServerEvent('qb-cookies:server:SorbertPick')
    end, function()
      ClearPedTasks(GetPlayerPed(-1))
    end)
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)



------------- Payments -------------

RegisterNetEvent('qb-cookies:openPayment')
AddEventHandler('qb-cookies:openPayment', function()
  SetNuiFocus(true, true)
  SendNUIMessage({action = 'OpenPayment', payments = Config.ActivePayments})
end)

RegisterNetEvent('qb-cookies:client:openRegister')
AddEventHandler('qb-cookies:client:openRegister', function()
  SetNuiFocus(true, true)
  SendNUIMessage({action = 'OpenRegister'})
end)

RegisterNetEvent('qb-cookies:client:sync:register')
AddEventHandler('qb-cookies:client:sync:register', function(RegisterConfig)
  Config.ActivePayments = RegisterConfig
end)

function GetActiveRegister()
  return Config.ActivePayments
end

RegisterNUICallback('Click', function()
  PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback('ErrorClick', function()
  PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
end)

RegisterNUICallback('AddPrice', function(data)
  TriggerServerEvent('qb-cookies:server:add:to:register', data.Price, data.Note)
end)

RegisterNUICallback('PayReceipt', function(data)
  TriggerServerEvent('qb-cookies:server:pay:receipt', data.Price, data.Note, data.Id)
end)

RegisterNUICallback('CloseNui', function()
  SetNuiFocus(false, false)
end)

RegisterNetEvent('qb-cookies:cashRegister')
AddEventHandler('qb-cookies:cashRegister', function()
    Player = Framework:GetPlayerData()
    if Player.job.name == 'cookies' then
        TriggerEvent('qb-cookies:client:openRegister')
    else
        TriggerEvent('qb-cookies:openPayment')
    end
end)

------------- Context -------------

-- RegisterNetEvent("ClockInCookies")
-- AddEventHandler('ClockInCookie', function()
--   TriggerEvent('qb-menu:client:openMenu', {
--         {
--             id = 1,
--             header = "| Cookies |",
--             txt = ""
--         },
--         {
--             id = 2,
--             header = "| Signing On/Off Duty |",
--             txt = "| Use this to sign in/off |",
--             params = {
--                 event = "ClockInCookies"
--             }
--         },
--         {
--             id = 3,
--             header = "| Boss Menu |",
--             txt = "| Boss Options |",
--             params = {
--                 event = "qb-cookies:openbossmenu"
--             }
--         },
--     })
-- end)

RegisterNetEvent('CookiesMenu')
AddEventHandler('CookiesMenu', function()
  TriggerEvent('qb-menu:client:openMenu', {
        {
            id = 1,
            header = "Cookies Items",
            txt = ""
        },
        {
            id = 2,
            header = "| Straight Gas |",
            txt = "",
            params = {
                event = ""
            }
        },
        {
            id = 3,
            header = "| BackPack Boyz Blunt |",
            txt = "$100",
            params = {
                event = ""
            }
        },
        {
          id = 4,
          header = "| Gary Payton Blunt |",
          txt = "$100",
          params = {
              event = ""
           }
        },
        {
        id = 5,
        header = "| Italian Ice Blunt |",
        txt = "$100",
        params = {
            event = ""
           }
        },
        {
          id = 6,
          header = "| BlackCherryGelato Blunt |",
          txt = "$100",
          params = {
              event = ""
           }
        },
        {
          id = 7,
          header = "| PeanutButterBreath Blunt |",
          txt = "$100",
          params = {
              event = ""
          }
      },
      {
          id = 8,
          header = "| Pound Cake Blunt |",
          txt = "$100",
          params = {
              event = ""
          }
      },
      {
        id = 9,
        header = "| JefeOg Blunt |",
        txt = "$100",
        params = {
            event = ""
         }
      },
      {
      id = 10,
      header = "| Thrax OG Blunt |",
      txt = "$100",
      params = {
          event = ""
         }
      },
      {
        id = 11,
        header = "| Sharklato Blunt |",
        txt = "$100",
        params = {
            event = ""
         }
      },
              {
            id = 12,
            header = "| Lemon Peper Blunt |",
            txt = "$100",
            params = {
                event = ""
            }
        },
        {
            id = 13,
            header = "| White Runtz Blunt |",
            txt = "$100",
            params = {
                event = ""
            }
        },
        {
          id = 14,
          header = "| Snow Montana Blunt |",
          txt = "$100",
          params = {
              event = ""
           }
        },
        {
        id = 15,
        header = "| Sorbert Blunt |",
        txt = "$100",
        params = {
            event = ""
           }
        },
        {
          id = 16,
          header = "| PurpleCookiePunch Blunt |",
          txt = "$100",
          params = {
              event = ""
           }
        },
      --   {
      --     id = 17,
      --     header = "| ThinMintCookiesBlunt |",
      --     txt = "$100",
      --     params = {
      --         event = ""
      --     }
      -- },
      {
          id = 18,
          header = "| PinkCookiesBlunt |",
          txt = "$100",
          params = {
              event = ""
          }
      },
      {
        id = 19,
        header = "| LemonCookiesBlunt |",
        txt = "$100",
        params = {
            event = ""
         }
      },
      {
      id = 20,
      header = "| CerealMilkBlunt |",
      txt = "$100",
      params = {
          event = ""
         }
      },
      {
        id = 21,
        header = "| CakeMixBlunt |",
        txt = "$100",
        params = {
            event = ""
         }
      },
    })
end)

RegisterNetEvent('craftjoint')
AddEventHandler('craftjoint', function()
  TriggerEvent('qb-menu:client:openMenu', {
        {
            id = 1,
            header = "Blunt Crafting ",
            txt = ""
        },
        {
            id = 2,
            header = "Purple Cookies Blunt",
            txt = "1x Purple Cookies 8th | 1x Backwoood",
            params = {
                event = "qb-cookies:trigger:PurpleCookies"
            }
        },
        --     {
        --     id = 3,
        --     header = "Thin Mint Cookies Blunt",
        --     txt = "1x Thin Mint Cookies 8th | 1x Backwoood",
        --     params = {
        --         event = "qb-cookies:trigger:ThinMintCookies"
        --     }
        -- },
        {
            id = 4,
            header = "Pink Cookies Blunt",
            txt = "1x Pink Cookies 8th | 1x Backwoood",
            params = {
                event = "qb-cookies:trigger:PinkCookies"
            }
        },
        {
            id = 5,
            header = "Lemon Cookies Blunt",
            txt = "1x Lemon Cookies 8th | 1x Backwoood",
            params = {
                event = "qb-cookies:trigger:LemonCookies"
            }
        },
        {
            id = 6,
            header = "Cereal Milk Blunt",
            txt = "1x Cereal Milk 8th | 1x Backwoood",
            params = {
                event = "qb-cookies:trigger:CerealMilk"
            }
        },
        -- {
        --   id = 7,
        --   header = "STRAIGHT GAS",
        --   txt = "",
        --   params = {
        --       event = "qb-cookies:trigger:lol"
        --   }
        -- },
        {
          id = 8,
          header = "Back Pack Boyz Blunt",
          txt = "1x Back Pack Boyz 8th | 1x Backwoood",
          params = {
              event = "qb-cookies:trigger:BackPackBoyz"
          }
        },
        -- {
        --   id = 9,
        --   header = "",
        --   txt = "",
        --   params = {
        --       event = "qb-cookies:trigger:GaryPayton"
        --   }
        -- },
        {
          id = 10,
          header = "Black Cherry Gelato Blunt",
          txt = "1x Black Cherry Gelato 8th | 1x Backwoood",
          params = {
              event = "qb-cookies:trigger:BlackCherryGelato"
          }
        },
        {
          id = 11,
          header = "Peanut Butter Breath Blunt",
          txt = "1x Peanut Butter Breath 8th | 1x Backwoood",
          params = {
              event = "qb-cookies:trigger:PeanutButterBreath"
          }
        },
        {
          id = 12,
          header = "Pound Cake Blunt",
          txt = "1x Pound Cake 8th | 1x Backwoood",
          params = {
              event = "qb-cookies:trigger:PoundCake"
          }
        },
        {
          id = 13,
          header = "Jefe OG Blunt",
          txt = "1x Jefe Og 8th | 1x Backwoood",
          params = {
              event = "qb-cookies:trigger:JefeOg"
          }
        },
        {
          id = 14,
          header = "Thrax OG Blunt",
          txt = "1x Thrax 8th | 1x Backwoood",
          params = {
              event = "qb-cookies:trigger:ThraxOG"
          }
        },
        {
          id = 15,
          header = "Sharklato Blunt",
          txt = "1x Sharklato 8th | 1x Backwoood",
          params = {
              event = "qb-cookies:trigger:Sharklato"
          }
        },
        {
          id = 16,
          header = "Lemon Peper Blunt",
          txt = "1x Lemon Peper 8th | 1x Backwoood",
          params = {
              event = "qb-cookies:trigger:LemonPeper"
          }
        },
        {
          id = 17,
          header = "White Runtz Blunt",
          txt = "1x White Runtz 8th | 1x Backwoood",
          params = {
              event = "qb-cookies:trigger:WhiteRuntz"
          }
        },
        {
          id = 18,
          header = "Snow Montana Blunt",
          txt = "1x SnowMontana 8th | 1x Backwoood",
          params = {
              event = "qb-cookies:trigger:SnowMontana"
          }
        },
        {
          id = 19,
          header = "Sobert Blunt",
          txt = "1x Cake Mix 8th | 1x Backwoood",
          params = {
              event = "qb-cookies:trigger:Sorbert"
          }
        }
    })
end)

------------- Load Anim -------------

function RequestAnimationDict(AnimDict)
  RequestAnimDict(AnimDict)
  while not HasAnimDictLoaded(AnimDict) do
      Citizen.Wait(1)
  end
end

function RequestAnimationDict(ad)
  RequestAnimDict(ad)
  while not HasAnimDictLoaded(ad) do
      Citizen.Wait(1)
  end
end

------------- Blip -------------

Citizen.CreateThread(function()
  local blip = AddBlipForCoord(-937.2309, -1182.907, 4.972886)
  SetBlipSprite(blip, 140)
  SetBlipAsShortRange(blip, true)
  SetBlipScale(blip, 0.5)
  SetBlipColour(blip, 1)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Cookies Dispensary")
  EndTextCommandSetBlipName(blip)
end)

------------- Events -------------

RegisterNetEvent("ClockInCookies")
 AddEventHandler("ClockInCookies", function()
     TriggerServerEvent('QBCore:ToggleDuty')
 end)

RegisterNetEvent('qb-cookies:client:open:cold:storage')
AddEventHandler('qb-cookies:client:open:cold:storage', function()
  if Framework:GetPlayerData().job.onduty then
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "CookieStash", {maxweight = 1000000, slots = 500})
    TriggerEvent("inventory:client:SetCurrentStash", "CookieStash")
  --   TriggerServerEvent("inventory:server:OpenInventory", "stash", "WeedStorage", {
  --     maxweight = 4000000,
  --     slots = 500,
  -- })
  -- TriggerEvent("inventory:client:SetCurrentStash", " WeedStorage")
  else
    Framework:Notify("You must be Clocked into work", "error")
  end
end)

RegisterNetEvent('qb-cookies:client:open:counter')
AddEventHandler('qb-cookies:client:open:counter', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "WeedShopCounter", {maxweight = 1000000, slots = 6})
    TriggerEvent("inventory:client:SetCurrentStash", "WeedShopCounter")
end)

------------- qbTarget -------------

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("clockin", vector3(-931.64, -1167.23, 5.08), 1, 1.4, {
      name="clockin",
      heading=300.0,
      debugPoly=false,
      minZ=4.58,
      maxZ=5.98,
    },{
      options = {
              {
                type = "client",
                event = "ClockInCookies",
                icon = "fas fa-clock",
                label = "Clock In/Out",
                --job = "cookies",
              },
           },
      distance = 2.5
       })
 end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedStorage", vector3(-930.41, -1177.41, 5.0), 4.1, 0.9, {
      name="WeedStorage",
      heading=30.0,
      debugPoly=false,
      minZ = 4.4,
      maxZ = 5.6,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:open:cold:storage",
                icon = "fas fa-list-alt",
                label = "Weed Shop Storage",
              },
           },
      distance = 1.5
       })
 end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedCashier", vector3(-931.85, -1180.08, 5.03), 0.6, 0.2, {
      name="WeedCashier",
      heading=30.0,
      debugPoly=false,
      minZ=4.63,
      maxZ=5.23,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:cashRegister",
                icon = "fas fa-cash-register",
                label = "Weed Cashregister",
              },
           },
      distance = 1.5
       })
 end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedStorage1", vector3(-933.03, -1177.7, 5.03), 3.8, 0.8, { 
      name="WeedStorage1",
      heading=30.0,
      debugPoly=false,
      minZ = 4.23,
      maxZ = 5.23,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:open:counter",
                icon = "fas fa-inbox",
                label = "Products",
              },
           },
      distance = 1.5
       })
 end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("craftjoints", vector3(-929.99, -1171.73, -0.9), 0.8, 4.2, {
      name="craftjoints",
      heading=31.0,
      debugPoly=false,
      minZ = -4.5,
      maxZ = -0.5,
    },{
      options = {
              {
                type = "client",
                event = "craftjoint",
                icon = "fas fa-inbox",
                label = "Craft Products",
                job = "cookies",
              },
           },
      distance = 1.5
       })
 end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("PickPurpleCookies", vector3(-927.55, -1186.83, -0.88), 3.1, 0.6, {
      name="PickPurpleCookies",
      heading=30.0,
      debugPoly=false,
      minZ=-1.88,
      maxZ=-0.28,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickpurplecookies",
                icon = "fas fa-seedling",
                label = "Pick Purple Cookies Punch Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

-- Citizen.CreateThread(function()
--   exports['qb-target']:AddBoxZone("ThinMintCookiesPick", vector3(-929.5, -1188.34, -0.88), 3.3, 0.5, {
--       name="ThinMintCookiesPick",
--       heading=30.0,
--       debugPoly=false,
--       minZ=-2.08,
--       maxZ=-0.08,
--     },{
--       options = {
--               {
--                 type = "client",
--                 event = "qb-cookies:client:pickthinmintcookies",
--                 icon = "fas fa-seedling",
--                 label = "Pick ThinMintCookies Plant",
--                 job = "cookies",
--               },
--            },
--       distance = 4.0
--        })
-- end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("PinkCookiesPick", vector3(-931.66, -1189.33, -0.88), 4.1, 0.9, {
      name="PinkCookiesPick",
      heading=30.0,
      debugPoly=false,
      minZ=-2.08,
      maxZ=-0.08,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickpinkcookies",
                icon = "fas fa-seedling",
                label = "Pick PinkCookies Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("LemonCookiesPick", vector3(-933.35, -1191.5, -0.88), 3.5, 0.5, {
      name="LemonCookiesPick",
      heading=28.0,
      debugPoly=false,
      minZ=-1.88,
      maxZ=-0.08,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:picklemoncookies",
                icon = "fas fa-seedling",
                label = "Pick LemonCookies Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("CerealMilkPick", vector3(-928.57, -1194.76, -0.88), 3.3, 0.7, {
      name="CerealMilkPick",
      heading=30.0,
      debugPoly=false,
      minZ=-2.08,
      maxZ=-0.28,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickcerealmilk",
                icon = "fas fa-seedling",
                label = "Pick CerealMilk Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("CakeMixPick", vector3(-926.68, -1198.01, -0.88), 2.1, 0.7, {
      name="CakeMixPick",
      heading=30.0,
      debugPoly=false,
      minZ=-1.88,
      maxZ=0.32,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickcakemix",
                icon = "fas fa-seedling",
                label = "Pick CakeMix Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("BackPackBoyzPick", vector3(-923.65, -1196.53, -0.88), 3.9, 0.7, {
      name="BackPackBoyzPick",
      heading=25.0,
      debugPoly=false,
      minZ=-2.08,
      maxZ=-0.08,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickbackpackboyz",
                icon = "fas fa-seedling",
                label = "Pick BackPackBoyz Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("BlackCherryGelatoPick", vector3(-921.4, -1195.11, -0.88), 3.9, 0.7, {
      name="BlackCherryGelatoPick",
      heading=25.0,
      debugPoly=false,
      minZ=-1.88,
      maxZ=-0.08,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickblackcherrygelato",
                icon = "fas fa-seedling",
                label = "Pick BlackCherryGelato Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("GaryPaytonPick", vector3(-920.53, -1200.09, -0.88), 0.5, 3.9, {
      name="GaryPaytonPick",
      heading=27.0,
      debugPoly=false,
      minZ=-2.08,
      maxZ=-0.08,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickgarypayton",
                icon = "fas fa-seedling",
                label = "Pick GaryPayton Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("GorillaGluePick", vector3(-919.37, -1202.51, -0.88), 0.5, 3.9, {
      name="GorillaGluePick",
      heading=30.0,
      debugPoly=false,
      minZ=-2.08,
      maxZ=-0.28,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickgorillaglue",
                icon = "fas fa-seedling",
                label = "Pick GorillaGlue Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("ItalianIcePick", vector3(-916.62, -1197.02, -0.88), 4.7, 0.4, {
      name="ItalianIcePick",
      heading=30.0,
      debugPoly=false,
      minZ=-2.08,
      maxZ=-0.28,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickitalianice",
                icon = "fas fa-seedling",
                label = "Pick ItalianIce Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("JefeOGPick", vector3(-913.99, -1195.53, -0.88), 5.1, 0.7, {
      name="JefeOGPick",
      heading=30.0,
      debugPoly=false,
      minZ=-1.88,
      maxZ=-0.08,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickjefeog",
                icon = "fas fa-seedling",
                label = "Pick JefeOG Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("LemonPeperPick", vector3(-917.96, -1192.41, -0.88), 0.7, 3.2, {
      name="LemonPeperPick",
      heading=30.0,
      debugPoly=false,
      minZ=-1.88,
      maxZ=0.32,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:picklemonpeper",
                icon = "fas fa-seedling",
                label = "Pick LemonPeper Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("PeanutButterBreathPick", vector3(-918.63, -1191.29, -0.88), 0.7, 2.9, {
      name="PeanutButterBreathPick",
      heading=30.0,
      debugPoly=false,
      minZ=-2.08,
      maxZ=0.32,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickpeanutbutterbreath",
                icon = "fas fa-seedling",
                label = "Pick PeanutButterBreath Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("PoundCakePick", vector3(-920.01, -1188.51, -0.88), 0.7, 3.5, {
      name="PoundCakePick",
      heading=25.0,
      debugPoly=false,
      minZ=-1.88,
      maxZ=-0.08,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickpoundcake",
                icon = "fas fa-seedling",
                label = "Pick PoundCake Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("SharklatoPick", vector3(-920.6, -1187.35, -0.88), 0.5, 1.8, {
      name="SharklatoPick",
      heading=30.0,
      debugPoly=false,
      minZ=-1.88,
      maxZ=-0.08,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:picksharklato",
                icon = "fas fa-seedling",
                label = "Pick Sharklato Plant",
                job = "cookies",
              },
           },
           distance = 4.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("SnowMontanaPick", vector3(-923.5, -1182.67, -0.88), 2.2, 0.7, {
      name="SnowMontanaPick",
      heading=29.0,
      debugPoly=false,
      minZ = -2.08,
      maxZ = 0.08,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:picksnowmontana",
                icon = "fas fa-seedling",
                label = "Pick SnowMontana Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("SorbertPick", vector3(-921.81, -1186.44, -0.88), 0.5, 2.5, {
      name="SorbertPick",
      heading=30.0,
      debugPoly=false,
      minZ=-1.88,
      maxZ=-0.08,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:picksorbert",
                icon = "fas fa-seedling",
                label = "Pick Sorbert Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("ThraxOG", vector3(-924.38, -1182.94, -0.88), 2.3, 0.5, {
      name="ThraxOG",
      heading=25.0,
      debugPoly=false,
      minZ=-2.08,
      maxZ=-0.88,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickthraxog",
                icon = "fas fa-seedling",
                label = "Pick ThraxOG Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WhiteRuntzPick", vector3(-933.5, -1191.31, -0.88), 5.401, 0.8, {
      name="WhiteRuntzPick",
      heading=30.0,
      debugPoly=false,
      minZ=-5.08,
      maxZ=-1.08,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:client:pickwhiteruntz",
                icon = "fas fa-seedling",
                label = "Pick WhiteRuntz Plant",
                job = "cookies",
              },
           },
      distance = 4.0
       })
 end)

 Citizen.CreateThread(function()
  exports['qb-target']:AddBoxZone("WeedShopBuy", vector3(-936.25, -1171.71, 5.01), 3.5, 0.5, {
      name="WeedShopBuy",
      heading=33.0,
      debugPoly=false,
      minZ = 4.21,
      maxZ = 5.41,
    },{
      options = {
              {
                type = "client",
                event = "qb-cookies:storeeprod",
                icon = "fas fa-shopping-basket",
                label = "Enter Weed Store",
              },
           },
      distance = 1.5
       })
 end)

-- Citizen.CreateThread(function()
--   while true do
--     local sleep = 2000
--     local PlayerPed = PlayerPedId()
--     local PlayerPos = GetEntityCoords(PlayerPed)
--     local Player = Framework:GetPlayerData()

--     local CookiesMenu = #(PlayerPos - vector3(-934.209, -1176.76, 5.0055))  
    
--     InRange = false
--     if CookiesMenu < 10 then sleep = 2 end
--     if CookiesMenu < 1.0 then
--         InRange = true
--           Framework:DrawText3D(-934.209, -1176.76, 5.0055 ,'~g~E~w~ - Open Cookies Menu')
--             if IsControlJustPressed(0, 38) then
--                 TriggerEvent("CookiesMenu")
--             end
--           end
--     Citizen.Wait(sleep)
--   end
-- end)

RegisterNetEvent("qb-cookies:openbossmenu")
AddEventHandler("qb-cookies:openbossmenu", function()
  local Player = Framework:GetPlayerData()
  if Player.job.grade.level == 2 then
    TriggerServerEvent("qb-bossmenu:server:openMenu")
    else
      Framework:Notify("You aren't the boss.");
    end
end)


RegisterNetEvent("qb-cookies:storeeprod")
AddEventHandler("qb-cookies:storeeprod", function()
  local Player = Framework:GetPlayerData()

    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Weed Shop Items", Config.Items)
end)

------------- Purple Cookies -------------

RegisterNetEvent("qb-cookies:trigger:PurpleCookies")
AddEventHandler("qb-cookies:trigger:PurpleCookies", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:purplecookiepunch8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "purplecookiepunch8th"}) 
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Purple Cookies..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "purplecookiepunch8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "purplecookiepunchblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Purple Cookies Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

------------- Thin Mint Cookies -------------

-- RegisterNetEvent("qb-cookies:trigger:ThinMintCookies")
-- AddEventHandler("qb-cookies:trigger:ThinMintCookies", function()
--   if Framework:GetPlayerData().job.onduty then
--     	-- Framework:TriggerCallback('qb-cookies:server:getitems:thinmintcookies8th', function(HasItem)  
--       local HasItem = Inventory:HasItem({"backwood", "thinmintcookies8th"})  
--     		if HasItem then
--           RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
--           TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
--           Framework:Progressbar("search_register", "Rolling Up Thin Mint Cookies..", 7500, false, true, {
--               disableMovement = true,
--               disableCarMovement = false,
--               disableMouse = false,
--               disableCombat = true,
--             }, {}, {}, {}, function()
--               TriggerEvent('inventory:client:set:busy', false)
--               TriggerServerEvent('cookies:ByeItem', "backwood", 1)
--               TriggerServerEvent('cookies:ByeItem', "thinmintcookies8th", 1)
--               TriggerServerEvent('cookies:WagwanItem', "thinmintcookiesblunt", 1)
--               StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
--               Framework:Notify("Rolled Up Thin Mint Cookies Blunt.", "success")
--           end, function()
--             TriggerEvent('inventory:client:busy:status', false)
--             Framework:Notify("Cancelled..", "error")
--               StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
--           end)
--       else
--           Framework:Notify('You do not have the required items!', "error")
--           end
--     -- end)
--       else 
--         Framework:Notify("You must be Clocked into work", "error")
--     end
-- end)

------------- Pink Cookies -------------

RegisterNetEvent("qb-cookies:trigger:PinkCookies")
AddEventHandler("qb-cookies:trigger:PinkCookies", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:pinkcookies8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "pinkcookies8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Pink Cookies..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "pinkcookies8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "pinkcookiesblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Pink Cookies Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

------------- Lemon Cookies -------------

RegisterNetEvent("qb-cookies:trigger:LemonCookies")
AddEventHandler("qb-cookies:trigger:LemonCookies", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:lemoncookies8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "lemoncookies8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Lemon Cookies..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "lemoncookies8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "lemoncookiesblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Lemon Cookies.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

------------- CerealMilk -------------

RegisterNetEvent("qb-cookies:trigger:CerealMilk")
AddEventHandler("qb-cookies:trigger:CerealMilk", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:cerealmilk8th', function(HasItem)
      local HasItem = Inventory:HasItem({"backwood", "cerealmilk8th"})   
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Cereal Milk Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "cerealmilk8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "cerealmilkblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Cereal Milk Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

------------- GorillaGlue -------------

RegisterNetEvent("qb-cookies:trigger:GorrilaGlue")
AddEventHandler("qb-cookies:trigger:GorrilaGlue", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:gorrilaglue8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "gorrilaglue8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Gorilla Glue Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "gorrilaglue8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "gorrilaglueblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Gorilla Glue Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

----------------Cake Mix-------------

RegisterNetEvent("qb-cookies:trigger:CakeMix")
AddEventHandler("qb-cookies:trigger:CakeMix", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:cakemix8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "cakemix8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Cake Mix Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "cakemix8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "cakemixblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Cake Mix Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

-----------------BackPack Boyz-----------

RegisterNetEvent("qb-cookies:trigger:BackPackBoyz")
AddEventHandler("qb-cookies:trigger:BackPackBoyz", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:backpackboyz8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "backpackboyz8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Back Pack Boyz Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "backpackboyz8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "backpackboyzblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Back Pack Boyz Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

---------------Gary Payton------------------

RegisterNetEvent("qb-cookies:trigger:GaryPayton")
AddEventHandler("qb-cookies:trigger:GaryPayton", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:garypayton8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "garypayton8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Gary Payton Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "garypayton8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "garypaytonblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Gary Payton Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

--------------Italian Ice-----------------

RegisterNetEvent("qb-cookies:trigger:ItalianIce")
AddEventHandler("qb-cookies:trigger:ItalianIce", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:italianice8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "italianice8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Italian Ice Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "italianice8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "italianiceblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Italian Ice Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

-------------Black Cherry Gelato----------------

RegisterNetEvent("qb-cookies:trigger:BlackCherryGelato")
AddEventHandler("qb-cookies:trigger:BlackCherryGelato", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:blackcherrygelato8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "blackcherrygelato8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Black Cherry Gelato Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "blackcherrygelato8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "blackcherrygelatoblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Black Cherry Gelato Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

---------------------Peanut Butter Breath------------------

RegisterNetEvent("qb-cookies:trigger:PeanutButterBreath")
AddEventHandler("qb-cookies:trigger:PeanutButterBreath", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:peanutbutterbreath8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "peanutbutterbreath8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Peanut Butter Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "peanutbutterbreath8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "peanutbutterbreathblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Peanut Butter Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

------------Pound Cake-------------------

RegisterNetEvent("qb-cookies:trigger:PoundCake")
AddEventHandler("qb-cookies:trigger:PoundCake", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:poundcake8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "poundcake8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Pound Cake Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "poundcake8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "poundcakeblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Pound Cake Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

------------Jefe OG-----------

RegisterNetEvent("qb-cookies:trigger:JefeOg")
AddEventHandler("qb-cookies:trigger:JefeOg", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:jefeog8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "jefeog8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Jefe OG Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "jefeog8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "jefeogblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Jefe OG Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

---------------------Thrax OG----------------------

RegisterNetEvent("qb-cookies:trigger:ThraxOG")
AddEventHandler("qb-cookies:trigger:ThraxOG", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:thraxog8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "thraxog8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Thrax OG Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "thraxog8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "thraxogblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Thrax OG Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

RegisterNetEvent("qb-cookies:trigger:Sharklato")
AddEventHandler("qb-cookies:trigger:Sharklato", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:sharklato8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "sharklato8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Sharklato Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "sharklato8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "sharklatoblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Sharklato Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

---------Lemon Pepper-----------------

RegisterNetEvent("qb-cookies:trigger:LemonPeper")
AddEventHandler("qb-cookies:trigger:LemonPeper", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:lemonpeper8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "lemonpeper8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Lemon Peper Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "lemonpeper8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "lemonpeperblunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Lemon Peper Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

-------White Runtz-----------------------

RegisterNetEvent("qb-cookies:trigger:WhiteRuntz")
AddEventHandler("qb-cookies:trigger:WhiteRuntz", function()
  if Framework:GetPlayerData().job.onduty then
      -- Framework:TriggerCallback('qb-cookies:server:getitems:whiteruntz8th', function(HasItem)  
      local HasItem = Inventory:HasItem({"backwood", "whiteruntz8th"})  
          if HasItem then
            RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
            TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
            Framework:Progressbar("search_register", "Rolling Up White Runtz Blunt..", 7500, false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
              }, {}, {}, {}, function()
                TriggerEvent('inventory:client:set:busy', false)
                TriggerServerEvent('cookies:ByeItem', "backwood", 1)
                TriggerServerEvent('cookies:ByeItem', "whiteruntz8th", 1)
                TriggerServerEvent('cookies:WagwanItem', "whiteruntzblunt", 1)
                StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
                Framework:Notify("Rolled Up White Runtz Blunt.", "success")
            end, function()
              TriggerEvent('inventory:client:busy:status', false)
              Framework:Notify("Cancelled..", "error")
                StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
            end)
        else
            Framework:Notify('You do not have the required items!', "error")
        end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

----------------Snow Montana-------------

RegisterNetEvent("qb-cookies:trigger:SnowMontana")
AddEventHandler("qb-cookies:trigger:SnowMontana", function()
  if Framework:GetPlayerData().job.onduty then
    	-- Framework:TriggerCallback('qb-cookies:server:getitems:snowmontana8th', function(HasItem)
      local HasItem = Inventory:HasItem({"backwood", "snowmontana8th"})  
    		if HasItem then
          RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
          TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
          Framework:Progressbar("search_register", "Rolling Up Snow Montana Blunt..", 7500, false, true, {
              disableMovement = true,
              disableCarMovement = false,
              disableMouse = false,
              disableCombat = true,
            }, {}, {}, {}, function()
              TriggerEvent('inventory:client:set:busy', false)
              TriggerServerEvent('cookies:ByeItem', "backwood", 1)
              TriggerServerEvent('cookies:ByeItem', "snowmontana8th", 1)
              TriggerServerEvent('cookies:WagwanItem', "snowmontanablunt", 1)
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
              Framework:Notify("Rolled Up Snow Montana Blunt.", "success")
          end, function()
            TriggerEvent('inventory:client:busy:status', false)
            Framework:Notify("Cancelled..", "error")
              StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          end)
      else
          Framework:Notify('You do not have the required items!', "error")
          end
    -- end)
      else 
        Framework:Notify("You must be Clocked into work", "error")
    end
end)

--------------------sorbert---------------

RegisterNetEvent("qb-cookies:trigger:Sorbert")
AddEventHandler("qb-cookies:trigger:Sorbert", function()
  if Framework:GetPlayerData().job.onduty then
    -- Framework:TriggerCallback('qb-cookies:server:getitems:sorbert8th', function(HasItem)  
    local HasItem = Inventory:HasItem({"backwood", "sorbert8th"})
      if HasItem then
        RequestAnimationDict("anim@amb@business@weed@weed_inspecting_high_dry@")
        TaskPlayAnim(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector" ,1.0, 1.0, -1, 16, 1, true, true, true)
        Framework:Progressbar("search_register", "Rolling Up Sorbet Blunt..", 7500, false, true, {
          disableMovement = true,
          disableCarMovement = false,
          disableMouse = false,
          disableCombat = true,
        }, {}, {}, {}, function()
          TriggerEvent('inventory:client:set:busy', false)
          TriggerServerEvent('cookies:ByeItem', "backwood", 1)
          TriggerServerEvent('cookies:ByeItem', "sorbert8th", 1)
          TriggerServerEvent('cookies:WagwanItem', "sorbertblunt", 1)
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
          Framework:Notify("Rolled Up Sorbet Blunt.", "success")
        end, function()
        TriggerEvent('inventory:client:busy:status', false)
        Framework:Notify("Cancelled..", "error")
          StopAnimTask(PlayerPedId(), "anim@amb@business@weed@weed_inspecting_high_dry@", "weed_inspecting_high_base_inspector", 1.0)
        end)
      else
        Framework:Notify('You do not have the required items!', "error")
      end
    -- end)
  else 
      Framework:Notify("You must be Clocked into work", "error")
  end
end)


