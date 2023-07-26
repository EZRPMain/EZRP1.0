Config = {}

Config.build = {
    Phone = 'qb',  -- qb / gks / qs
    CoolDown = 2, -- Server side cooldown
    fuelscript = 'ps-fuel', -- cdn/ps-fuel / LegacyFuel
    waitTime = 15000, -- progress bar time
    ----------------------------Ped stuff
    pedhash = `mp_m_waremech_01`, --ped hash
    ----------------------------Messages for translation
    initialmessage = 'Alright, write it down. The plate is: ',
    notabletouseitem = 'You cant do that',
    vehiclefinished = 'Now that you finished building the car, bring it to me so i can give u the papperwork',
    notenoughtires = 'You dont have enough tyres',
    papperworkprogressbar = 'Getting the pappers...',
    hoodprogressbar = 'Installing the hood..',
    engineprogressbar = 'Installing the engine..',
    leftdoorprogressbar = 'Installing the left doors..',
    rightdoorprogressbar = 'Installing the right doors..',
    seatprogressbar = 'Installing the vehicle seats..',
    trunkprogressbar = 'Installing the trunk lid..',
    wheelsprogressbar = 'Installing the wheels...',
    Cooldownmsg = 'Comeback later when the heat has cooled down',
    installseatfirstmsg = 'You need to install the seats first',
    vehiclesuccess = 'The car now belongs to you !',
    ----------------------------Labels for translation
    getcontract = 'get contract',
    ownthecar = 'own the car',
    installdoor = 'Install the door',
    installseat = 'Install the seats',
    installtrunk = 'Instal the trunk lid',
    installengine = 'Install the engine',
    installhood = 'Install the hood',
    installwheels = 'Install the Wheel',
    ----------------------------Spawn stuff
    Spawns = { 
        buildcars = { --- Add spawn locations here 
                vector4(2184.7, 3323.99, 45.95, 172.42),
                vector4(2417.44, 3145.59, 48.25, 147.88),
                vector4(2416.41, 3746.89, 41.78, 10.16),
                vector4(1729.96, 4773.84, 41.83, 179.78),
        },
        pedpos = { --- Add ped spawn locations here to be random spawns for the ped
                vector4(1722.3, 3283.93, 41.06, 232.29),
                vector4(733.98, -1311.27, 26.87, 104.86),
                vector4(552.76, -170.52, 54.48, 277.46)
        }
    },
    Vehicles = { --- Add cars here (make sure the models are in your shared/vehicle.lua)
        'superd',
        'sultanrs',
        'patriot',
       'fugitive',
    },
}
