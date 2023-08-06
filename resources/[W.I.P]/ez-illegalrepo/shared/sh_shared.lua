Framework = exports['qb-core']
Shared = {}

Shared.Ped = {
    coords = vector4(53.25, -2573.04, 6.26, 82.53),
    model = `ig_siemonyetarian`,
}

Shared.VehicleRepo = {
    min = 3,
    max = 8,
}

Shared.RepLevel = {
    [0] = "D",
    [25] = "C",
    [50] = "M",
    [60] = "B", -- VEHICLE TRACKER
    [75] = "A", -- ARMED GUARDS + VEHICLE TRACKER
    [100] = "S", -- ARMED GUARDS + VEHICLE TRACKER
    [200] = "X", -- IF X VEHICLE DRIVES AROUND WITH ARMED DRIVER + VEHICLE TRACKER
}

Shared.Vehicles = {
    ["D"] = {
        "emperor",
        "tornado",
        "tornado2",
        "tornado5",
        "minivan",
        "minivan2",
        "speedo",
        "journey",
        "journey2",
        "regina",
        "surge",
        "ingot",
        "dilettante",
        "weevil",
        "winky",
        "rumpo",
    },
    ["C"] = {

    },
    ["M"] = {

    },
    ["B"] = {

    },
    ["A"] = {

    },
    ["S"] = {

    },
    ["X"] = {

    }
}

Shared.Locations = {
    ["D"] = {
        vector4(-1044.2, -1572.53, 4.35, 46.84),
        vector4(165.91, -1858.63, 23.51, 157.11),
        vector4(-1326.41, -1027.42, 7.05, 102.05),
        vector4(271.1, -1940.09, 24.2, 222.76),
        vector4(558.21, -1787.71, 28.52, 335.09),
        vector4(-1547.43, -424.47, 41.32, 49.73),
        vector4(1149.12, -1642.71, 35.66, 210.33),
        vector4(-686.4, -982.05, 19.71, 101.54),
        vector4(-1107.3, -1227.61, 1.91, 120.14),
        vector4(-1150.86, -1531.78, 3.57, 30.87),
        vector4(-1334.0, -1163.81, 3.88, 269.71),
        vector4(-1326.41, -1027.42, 7.05, 102.05),
        vector4(836.6, -798.39, 25.6, 115.42),
        vector4(506.17, -1842.37, 26.95, 122.13),
        vector4(31.53, -1458.83, 28.64, 318.31),
        vector4(956.39, -195.98, 72.53, 223.29),
        vector4(334.64, -216.17, 53.41, 256.59),
        vector4(1140.11, -413.47, 66.45, 32.8),
        vector4(1125.25, -993.53, 45.25, 278.44),
        vector4(1101.37, -1510.72, 33.8, 264.35),
        vector4(-766.85, 373.48, 86.98, 3.59),
        vector4(-699.78, -763.29, 32.93, 179.19),
        vector4(-726.08, -412.41, 34.33, 84.64),
        vector4(-1471.25, -651.65, 28.82, 25.77),
        vector4(-1702.44, -447.72, 40.94, 319.34),
        vector4(-1483.83, -199.18, 49.72, 47.18),
    },
    ["C"] = {

    },
    ["M"] = {

    },
    ["B"] = {

    },
    ["A"] = {

    },
    ["S"] = {

    },
    ["X"] = {

    }
}

print(#Shared.Locations["D"])