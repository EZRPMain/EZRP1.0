

-- Front door created by Rinehart
Config.DoorList['Burgershot-Front door'] = {
    doorRate = 1.0,
    authorizedJobs = { ['burgershot'] = 0 },
    doors = {
        {objName = -1890974902, objYaw = 123.99998474121, objCoords = vec3(-1180.728516, -887.477356, 14.095269)},
        {objName = 1143532813, objYaw = 304.0, objCoords = vec3(-1182.182861, -885.330811, 14.095269)}
    },
    locked = true,
    distance = 2,
    doorType = 'double',
}

-- Counter created by Rinehart
Config.DoorList['Burgershot-Counter'] = {
    doorRate = 1.0,
    objYaw = 304.00003051758,
    locked = true,
    doorLabel = 'Counter',
    fixText = false,
    authorizedJobs = { ['burgershot'] = 0 },
    objName = 2010236044,
    objCoords = vec3(-1188.065796, -896.678406, 13.905561),
    distance = 2,
    doorType = 'door',
}

-- Back created by Rinehart
Config.DoorList['Burgershot-Back'] = {
    doorRate = 1.0,
    objYaw = 214.00001525879,
    locked = true,
    doorLabel = 'Back',
    fixText = false,
    authorizedJobs = { ['burgershot'] = 0 },
    objName = 1465287574,
    objCoords = vec3(-1197.099121, -903.939392, 14.035266),
    distance = 2,
    doorType = 'door',
}