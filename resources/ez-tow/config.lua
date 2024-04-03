Framework = exports['qb-core']
Keybinds = exports['jay-interactions']
Inventory  = exports['lj-inventory']
Phone = exports['qb-phone']
Radial = exports['qb-radialmenu']
Functions = exports['ez-lib']

function string.starts(String,Start)    
    return string.sub(String,1,string.len(Start))==Start 
end


Shared = Shared or {}

Shared.TowYard = {
    label = "Tow Yard",
    coords = vector3(1203.621, -1261.503, 36.527),
    length = 35.9, 
    width = 28.0, 
    data = {
        name = "TowYard",
        heading = 0.0,
        debugPoly = false,
        minZ = 34.127,
        maxZ = 38.927,
    },
}

--[[

exports['qb-target']:AddBoxZone(??, vector3(1203.621, -1261.503, 36.527), 35.9, 28.0, {
	name = ??,
	heading = 0.0,
	debugPoly = false,
	MinZ = 34.127,
	MaxZ = 38.927,

]]