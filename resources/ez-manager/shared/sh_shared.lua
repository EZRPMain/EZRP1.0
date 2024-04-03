Framework = exports['qb-core']
Shared = {}

Shared.Debug = true

Shared.Classes = {
    C = 325,
    B = 400,
    A = 550,
    S = 700,
    X = 900,
}

exports("GetTierClasses", function()
    return Shared.Classes
end)