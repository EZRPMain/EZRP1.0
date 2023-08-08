Config = {}

Config.Wrapper = "ox" -- Put which wrapper you use either "ox" or "ghm"

Config.ScratchBlip = vector3(-226.89, -2658.27, 6.0) -- This is for the blip for the Scratch Location

Config.Cooldown = 20 -- How many minutes must people wait before starting another job?
Config.BoostingCooldown = 10 -- How many minutes cooldownf or people before they can start a new Boosting Job?

-- All the Car Chances
Config.CCarChance = 62 -- How many % chance to get a C vehicle (worst kind of car) This would be 62%
Config.BCarChance = 84 -- How many % chance to get a B vehicle (Second worst car) This would be 22%
Config.ACarChance = 95 -- How many % chance to get a A vehicle (third best vehicle) this would be 11% 
Config.SCarChance = 99 -- How many % chance to get a S vehicle (second best vehicle) This would be 4%
Config.SPCarChance = 100 -- How many % chance to get a S+ vehicle (best vehicle) THis would be 1%

-- Minimum Cops
Config.MinCops = 0 -- Number of cops on Duty before you can do the Vin Scratching 

-- Blip Cooldowns
Config.StartCD = 1000 -- What delay does the tracker start on? The lower the number the higher MS (1000 = 1 second)
Config.MaxCD = 15000 -- Maximum CD before chip gets overheated and cops no longer can see it (recommended 15000)

-- Hack Config
Config.HackSecondsMin = 30 -- How many seconds to hack the car min
Config.HackSecondsMax = 60 -- How many seconds to hack the car max

Config.HackLengthMin = 4 -- How long should the text be in the hack? Minimum
Config.HackLengthMax = 4 -- How long should the text be in the hack? Maximum

-- Start price for Job
Config.StartPrice = 5000 -- Price to start a Vinscratch job

Config.BasePrice = 35000 -- How much money minimum should a car give? 
-- if this is 15000 then C will be 15000 and B will be 30% more and A 30% more of B and so on.

Config.CarDamage = true -- If Car is damaged upon returning should it give less money? true (less money) false (no difference)
Config.LessMoney = 0.8 -- How much less money should the car give if it's damaged? This is in decimal percentages
-- ONLY EDIT IF Config.CarDamage is true. 0.9 = 10% 0.8 = 20% 0.7 = 30% and so on

Config.VinRep = 100 -- What kind of rep before getting missions to scratch? 
Config.VinSkipC = 1000 -- What rep do you need to be at to Skip C vehicles (Worst vehicles) 
Config.VinSkipB = 2000 -- What rep do you need to be at to skip B Vehicles? (Second worst vehicles) 

Config.HackItem = "electronickit" -- Put in the name of your hack item here will randomly give this hackitem during vehicle robberies
-- The standard is electronickit but just change it to whatever if you use electronickit for different things

Config.RequiredItem = true -- Does a player need Config.RareItem before they can scratch a vehicle? True or False
Config.RareItem = "screwdriverset" -- Use this item to Scratch the vehicle
Config.RareItemChance = 5 -- Whats the chance of getting the rare item from a veh boost?
-- All the polyzone Configs here and QB/BT Target configs

Config.TargetOption = "qb" -- use either "bt", "qb" or "berkie" depending on which target you use (bt-targer, qb-target or berkie-target)

Config.LaptopPosition = vector4(-230.90, -2661.86, 6.0, 85.7) -- Put the XYZ for the BT / QB Target for the Computer

Config.NathanielPosition = vector4(1698.58, 6426.11, 32.76, 151.7) -- Put the XYZ for the BT / QB Target for Nathaniel 

Config.TurnInLocation = vector4(219.25, -3340.61, 5.8, 6.77) -- Location to turn in the Boosting Car

Config.DebugPolyzones = false -- Put this either as true or false to see if your BT/QB Targer and PolyZonehelper align


Config.ScratchLocation = {
    ["1"] = {
        polyzone = vector3(-229.87, -2654.08, 6.0),
        polyzone1 = 15.0, 
        polyzone2 = 9.0,
        heading = 90, 
        minZ=5.00,
        maxZ=8.00
    },
}

-- Be carefull editing the locations as they are represented as
Config.MaxCLocations = 20 -- Put the maximum amount of locations for each spot
Config.MaxBLocations = 10 -- Put the maximum amount of locations for each spot
Config.MaxALocations = 5 -- Put the maximum amount of locations for each spot
Config.MaxSLocations = 5 -- Put the maximum amount of locations for each spot
Config.MaxSPLocations = 5 -- Put the maximum amount of locations for each spot
-- discord.gg/AS2Y8TWejt

Config.CLocations = {
    [1] = {
        ["ped"] = "a_m_y_soucent_03",
        ["coords"] = {
            [1] = vector3(-451.422, 395.5793, 104.77),
            [2] = vector3(-451.841, 397.5930, 104.77),
            [3] = vector3(-436.311, 363.3807, 105.76),
            [4] = vector3(-436.332, 360.0453, 105.92),
        },
        ["vehicle"] = "pulsarhr",
        ["vehiclepos"] = { x = -448.511, y = 371.4920, z = 104.16, h = 87.67},
        ["weapon"] = "weapon_katana",
   },
   [2] = {
        ["ped"] = "a_m_y_soucent_03",
        ["coords"] = {
            [1] = vector3(-451.422, 395.5793, 104.77),
            [2] = vector3(-451.841, 397.5930, 104.77),
            [3] = vector3(-436.311, 363.3807, 105.76),
            [4] = vector3(-436.332, 360.0453, 105.92),
        },
        ["vehicle"] = "r33hr",
        ["vehiclepos"] = { x = -448.511, y = 371.4920, z = 104.16, h = 87.67},
        ["weapon"] = "weapon_katana",
   },
   [3] = {
        ["ped"] = "a_m_y_downtown_01",
        ["coords"] = {
            [1] = vector3(1307.646, -1754.17, 53.881),
            [2] = vector3(1308.522, -1753.52, 53.901),
            [3] = vector3(1290.176, -1742.97, 53.878),
            [4] = vector3(1289.308, -1741.33, 53.866),
        },
        ["vehicle"] = "r35",
        ["vehiclepos"] = { x = 1302.841, y = -1741.33, z = 53.274, h = 21.83},
        ["weapon"] = "weapon_pistol",
   },
   [4] = {
        ["ped"] = "a_m_y_downtown_01",
        ["coords"] = {
            [1] = vector3(1307.646, -1754.17, 53.881),
            [2] = vector3(1308.522, -1753.52, 53.901),
            [3] = vector3(1290.176, -1742.97, 53.878),
            [4] = vector3(1289.308, -1741.33, 53.866),
        },
        ["vehicle"] = "488",
        ["vehiclepos"] = { x = 1302.841, y = -1741.33, z = 53.274, h = 21.83},
        ["weapon"] = "weapon_pistol",
   },
   [5] = {
        ["ped"] = "a_m_y_beach_01",
        ["coords"] = {
            [1] = vector3(-1322.78, -1252.86, 4.6010),
            [2] = vector3(-1321.72, -1264.19, 4.5919),
            [3] = vector3(-1308.36, -1227.69, 4.8997),
            [4] = vector3(-1308.91, -1229.15, 4.9065),
        },
        ["vehicle"] = "r35",
        ["vehiclepos"] = { x = -1318.87, y = -1241.02, z = 3.9951, h = 290.1},
        ["weapon"] = "weapon_pistol",
   },
   [6] = {
        ["ped"] = "a_m_y_beach_01",
        ["coords"] = {
            [1] = vector3(-1322.78, -1252.86, 4.6018),
            [2] = vector3(-1321.72, -1264.19, 4.5919),
            [3] = vector3(-1308.36, -1227.69, 4.8997),
            [4] = vector3(-1308.91, -1229.15, 4.9065),
        },
        ["vehicle"] = "r33",
        ["vehiclepos"] = { x = -1318.87, y = -1241.02, z = 3.9951, h = 290.1},
        ["weapon"] = "weapon_pistol",
   },
   [7] = {
        ["ped"] = "cs_carbuyer",
        ["coords"] = {
            [1] = vector3(-385.172, 6194.068, 31.534),
            [2] = vector3(-384.449, 6193.229, 31.518),
            [3] = vector3(-385.154, 6200.845, 31.487),
            [4] = vector3(-384.033, 6201.734, 31.487),
        },
        ["vehicle"] = "r32",
        ["vehiclepos"] = { x = -381.381, y = 6186.874, z = 30.884, h = 224.8},
        ["weapon"] = "weapon_pistol50",
   },
   [8] = {
        ["ped"] = "cs_carbuyer",
        ["coords"] = {
            [1] = vector3(-385.172, 6194.068, 31.534),
            [2] = vector3(-384.449, 6193.229, 31.518),
            [3] = vector3(-385.154, 6200.845, 31.487),
            [4] = vector3(-384.033, 6201.734, 31.487),
        },
        ["vehicle"] = "razor",
        ["vehiclepos"] = { x = -381.381, y = 6186.874, z = 30.884, h = 224.8},
        ["weapon"] = "weapon_pistol50",
   },
   [9] = {
        ["ped"] = "cs_priest",
        ["coords"] = {
            [1] = vector3(-328.828, 6149.856, 32.313),
            [2] = vector3(-329.827, 6150.899, 32.313),
            [3] = vector3(-328.975, 6154.277, 32.313),
            [4] = vector3(-329.886, 6153.346, 32.313),
        },
        ["vehicle"] = "GODzDEMONSBLB",
        ["vehiclepos"] = { x = -341.769, y = 6141.292, z = 31.004, h = 313.5},
        ["weapon"] = "weapon_revolver",},
   [10] = {
        ["ped"] = "cs_priest",
        ["coords"] = {
            [1] = vector3(-328.828, 6149.856, 32.313),
            [2] = vector3(-329.827, 6150.899, 32.313),
            [3] = vector3(-328.975, 6154.277, 32.313),
            [4] = vector3(-329.886, 6153.346, 32.313),
        },
        ["vehicle"] = "GODzDEMONSBLB",
        ["vehiclepos"] = { x = -321.043, y = 6126.836, z = 31.185, h = 43.60},
        ["weapon"] = "weapon_bat",
    },
   [11] = {
        ["ped"] = "a_m_m_hillbilly_01",
        ["coords"] = {
            [1] = vector3(-481.189, 6266.513, 13.634),
            [2] = vector3(-480.306, 6265.990, 13.634),
            [3] = vector3(-483.849, 6277.390, 13.332),
            [4] = vector3(-482.903, 6279.383, 13.349),
        },
        ["vehicle"] = "r35",
        ["vehiclepos"] = { x = -481.703, y = 6260.528, z = 13.047, h = 68.22},
        ["weapon"] = "weapon_pistol",
   },
   [12] = {
        ["ped"] = "a_m_m_hillbilly_01",
        ["coords"] = {
            [1] = vector3(-481.189, 6266.513, 13.634),
            [2] = vector3(-480.306, 6265.990, 13.634),
            [3] = vector3(-483.849, 6277.390, 13.332),
            [4] = vector3(-482.903, 6279.383, 13.349),
        },
        ["vehicle"] = "RAPTOR150",
        ["vehiclepos"] = { x = -481.703, y = 6260.528, z = 13.047, h = 68.22},
        ["weapon"] = "weapon_pistol",
   },
   [13] = {
        ["ped"] = "a_m_m_trampbeac_01",
        ["coords"] = {
            [1] = vector3(1435.586, 3656.366, 34.406),
            [2] = vector3(1435.194, 3657.792, 34.437),
            [3] = vector3(1435.743, 3660.189, 37.939),
            [4] = vector3(1434.479, 3659.696, 37.939),
        },
        ["vehicle"] = "drescatpack",
        ["vehiclepos"] = { x = 1428.858, y = 3660.897, z = 33.592, h = 292},
        ["weapon"] = "weapon_pistol",
},
   [14] = {
        ["ped"] = "a_m_m_trampbeac_01",
        ["coords"] = {
            [1] = vector3(1435.586, 3656.366, 34.406),
            [2] = vector3(1435.194, 3657.792, 34.437),
            [3] = vector3(1435.743, 3660.189, 37.939),
            [4] = vector3(1434.479, 3659.696, 37.939),
        },
        ["vehicle"] = "silvia",
        ["vehiclepos"] = { x = 1428.858, y = 3660.897, z = 33.592, h = 292},
        ["weapon"] = "weapon_pistol",
},
   [15] = {
        ["ped"] = "a_m_m_golfer_01",
        ["coords"] = {
            [1] = vector3(-3088.05, 392.5769, 11.447),
            [2] = vector3(-3088.68, 391.5757, 11.448),
            [3] = vector3(-3081.68, 405.5546, 6.9685),
            [4] = vector3(-3080.69, 405.1269, 6.9685),
        },
        ["vehicle"] = "hellcat",
        ["vehiclepos"] = { x = -3073.17, y = 394.9708, z = 6.8951, h = 250.8 },
        ["weapon"] = "weapon_combatpistol",
},
   [16] = {
        ["ped"] = "a_m_m_golfer_01",
        ["coords"] = {
            [1] = vector3(-3088.05, 392.5769, 11.447),
            [2] = vector3(-3088.68, 391.5757, 11.448),
            [3] = vector3(-3081.68, 405.5546, 6.9685),
            [4] = vector3(-3080.69, 405.1269, 6.9685),
        },
        ["vehicle"] = "razor",
        ["vehiclepos"] = { x = -3073.17, y = 394.9708, z = 6.8951, h = 250.8 },
        ["weapon"] = "weapon_combatpistol",
},
   [17] = {
        ["ped"] = "a_m_m_salton_02",
        ["coords"] = {
            [1] = vector3(-3058.21, 451.3487, 9.6431),
            [2] = vector3(-3059.35, 448.8627, 9.6435),
            [3] = vector3(-3061.93, 442.0563, 9.6446),
            [4] = vector3(-3060.76, 444.4976, 9.6442),
        },
        ["vehicle"] = "am21",
        ["vehiclepos"] = { x = -3055.20, y = 446.5413, z = 6.0415, h = 246.0},
        ["weapon"] = "weapon_combatpistol",
},
   [18] = {
        ["ped"] = "a_m_m_salton_02",
        ["coords"] = {
            [1] = vector3(-3058.21, 451.3487, 9.6431),
            [2] = vector3(-3059.35, 448.8627, 9.6435),
            [3] = vector3(-3061.93, 442.0563, 9.6446),
            [4] = vector3(-3060.76, 444.4976, 9.6442),
        },

        ["vehicle"] = "silvia",
        ["vehiclepos"] = { x = -3055.20, y = 446.5413, z = 6.0415, h = 246.0},
        ["weapon"] = "weapon_combatpistol",
},
   [19] = {
        ["ped"] = "g_m_m_chigoon_01",
        ["coords"] = {
            [1] = vector3(-2795.89, 1435.102, 100.92),
            [2] = vector3(-2794.91, 1434.572, 100.92),
            [3] = vector3(-2796.55, 1431.855, 100.92),
            [4] = vector3(-2797.06, 1432.905, 100.92),
        },

        ["vehicle"] = "mach1",
        ["vehiclepos"] = { x = -2786.62, y = 1432.449, z = 100.39, h = 233.2},
        ["weapon"] = "weapon_pistol",
},
   [20] = {
        ["ped"] = "g_m_m_chigoon_01",
        ["coords"] = {
            [1] = vector3(-2795.89, 1435.102, 100.92),
            [2] = vector3(-2794.91, 1434.572, 100.92),
            [3] = vector3(-2796.55, 1431.855, 100.92),
            [4] = vector3(-2797.06, 1432.905, 100.92),
        },

        ["vehicle"] = "21camaro",
        ["vehiclepos"] = { x = -2786.62, y = 1432.449, z = 100.39, h = 233.2},
        ["weapon"] = "weapon_shoe",
}, -- These are the lowest tier Cars
} 

Config.BLocations = {
    [1] = {
        ["ped"] = "a_m_y_soucent_03",
        ["coords"] = {
            [1] = vector3(-451.422, 395.5793, 104.77),
            [2] = vector3(-451.841, 397.5930, 104.77),
            [3] = vector3(-436.311, 363.3807, 105.76),
            [4] = vector3(-436.332, 360.0453, 105.92),
        },
        ["vehicle"] = "21ramtrx",
        ["vehiclepos"] = { x = -448.511, y = 371.4920, z = 104.16, h = 87.67},
        ["weapon"] = "weapon_p226",
    },
    [2] = {
        ["ped"] = "a_m_y_soucent_03",
        ["coords"] = {
            [1] = vector3(-451.422, 395.5793, 104.77),
            [2] = vector3(-451.841, 397.5930, 104.77),
            [3] = vector3(-436.311, 363.3807, 105.76),
            [4] = vector3(-436.332, 360.0453, 105.92),
        },
        ["vehicle"] = "RAPTOR150",
        ["vehiclepos"] = { x = -448.511, y = 371.4920, z = 104.16, h = 87.67},
        ["weapon"] = "weapon_shoe",
    },
    [3] = {
        ["ped"] = "a_m_y_downtown_01",
        ["coords"] = {
            [1] = vector3(1307.646, -1754.17, 53.881),
            [2] = vector3(1308.522, -1753.52, 53.901),
            [3] = vector3(1290.176, -1742.97, 53.878),
            [4] = vector3(1289.308, -1741.33, 53.866),
        },
        ["vehicle"] = "RAPTOR150",
        ["vehiclepos"] = { x = 1302.841, y = -1741.33, z = 53.274, h = 21.83},
        ["weapon"] = "weapon_shoe",
    },
    [4] = {
        ["ped"] = "a_m_y_downtown_01",
        ["coords"] = {
            [1] = vector3(1307.646, -1754.17, 53.881),
            [2] = vector3(1308.522, -1753.52, 53.901),
            [3] = vector3(1290.176, -1742.97, 53.878),
            [4] = vector3(1289.308, -1741.33, 53.866),
        },
        ["vehicle"] = "nh2r",
        ["vehiclepos"] = { x = 1302.841, y = -1741.33, z = 53.274, h = 21.83},
        ["weapon"] = "weapon_brick",
    },
    [5] = {
        ["ped"] = "a_m_y_beach_01",
        ["coords"] = {
            [1] = vector3(-1322.78, -1252.86, 4.6010),
            [2] = vector3(-1321.72, -1264.19, 4.5919),
            [3] = vector3(-1308.36, -1227.69, 4.8997),
            [4] = vector3(-1308.91, -1229.15, 4.9065),
        },
        ["vehicle"] = "pulsarhr",
        ["vehiclepos"] = { x = -1318.87, y = -1241.02, z = 3.9951, h = 290.1},
        ["weapon"] = "weapon_brick",
    },
    [6] = {
        ["ped"] = "a_m_y_beach_01",
        ["coords"] = {
            [1] = vector3(-1322.78, -1252.86, 4.6018),
            [2] = vector3(-1321.72, -1264.19, 4.5919),
            [3] = vector3(-1308.36, -1227.69, 4.8997),
            [4] = vector3(-1308.91, -1229.15, 4.9065),
        },
        ["vehicle"] = "saleemc63",
        ["vehiclepos"] = { x = -1318.87, y = -1241.02, z = 3.9951, h = 290.1},
        ["weapon"] = "weapon_brick",
    },
    [7] = {
        ["ped"] = "cs_fbisuit_01",
        ["coords"] = {
            [1] = vector3(1407.9, 1127.81, 114.33),
            [2] = vector3(1406.12, 1127.32, 114.33),
            [3] = vector3(1418.78, 1114.17, 114.79),
            [4] = vector3(1429.05, 1126.26, 114.27),
        },
        ["vehicle"] = "mig",
        ["vehiclepos"] = { x = 1406.44, y = 1118.322, z = 114.42, h = 88.1},
        ["weapon"] = "weapon_brick",
    },
    [8] = {
        ["ped"] = "cs_fbisuit_01",
        ["coords"] = {
            [1] = vector3(1407.9, 1127.81, 114.33),
            [2] = vector3(1406.12, 1127.32, 114.33),
            [3] = vector3(1418.78, 1114.17, 114.79),
            [4] = vector3(1429.05, 1126.26, 114.27),
        },
        ["vehicle"] = "f430s",
        ["vehiclepos"] = { x = 1406.44, y = 1118.322, z = 114.42, h = 88.1},
        ["weapon"] = "weapon_brick",
    },
    [9] = {
        ["ped"] = "mp_m_weapexp_01",
        ["coords"] = {
            [1] = vector3(-2008.9, 368.22, 94.81),
            [2] = vector3(-2008.54, 367.06, 94.81),
            [3] = vector3(-1993.09, 384.34, 94.53),
            [4] = vector3(-1991.98, 384.21, 94.53),
        },
        ["vehicle"] = "488",
        ["vehiclepos"] = { x = -2001.25, y = 378.94, z = 94.48, h = 180.6},
        ["weapon"] = "weapon_microsmg",
    },
    [10] = {
        ["ped"] = "mp_m_weapexp_01",
        ["coords"] = {
            [1] = vector3(-1322.78, -1252.86, 4.6018),
            [2] = vector3(-1321.72, -1264.19, 4.5919),
            [3] = vector3(-1308.36, -1227.69, 4.8997),
            [4] = vector3(-1308.91, -1229.15, 4.9065),
        },
        ["vehicle"] = "abflug",
        ["vehiclepos"] = { x = -2001.25, y = 378.94, z = 94.48, h = 180.6},
        ["weapon"] = "weapon_microsmg",
    },
}

Config.ALocations = {
    [1] = {
        ["ped"] = "g_m_y_mexgoon_03",
        ["coords"] = { 
            [1] = vector3(-1808.51, 333.9, 89.37),
            [2] = vector3(-1807.89, 335.51, 89.37),
            [3] = vector3(-1805.52, 342.52, 88.55),
            [4] = vector3(-1783.65, 355.04, 88.97),
            [5] = vector3(-1782.49, 356.36, 88.97),
        },
        ["vehicle"] = "r33",
        ["vehiclepos"] = { x = -1791.53, y = 347.69, z = 87.89, h = 64.4},
        ["weapon"] = "weapon_glock",
    },
    [2] = {
        ["ped"] = "g_m_y_salvagoon_03",
        ["coords"] = {
            [1] = vector3(-1808.51, 333.9, 89.37),
            [2] = vector3(-1807.89, 335.51, 89.37),
            [3] = vector3(-1805.52, 342.52, 88.55),
            [4] = vector3(-1783.65, 355.04, 88.97),
            [5] = vector3(-1782.49, 356.36, 88.97),
        },
        ["vehicle"] = "r32",
        ["vehiclepos"] = { x = -1791.53, y = 347.69, z = 87.89, h = 64.4},
        ["weapon"] = "weapon_glock",
    },
    [3] = {
        ["ped"] = "g_m_y_mexgoon_03",
        ["coords"] = { 
            [1] = vector3(-592.12, 761.69, 188.51),
            [2] = vector3(-596.41, 759.24, 188.51),
            [3] = vector3(-580.35, 732.76, 184.21),
            [4] = vector3(-579.09, 733.08, 184.21),
            [5] = vector3(-579.59, 766.94, 185.41),
        },
        ["vehicle"] = "488",
        ["vehiclepos"] = { x = -591.37, y = 753.05, z = 183.08, h = 257.51},
        ["weapon"] = "weapon_glock",
    },
    [4] = {
        ["ped"] = "g_m_y_salvagoon_03",
        ["coords"] = {
            [1] = vector3(-592.12, 761.69, 188.51),
            [2] = vector3(-596.41, 759.24, 188.51),
            [3] = vector3(-580.35, 732.76, 184.21),
            [4] = vector3(-579.09, 733.08, 184.21),
            [5] = vector3(-579.59, 766.94, 185.41),
        },
        ["vehicle"] = "488",
        ["vehiclepos"] = { x = -2001.25, y = 378.94, z = 94.48, h = 180.6},
        ["weapon"] = "weapon_glock",
    },
    [5] = {
        ["ped"] = "g_m_m_mexboss_01",
        ["coords"] = {
            [1] = vector3(-592.12, 761.69, 188.51),
            [2] = vector3(-596.41, 759.24, 188.51),
            [3] = vector3(-580.35, 732.76, 184.21),
            [4] = vector3(-579.09, 733.08, 184.21),
            [5] = vector3(-579.59, 766.94, 185.41),
        },
        ["vehicle"] = "r34",
        ["vehiclepos"] = { x = -2001.25, y = 378.94, z = 94.48, h = 180.6},
        ["weapon"] = "weapon_pistol",
    },
}

Config.SLocations = {
    [1] = {
        ["ped"] = "cs_manuel",
        ["coords"] = {  
            [1] = vector3(-1985.89, 245.43, 87.21),
            [2] = vector3(-1986.78, 246.43, 87.22),
            [3] = vector3(-1969.24, 246.98, 87.62),
            [4] = vector3(-1968.6, 247.61, 87.61),
            [5] = vector3(-1983.11, 260.67, 87.2),
        },
        ["vehicle"] = "huracanst",
        ["vehiclepos"] = { x = -1974.45, y = 260.93, z = 86.56, h = 287.17},
        ["weapon"] = "weapon_g19",
    },
    [2] = {
        ["ped"] = "cs_chengsr",
        ["coords"] = { 
            [1] = vector3(-1985.89, 245.43, 87.21),
            [2] = vector3(-1986.78, 246.43, 87.22),
            [3] = vector3(-1969.24, 246.98, 87.62),
            [4] = vector3(-1968.6, 247.61, 87.61),
            [5] = vector3(-1983.11, 260.67, 87.2),
        },
        ["vehicle"] = "lp670sv",
        ["vehiclepos"] = { x = -1974.45, y = 260.93, z = 86.56, h = 287.17},
        ["weapon"] = "weapon_assaultrifle",
    },
    [3] = {
        ["ped"] = "g_m_y_mexgoon_03",
        ["coords"] = { 
            [1] = vector3(-1784.7, 454.79, 128.31),
            [2] = vector3(-1788.5, 463.91, 128.31),
            [3] = vector3(-1805.22, 436.36, 128.83),
            [4] = vector3(-1811.57, 442.25, 128.51),
            [5] = vector3(-1801.55, 441.89, 128.51),
        },
        ["vehicle"] = "agerars",
        ["vehiclepos"] = { x = -1803.57, y = 457.15, z = 127.63, h = 54.03},
        ["weapon"] = "weapon_assaultrifle",
    },
    [4] = {
        ["ped"] = "cs_chengsr",
        ["coords"] = {
            [1] = vector3(-1784.7, 454.79, 128.31),
            [2] = vector3(-1788.5, 463.91, 128.31),
            [3] = vector3(-1805.22, 436.36, 128.83),
            [4] = vector3(-1811.57, 442.25, 128.51),
            [5] = vector3(-1801.55, 441.89, 128.51),
        },
        ["vehicle"] = "lp670sv",
        ["vehiclepos"] = { x = -1803.57, y = 457.15, z = 127.63, h = 54.03},
        ["weapon"] = "weapon_assaultrifle",
    },
    [5] = {
        ["ped"] = "g_m_y_mexgoon_03",
        ["coords"] = {
            [1] = vector3(-1784.7, 454.79, 128.31),
            [2] = vector3(-1788.5, 463.91, 128.31),
            [3] = vector3(-1805.22, 436.36, 128.83),
            [4] = vector3(-1811.57, 442.25, 128.51),
            [5] = vector3(-1801.55, 441.89, 128.51),
        },
        ["vehicle"] = "svj63",
        ["vehiclepos"] = { x = -1803.57, y = 457.15, z = 127.63, h = 54.03},
        ["weapon"] = "weapon_assaultrifle",
    },
}

Config.SPLocations = {
    [1] = {
        ["ped"] = "a_m_y_hasjew_01",
        ["coords"] = {
            [1] = vector3(-1535.63, 98.84, 56.78),
            [2] = vector3(-1536.69, 97.49, 56.78),
            [3] = vector3(-1539.95, 92.46, 57.61),
            [4] = vector3(-1539.05, 93.4, 56.97),
            [5] = vector3(-1491.48, 94.0, 55.0),
            [6] = vector3(-1494.86, 93.13, 55.07),
        },
        ["vehicle"] = "veneno",
        ["vehiclepos"] = { x = -1527.28, y = 83.01, z = 55.94, h = 275.96},
        ["weapon"] = "weapon_assaultrifle",
    },
    [2] = {
        ["ped"] = "a_m_m_soucent_02",
        ["coords"] = {  
            [1] = vector3(-1535.63, 98.84, 56.78),
            [2] = vector3(-1536.69, 97.49, 56.78),
            [3] = vector3(-1539.95, 92.46, 57.61),
            [4] = vector3(-1539.05, 93.4, 56.97),
            [5] = vector3(-1491.48, 94.0, 55.0),
            [6] = vector3(-1494.86, 93.13, 55.07),
        },
        ["vehicle"] = "lambose",
        ["vehiclepos"] = { x = -1527.28, y = 83.01, z = 55.94, h = 275.96},
        ["weapon"] = "weapon_assaultrifle",
    },
    [3] = {
        ["ped"] = "a_m_m_genfat_01",
        ["coords"] = { 
            [1] = vector3(-592.12, 761.69, 188.51),
            [2] = vector3(-596.41, 759.24, 188.51),
            [3] = vector3(-580.35, 732.76, 184.21),
            [4] = vector3(-579.09, 733.08, 184.21),
            [5] = vector3(-579.59, 766.94, 185.41),
            [6] = vector3(-579.59, 766.94, 185.41),
        },
        ["vehicle"] = "infinitig35",
        ["vehiclepos"] = { x = -1527.28, y = 83.01, z = 55.94, h = 275.96},
        ["weapon"] = "weapon_assaultrifle",
    },
    [4] = {
        ["ped"] = "g_m_y_mexgoon_03",
        ["coords"] = { 
            [1] = vector3(-1144.22, 387.88, 71.3),
            [2] = vector3(-1143.87, 386.65, 71.31),
            [3] = vector3(-1136.41, 376.96, 71.3),
            [4] = vector3(-1134.58, 376.36, 71.3),
            [5] = vector3(-1093.64, 358.11, 68.52),
            [6] = vector3(-1097.48, 359.51, 68.5),
        },
        ["vehicle"] = "huracanst",
        ["vehiclepos"] = { x = -1125.31, y = 380.64, z = 70.01, h = 41.36},
        ["weapon"] = "weapon_assaultrifle",
    },
    [5] = {
        ["ped"] = "cs_chengsr",
        ["coords"] = {
            [1] = vector3(-1144.22, 387.88, 71.3),
            [2] = vector3(-1143.87, 386.65, 71.31),
            [3] = vector3(-1136.41, 376.96, 71.3),
            [4] = vector3(-1134.58, 376.36, 71.3),
            [5] = vector3(-1093.64, 358.11, 68.52),
            [6] = vector3(-1097.48, 359.51, 68.5),
        },
        ["vehicle"] = "huracanst",
        ["vehiclepos"] = { x = -1125.31, y = 380.64, z = 70.01, h = 41.36},
        ["weapon"] = "weapon_assaultrifle",
    },
}