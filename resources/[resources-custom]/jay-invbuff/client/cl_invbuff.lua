local buffName = "strength"

local inventorySize = 120000
local function SetStrength(buff) -- 0-100
    local display = true
    if buff == 0 then 
        display = false
        Inventory:MaxWeight(inventorySize)
        TriggerEvent('hud:client:BuffEffect', {
            display = false,
            buffName = buffName,
        })
    elseif buff <= 100 then
        local workPls = buff*(inventorySize/100000)
        local thisBig = workPls *1000
        local newInv = thisBig + inventorySize
        Inventory:MaxWeight(newInv)
        TriggerEvent('hud:client:BuffEffect', {
            buffName = buffName,
            display = display,
            iconName = "dumbbell",
            iconColor = "#FFD700",
            progressColor = "#FFD700",
            progressValue = buff,
        })
    else
        Config.Notify(Shared.Lang["cannotdothat"], 'error')
    end
end

RegisterNetEvent("jay-invbuff:client:RecieveStrength", function(buffAmt)
    SetStrength(buffAmt)
end)
exports("SetStrength", SetStrength)

-- Ped Buff Check
CreateThread(function()
    local cached_pedId = PlayerPedId()
    local ped = GetEntityModel(cached_pedId)
    if Shared.PedBuffs[ped] then
        SetStrength(Shared.PedBuffs[ped])
    end
    while true do
        if cached_pedId ~= PlayerPedId() then
            cached_pedId = PlayerPedId()
            local ped = GetEntityModel(cached_pedId)
            if Shared.PedBuffs[ped] then
                SetStrength(Shared.PedBuffs[ped])
            end
        end
        Wait(5000)
    end
end)

if Shared.Debug then
    TriggerEvent('hud:client:BuffEffect', {
        display = false,
        buffName = buffName,
    })    

    RegisterCommand("setstrength", function(s,args)
        if not args[1] then return end
        local buffAmt = tonumber(args[1])
        SetStrength(buffAmt)
    end, Shared.Debug)
end