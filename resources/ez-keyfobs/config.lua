Framework = exports['qb-core']
Keybinds = exports['jay-interactions']
Inventory  = exports['lj-inventory']
Radial = exports['qb-radialmenu']

function string.starts(String,Start)    
    return string.sub(String,1,string.len(Start))==Start 
end

Shared = Shared or {}

Shared.DebugZone = false

Shared.Zones = {
    {
        name = "MRPD-BOLARD-1",
        coords = vector3(410.158, -1023.994, 29.864),
        length = 11.9,
        width = 21.9,
        data = {
            debugPoly = Shared.DebugZone,
            heading = 0.0,
            minZ = 28.464,
            maxZ = 31.264,
            data = {
                doorlock = "LSPD-Ballards",
                jobType = "leo",
            }
        }
    },
    {
        name = "MRPD-GARAGE-1",
        coords = vector3(452.412, -1001.004, 26.786),
        length = 25.0,
        width = 5.3,
        data = {
            debugPoly = Shared.DebugZone,
            heading = 0.0,
            minZ = 23.936,
            maxZ = 29.636,
            data = {
                doorlock = "LSPD-Garage 1",
                jobType = "leo",
            }
        }
    },
    {
        name = "MRPD-GARAGE-2",
        coords = vector3(431.31, -1001.004, 26.786),
        length = 25.0,
        width = 5.3,
        data = {
            debugPoly = Shared.DebugZone,
            heading = 0.0,
            minZ = 23.936,
            maxZ = 29.636,
            data = {
                doorlock = "LSPD-Garage 2",
                jobType = "leo",
            }
        }
    },
}