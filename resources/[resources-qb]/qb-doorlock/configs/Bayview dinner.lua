

-- front created by Rinehart
Config.DoorList['Bayview dinner-front'] = {
    locked = true,
    doorType = 'double',
    authorizedJobs = { ['bayview'] = 0 },
    doorLabel = 'front',
    distance = 2,
    doorRate = 1.0,
    doors = {
        {objName = -1033983061, objYaw = 65.081565856934, objCoords = vec3(-694.718201, 5803.065918, 17.529430)},
        {objName = -1033983061, objYaw = 245.09957885742, objCoords = vec3(-695.685791, 5800.983887, 17.530401)}
    },
}

-- front right created by Rinehart
Config.DoorList['Bayview dinner-front right'] = {
    locked = true,
    doorType = 'double',
    authorizedJobs = { ['bayview'] = 0 },
    doorLabel = 'front right',
    distance = 2,
    doorRate = 1.0,
    doors = {
        {objName = 473423708, objYaw = 245.09957885742, objCoords = vec3(-702.700378, 5788.390625, 17.640291)},
        {objName = 473423708, objYaw = 64.716606140137, objCoords = vec3(-701.710266, 5790.467773, 17.640760)}
    },
}

-- back right created by Rinehart
Config.DoorList['Bayview dinner-back right'] = {
    locked = true,
    objName = 1890297615,
    fixText = false,
    doorRate = 1.0,
    doorType = 'door',
    authorizedJobs = { ['bayview'] = 0 },
    objCoords = vec3(-687.300354, 5794.580078, 17.599901),
    doorLabel = 'back right',
    distance = 2,
    objYaw = 243.54058837891,
}

-- back left created by Rinehart
Config.DoorList['Bayview dinner-back left'] = {
    locked = true,
    objName = 1890297615,
    fixText = false,
    doorRate = 1.0,
    doorType = 'door',
    authorizedJobs = { ['bayview'] = 0 },
    objCoords = vec3(-689.524658, 5789.783691, 17.599901),
    doorLabel = 'back left',
    distance = 2,
    objYaw = 243.54058837891,
}

-- kitchen created by Rinehart
Config.DoorList['Bayview dinner-kitchen'] = {
    locked = true,
    objName = -1128607325,
    fixText = false,
    doorRate = 1.0,
    doorType = 'door',
    authorizedJobs = { ['bayview'] = 0 },
    objCoords = vec3(-688.742126, 5793.460938, 17.490370),
    doorLabel = 'kitchen',
    distance = 1,
    objYaw = 334.13137817383,
}