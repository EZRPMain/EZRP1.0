local inventorySize = 120000
local dF = inventorySize

print()


---

local function SetStrength(buff) -- 0-100
    local display = true
    if buff == 0 then 
        display = false
        inventorySize = df
        exports['lj-inventory']:MaxWeight(inventorySize)
    elseif buff <= 100 then
       



    else
        TriggerEvent("QBCore:Notify", "Invalid Amount")
    end

    TriggerEvent('hud:client:BuffEffect', {
        buffName = "strength",
        display = display,
        iconName = "dumbbell",
        iconColor = "#ffffff",
        progressColor = "#FFD700",
        progressValue = buff,
    })
end

RegisterCommand("setstrength", function(s,args)
    if not args[1] then return end
    local buffAmt= tonumber(args[1])
    SetStrength(buffAmt)
end)

RegisterCommand("fucking", function()
--[[
        ['strength'] = {
        iconColor = "#ffffff",
        iconName = 'dumbbell',
        maxTime = 3600000,
        progressColor = "#FFD700",
        type = 'buff'
    },
]]

    TriggerEvent('hud:client:BuffEffect', {
        buffName = "strength",
        display = true,
        iconName = "dumbbell",
        iconColor = "#ffffff",
        progressColor = "#FFD700",
        progressValue = 75,
    })
end)