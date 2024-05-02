QB = {}

QB.Spawns = {
    ["legion"] = {
        coords = vector4(195.17, -933.77, 29.7, 144.5),
        location = "legion",
        label = "Legion Square",
        pos = {top = 50, left = 61.9}
    },

    ["policedp"] = {
        coords = vector4(428.23, -984.28, 29.76, 3.5),
        location = "policedp",
        label = "Police Department",
        pos = {top = 48, left = 57.5}
    },

    ["paleto"] = {
        coords = vector4(80.35, 6424.12, 31.67, 45.5),
        location = "paleto",
        label = "Paleto Bay",
        pos = {top = 51.5, left = 28.9}
    },

    ["motel"] = {
        coords = vector4(327.56, -205.08, 53.08, 163.5),
        location = "motel",
        label = "Motels",
        pos = {top = 49.5, left = 52}
    },

    ["sandy"] = {
        coords = vector4(1857.37, 3680.04, 33.79, 213.5),
        location = "sandy",
        label = "Blaine County Sheriff Station",
        pos = {top = 33, left = 28.7},
    },

    ["amusementpark"] = {
        coords = vector4(-1600.0509033203125, -971.2437133789064, 13.01739120483398, 54.69508361816406),
        location = "amusementpark",
        label = "Amusement Park",
        pos = {top = 72, left = 57.8},
    },

    ["paleto2"] = {
        coords = vector4(-375.2769775390625, 6030.4697265625, 31.52615165710449, 162.48745727539065),
        location = "paleto2",
        label = "Paleto Bay Sheriff",
        pos = {top = 58, left = 14},
    },
}

QB.SpawnAccess = { --To disable the buttons
    ['apartments'] = true,
    ['houses'] = true,
    ['lastLoc'] = true,
}

QB.Housing = { --New
    ['ps-housing'] = true, --https://github.com/Project-Sloth/ps-housing
    ['qb-houses'] = false,
}