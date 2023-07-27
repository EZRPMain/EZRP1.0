Shared = {}
Shared.Debug = true

-- No Ox Support Yet

Shared.Inventory = "lj-inventory" -- "lj-inventory", "qb-inventory", "ps-inventory"
Inventory = exports[Shared.Inventory]

Shared.PedBuffs = {
    [`pw_andreas`] = 100,
    [`pw_jiwon`] = 100,
    [`ig_tommyt`] = 75,
    [`ig_deanquincy`] = 75,
}

Shared.DependencyList = {
    ["ps-hud"] = true,
    [Shared.Inventory] = true,
}

CreateThread(function()
    for resource in pairs(Shared.DependencyList) do
        if GetResourceState(resource) == 'missing' then 
            print(("[%s] is missing, You will experience major issues"))
        end
    end
    print("Passed Dependency Check")
    if Inventory:MaxWeight then 
        print("Passed Export Check")
    end
end)