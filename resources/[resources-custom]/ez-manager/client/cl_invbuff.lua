local isDebug = true
local buffName = "strength"

local pedBuffs = {
    [`pw_andreas`] = 100,
}

local inventorySize = 120000
local function SetStrength(buff) -- 0-100
    local display = true
    if buff == 0 then 
        display = false
        exports['lj-inventory']:MaxWeight(inventorySize)
        TriggerEvent('hud:client:BuffEffect', {
            display = false,
            buffName = buffName,
        })
    elseif buff <= 100 then
        local workPls = buff*1.2
        local thisBig = workPls *1000
        local newInv = thisBig + inventorySize
        exports['lj-inventory']:MaxWeight(newInv)
        TriggerEvent('hud:client:BuffEffect', {
            buffName = buffName,
            display = display,
            iconName = "dumbbell",
            iconColor = "#ffffff",
            progressColor = "#FFD700",
            progressValue = buff,
        })
    else
        TriggerEvent("QBCore:Notify", "cant do that u retard", 'error')
    end
end

RegisterNetEvent("jay-invbuff:client:RecieveStrength", function(buffAmt)
    SetStrength(buffAmt)
end)

-- Ped Buff Check
CreateThread(function()
    local cached_pedId = PlayerPedId()
    while true do
        if cached_pedId ~= PlayerPedId() then
            cached_pedId = PlayerPedId()
            local ped = GetEntityModel(cached_pedId)
            if pedBuffs[ped] then
                SetStrength(pedBuffs[ped])
            end
        end
        Wait(5000)
    end
end)

if isDebug then
    RegisterCommand("setstrength", function(s,args)
        if not args[1] then return end
        local buffAmt = tonumber(args[1])
        SetStrength(buffAmt)
    end, isDebug)
end