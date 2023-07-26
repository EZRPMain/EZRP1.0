local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local ClosestBlackmarket = nil
local InsideBlackmarket = false
local CurrentBlackmarket = nil
local BlackmarketObj = {}
local POIOffsets = nil
local InBlackmarketRange = false



local carryData = {}
local inZone = nil

-- Code

function string.starts(String,Start)    
    return string.sub(String,1,string.len(Start))==Start 
end

CreateThread(function()
    for i = 1, #Config.Blackmarkets do 
        local Zone = Config.Blackmarkets[i]
        exports["ps-zones"]:CreateCircleZone("blackmarket_"..i, Zone.coords, Zone.radius, Zone.data)
    end
end)

RegisterCommand("+enterBM", function()
    if not inZone then return end
    if inZone == "enter" then
        EnterBlackmarket(carryData)
    elseif inZone == "leave" then
        LeaveBlackmarket(carryData)
    end
end)
RegisterCommand("-enterBM", function()

end)

RegisterKeyMapping("+enterBM", "Enter BM", "keyboard", "E")

TriggerEvent('chat:removeSuggestion', "+enterBM")
TriggerEvent('chat:removeSuggestion', "-enterBM")

RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
 
    if string.starts(ZoneName, "blackmarket_") then
        inZone = "enter"
        carryData = ZoneData
        -- print(json.encode(ZoneData))
        exports['qb-core']:DrawText(("[%s] %s"):format(GetKeyMapping("+enterBM"), ZoneData.drawtext))
        -- EnterBlackmarket()
    elseif string.starts(ZoneName, "leave_blackmarket_") then
        inZone = "leave"
        carryData = ZoneData
        -- print(json.encode(ZoneData))
        exports['qb-core']:DrawText(("[%s] %s"):format(GetKeyMapping("+enterBM"), ZoneData.drawtext))
        -- EnterBlackmarket()
    end
end)

RegisterNetEvent("ps-zones:leave", function(ZoneName, ZoneData)
    if string.starts(ZoneName, "blackmarket_") or string.starts(ZoneName, "leave_blackmarket_") then
        inZone = nil
        exports['qb-core']:HideText()
    end
end)

function EnterBlackmarket(ZoneData)
    local coords = { x = ZoneData.enter.x, y = ZoneData.enter.y, z= ZoneData.enter.z - Config.MinZOffset}
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    data = exports['qb-interior']:CreateLesterShell(coords)
    BlackmarketObj = data[1]
    POIOffsets = data[2]
    CurrentBlackmarket = ClosestBlackmarket
    InsideBlackmarket = true
    TriggerEvent('qb-weathersync:client:DisableSync')
    FreezeEntityPosition(BlackmarketObj, true)
    --PolyZone Shit Drawtext shit
    local jaydidthisshit = vector3(ZoneData.enter.x + POIOffsets.exit.x, ZoneData.enter.y + POIOffsets.exit.y, ZoneData.enter.z - Config.MinZOffset + POIOffsets.exit.z)
    exports["ps-zones"]:CreateCircleZone("leave_blackmarket_"..ZoneData.id, jaydidthisshit, 1, {
        debugPoly = Config.Showzone,
        useZ = true,
        data = {
            enter = ZoneData.enter,
            drawtext = "Leave",
        }
    })
end

function LeaveBlackmarket(ZoneData)
    local ped = PlayerPedId()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
    DoScreenFadeOut(250)
    Wait(250)
    exports['qb-interior']:DespawnInterior(BlackmarketObj, function()
        TriggerEvent('qb-weathersync:client:EnableSync')
        DoScreenFadeIn(250)
        SetEntityCoords(ped, ZoneData.enter.x, ZoneData.enter.y, ZoneData.enter.z)
        SetEntityHeading(ped, ZoneData.enter.w)
        BlackmarketObj = nil
        POIOffsets = nil
        CurrentBlackmarket = nil
        InsideBlackmarket = false
    end)
end


-- old code
-- CreateThread(function()
--     while true do
--         if LocalPlayer.state.isLoggedIn then
--             SetClosestBlackmarket()
--         end
--         Wait(1000)
--     end
-- end)

-- function SetClosestBlackmarket()
--     local pos = GetEntityCoords(PlayerPedId(), true)
--     local current = nil
--     local dist = nil
--     for id, Blackmarket in pairs(Config.Blackmarkets) do
--         if current ~= nil then
--             if #(pos - Config.Blackmarkets[id].coords.enter) < dist then
--                 current = id
--                 dist = #(pos - Config.Blackmarkets[id].coords.enter)
--             end
--         else
--             dist = #(pos - Config.Blackmarkets[id].coords.enter)
--             current = id
--         end
--     end
--     ClosestBlackmarket = current
-- end

-- function DrawText3Ds(x, y, z, text)
-- 	SetTextScale(0.35, 0.35)
--     SetTextFont(4)
--     SetTextProportional(1)
--     SetTextColour(255, 255, 255, 215)
--     SetTextEntry("STRING")
--     SetTextCentre(true)
--     AddTextComponentString(text)
--     SetDrawOrigin(x,y,z, 0)
--     DrawText(0.0, 0.0)
--     local factor = (string.len(text)) / 370
--     DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
--     ClearDrawOrigin()
-- end


-- CreateThread(function()
--     while true do

--         local ped = PlayerPedId()
--         local pos = GetEntityCoords(ped)
--         local inRange = false

--         if ClosestBlackmarket ~= nil then
--             local data = Config.Blackmarkets[ClosestBlackmarket]
--             if InsideBlackmarket then
--                 local ExitDistance = #(pos - vector3(data.coords["enter"].x + POIOffsets.exit.x, data.coords["enter"].y + POIOffsets.exit.y, data.coords["enter"].z - Config.MinZOffset + POIOffsets.exit.z))
--                 if ExitDistance < 20 then
--                     inRange = true
--                     if ExitDistance < 1 then
--                         DrawText3Ds(data.coords["enter"].x + POIOffsets.exit.x, data.coords["enter"].y + POIOffsets.exit.y, data.coords["enter"].z - Config.MinZOffset + POIOffsets.exit.z, "~b~E~w~ - Leave")
--                         if IsControlJustPressed(0, 38) then
--                             LeaveBlackmarket(data)
--                         end
--                     end
--                 end

--                 -- local InteractDistance = #(pos - vector3(data.coords["interaction"].x, data.coords["interaction"].y, data.coords["interaction"].z))
--                 -- if InteractDistance < 20 then
--                 --     inRange = true
--                 --     if InteractDistance < 1 then
--                 --         DrawText3Ds(data.coords["interaction"].x, data.coords["interaction"].y, data.coords["interaction"].z + 0.2, "~b~H~w~ - Open Shop")
--                 --         if IsControlJustPressed(0, 38) then
--                 --             -- TriggerServerEvent('grp-blackmarket:server:TakeoverHouse', CurrentBlackmarket)
--                 --             -- print("OpenShop")
--                 --             TriggerEvent("qb-shops:marketshop")
--                 --         end
--                 --     end
--                 -- end
--             else
--                 local EnterDistance = #(pos - data.coords["enter"])
--                 if EnterDistance < 20 then
--                     inRange = true
--                     if EnterDistance < 1 then
--                         InBlackmarketRange = true
--                     else
--                         if InBlackmarketRange then
--                             InBlackmarketRange = false
--                         end
--                     end
--                 end
--             end
--         else
--             Wait(2000)
--         end

--         Wait(3)
--     end
-- end)

-- function EnterBlackmarket(data)
--     local coords = { x = data.coords.x, y = data.coords.y, z= data.coords.z - Config.MinZOffset}
--     TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
--     data = exports['qb-interior']:CreateLesterShell(coords)
--     BlackmarketObj = data[1]
--     POIOffsets = data[2]
--     CurrentBlackmarket = ClosestBlackmarket
--     InsideBlackmarket = true
--     TriggerEvent('qb-weathersync:client:DisableSync')
--     FreezeEntityPosition(BlackmarketObj, true)
-- end

-- function LeaveBlackmarket(data)
--     local ped = PlayerPedId()
--     TriggerServerEvent("InteractSound_SV:PlayOnSource", "houses_door_open", 0.25)
--     DoScreenFadeOut(250)
--     Wait(250)
--     exports['qb-interior']:DespawnInterior(BlackmarketObj, function()
--         TriggerEvent('qb-weathersync:client:EnableSync')
--         DoScreenFadeIn(250)
--         SetEntityCoords(ped, data.coords.x, data.coords.y, data.coords.z + 0.5)
--         SetEntityHeading(ped, data.coords.w)
--         BlackmarketObj = nil
--         POIOffsets = nil
--         CurrentBlackmarket = nil
--         InsideBlackmarket = false
--     end)
-- end

-- RegisterNetEvent('grp-blackmarket:client:EnterBlackmarket')
-- AddEventHandler('grp-blackmarket:client:EnterBlackmarket', function(code)
--     if ClosestBlackmarket ~= nil then
--         if InBlackmarketRange then
--             local data = Config.Blackmarkets[ClosestBlackmarket]
--             EnterBlackmarket(data)
--         end
--     end
-- end)
