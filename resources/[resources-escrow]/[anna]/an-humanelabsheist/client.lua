local QBCore = exports['qb-core']:GetCoreObject()

local CurrentCops = 0
local PlayerData = QBCore.Functions.GetPlayerData()
local CachedNet = nil -- NetID Handler from serverside.
local blip = nil -- Blip Handler
local curLocation = nil -- Current location
local mainBlip = nil -- Just the location of the garbage job
local NotOnJob = false
local IsStolen = false
local Ishacked = false
local Ishacked2 = false
local IsExtracted = false
local IsJobInded = false
local IsBusy = false
local IsFirst = false
local IsSecond = false
local Finished = {}
local floorsMenu = {}
local Progresstime = Config.humane.Progressbartime * 1000
local currentGear = {
  mask = 0,
  tank = 0,
  enabled = false
}
local coordfx = vector3(3595.9, 3715.5, 29.69)

RegisterNetEvent('police:SetCopCount', function(amount)
  CurrentCops = amount
end)

CreateThread(function()
  keypadcoords = vector4(3624.67, 3749.28, 29.0, 146.58)
  keypad = CreateObject(`prop_ld_keypad_01`, keypadcoords.x, keypadcoords.y, keypadcoords.z, true, true, true)
  SetEntityHeading(keypad,146.58)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
  PlayerData = QBCore.Functions.GetPlayerData()
end)

local function LoadAnimation(dict)
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do Wait(10) end
end

RegisterNetEvent('an-humanelabsheist:client:clientChecks', function()
  if CurrentCops >= Config.humane.Cops then
    QBCore.Functions.TriggerCallback("an-humanelabsheist:server:cooldown",function(isCooldown)
        if not isCooldown then
          QBCore.Functions.TriggerCallback("an-humanelabsheist:server:CoolStart",function(isCoolstart)
            if not isCoolstart then
              QBCore.Functions.TriggerCallback("an-humanelabsheist:server:ifgroup",function(ifgroup)
                if not ifgroup then
                  QBCore.Functions.TriggerCallback("an-humanelabsheist:server:ifgroupleader",function(ifgroupleader)
                    if not ifgroupleader then
                      local coords = Config.humane.Helicopterpos
                            notonjobsync(true)
                            TriggerServerEvent('an-humanelabsheist:server:StartJob', coords)
                            TriggerServerEvent('an-humanelabsheist:server:CoolStarttimertrue')
                              Spawnnpccars()       
      
                        else 
                                QBCore.Functions.Notify(Config.humane.notingroupleader, 'error')
                        end 
                      end)
                    else 
                      QBCore.Functions.Notify(Config.humane.notingroup, 'error')
                    end
                 end)
              else 
                  QBCore.Functions.Notify(Config.humane.alreadystarted, 'error')
              end
            end)
      else 
            QBCore.Functions.Notify(Config.humane.cooldownmsg, 'error')
      end
    end)
  else
    QBCore.Functions.Notify(Config.humane.nocopsmsg, 'error')
  end
end)

RegisterNetEvent('an-humanelabsheist:client:firstzone', function()
  Zone = CircleZone:Create(vector3(3627.72, 3753.6, 28.52), 30, { 
    name = "none", 
    heading = 0, 
    debugPoly = false,
    useZ = true, 
})
Zone:onPlayerInOut(function(isPointInside)                
  if isPointInside then
    Zone:destroy()
    QBCore.Functions.TriggerCallback('an-humanelabsheist:server:labs', function(result)
      if result then
      end
    end)
  end
end)
end)

  

RegisterNetEvent('an-humanelabsheist:client:keypad', function()
        notonjobsync(true)
        jobendedsync(false)
       exports['qb-target']:AddBoxZone("keypad", vector3(3624.67, 3749.28, 29.0), 0.2, 0.2, {
         name = "keypad",
         heading = 146.58,
         debugPoly = false,
         minZ=29.0,
         maxZ=29.25,
       }, {
         options = {
           {
             event = "an-humanelabsheist:client:hackkeypad",
             canInteract = function()
               return not Ishacked and not IsBusy
           end,
             icon = "fa-solid fa-magnifying-glass",
             label = Config.humane.keypadhackmsglabel,
           },
         },
         distance = 2.0
       })
end)

RegisterNetEvent('an-humanelabsheist:client:keypad2', function()
  notonjobsync(true)
  jobendedsync(false)
  exports['qb-target']:AddBoxZone("keypad2", vector3(3555.73, 3664.9, 27.0), 0.2, 0.2, {
    name = "keypad2",
    heading = 173.57,
    debugPoly = false,
    minZ=28.4,
    maxZ=28.6,
  }, {
    options = {
      {
        event = "an-humanelabsheist:client:hackkeypad2",
        canInteract = function()
          return not Ishacked2 and not IsBusy
      end,
        icon = "fa-solid fa-magnifying-glass",
        label = Config.humane.keypadhackmsglabel,
      },
    },
    distance = 2.0
  })
end)

RegisterNetEvent('an-humanelabsheist:client:hackkeypad', function()
  busysync(true)
    QBCore.Functions.TriggerCallback('an-humanelabsheist:server:hashackingdevice', function(Items)
      if Items then      
        local animDict = 'anim@heists@ornate_bank@hack'
          RequestAnimDict(animDict)
          RequestModel('hei_prop_hst_laptop')
          RequestModel('hei_p_m_bag_var22_arm_s')
          while not HasAnimDictLoaded(animDict)
              or not HasModelLoaded('hei_prop_hst_laptop')
              or not HasModelLoaded('hei_p_m_bag_var22_arm_s') do
              Wait(100)
          end
          local loc = vector4(3624.8, 3750.41, 29.1, 148.01)
          local ped = PlayerPedId()
          local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))

          SetEntityHeading(ped, loc.w)
          local animPos = GetAnimInitialOffsetPosition(animDict, 'hack_enter', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
          local animPos2 = GetAnimInitialOffsetPosition(animDict, 'hack_loop', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
          local animPos3 = GetAnimInitialOffsetPosition(animDict, 'hack_exit', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)

          FreezeEntityPosition(ped, true)
          local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
          local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), targetPosition, 1, 1, 0)
          local laptop = CreateObject(GetHashKey('hei_prop_hst_laptop'), targetPosition, 1, 1, 0)

          NetworkAddPedToSynchronisedScene(ped, netScene, animDict, 'hack_enter', 1.5, -4.0, 1, 16, 1148846080, 0)
          NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, 'hack_enter_bag', 4.0, -8.0, 1)
          NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, 'hack_enter_laptop', 4.0, -8.0, 1)

          local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
          NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, 'hack_loop', 1.5, -4.0, 1, 16, 1148846080, 0)
          NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, 'hack_loop_bag', 4.0, -8.0, 1)
          NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, 'hack_loop_laptop', 4.0, -8.0, 1)

          local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
          NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, 'hack_exit', 1.5, -4.0, 1, 16, 1148846080, 0)
          NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, 'hack_exit_bag', 4.0, -8.0, 1)
          NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, 'hack_exit_laptop', 4.0, -8.0, 1)

          Wait(200)
          NetworkStartSynchronisedScene(netScene)
          Wait(6300)
          NetworkStartSynchronisedScene(netScene2)
          Wait(2000) 
          exports['ps-ui']:Thermite(function(success)
              if success then      
                QBCore.Functions.TriggerCallback('an-humanelabsheist:server:dna', function(result)
                  if result then
                      hackSync(true)
                      targetSync('keypad')
                      busysync(false)
                      NetworkStartSynchronisedScene(netScene3)
                      NetworkStopSynchronisedScene(netScene3)
                      DeleteObject(bag)
                      DeleteObject(laptop)
                      FreezeEntityPosition(ped, false)
                        TriggerServerEvent('qb-doorlock:server:updateState', Config.humane.DoorId, false, false, false, true, false, false)
                      Spawnfirstambush()
                      TriggerEvent('an-humanelabsheist:client:keypad2')
                  end
                end)
              else
                busysync(false)
                DeleteObject(bag)
                DeleteObject(laptop)
                FreezeEntityPosition(ped, false)
                  hackSync(false)
                  QBCore.Functions.Notify(Config.humane.failed, 'error', 5000)
              end
          end, 10, 3, 3)
      else
          busysync(false)
          QBCore.Functions.Notify(Config.humane.itemmissing, 'error', 5000)
      end
    end)

end)

RegisterNetEvent('an-humanelabsheist:client:hackkeypad2', function()
    QBCore.Functions.TriggerCallback('an-humanelabsheist:server:hashackingdevice', function(Items)
      if Items then      
        local animDict = 'anim@heists@ornate_bank@hack'
          RequestAnimDict(animDict)
          RequestModel('hei_prop_hst_laptop')
          RequestModel('hei_p_m_bag_var22_arm_s')
          while not HasAnimDictLoaded(animDict)
              or not HasModelLoaded('hei_prop_hst_laptop')
              or not HasModelLoaded('hei_p_m_bag_var22_arm_s') do
              Wait(100)
          end
          local loc = vector4(3555.83, 3665.88, 28.12, 172.87)
          local ped = PlayerPedId()
          local targetPosition, targetRotation = (vec3(GetEntityCoords(ped))), vec3(GetEntityRotation(ped))

          SetEntityHeading(ped, loc.w)
          local animPos = GetAnimInitialOffsetPosition(animDict, 'hack_enter', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
          local animPos2 = GetAnimInitialOffsetPosition(animDict, 'hack_loop', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
          local animPos3 = GetAnimInitialOffsetPosition(animDict, 'hack_exit', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)

          FreezeEntityPosition(ped, true)
          local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
          local bag = CreateObject(GetHashKey('hei_p_m_bag_var22_arm_s'), targetPosition, 1, 1, 0)
          local laptop = CreateObject(GetHashKey('hei_prop_hst_laptop'), targetPosition, 1, 1, 0)

          NetworkAddPedToSynchronisedScene(ped, netScene, animDict, 'hack_enter', 1.5, -4.0, 1, 16, 1148846080, 0)
          NetworkAddEntityToSynchronisedScene(bag, netScene, animDict, 'hack_enter_bag', 4.0, -8.0, 1)
          NetworkAddEntityToSynchronisedScene(laptop, netScene, animDict, 'hack_enter_laptop', 4.0, -8.0, 1)

          local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
          NetworkAddPedToSynchronisedScene(ped, netScene2, animDict, 'hack_loop', 1.5, -4.0, 1, 16, 1148846080, 0)
          NetworkAddEntityToSynchronisedScene(bag, netScene2, animDict, 'hack_loop_bag', 4.0, -8.0, 1)
          NetworkAddEntityToSynchronisedScene(laptop, netScene2, animDict, 'hack_loop_laptop', 4.0, -8.0, 1)

          local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
          NetworkAddPedToSynchronisedScene(ped, netScene3, animDict, 'hack_exit', 1.5, -4.0, 1, 16, 1148846080, 0)
          NetworkAddEntityToSynchronisedScene(bag, netScene3, animDict, 'hack_exit_bag', 4.0, -8.0, 1)
          NetworkAddEntityToSynchronisedScene(laptop, netScene3, animDict, 'hack_exit_laptop', 4.0, -8.0, 1)
          Wait(200)
          NetworkStartSynchronisedScene(netScene)
          Wait(6300)
          NetworkStartSynchronisedScene(netScene2)
          Wait(2000) 
          exports['ps-ui']:Thermite(function(success)
              if success then
                      hackSync2(true)
                      targetSync('keypad2')
                      Spawnfourthambush()
                      TriggerServerEvent('an-humanelabsheist:server:getai')
                      busysync(false)
                      NetworkStartSynchronisedScene(netScene3)
                      NetworkStopSynchronisedScene(netScene3)
                      DeleteObject(bag)
                      DeleteObject(laptop)
                      FreezeEntityPosition(ped, false)
                        TriggerServerEvent('qb-doorlock:server:updateState', Config.humane.DoorId2, false, false, false, true, false, false)
                    QBCore.Functions.Notify('Doors are hacked!', 'success', 5000)
              else
                busysync(false)
                DeleteObject(bag)
                DeleteObject(laptop)
                FreezeEntityPosition(ped, false)
                    hackSync2(false)
                  QBCore.Functions.Notify(Config.humane.failed, 'error', 5000)
              end
          end, 10, 3, 3)
      else
          busysync(false)
          QBCore.Functions.Notify(Config.humane.itemmissing, 'error', 5000)
      end
    end)

end)

--- SYNCING EVENTS

-- hacksync // keypad
function hackSync(hackInfo)
  TriggerServerEvent('an-humanelabsheist:server:hackSync',hackInfo)
end

RegisterNetEvent('an-humanelabsheist:client:hackSync',function(hackSync)
  Ishacked = hackSync
end)

function hackSync2(hackInfo2)
  TriggerServerEvent('an-humanelabsheist:server:hackSync2',hackInfo2)
end

RegisterNetEvent('an-humanelabsheist:client:hackSync2',function(hackSync2)
  Ishacked2 = hackSync2
end)

function stolensync(stoleninfo)
  TriggerServerEvent('an-humanelabsheist:server:stolensync',stoleninfo)
end

RegisterNetEvent('an-humanelabsheist:client:stolensync',function(stolensync)
  IsStolen = stolensync
end)

function busysync(busyinfo)
  TriggerServerEvent('an-humanelabsheist:server:busysync',busyinfo)
end

RegisterNetEvent('an-humanelabsheist:client:busysync',function(busysync)
  IsBusy = busysync
end)

function firstsync(firstinfo)
  TriggerServerEvent('an-humanelabsheist:server:firstsync',firstinfo)
end

RegisterNetEvent('an-humanelabsheist:client:firstsync',function(firstsync)
  IsFirst = firstsync
end)

function secondsync(secondinfo)
  TriggerServerEvent('an-humanelabsheist:server:secondsync',secondinfo)
end

RegisterNetEvent('an-humanelabsheist:client:secondsync',function(secondsync)
  IsSecond = secondsync
end)


function extractedsync(extractedinfo)
  TriggerServerEvent('an-humanelabsheist:server:extractedsync',extractedinfo)
end

RegisterNetEvent('an-humanelabsheist:client:extractedsync',function(extractedsync)
  IsExtracted = extractedsync
end)

function notonjobsync(notonjobinfo)
  TriggerServerEvent('an-humanelabsheist:server:notonjobsync',notonjobinfo)
end

RegisterNetEvent('an-humanelabsheist:client:notonjobsync',function(notonjobsync)
  NotOnJob = notonjobsync
end)

function jobendedsync(jobendedinfo)
  TriggerServerEvent('an-humanelabsheist:server:jobendedsync',jobendedinfo)
end

RegisterNetEvent('an-humanelabsheist:client:jobendedsync',function(jobendedsync)
  IsJobInded = jobendedsync
end)

function PedSync(pedName)
  TriggerServerEvent('an-humanelabsheist:server:PedSync',pedName)
end

RegisterNetEvent('an-humanelabsheist:client:PedSync',function(pName)
  Deleteped(pname)
end)

-- generic target syncing pass targetname with targetSync(targetname)
function targetSync(targetName)
  TriggerServerEvent('an-humanelabsheist:server:targetSync',targetName)
end

RegisterNetEvent('an-humanelabsheist:client:targetSync',function(tName)
  exports['qb-target']:RemoveZone(tName)
end)

RegisterNetEvent('an-humanelabsheist:client:firstcheckpoint', function()
  exports['qb-target']:AddBoxZone("firstcheckpoint", vector3(3600.9, 3718.5, 29.69), 0.2,1.0, {
    name = "firstcheckpoint",
    heading = 320.0,
    debugPoly = false,
    minZ=29.69,
    maxZ=30.5,
  }, {
    options = {
      {
        event = "an-humanelabsheist:client:firstcheckpointthermite",
        canInteract = function()
          return not IsFirst and not IsBusy
      end,
        icon = "fa-solid fa-magnifying-glass",
        label = Config.humane.firstdoorthermitelabel,
      },
    },
    distance = 2.0
  })         
            
end)

RegisterNetEvent('an-humanelabsheist:client:firstcheckpointthermite', function()
  busysync(true)
  QBCore.Functions.TriggerCallback('an-humanelabsheist:server:hasItemsthermite', function(Items)
    if Items then
                Thermiteplanting()
                Spawnsecondambush()
                targetSync('firstcheckpoint')
                AddExplosion(3600.9, 3718.5, 29.69, 0, 0, true, false, 4.0)
                TriggerServerEvent('qb-doorlock:server:updateState', Config.humane.DoorId3, false, false, false, true, false, false)
                firstsync(true)
                busysync(false)
    else
        busysync(false)
        firstsync(false)
        QBCore.Functions.Notify(Config.humane.itemmissing, 'error', 5000)
    end
  end)
end)


function Thermiteplanting()
  local pos = vector3(3600.9, 3718.5, 29.69)
  RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
  RequestModel("hei_p_m_bag_var22_arm_s")
  RequestNamedPtfxAsset("scr_ornate_heist")
  while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
      Wait(50)
  end

  local ped = PlayerPedId()
  SetEntityHeading(ped, 320.0)
  Wait(100)
  local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(ped)))
  local bagscene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
  local bag = CreateObject(GetHashKey("hei_p_m_bag_var22_arm_s"), pos.x, pos.y, pos.z,  true,  true, false)
  SetEntityCollision(bag, false, true)

  local x, y, z = table.unpack(GetEntityCoords(ped))
  local thermite = CreateObject(GetHashKey("hei_prop_heist_thermite"), x, y, z + 0.2,  true,  true, true)
  FreezeEntityPosition(ped, true)
  SetEntityCollision(thermite, false, true)
  AttachEntityToEntity(thermite, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
  NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
  NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
  SetPedComponentVariation(ped, 5, 0, 0, 0)
  NetworkStartSynchronisedScene(bagscene)
  Wait(5000)
  DetachEntity(thermite, 1, 1)
  FreezeEntityPosition(thermite, true)
  DeleteObject(bag)
  NetworkStopSynchronisedScene(bagscene)
  ThermiteEffect()
  FreezeEntityPosition(ped, false)
  DeleteEntity(thermite)
end

function ThermiteEffect()
  RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
  while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do
      Wait(50)
  end
  local ped = PlayerPedId()
  local ptfx = vector3(3600.7, 3719.42, 29.69)
  Wait(1500)
  TriggerServerEvent("an-humanelabsheist:server:ThermitePtfx", ptfx)
  Wait(500)
  TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
  TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 11000, 49, 1, 0, 0, 0)
  Wait(11000)
  ClearPedTasks(ped)
end

RegisterNetEvent("an-humanelabsheist:client:ThermitePtfx", function(coordfx)-- Thermite Sparkles
  RequestNamedPtfxAsset("scr_ornate_heist")
  while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do
      Wait(50)
  end
  SetPtfxAssetNextCall("scr_ornate_heist")
  local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", coordfx , 0.0, 0.0, 0.0, 1.0, false, false, false, false)
  Wait(11000)
  StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent('an-humanelabsheist:client:secondcheckpoint', function()
  
  exports['qb-target']:AddBoxZone("secondcheckpoint", vector3(3597.4, 3689.8, 28.82), 0.2,1.0, {
    name = "secondcheckpoint",
    heading = 146.0,
    debugPoly = false,
    minZ=28.69,
    maxZ=29.5,
  }, {
    options = {
      {
        event = "an-humanelabsheist:client:secondcheckpointtorch",
        canInteract = function()
          return not IsSecond and not IsBusy
      end,
        icon = "fa-solid fa-magnifying-glass",
        label = Config.humane.seconddoorlabel,
      },
    },
    distance = 2.0
  }) 
end)

RegisterNetEvent('an-humanelabsheist:client:secondcheckpointtorch', function()
  busysync(true)
  ExecuteCommand('e knock2')
  QBCore.Functions.Progressbar("Torch", Config.humane.seconddoorprogress , 10000, false, true, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {}, {}, {}, function()
      ClearPedTasks(PlayerPedId())
      busysync(false)
      secondsync(true)
      Spawnthirdambush()
        TriggerServerEvent('qb-doorlock:server:updateState', Config.humane.DoorId4, false, false, false, true, false, false)
  end, function() -- Cancel
    busysync(false)
    stolensync(false)
    ClearPedTasks(playerPed)
    QBCore.Functions.Notify(Config.humane.Cancelprogress, 'error')
end)

end)

RegisterNetEvent('an-humanelabsheist:client:dna', function()
    notonjobsync(true)
    jobendedsync(false)
  exports['qb-target']:AddBoxZone("dna", vector3(3559.7, 3673.4, 28.5), 2.5, 1.6, {
    name = "dna",
    heading = 79.8,
    debugPoly = false,
    minZ=26.0,
    maxZ=28.5,
  }, {
    options = {
      {
        event = "an-humanelabsheist:client:getdna",
        canInteract = function()
          return not IsStolen and not IsBusy
      end,
        icon = "fa-solid fa-magnifying-glass",
        label = Config.humane.dnamessagelabel,
      },
    },
    distance = 2.0
  })
end)

RegisterNetEvent('an-humanelabsheist:client:getdna', function()
  
      busysync(true)
        ExecuteCommand('e mechanic')
        QBCore.Functions.Progressbar("dna", Config.humane.dnaprogressbar, Progresstime , false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
          
            ClearPedTasks(PlayerPedId())         
          QBCore.Functions.TriggerCallback('an-humanelabsheist:server:ai', function(result)
            if result then
              TriggerServerEvent('an-humanelabsheist:server:dnaitem')
              stolensync(true)
              busysync(false)
              targetSync('dna')
            end
          end)
        end, function() -- Cancel
          busysync(false)
          stolensync(false)
          ClearPedTasks(playerPed)
          QBCore.Functions.Notify(Config.humane.Cancelprogress, 'error')
      end)
end)

function Spawnnpccars()
  Parkedcars = Config.humane.Attack[math.random(#Config.humane.Attack)]
  for k, v in pairs(Parkedcars.cars) do
  model = Config.humane.Cars[math.random(#Config.humane.Cars)] 
  QBCore.Functions.LoadModel(model)
  local veh = CreateVehicle(model, v.x, v.y, v.z, v.w, true, false)
  SetVehicleNumberPlateText(veh, "GOV"..tostring(math.random(1000, 9999)))
  SetEntityAsMissionEntity(veh, true, true)
  SetVehicleEngineOn(veh, false, false)
  end
end

function spawnhelicopter()
  local model = Config.humane.Helicoptermodel
  QBCore.Functions.LoadModel(model)
  local veh = CreateVehicle(model, Config.humane.Helicopterpos.x, Config.humane.Helicopterpos.y, Config.humane.Helicopterpos.z, Config.humane.Helicopterpos.w, true, false)
  SetVehicleNumberPlateText(veh, "Run"..tostring(math.random(1000, 9999)))
  exports[Config.humane.fuelscript]:SetFuel(veh, 100.0)
  CurrentPlate = QBCore.Functions.GetPlate(veh)
  SetEntityAsMissionEntity(veh, true, true)
  SetVehicleEngineOn(veh, false, false)
  print(CurrentPlate)
end

RegisterNetEvent('an-humanelabsheist:client:rewardped', function()
  notonjobsync(true)
  jobendedsync(false)
  stolensync(true)
  exports['qb-target']:AddTargetEntity(Deliverped, {
    options = {
        {
            icon = 'fa-solid fa-comment',
            label = Config.humane.delivermsglabel,
            type = "client",
            event = "an-humanelabsheist:client:reward",
            canInteract = function()
              return not IsJobInded and not IsBusy
          end,   
        },
    },
    distance = 2.0
  })
end)

RegisterNetEvent('an-humanelabsheist:client:aiextracted', function()
  notonjobsync(true)
  jobendedsync(false)
  exports['qb-target']:AddBoxZone("ai", vector3(3536.95, 3669.35, 28.12), 2.5, 1.0, {
    name = "ai",
    heading = 256.0,
    debugPoly = false,
    minZ=26.0,
    maxZ=28.5,
  }, {
    options = {
      {
        event = "an-humanelabsheist:client:ai",
        canInteract = function()
          return not IsExtracted and not IsBusy
          end,
        icon = "fa-solid fa-magnifying-glass",
        label = Config.humane.aimessagelabel,
      },
    },
    distance = 2.0
  })
end)

RegisterNetEvent('an-humanelabsheist:client:ai', function()
      ExecuteCommand('e type')
      busysync(true)
        QBCore.Functions.Progressbar("ai", Config.humane.aiprogressbar, Progresstime , false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, function()
          extractedsync(true)
          ClearPedTasks(PlayerPedId())        
  QBCore.Functions.TriggerCallback('an-humanelabsheist:server:run', function(result)
    if result then
      TriggerServerEvent('an-humanelabsheist:server:aiitem')
      busysync(false)
      targetSync('ai')
      elevator()
      QBCore.Functions.Notify(Config.humane.elevatoraccess, 'success')
    end
  end)
end, function() -- Cancel
  busysync(false)
  extractedsync(false)
    ClearPedTasks(playerPed)
    QBCore.Functions.Notify(Config.humane.Cancelprogress, 'error')
end)  
end)

RegisterNetEvent('an-humanelabsheist:client:reward', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local closestVehicle, distance = QBCore.Functions.GetClosestVehicle(coords)
    notonjobsync(false)
    jobendedsync(true)
  QBCore.Functions.TriggerCallback('an-humanelabsheist:server:hasloot', function(Items)
    if Items then
          busysync(true)
          ExecuteCommand('e argue')
                QBCore.Functions.Progressbar("goodies", Config.humane.deliverprogress, Progresstime , false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    if distance < 30 then -- distance limiter to make sure it's close enough change as you wish
                      local plate = GetVehicleNumberPlateText(closestVehicle) -- uses existing function so will work as normal
                      local vehicle = Config.humane.Helicoptermodel
                      if vehicle then
                          NetworkRequestControlOfEntity(closestVehicle) -- network entity ownership check before deletion
                          SetEntityAsMissionEntity(closestVehicle)
                          DeleteEntity(closestVehicle)
                      end
                      else
                        QBCore.Functions.Notify(Config.humane.missinghelicopter, "error")
                        print("no vehicle was nearby")
                    end
                    notonjobsync(false)
                    jobendedsync(true)
                    busysync(false)
                    TriggerServerEvent('an-humanelabsheist:server:CoolStarttimerfalse')
                    TriggerServerEvent('an-humanelabsheist:server:cooldowntimer')
                    TriggerServerEvent('qb-doorlock:server:updateState', Config.humane.DoorId, true, true, true, true, true, true)
                    TriggerServerEvent('qb-doorlock:server:updateState', Config.humane.DoorId2, true, true, true, true, true, true)
                    TriggerServerEvent('qb-doorlock:server:updateState', Config.humane.DoorId3, true, true, true, true, true, true)
                    TriggerServerEvent('qb-doorlock:server:updateState', Config.humane.DoorId4, true, true, true, true, true, true)
                    QBCore.Functions.TriggerCallback('an-humanelabsheist:server:reward', function(result)
                      if result then
                      end
                    end)
                end, function() -- Cancel
                  busysync(false)
                  notonjobsync(true)
                  jobendedsync(false)
                    ClearPedTasks(playerPed)
                    QBCore.Functions.Notify(Config.humane.Cancelprogress, 'error')
                
                end)
    else
        QBCore.Functions.Notify(Config.humane.missingitemsdelivery, 'error', 5000)
    end
  end)
end)



CreateThread(function()
    QBCore.Functions.LoadModel(Config.humane.PedHash)
    Deliverped = CreatePed(0, Config.humane.PedHash, Config.humane.Peddeliverpos.x, Config.humane.Peddeliverpos.y, Config.humane.Peddeliverpos.z-1.0, Config.humane.Peddeliverpos.w, false, false)  
    StartPed = CreatePed(0, Config.humane.PedHash, Config.humane.PedPos.x, Config.humane.PedPos.y, Config.humane.PedPos.z-1.0, Config.humane.PedPos.w, false, false)
    TaskStartScenarioInPlace(Deliverped, true)
      FreezeEntityPosition(Deliverped, true)
      SetEntityInvincible(Deliverped, true)
      SetBlockingOfNonTemporaryEvents(Deliverped, true)
    TaskStartScenarioInPlace(StartPed,  true)
    FreezeEntityPosition(StartPed, true)
    SetEntityInvincible(StartPed, true)
    SetBlockingOfNonTemporaryEvents(StartPed, true)

  exports['qb-target']:AddTargetEntity(StartPed, {
    options = {
        {
            icon = 'fa-solid fa-comment',
            label = Config.humane.startpedlabel,
            type = "client",
            event = "an-humanelabsheist:client:OpenMainMenu",
            canInteract = function()
                return not NotOnJob and not IsBusy
              end,
        },
    },
    distance = 2.0
  })


end)

 

RegisterNetEvent('an-humanelabsheist:client:elevator', function()
  exports['qb-target']:AddBoxZone("elevator", vector3(3541.9, 3673.9, 29.49), 0.2, 0.2, {
    name = "elevator",
    heading = 168.0,
    debugPoly = false,
    minZ = 28.1,
    maxZ = 28.5,
  }, {
    options = {
        {
          type = "client",
          action = function(entity) 
            TriggerEvent('an-humanelabsheist:callLift', k)
          end,
          icon = "fas fa-chevron-circle-up",
          label = Config.humane.elevator,
        },
    },
    distance = 2.5
  })
end)

function Spawnfirstambush()
  Pedattack = Config.humane.Attack[math.random(#Config.humane.Attack)]
  for k, v in pairs(Pedattack.firstambush) do   
  Weaponattack = Config.humane.Weapon[math.random(#Config.humane.Weapon)]
  Attackped = Config.humane.Attackped[math.random(#Config.humane.Attackped)]
      QBCore.Functions.LoadModel(Attackped)
      Pedattack = CreatePed(0, Attackped, v.x, v.y, v.z, v.w, true, true)               
      SetPedKeepTask(Pedattack, true)
      SetCanAttackFriendly(Pedattack, false, true)
      TaskCombatPed(Pedattack, PlayerPedId(), 0, 16)
      SetPedCombatAttributes(Pedattack, 46, true)
      SetPedCombatAbility(Pedattack, 1)
      SetPedCombatAttributes(Pedattack, 0, true)
      SetPedAccuracy(Pedattack, Config.humane.pedaccuracy)
      SetPedArmour(Pedattack, Config.humane.pedarmor)
      SetPedMaxHealth(Pedattack, Config.humane.pedhealth)
      GiveWeaponToPed(Pedattack, Weaponattack, -1, false, true)
      SetPedDropsWeaponsWhenDead(Pedattack, false)
      SetPedCombatRange(Pedattack, 1)
      SetPedFleeAttributes(Pedattack, 0, 0)
      SetBlockingOfNonTemporaryEvents(Pedattack, true)
      SetPedSuffersCriticalHits(Pedattack, false)
      SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(Pedattack), true)
      SetPedCanRagdoll(Pedattack, false)
      SetPedRelationshipGroupHash(Pedattack, `HATES_PLAYER`)
  end
end

function Spawnsecondambush()
  Pedattack = Config.humane.Attack[math.random(#Config.humane.Attack)]
  for k, v in pairs(Pedattack.secondambush) do   
  Weaponattack = Config.humane.Weapon[math.random(#Config.humane.Weapon)]
  Attackped = Config.humane.Attackped[math.random(#Config.humane.Attackped)]
      QBCore.Functions.LoadModel(Attackped)
      Pedattack = CreatePed(0, Attackped, v.x, v.y, v.z, v.w, true, true)               
      SetPedKeepTask(Pedattack, true)
      SetCanAttackFriendly(Pedattack, false, true)
      TaskCombatPed(Pedattack, PlayerPedId(), 0, 16)
      SetPedCombatAttributes(Pedattack, 46, true)
      SetPedCombatAbility(Pedattack, 1)
      SetPedCombatAttributes(Pedattack, 0, true)
      SetPedAccuracy(Pedattack, Config.humane.pedaccuracy)
      SetPedArmour(Pedattack, Config.humane.pedarmor)
      SetPedMaxHealth(Pedattack, Config.humane.pedhealth)
      GiveWeaponToPed(Pedattack, Weaponattack, -1, false, true)
      SetPedDropsWeaponsWhenDead(Pedattack, false)
      SetPedCombatRange(Pedattack, 1)
      SetPedFleeAttributes(Pedattack, 0, 0)
      SetBlockingOfNonTemporaryEvents(Pedattack, true)
      SetPedSuffersCriticalHits(Pedattack, false)
      SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(Pedattack), true)
      SetPedCanRagdoll(Pedattack, false)
      SetPedRelationshipGroupHash(Pedattack, `HATES_PLAYER`)
  end
end

function Spawnthirdambush()
  Pedattack = Config.humane.Attack[math.random(#Config.humane.Attack)]
  for k, v in pairs(Pedattack.thirdambush) do   
  Weaponattack = Config.humane.Weapon[math.random(#Config.humane.Weapon)]
  Attackped = Config.humane.Attackped[math.random(#Config.humane.Attackped)]
      QBCore.Functions.LoadModel(Attackped)
      Pedattack = CreatePed(0, Attackped, v.x, v.y, v.z, v.w, true, true)               
      SetPedKeepTask(Pedattack, true)
      SetCanAttackFriendly(Pedattack, false, true)
      TaskCombatPed(Pedattack, PlayerPedId(), 0, 16)
      SetPedCombatAttributes(Pedattack, 46, true)
      SetPedCombatAbility(Pedattack, 1)
      SetPedCombatAttributes(Pedattack, 0, true)
      SetPedAccuracy(Pedattack, Config.humane.pedaccuracy)
      SetPedArmour(Pedattack, Config.humane.pedarmor)
      SetPedMaxHealth(Pedattack, Config.humane.pedhealth)
      GiveWeaponToPed(Pedattack, Weaponattack, -1, false, true)
      SetPedDropsWeaponsWhenDead(Pedattack, false)
      SetPedCombatRange(Pedattack, 1)
      SetPedFleeAttributes(Pedattack, 0, 0)
      SetBlockingOfNonTemporaryEvents(Pedattack, true)
      SetPedSuffersCriticalHits(Pedattack, false)
      SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(Pedattack), true)
      SetPedCanRagdoll(Pedattack, false)
      SetPedRelationshipGroupHash(Pedattack, `HATES_PLAYER`)
  end
end

function Spawnfourthambush()
  Pedattack = Config.humane.Attack[math.random(#Config.humane.Attack)]
  for k, v in pairs(Pedattack.fourthambush) do   
  Weaponattack = Config.humane.Weapon[math.random(#Config.humane.Weapon)]
  Attackped = Config.humane.Attackped[math.random(#Config.humane.Attackped)]
      QBCore.Functions.LoadModel(Attackped)
      Pedattack = CreatePed(0, Attackped, v.x, v.y, v.z, v.w, true, true)               
      SetPedKeepTask(Pedattack, true)
      SetCanAttackFriendly(Pedattack, false, true)
      TaskCombatPed(Pedattack, PlayerPedId(), 0, 16)
      SetPedCombatAttributes(Pedattack, 46, true)
      SetPedCombatAbility(Pedattack, 1)
      SetPedCombatAttributes(Pedattack, 0, true)
      SetPedAccuracy(Pedattack, Config.humane.pedaccuracy)
      SetPedArmour(Pedattack, Config.humane.pedarmor)
      SetPedMaxHealth(Pedattack, Config.humane.pedhealth)
      GiveWeaponToPed(Pedattack, Weaponattack, -1, false, true)
      SetPedDropsWeaponsWhenDead(Pedattack, false)
      SetPedCombatRange(Pedattack, 1)
      SetPedFleeAttributes(Pedattack, 0, 0)
      SetBlockingOfNonTemporaryEvents(Pedattack, true)
      SetPedSuffersCriticalHits(Pedattack, false)
      SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(Pedattack), true)
      SetPedCanRagdoll(Pedattack, false)
      SetPedRelationshipGroupHash(Pedattack, `HATES_PLAYER`)
  end
end

function Spawnfifthambush()
  Pedattack = Config.humane.Attack[math.random(#Config.humane.Attack)]
  for k, v in pairs(Pedattack.fifrthambush) do   
  Weaponattack = Config.humane.Weapon[math.random(#Config.humane.Weapon)]
  Attackped = Config.humane.Attackped[math.random(#Config.humane.Attackped)]
      QBCore.Functions.LoadModel(Attackped)
      Pedattack = CreatePed(0, Attackped, v.x, v.y, v.z, v.w, true, true)               
      SetPedKeepTask(Pedattack, true)
      SetCanAttackFriendly(Pedattack, false, true)
      TaskCombatPed(Pedattack, PlayerPedId(), 0, 16)
      SetPedCombatAttributes(Pedattack, 46, true)
      SetPedCombatAbility(Pedattack, 1)
      SetPedCombatAttributes(Pedattack, 0, true)
      SetPedAccuracy(Pedattack, Config.humane.pedaccuracy)
      SetPedArmour(Pedattack, Config.humane.pedarmor)
      SetPedMaxHealth(Pedattack, Config.humane.pedhealth)
      GiveWeaponToPed(Pedattack, Weaponattack, -1, false, true)
      SetPedDropsWeaponsWhenDead(Pedattack, false)
      SetPedCombatRange(Pedattack, 1)
      SetPedFleeAttributes(Pedattack, 0, 0)
      SetBlockingOfNonTemporaryEvents(Pedattack, true)
      SetPedSuffersCriticalHits(Pedattack, false)
      SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(Pedattack), true)
      SetPedCanRagdoll(Pedattack, false)
      SetPedRelationshipGroupHash(Pedattack, `HATES_PLAYER`)
  end
end

RegisterNetEvent('an-humanelabsheist:client:OpenMainMenu', function()
  local menu = {
      {
          header = "Barry",
          isMenuHeader = true,
          icon = "fa-solid fa-circle-exclamation",
      }
  }

      menu[#menu+1] = {
          header = "Request Job",
          txt = "Get the job",
          icon = "fa-solid fa-truck-arrow-right",
          params = {
              event = "an-humanelabsheist:client:clientChecks",
          }
      }

  menu[#menu+1] = {
      header = "Exit",
      icon = "fa-solid fa-circle-xmark",
      params = {
          event = "ps-ui:client:closeMenu",
      }
  }

  exports[Config.humane.Menu]:openMenu(menu)
end)

function changeFloor()
  local ped = PlayerPedId()
  local coords = vector4(3540.76, 3675.68, 20.99, 178.07)

  QBCore.Functions.Progressbar("Call_The_Lift", Config.humane.elevatorprogress, 8000, false, false, {
      disableMovement = true,
      disableCarMovement = true,
      disableMouse = false,
      disableCombat = true,
  }, {
      animDict = "anim@apt_trans@elevator",
      anim = "elev_1",
      flags = 16,
  }, {}, {}, function() -- Done
      StopAnimTask(ped, "anim@apt_trans@elevator", "elev_1", 1.0)
      DoScreenFadeOut(500)
      Citizen.Wait(1000)
      SetEntityCoords(ped, coords.x, coords.y, coords.z, 0, 0, 0, false)
      SetEntityHeading(ped, coords.w)
      Spawnfifthambush()
      Citizen.Wait(1000)
      DoScreenFadeIn(600)
      
  end)
end

RegisterNetEvent('an-humanelabsheist:callLift', function(playerId)
    Wait(1000)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
            local liftDist = #(coords - vector3(3540.45, 3675.44, 28.12))
            if liftDist <= 15 then
                inLiftRange = true
                if liftDist <= 7.5 then
                    if not IsPedInAnyVehicle(ped) then            
 if not IsPedInAnyVehicle(ped) then
   changeFloor()
                            end
                        
                    end
                end
            end
    if not inLiftRange then
        Wait(1000)
    end
end)

AddEventHandler('onResourceStop', function(resource)
  if resource == GetCurrentResourceName() then
          DeleteEntity(StartPed)
          DeleteEntity(Deliverped)
          DeleteEntity(model)
          DeleteEntity(Pedattack)
          ClearPedTasksImmediately(PlayerPedId())
            TriggerServerEvent('qb-doorlock:server:updateState', Config.humane.DoorId, true, true, true, true, true, true)
            TriggerServerEvent('qb-doorlock:server:updateState', Config.humane.DoorId2, true, true, true, true, true, true)
            TriggerServerEvent('qb-doorlock:server:updateState', Config.humane.DoorId3, true, true, true, true, true, true)
            TriggerServerEvent('qb-doorlock:server:updateState', Config.humane.DoorId4, true, true, true, true, true, true)
  end
end)

AddEventHandler('onResourceStart', function(resource)
  PlayerData = QBCore.Functions.GetPlayerData()
end)

function loadAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
      RequestAnimDict(dict)
      Wait(0)
  end
end

function GearAnim()
  loadAnimDict("clothingshirt")
  TaskPlayAnim(PlayerPedId(), "clothingshirt", "try_shirt_positive_d", 8.0, 1.0, -1, 49, 0, 0, 0, 0)
end

RegisterNetEvent('an-humanelabsheist:client:UseGear', function(bool)
  if bool then
      GearAnim()
      QBCore.Functions.Progressbar("equip_gear", Config.humane.divingsuiton, 5000, false, true, {}, {}, {}, {}, function() -- Done
          DeleteGear()
          local maskModel = `p_d_scuba_mask_s`
          local tankModel = `p_s_scuba_tank_s`

          RequestModel(tankModel)
          while not HasModelLoaded(tankModel) do
              Wait(1)
          end
          TankObject = CreateObject(tankModel, 1.0, 1.0, 1.0, 1, 1, 0)
          local bone1 = GetPedBoneIndex(PlayerPedId(), 24818)
          AttachEntityToEntity(TankObject, PlayerPedId(), bone1, -0.25, -0.25, 0.0, 180.0, 90.0, 0.0, 1, 1, 0, 0, 2, 1)
          currentGear.tank = TankObject

          RequestModel(maskModel)
          while not HasModelLoaded(maskModel) do
              Wait(1)
          end

          MaskObject = CreateObject(maskModel, 1.0, 1.0, 1.0, 1, 1, 0)
          local bone2 = GetPedBoneIndex(PlayerPedId(), 12844)
          AttachEntityToEntity(MaskObject, PlayerPedId(), bone2, 0.0, 0.0, 0.0, 180.0, 90.0, 0.0, 1, 1, 0, 0, 2, 1)
          currentGear.mask = MaskObject

          SetEnableScuba(PlayerPedId(), true)
          SetPedMaxTimeUnderwater(PlayerPedId(), 2000.00)
          currentGear.enabled = true
          ClearPedTasks(PlayerPedId())
          TriggerServerEvent('an-humanelabsheist:server:removedivinggear')
          TriggerEvent('chatMessage', "SYSTEM", "error", Config.humane.divingsuithelp)
      end)
  else
      if currentGear.enabled then
          GearAnim()
          QBCore.Functions.Progressbar("remove_gear", Config.humane.divingsuitoff, 5000, false, true, {}, {}, {}, {}, function() -- Done
              DeleteGear()
              SetEnableScuba(PlayerPedId(), false)
              SetPedMaxTimeUnderwater(PlayerPedId(), 1.00)
              currentGear.enabled = false
              ClearPedTasks(PlayerPedId())
              QBCore.Functions.Notify('You took your wetsuit off')
          end)
      else
          QBCore.Functions.Notify(Config.humane.notdivingsuit, 'error')
      end
  end
end)

function DeleteGear()
	if currentGear.mask ~= 0 then
        DetachEntity(currentGear.mask, 0, 1)
        DeleteEntity(currentGear.mask)
		currentGear.mask = 0
    end

	if currentGear.tank ~= 0 then
        DetachEntity(currentGear.tank, 0, 1)
        DeleteEntity(currentGear.tank)
		currentGear.tank = 0
	end
end

RegisterNetEvent('an-humanelabsheist:client:RemoveGear', function()	--Add event to call externally
  TriggerEvent('an-humanelabsheist:client:UseGear', false)
end)
