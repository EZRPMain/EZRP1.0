

-- Front created by Rinehart
Config.DoorList['zancudo PD-Front'] = {
    objYaw = 149.99998474121,
    objName = 1248599813,
    doorRate = 1.0,
    fixText = false,
    distance = 2,
    locked = false,
    authorizedJobs = { ['police'] = 0 },
    doorLabel = 'Front',
    doorType = 'door',
    objCoords = vec3(-2346.531982, 3231.965576, 35.086632),
}

-- armoury created by Rinehart
Config.DoorList['zancudo PD-armoury'] = {
    objYaw = 59.999969482422,
    objName = 1248599813,
    doorRate = 1.0,
    fixText = false,
    distance = 2,
    locked = false,
    authorizedJobs = { ['police'] = 0 },
    doorLabel = 'armoury',
    doorType = 'door',
    objCoords = vec3(-2346.875000, 3219.601807, 29.367290),
}

-- cell 1 created by Rinehart
Config.DoorList['zancudo PD-cell 1'] = {
    objYaw = 330.0,
    objName = 1255609891,
    doorRate = 1.0,
    fixText = false,
    distance = 2,
    locked = false,
    authorizedJobs = { ['police'] = 0 },
    doorLabel = 'cell 2',
    doorType = 'door',
    objCoords = vec3(-2344.952881, 3207.626953, 29.377430),
}

-- cell 2 created by Rinehart
Config.DoorList['zancudo PD-cell 2'] = {
    objYaw = 330.0,
    objName = 1255609891,
    doorRate = 1.0,
    fixText = false,
    distance = 2,
    locked = false,
    authorizedJobs = { ['police'] = 0 },
    doorLabel = 'cell 1',
    doorType = 'door',
    objCoords = vec3(-2346.651855, 3204.684814, 29.377430),
}

-- Sick hall created by Rinehart
Config.DoorList['zancudo PD-Sick hall'] = {
    doors = {
        {objName = 1248599813, objYaw = 240.00001525879, objCoords = vec3(-2355.898926, 3210.460938, 29.367290)},
        {objName = -1421582160, objYaw = 59.999969482422, objCoords = vec3(-2354.604004, 3212.702881, 29.367290)}
    },
    doorLabel = 'Sick hall',
    locked = false,
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
    doorRate = 1.0,
    doorType = 'double',
}