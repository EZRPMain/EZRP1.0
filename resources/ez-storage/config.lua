Framework = exports['qb-core']
Radial = exports['qb-radialmenu']

function string.starts(String,Start)    
    return string.sub(String,1,string.len(Start))==Start 
end

Shared = Shared or {}
Shared.Storages = {
    ["Garage1"] = {
        coords = vector3(-1706.692, -733.426, 10.841),
        length = 7.4, 
        width = 8.2, 
        data = {
            name = "Garage1",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.241,
            maxZ = 12.441,
        },
        door = "BeachStorage-Garage 1",
        owner = nil,
        hasKeys = {}
    },
}