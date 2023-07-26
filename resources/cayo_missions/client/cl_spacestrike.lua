local function RotationToDirection(rot)
    local rotZ = math.rad(rot.z)
    local rotX = math.rad(rot.x)
    local cosOfRotX = math.abs(math.cos(rotX))
    return vector3(-math.sin(rotZ) * cosOfRotX, math.cos(rotZ) * cosOfRotX, math.sin(rotX))
end
  
local function RayCastCamera(dist)
    local camRot = GetGameplayCamRot()
    local camPos = GetGameplayCamCoord()
    local dir = RotationToDirection(camRot)
    local dest = camPos + (dir * dist)
    local ray = StartShapeTestRay(camPos, dest, 17, -1, 0)
    local _, hit, endPos, surfaceNormal, entityHit = GetShapeTestResult(ray)
    if hit == 0 then endPos = dest end
    return hit, endPos, entityHit, surfaceNormal
end

-- local DrawTitle = function(text, width, height)
--     SetTextScale(0.50, 0.50)
--     SetTextFont(4)
--     SetTextDropshadow(1.0, 0, 0, 0, 255)
--     SetTextEdge(1, 0, 0, 0, 255)
--     SetTextColour(255, 255, 255, 215)
--     SetTextJustification(0)
--     SetTextEntry("STRING")
--     AddTextComponentString(text)
--     DrawText(0.5, 0.02)
--     DrawRect(0.425+(width/2), 0.01+(height/2), width, height, 11, 11, 11, 200)
-- end

RegisterNetEvent("client:spacestrike", function()
    local color = {r = 255, g = 255, b = 255, a = 255}
    local alreadyOpened = false
    local text = '[E] Space Strike [←] Cancel'
    -- exports['qb-core']:Notify(text)
    ExecuteCommand("e radio")
    while true do
        local hit, dest, _, _ = RayCastCamera(1000)
        if hit == 1 then
            if not alreadyOpened then
                alreadyOpened = true
                exports['qb-core']:DrawText(text)
                -- TriggerEvent('cd_drawtextui:ShowUI', 'show', text)
            end

            -- DrawTitle("[E] Space strike", 0.15, 0.14)
            local ped = PlayerPedId()
            local position = GetEntityCoords(ped)
            DrawLine(position.x, position.y, position.z, dest.x, dest.y, dest.z, color.r, color.g, color.b, color.a)
            if IsControlJustReleased(0, 38) then
                ExecuteCommand("e c")
                -- TriggerEvent('cd_drawtextui:HideUI')
                exports['qb-core']:HideText()
                for i=10,1,-1 do
                    Wait(1000)
                    exports['qb-core']:Notify(("Space strike in %s seconds"):format(i),nil,990)
                end
                RequestWeaponAsset(`WEAPON_AIRSTRIKE_ROCKET`) 
                while not HasWeaponAssetLoaded(`WEAPON_AIRSTRIKE_ROCKET`) do
                    Wait(0)
                end
                ShootSingleBulletBetweenCoords(dest.x + math.random(-5,5), dest.y + math.random(-5,5), dest.z+150, dest.x, dest.y, dest.z, 500, true,`WEAPON_AIRSTRIKE_ROCKET`, PlayerPedId(), true, false, -1.0)

                for i=1,math.random(15,30) do
                    Wait(math.random(300,1300))
                    ShootSingleBulletBetweenCoords(dest.x + math.random(-5,5), dest.y + math.random(-5,5), dest.z+150, dest.x+ math.random(-15,15), dest.y+ math.random(-15,15), dest.z, 500, true,`WEAPON_AIRSTRIKE_ROCKET`, PlayerPedId(), true, false, -1.0)
                end
                CancelEvent()
                break
            elseif IsControlJustReleased(0, 202) then
                ExecuteCommand("e c")
                -- TriggerEvent('cd_drawtextui:HideUI')
                exports['qb-core']:HideText()
                CancelEvent()
                break
            end
        end
        Wait(3)
    end
end)

-- CreateThread(function()
--     local color = {r = 255, g = 255, b = 255, a = 255}
--     while true do
--         local hit, dest, _, _ = RayCastCamera(1000)
--         if hit == 1 then
--             DrawTitle("[E] Space strike", 0.15, 0.14)
--             local ped = PlayerPedId()
--             local position = GetEntityCoords(ped)
--             DrawLine(position.x, position.y, position.z, dest.x, dest.y, dest.z, color.r, color.g, color.b, color.a)
--             if IsControlJustReleased(0, 38) then
--                 for i=10,1,-1 do
--                     Wait(1000)
--                     exports['qb-core']:Notify(("Space strike in %s seconds"):format(i),nil,990)
--                 end
--                 RequestWeaponAsset(`VEHICLE_WEAPON_SPACE_ROCKET`) 
--                 while not HasWeaponAssetLoaded(`VEHICLE_WEAPON_SPACE_ROCKET`) do
--                     Wait(0)
--                 end
--                 ShootSingleBulletBetweenCoords(dest.x + math.random(-5,5), dest.y + math.random(-5,5), dest.z+150, dest.x, dest.y, dest.z, 500, true,`VEHICLE_WEAPON_SPACE_ROCKET`, PlayerPedId(), true, false, -1.0)

--                 for i=1,9 do
--                     Wait(math.random(300,1300))
--                     ShootSingleBulletBetweenCoords(dest.x + math.random(-5,5), dest.y + math.random(-5,5), dest.z+150, dest.x+ math.random(-15,15), dest.y+ math.random(-15,15), dest.z, 500, true,`VEHICLE_WEAPON_SPACE_ROCKET`, PlayerPedId(), true, false, -1.0)
--                 end
--             end
--         end
--         Wait(3)
--     end
-- end)

