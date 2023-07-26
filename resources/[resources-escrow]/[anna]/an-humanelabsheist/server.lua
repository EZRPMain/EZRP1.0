local QBCore = exports['qb-core']:GetCoreObject()
local CoolDown = false
local CoolStart = false
local Currentjob = {}
local usedPlates = {}


RegisterServerEvent('an-humanelabsheist:server:cooldowntimer', function()
  CoolDown = true
  local timer = Config.humane.CoolDown * (60 * 1000)
  while timer > 0 do
      Wait(1000)
      timer = timer - 1000
      if timer == 0 then
          CoolDown = false
      end
  end
  
end)

QBCore.Functions.CreateCallback("an-humanelabsheist:server:cooldown",function(source, cb)
  if CoolDown then
      cb(true)
  else
      cb(false)
  end
end)

QBCore.Functions.CreateCallback("an-humanelabsheist:server:ifgroup",function(source, cb)
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  if not Player then return end
  local group = exports['qb-phone']:GetGroupByMembers(src)
  if not group then  
    cb(true)
  else 
    cb(false)
  end
end)

QBCore.Functions.CreateCallback("an-humanelabsheist:server:ifgroupleader",function(source, cb)
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  if not Player then return end
  local group = exports['qb-phone']:GetGroupByMembers(src)
  if not exports['qb-phone']:isGroupLeader(src, group) then  
    cb(true)
  else 
    cb(false)
  end
end)

RegisterServerEvent('an-humanelabsheist:server:CoolStarttimertrue', function()
  CoolStart = true
end)

RegisterServerEvent('an-humanelabsheist:server:CoolStarttimerfalse', function()
  CoolStart = false
end)

QBCore.Functions.CreateCallback("an-humanelabsheist:server:CoolStart",function(source, cb)
  if CoolStart then
      cb(true)
  else
      cb(false)
  end
end)

QBCore.Functions.CreateCallback('an-humanelabsheist:server:hascard', function(source, cb)
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local hasItems = Player.Functions.GetItemByName(Config.humane.Startitem)
  if hasItems then
    Player.Functions.RemoveItem(Config.humane.Startitem, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.humane.Startitem], "remove")
    cb(true)
  else
    cb(false)
  end
end)

QBCore.Functions.CreateCallback('an-humanelabsheist:server:hashackingdevice', function(source, cb)
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local hasItems = Player.Functions.GetItemByName(Config.humane.Hackingdevice)
  if hasItems then
    Player.Functions.RemoveItem(Config.humane.Hackingdevice, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.humane.Hackingdevice], "remove")
    cb(true)
  else
    cb(false)
  end
end)

QBCore.Functions.CreateCallback('an-humanelabsheist:server:hasItemsthermite', function(source, cb)
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local hasItems = Player.Functions.GetItemByName(Config.humane.Forceitem)
  if hasItems then
    Player.Functions.RemoveItem(Config.humane.Forceitem, 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.humane.Forceitem], "remove")
    cb(true)
  else
    cb(false)
  end
end)

RegisterNetEvent('an-humanelabsheist:server:dnaitem', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  Player.Functions.AddItem(Config.humane.Dnaitem, 1, false)
TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.humane.Dnaitem], "add")
end)

RegisterNetEvent('an-humanelabsheist:server:aiitem', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  Player.Functions.AddItem(Config.humane.Aiitem, 1, false)
TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.humane.Aiitem], "add")
end)

QBCore.Functions.CreateUseableItem("diving_tank", function(source, item)
  TriggerClientEvent("an-humanelabsheist:client:UseGear", source, true)
end)

RegisterNetEvent('an-humanelabsheist:server:divinggear', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)

  Player.Functions.AddItem(Config.humane.Divingitem, 1)
  TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.humane.Divingitem], "add")
end)

RegisterNetEvent('an-humanelabsheist:server:removedivinggear', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)

  Player.Functions.RemoveItem(Config.humane.Divingitem, 1)
  TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.humane.Divingitem], "remove")
end)

local function RandomPlate()
  local string = QBCore.Shared.RandomInt(4)
  if usedPlates[string] then
      return RandomPlate()
  else
      usedPlates[string] = true
      return string
  end
end

local function SpawnVehicle(carType, location, group, coords)
  local CreateAutomobile = GetHashKey('CREATE_AUTOMOBILE')
  local car = Citizen.InvokeNative(CreateAutomobile, GetHashKey(carType), coords, true, false)

  while not DoesEntityExist(car) do
      Wait(25)
  end

  local NetID = NetworkGetNetworkIdFromEntity(car)
  local plate = RandomPlate()

  SetVehicleNumberPlateText(car, plate)

  local m = exports['qb-phone']:getGroupMembers(group)
  for i=1, #m do
      TriggerClientEvent("an-humanelabsheist:client:NewPlace", m[i], location, NetID, plate)
  end
  return NetID, plate
end

RegisterNetEvent('an-humanelabsheist:server:StartJob', function(coords)
  local src = source
  if not coords then return end

  local ped = GetPlayerPed(src)
  if #(GetEntityCoords(ped) - vector3(Config.humane.PedPos.x, Config.humane.PedPos.y, Config.humane.PedPos.z)) > 5 then return end

  local Player = QBCore.Functions.GetPlayer(src)


  if not Player then return end
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end

    for i=1, #m do
        if m[i] then
            local Player = QBCore.Functions.GetPlayer(m[i])
            local CID = Player.PlayerData.citizenid

          Player.Functions.AddItem("diving_tank", 1)
          TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items["diving_tank"], "add")
          TriggerClientEvent('an-humanelabsheist:client:keypad', Player.PlayerData.source) -- so this, now does all
          TriggerClientEvent('an-humanelabsheist:client:keypad2', Player.PlayerData.source)
          TriggerClientEvent('an-humanelabsheist:client:firstzone',Player.PlayerData.source)
          TriggerClientEvent('an-humanelabsheist:client:firstcheckpoint',Player.PlayerData.source)
          TriggerClientEvent('an-humanelabsheist:client:secondcheckpoint',Player.PlayerData.source)
          
        end
    end

  if not group then return end

  local Size = exports['qb-phone']:getGroupSize(group)
  if Size > 4 then TriggerClientEvent('QBCore:Notify', src, "Your group can only have a maximum of 4 participants for this...", "error") return end


  if exports['qb-phone']:getJobStatus(group) ~= "WAITING" then TriggerClientEvent('QBCore:Notify', src, "Your group is currently busy with a different job...", "error") return end
  if not exports['qb-phone']:isGroupLeader(src, group) then TriggerClientEvent('QBCore:Notify', src, "I cannot give you a job if you're not the group leader...", "error") return end

  local vehicle, plate = SpawnVehicle('frogger', location, group, coords)

  local message = Config.humane.startingmsg
  local blip = {
    coords = vector3(3625.65, 3756.01, 28.52), -- Just the coords for the blip
    color = 49, -- just a red colour
    alpha = 255, -- This makes the blip kinda see through if u lower it
    sprite = 57, -- Just a circle icon,
    scale = 0.3, -- How big do u want the blip to be?
    label = "Base route", -- The label for the blip
    route = true, -- Will set a route for the job (Note a route is not a waypoint they cant remove it)
    routeColor = 49, -- just a red to finish off the routeColor
  }

  Currentjob[group] = {
      Stages = {
          {name = "Go to the lab.", isDone = false, id = 1},
          {name = "Hack the door open", isDone = false, id = 2},
          {name = "Get the DNA sample", isDone = false, id = 3},
          {name = "Extract the AI", isDone = false, id = 4},
          {name = "Escape from the sewers using the diving gear. i left you a helicopter bring it back to me", isDone = false, id = 5},
           
      }
  }

  exports['qb-phone']:pNotifyGroup(group, "Humane heist", message, "fas fa-recycle", red, 7500)
  exports['qb-phone']:CreateBlipForGroup(group, "base", blip)
  exports['qb-phone']:setJobStatus(group, "Well done", Currentjob[group].Stages)
  local job = exports["qb-phone"]:getJobStatus(group)
  print(job)
end)

RegisterNetEvent('an-humanelabsheist:server:getai', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)

  if not Player then return end
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end

    for i=1, #m do
        if m[i] then
            local Player = QBCore.Functions.GetPlayer(m[i])
            TriggerClientEvent('an-humanelabsheist:client:getai',Player.PlayerData.source)
            end
    end
end)

RegisterNetEvent('an-humanelabsheist:server:hackSync', function(Ishacked)
  local src = source
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end
    for i=1, #m do
      if m[i] then
        TriggerClientEvent('an-humanelabsheist:client:hackSync', m[i],Ishacked)
      end
    end
end)

RegisterNetEvent('an-humanelabsheist:server:hackSync2', function(Ishacked2)
  local src = source
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end
    for i=1, #m do
      if m[i] then
        TriggerClientEvent('an-humanelabsheist:client:hackSync2', m[i],Ishacked2)
      end
    end
end)

RegisterNetEvent('an-humanelabsheist:server:stolensync', function(IsStolen)
  local src = source
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end
    for i=1, #m do
      if m[i] then
        TriggerClientEvent('an-humanelabsheist:client:stolensync', m[i],IsStolen)
      end
    end
end)

RegisterNetEvent('an-humanelabsheist:server:notonjobsync', function(IsJobInded)
  local src = source
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end
    for i=1, #m do
      if m[i] then
        TriggerClientEvent('an-humanelabsheist:client:notonjobsync', m[i],IsJobInded)
      end
    end
end)

RegisterNetEvent('an-humanelabsheist:server:extractedsync', function(IsExtracted)
  local src = source
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end
    for i=1, #m do
      if m[i] then
        TriggerClientEvent('an-humanelabsheist:client:extractedsync', m[i],IsExtracted)
      end
    end
end)

RegisterNetEvent('an-humanelabsheist:server:firstsync', function(IsFirst)
  local src = source
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end
    for i=1, #m do
      if m[i] then
        TriggerClientEvent('an-humanelabsheist:client:firstsync', m[i],IsFirst)
      end
    end
end)

RegisterNetEvent('an-humanelabsheist:server:secondsync', function(IsSecond)
  local src = source
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end
    for i=1, #m do
      if m[i] then
        TriggerClientEvent('an-humanelabsheist:client:secondsync', m[i],IsSecond)
      end
    end
end)

RegisterNetEvent('an-humanelabsheist:server:busysync', function(IsBusy)
  local src = source
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
  if not m then return end

    for i=1, #m do
      if m[i] then
        TriggerClientEvent('an-humanelabsheist:client:busysync', m[i],IsBusy)
      end
    end
end)

RegisterNetEvent('an-humanelabsheist:server:notonjobsync', function(NotOnJob)
  local src = source
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end
    for i=1, #m do
      if m[i] then
        TriggerClientEvent('an-humanelabsheist:client:notonjobsync', m[i],NotOnJob)
      end
    end
end)

RegisterNetEvent('an-humanelabsheist:server:targetSync', function(tName)
  local src = source
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end
    for i=1, #m do
      if m[i] then
        TriggerClientEvent('an-humanelabsheist:client:targetSync', m[i],tName)
      end
    end
end)

RegisterNetEvent('an-humanelabsheist:server:zoneSync', function(zName)
  local src = source
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end
    for i=1, #m do
      if m[i] then
        TriggerClientEvent('an-humanelabsheist:client:zoneSync', m[i],zName)
      end
    end
end)

RegisterNetEvent('an-humanelabsheist:server:PedSync', function(pname)
  local src = source
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end
    for i=1, #m do
      if m[i] then
        TriggerClientEvent('an-humanelabsheist:client:PedSync', m[i],pname)
      end
    end
end)

QBCore.Functions.CreateCallback("an-humanelabsheist:server:labs", function(source, cb)
  local src = source

  local ped = GetPlayerPed(src)
  local coords = GetEntityCoords(ped)
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end

    for i=1, #m do
        if m[i] then
            local Player = QBCore.Functions.GetPlayer(m[i])
            local CID = Player.PlayerData.citizenid
            TriggerClientEvent('an-humanelabsheist:client:dna', Player.PlayerData.source)
        end
    end

  if not group then return cb(false) end

          Currentjob[group].Stages = {
            {name = "Go to the lab.", isDone = true, id = 1},
            {name = "Hack the door open", isDone = false, id = 2},
            {name = "Get the DNA sample", isDone = false, id = 3},
            {name = "Extract the AI", isDone = false, id = 4},
            {name = "Escape from the sewers using the diving gear. i left you a helicopter bring it back to me", isDone = false, id = 5},
             
          }
    


  
  local message = Config.humane.Hackingmsg
  exports['qb-phone']:pNotifyGroup(group, "Humane heist", message, "fas fa-recycle", red, 7500)
  exports['qb-phone']:RemoveBlipForGroup(group, "base")
  exports['qb-phone']:setJobStatus(group, "hack the keypad", Currentjob[group].Stages)
  local job = exports["qb-phone"]:getJobStatus(group)
  print(job)
  cb(true)
end)

QBCore.Functions.CreateCallback("an-humanelabsheist:server:dna", function(source, cb)
  local src = source

  local ped = GetPlayerPed(src)
  local coords = GetEntityCoords(ped)
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end

    for i=1, #m do
        if m[i] then
            local Player = QBCore.Functions.GetPlayer(m[i])
            local CID = Player.PlayerData.citizenid

         TriggerClientEvent('an-humanelabsheist:client:aiextracted', Player.PlayerData.source) -- so this, now does all
        end
    end

  if not group then return cb(false) end

          Currentjob[group].Stages = {
            {name = "Go to the lab.", isDone = true, id = 1},
            {name = "Hack the door open", isDone = true, id = 2},
            {name = "Get the DNA sample", isDone = false, id = 3},
            {name = "Extract the AI", isDone = false, id = 4},
            {name = "Escape from the sewers using the diving gear. i left you a helicopter bring it back to me", isDone = false, id = 5},
             
          }

  
  local message = Config.humane.Dnamsg
  exports['qb-phone']:pNotifyGroup(group, "Humane heist", message, "fas fa-recycle", red, 7500)
  exports['qb-phone']:setJobStatus(group, "Get the dna sample", Currentjob[group].Stages)
  local job = exports["qb-phone"]:getJobStatus(group)
  print(job)
  cb(true)
end)

QBCore.Functions.CreateCallback("an-humanelabsheist:server:ai", function(source, cb)
  local src = source

  local ped = GetPlayerPed(src)
  local coords = GetEntityCoords(ped)
  local group = exports['qb-phone']:GetGroupByMembers(src)

  if not group then return cb(false) end

          Currentjob[group].Stages = {
            {name = "Go to the lab.", isDone = true, id = 1},
            {name = "Hack the door open", isDone = true, id = 2},
            {name = "Get the DNA sample", isDone = true, id = 3},
            {name = "Extract the AI", isDone = false, id = 4},
            {name = "Escape from the sewers using the diving gear. i left you a helicopter bring it back to me", isDone = false, id = 5},
             
          }
  
  local message = Config.humane.Aimsg
  exports['qb-phone']:pNotifyGroup(group, "Humane heist", message, "fas fa-recycle", red, 7500)
  exports['qb-phone']:setJobStatus(group, "Get the AI", Currentjob[group].Stages)
  local job = exports["qb-phone"]:getJobStatus(group)
  print(job)
  cb(true)
end)

QBCore.Functions.CreateCallback("an-humanelabsheist:server:run", function(source, cb)
  local src = source

  local ped = GetPlayerPed(src)
  local coords = GetEntityCoords(ped)
  local group = exports['qb-phone']:GetGroupByMembers(src)
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
    if not m then return end

    for i=1, #m do
        if m[i] then
            local Player = QBCore.Functions.GetPlayer(m[i])
          TriggerClientEvent('an-humanelabsheist:client:elevator', Player.PlayerData.source)
          TriggerClientEvent('an-humanelabsheist:client:rewardped', Player.PlayerData.source) -- so this, now does all
        end
    end
  

  if not group then return cb(false) end
  

          Currentjob[group].Stages = {
            {name = "Go to the lab.", isDone = true, id = 1},
            {name = "Hack the door open", isDone = true, id = 2},
            {name = "Get the DNA sample", isDone = true, id = 3},
            {name = "Extract the AI", isDone = true, id = 4},
            {name = "Escape from the sewers using the diving gear. i left you a helicopter bring it back to me", isDone = false, id = 5},
             
          }
          local blip = {
            coords = Config.humane.Peddeliverpos, -- Just the coords for the blip
            color = 49, -- just a red colour
            alpha = 255, -- This makes the blip kinda see through if u lower it
            sprite = 57, -- Just a circle icon,
            scale = 0.3, -- How big do u want the blip to be?
            label = "Base route", -- The label for the blip
            route = true, -- Will set a route for the job (Note a route is not a waypoint they cant remove it)
            routeColor = 49, -- just a red to finish off the routeColor
          }

          local m = exports['qb-phone']:getGroupMembers(group)
            for i=1, #m do
                TriggerClientEvent('an-humanelabsheist:client:NewPlace', m[i], location)
            end

  local message = Config.humane.Runmsg
  exports['qb-phone']:CreateBlipForGroup(group, "deliver", blip)
  exports['qb-phone']:pNotifyGroup(group, "Humane heist", message, "fas fa-recycle", red, 7500)
  exports['qb-phone']:setJobStatus(group, "Run", Currentjob[group].Stages)
  local job = exports["qb-phone"]:getJobStatus(group)
  print(job)
  cb(true)
end)

QBCore.Functions.CreateCallback('an-humanelabsheist:server:hasloot', function(source, cb)
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local ai = Player.Functions.GetItemByName(Config.humane.Aiitem)
  local dna = Player.Functions.GetItemByName(Config.humane.Dnaitem)
  
  if ai ~= nil and dna ~= nil then
      cb(true)
  else
      cb(false)
  end
end)

QBCore.Functions.CreateCallback("an-humanelabsheist:server:reward", function(source, cb)
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)

  local ped = GetPlayerPed(src)
  local coords = GetEntityCoords(ped)
  local group = exports['qb-phone']:GetGroupByMembers(src)
  if not group then return end
  local m = exports['qb-phone']:getGroupMembers(group)
  local groupSize = exports['qb-phone']:getGroupSize(group)
  local Pay = math.random(Config.humane.Minpayout, Config.humane.Maxpayout) / groupSize
  print(groupSize)
  print(pay)
  if not m then return end
  if Pay > 0 then
    for i=1, #m do
        if m[i] then
            local Player = QBCore.Functions.GetPlayer(m[i])
            local CID = Player.PlayerData.citizenid

          
          Player.Functions.AddItem(Config.humane.Lootitem, 1)
          Player.Functions.AddMoney('cash', Pay, 'Payment')
        TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items[Config.humane.Lootitem], "add")
        
        end
      end
    end
    Player.Functions.RemoveItem(Config.humane.Aiitem, 1, false)
    Player.Functions.RemoveItem(Config.humane.Dnaitem, 1, false)
  TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items[Config.humane.Dnaitem], "remove")
  TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items[Config.humane.Aiitem], "remove")
  
 -- DeleteEntity(NetworkGetEntityFromNetworkId(CurrentJob[group].car))
  if not group then return cb(false) end

          Currentjob[group].Stages = {
            {name = "Go to the lab.", isDone = true, id = 1},
            {name = "Hack the door open", isDone = true, id = 2},
            {name = "Get the DNA sample", isDone = true, id = 3},
            {name = "Extract the AI", isDone = true, id = 4},
            {name = "Escape from the sewers using the diving gear. i left you a helicopter bring it back to me", isDone = true, id = 5},
             
          }

          local m = exports['qb-phone']:getGroupMembers(group)
            for i=1, #m do
                TriggerClientEvent('an-humanelabsheist:client:NewPlace', m[i], location)
            end
  
  local message = Config.humane.Runmsg
  exports['qb-phone']:RemoveBlipForGroup(group, "deliver")
  local job = exports["qb-phone"]:getJobStatus(group)
  exports['qb-phone']:DestroyGroup(group)
  cb(true)
end)

AddEventHandler('qb-phone:server:GroupDeleted', function(group, players)
  if not Currentjob[group] then return end
  Currentjob[group] = nil
  for i=1, #players do
      TriggerClientEvent("an-humanelabsheist:client:ResetClient", players[i])
  end
end)

QBCore.Commands.Add("divinggear", "Take off your diving suit", {}, false, function(source, args)
  local Player = QBCore.Functions.GetPlayer(source)
  TriggerClientEvent("an-humanelabsheist:client:UseGear", source, false)
end)

RegisterServerEvent('an-humanelabsheist:server:ThermitePtfx', function(coordfx)
  TriggerClientEvent('an-humanelabsheist:client:ThermitePtfx', -1, coordfx)
end)
