

-- Front created by Rinehart
Config.DoorList['SASP-Front'] = {
    doors = {
        {objName = -1501157055, objYaw = 245.0, objCoords = vec3(-3146.461670, 1129.026733, 21.217188)},
        {objName = -1501157055, objYaw = 64.999977111816, objCoords = vec3(-3145.363525, 1131.383179, 21.217188)}
    },
    doorLabel = 'Front',
    doorType = 'double',
    doorRate = 1.0,
    distance = 2,
    authorizedJobs = { ['police'] = 0 },
    locked = false,
}

-- Back created by Rinehart
Config.DoorList['SASP-Back'] = {
    doorLabel = 'Back',
    objYaw = 64.999977111816,
    authorizedJobs = { ['police'] = 0 },
    objName = 245182344,
    distance = 2,
    locked = false,
    doorRate = 1.0,
    fixText = false,
    doorType = 'door',
    objCoords = vec3(-3157.260742, 1134.791870, 21.281710),
}

-- bigdatdoor created by Jay
Config.DoorList['SASP-bigdatdoor'] = {
    doorRate = 1.0,
    authorizedJobs = { ['police'] = 0 },
    doorType = 'door',
    objName = 245182344,
    locked = false,
    distance = 2,
    doorLabel = 'bigdatdoor',
    fixText = false,
    objCoords = vec3(-3160.047607, 1128.800415, 21.132374),
    objYaw = 65.000015258789,
}

-- Locker created by Rinehart
Config.DoorList['SASP-Locker'] = {
    doorRate = 1.0,
    authorizedJobs = { ['police'] = 0 },
    doorType = 'door',
    objName = 749848321,
    locked = false,
    distance = 2,
    doorLabel = 'Locker',
    fixText = false,
    objCoords = vec3(-3166.671631, 1114.617920, 21.215624),
    objYaw = 65.000007629395,
}

-- Cell created by Rinehart
Config.DoorList['SASP-Cell'] = {
    doorRate = 1.0,
    authorizedJobs = { ['police'] = 0 },
    doorType = 'door',
    objName = 631614199,
    locked = false,
    distance = 2,
    doorLabel = 'Cell',
    fixText = false,
    objCoords = vec3(-3157.275391, 1111.057617, 21.219681),
    objYaw = 335.0,
}