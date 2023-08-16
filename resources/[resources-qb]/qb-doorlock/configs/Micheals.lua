

-- Front gate created by Rinehart
Config.DoorList['Micheals-Front gate'] = {
    objYaw = 90.0,
    objName = -2125423493,
    doorRate = 1.0,
    fixText = false,
    distance = 5,
    locked = false,
    authorizedJobs = { ['pegasus'] = 0 },
    doorLabel = 'Front gate',
    doorType = 'sliding',
    objCoords = vec3(-844.051025, 155.961914, 66.032211),
}

-- side gate created by Rinehart
Config.DoorList['Micheals-side gate'] = {
    objYaw = 265.0,
    objName = -1568354151,
    doorRate = 1.0,
    fixText = false,
    distance = 2,
    locked = false,
    authorizedJobs = { ['pegasus'] = 0 },
    doorLabel = 'side gate',
    doorType = 'door',
    objCoords = vec3(-848.934326, 179.307861, 70.024704),
}

-- Garage created by Rinehart
Config.DoorList['Micheals-Garage'] = {
    objYaw = 291.00012207031,
    objName = 30769481,
    doorRate = 1.0,
    fixText = false,
    distance = 7,
    locked = false,
    authorizedJobs = { ['pegasus'] = 0 },
    doorLabel = 'Garage',
    doorType = 'garage',
    objCoords = vec3(-815.281616, 185.974991, 72.999931),
}

-- Front door created by Rinehart
Config.DoorList['Micheals-Front door'] = {
    doors = {
        {objName = 159994461, objYaw = 291.00006103516, objCoords = vec3(-816.716003, 179.097961, 72.827377)},
        {objName = -1686014385, objYaw = 291.00006103516, objCoords = vec3(-816.106812, 177.510864, 72.827377)}
    },
    doorLabel = 'Front door',
    locked = false,
    authorizedJobs = { ['pegasus'] = 0 },
    distance = 2,
    doorRate = 1.0,
    doorType = 'double',
}

-- Back 1 created by Rinehart
Config.DoorList['Micheals-Back 1'] = {
    doors = {
        {objName = -1454760130, objYaw = 111.00005340576, objCoords = vec3(-793.394348, 180.507462, 73.040451)},
        {objName = 1245831483, objYaw = 111.00005340576, objCoords = vec3(-794.185303, 182.568008, 73.040451)}
    },
    doorLabel = 'Back 1',
    locked = false,
    authorizedJobs = { ['pegasus'] = 0 },
    distance = 2,
    doorRate = 1.0,
    doorType = 'double',
}

-- Back 2 created by Rinehart
Config.DoorList['Micheals-Back 2'] = {
    doors = {
        {objName = -1454760130, objYaw = 21.000057220459, objCoords = vec3(-796.565674, 177.221375, 73.040451)},
        {objName = 1245831483, objYaw = 21.000057220459, objCoords = vec3(-794.505127, 178.012375, 73.040451)}
    },
    doorLabel = 'Back 2',
    locked = false,
    authorizedJobs = { ['pegasus'] = 0 },
    distance = 2,
    doorRate = 1.0,
    doorType = 'double',
}