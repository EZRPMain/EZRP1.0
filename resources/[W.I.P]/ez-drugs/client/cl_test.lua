-- Module Testing
local Framework = exports['qb-core']
local Functions = Framework:GetModule("Functions")
Functions.Notify("test")

print(Functions)


local Drugs = Drugs or {}

function Drugs.UseDrug()
    print("used Drug")
end

Framework:CreateModule("Drugs2", Drugs)



CreateThread(function()
    local ModuleDrugs = Framework:GetModule("Drugs2")
    print(json.encode(ModuleDrugs))
    print(json.encode(Functions))
    ModuleDrugs.UseDrug()
end)
