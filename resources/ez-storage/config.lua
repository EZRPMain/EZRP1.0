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
    ["Garage2"] = {
        coords = vector3(-1700.915, -739.139, 11.016),
        length = 7.3, 
        width = 8.2, 
        data = {
            name = "Garage2",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.241,
            maxZ = 12.441,
        },
        door = "BeachStorage-Garage 2",
        owner = nil,
        hasKeys = {}
    },
    ["Garage3"] = {
        coords = vector3(-1694.553, -743.888, 10.941),
        length = 7.3, 
        width = 8.2, 
        data = {
            name = "Garage3",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.291,
            maxZ = 12.591,
        },
        door = "BeachStorage-Garage 3",
        owner = nil,
        hasKeys = {}
    },
    ["Garage4"] = {
        coords = vector3(-1688.185, -749.479, 10.841),
        length = 7.9, 
        width = 8.2, 
        data = {
            name = "Garage4",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.191,
            maxZ = 12.491,
        },
        door = "BeachStorage-Garage 4",
        owner = nil,
        hasKeys = {}
    },
    ["Garage5"] = {
        coords = vector3(-1681.185, -754.922, 10.941),
        length = 7.9, 
        width = 8.2, 
        data = {
            name = "Garage5",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.291,
            maxZ = 12.591,
        },
        door = "BeachStorage-Garage 5",
        owner = nil,
        hasKeys = {}
    },
    ["Garage6"] = {
        coords = vector3(-1674.875, -760.581, 10.841),
        length = 7.9, 
        width = 8.2, 
        data = {
            name = "Garage6",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.191,
            maxZ = 12.491,
        },
        door = "BeachStorage-Garage 6",
        owner = nil,
        hasKeys = {}
    },
    ["Garage7"] = {
        coords = vector3(-1713.966, -752.266, 10.849),
        length = 7.9, 
        width = 8.2, 
        data = {
            name = "Garage7",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.199,
            maxZ = 12.499,
        },
        door = "BeachStorage-Garage 7",
        owner = nil,
        hasKeys = {}
    },
    ["Garage8"] = {
        coords = vector3(-1707.656, -758.116, 10.939),
        length = 7.9, 
        width = 8.2, 
        data = {
            name = "Garage8",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.289,
            maxZ = 12.589,
        },
        door = "BeachStorage-Garage 8",
        owner = nil,
        hasKeys = {}
    },
    ["Garage9"] = {
        coords = vector3(-1701.004, -763.406, 10.939),
        length = 7.9, 
        width = 8.2, 
        data = {
            name = "Garage9",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.289,
            maxZ = 12.589,
        },
        door = "BeachStorage-Garage 9",
        owner = nil,
        hasKeys = {}
    },
    ["Garage10"] = {
        coords = vector3(-1694.46, -768.911, 10.939),
        length = 7.9, 
        width = 8.2, 
        data = {
            name = "Garage10",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.289,
            maxZ = 12.589,
        },
        door = "BeachStorage-Garage 10",
        owner = nil,
        hasKeys = {}
    },
    ["Garage11"] = {
        coords = vector3(-1687.5, -774.342, 10.839),
        length = 7.9, 
        width = 8.2, 
        data = {
            name = "Garage11",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.189,
            maxZ = 12.489,
        },
        door = "BeachStorage-Garage 11",
        owner = nil,
        hasKeys = {}
    },
    ["Garage12"] = {
        coords = vector3(-1681.392, -779.582, 10.839),
        length = 7.9, 
        width = 8.2, 
        data = {
            name = "Garage12",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.189,
            maxZ = 12.489,
        },
        door = "BeachStorage-Garage 12",
        owner = nil,
        hasKeys = {}
    },
    ["Garage13"] = {
        coords = vector3(-1675.683, -784.816, 10.939),
        length = 7.2, 
        width = 8.2, 
        data = {
            name = "Garage13",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.293,
            maxZ = 12.593,
        },
        door = "BeachStorage-Garage 13",
        owner = nil,
        hasKeys = {}
    },
    ["Garage14"] = {
        coords = vector3(-1663.561, -796.12, 10.943),
        length = 7.9, 
        width = 8.4, 
        data = {
            name = "Garage14",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.293,
            maxZ = 12.593,
        },
        door = "BeachStorage-Garage 14",
        owner = nil,
        hasKeys = {}
    },
    ["Garage15"] = {
        coords = vector3(-1658.172, -789.895, 10.943),
        length = 8.5, 
        width = 7.9, 
        data = {
            name = "Garage15",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.293,
            maxZ = 12.593,
        },
        door = "BeachStorage-Garage 15",
        owner = nil,
        hasKeys = {}
    },
    ["Garage16"] = {
        coords = vector3(-1653.121, -783.423, 11.043),
        length = 8.5, 
        width = 7.9, 
        data = {
            name = "Garage16",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.208,
            maxZ = 12.878,
        },
        door = "BeachStorage-Garage 16",
        owner = nil,
        hasKeys = {}
    },
    ["Garage17"] = {
        coords = vector3(-1649.423, -808.152, 10.746),
        length = 8.5, 
        width = 7.9, 
        data = {
            name = "Garage17",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.911,
            maxZ = 12.581,
        },
        door = "BeachStorage-Garage 17",
        owner = nil,
        hasKeys = {}
    },
    ["Garage18"] = {
        coords = vector3(-1643.741, -801.966, 10.746),
        length = 8.5, 
        width = 7.9, 
        data = {
            name = "Garage18",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.911,
            maxZ = 12.581,
        },
        door = "BeachStorage-Garage 18",
        owner = nil,
        hasKeys = {}
    },
    ["Garage19"] = {
        coords = vector3(-1639.108, -795.654, 10.346),
        length = 8.5, 
        width = 7.9, 
        data = {
            name = "Garage19",
            heading = 50.0,
            debugPoly = false,
            minZ = 9.511,
            maxZ = 12.181,
        },
        door = "BeachStorage-Garage 19",
        owner = nil,
        hasKeys = {}
    },
}