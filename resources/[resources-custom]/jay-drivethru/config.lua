Config = Config or {}

Config.DebugZone = false

Config.RadioItems = {
    ["drivethru_bs"] = {
        {
            -- Far Far Away
            coords = vector3(6876.5166, 435.513, 57.997463),
            radio = 83.93,
            distance = 15.0
        },
        -- {
        --     coords = vector3(6876.5166, 435.513, 57.997463),
        --     radio = 83.93,
        -- },
    },
    ["drivethru_taco"] = {
        {
            -- Taco City
            coords = vector3(15.284764, -1600.162, 29.376964),
            radio = 201.315,
            distance = 15.0
        },
    }
}


Config.DrivethruZones = {
    [1] = {
        name = "burgershot_far_away", 
        coords = vector3(6878.617, 442.586, 58.47),
        length = 7.2,
        width = 4.0,
        data = {
            debugPoly = Config.DebugZone,
            heading = 310,
            minZ = 56.72,
            maxZ = 60.22,
            data = {
                radio = 83.93
            }
        }
    },
    [2] = {
        name = "taco_drivethru_city", 
        coords = vector3(17.837, -1611.302, 29.982),
        length = 4.2,
        width = 7.8,
        data = {
            debugPoly = Config.DebugZone,
            heading = 50.0,
            minZ = 28.182,
            maxZ = 31.782,
            data = {
                radio = 201.315,
            }
        }
    },
    [3] = { --vector4(17.480796, -1595.049, 28.832494, 49.074943)
        name = "taco_drivethru_city_2", 
        coords = vector3(17.480796, -1595.049, 28.832494),
        length = 4.2,
        width = 7.8,
        data = {
            debugPoly = Config.DebugZone,
            heading = 140.0,
            minZ = 28.182,
            maxZ = 31.782,
            data = {
                radio = 201.315,
            }
        }
    }
}

-- trey is snoring loud asf lol