

-- Front Lobby created by Rinehart
Config.DoorList['Cab Co.-Front Lobby'] = {
    locked = true,
    doorType = 'double',
    authorizedJobs = { ['taxi'] = 0 },
    doorLabel = 'Front Lobby',
    distance = 2,
    doorRate = 1.0,
    doors = {
        {objName = 1519319655, objYaw = 238.3483581543, objCoords = vec3(906.643311, -161.564407, 74.547783)},
        {objName = 1519319655, objYaw = 58.205558776855, objCoords = vec3(908.114685, -159.184692, 74.547783)}
    },
}

-- lobby office created by Rinehart
Config.DoorList['Cab Co.-lobby office'] = {
    locked = true,
    objName = -2023754432,
    fixText = false,
    doorRate = 1.0,
    doorType = 'door',
    authorizedJobs = { ['taxi'] = 0 },
    objCoords = vec3(903.571533, -152.161209, 74.336243),
    doorLabel = 'lobby office',
    distance = 2,
    objYaw = 327.72305297852,
}

-- Bay garage created by Rinehart
Config.DoorList['Cab Co.-Bay garage'] = {
    locked = true,
    objName = 2064385778,
    fixText = false,
    doorRate = 1.0,
    doorType = 'garage',
    authorizedJobs = { ['taxi'] = 0 },
    objCoords = vec3(900.085083, -147.830414, 77.320473),
    doorLabel = 'Bay garage',
    distance = 5,
    objYaw = 147.9923248291,
}

-- Bay door created by Rinehart
Config.DoorList['Cab Co.-Bay door'] = {
    locked = true,
    objName = -2023754432,
    fixText = false,
    doorRate = 1.0,
    doorType = 'door',
    authorizedJobs = { ['taxi'] = 0 },
    objCoords = vec3(895.241333, -144.865097, 77.045044),
    doorLabel = 'Bay door',
    distance = 1,
    objYaw = 328.84948730469,
}

-- Froont right created by Rinehart
Config.DoorList['Cab Co.-Froont right'] = {
    doors = {
        {objName = -2023754432, objYaw = 58.631664276123, objCoords = vec3(893.759644, -180.416702, 74.856239)},
        {objName = -2023754432, objYaw = 238.01802062988, objCoords = vec3(895.122498, -178.206100, 74.856239)}
    },
    distance = 2,
    doorType = 'double',
    doorLabel = 'Front right',
    locked = false,
    doorRate = 1.0,
    authorizedJobs = { ['taxi'] = 0 },
}