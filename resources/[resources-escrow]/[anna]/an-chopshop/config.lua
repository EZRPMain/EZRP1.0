Config = {}

Config.Chop = {
    Phone = 'qb',  -- qb / gks / qs
    CoolDown = 2, -- after scrapping the car how much time you need to wait for a new contract in minutes
    DrawText = 'qb-core', -- Define the export resource accordingly | qb-core, qb-drawtext, ps-ui
    fuelscript = 'LegacyFuel', -- cdn/ps-fuel / LegacyFuel
    blip = true, -- true/false if you want the blip to be visible.
    waitTime = 15000, -- progress bar time
    ----------------------------
    pedpos = vector4(502.28, -1340.74, 29.31, 16.2), -- the ped pos
    carchoppos = vector3(500.11,-1335.18,29.33), -- the chopshop pos
    posheading = 225.32, -- car heading 
    deliverpos = vector3(495.83, -1340.81,29.33), -- where you deliver the materials 
    ---------------------------- change according to your language.
    getcontract = "Get a contract", -- target npc
    initialmessage = 'Alright, write it down. The plate is: ',
    startchopping = 'Press E to start chopping',
    novehicle = 'Vehicle is required!',
    notrightvehicle= "This is not the right vehicle..",
    deliverpart = 'Deliver Part',
    deliveringmsg = 'Delivering the package',
    delivered = 'Part Successfully delivered',
    driverdoor = 'Remove Driver Door',
    driverdoorprogressbar = 'Dismantling the driver door...',
    passengerdoor= 'Remove Passenger Door',
    passengerdoorprogressbar = 'Dismantling the passanger door..',
    reardriverdoor= 'Remove Rear Driver Door',
    reardriverdoorprogressbar = 'Dismantling the rear driver door..',
    rearpassengerdoor= 'Remove Rear Passenger Door',
    rearpassengerdoorprogressbar = 'Dismantling the rear passanger door..',
    hood= 'Remove Hood',
    hoodprogressbar = 'Removing the Hood..',
    trunk= 'Remove Trunk',
    trunkprogressbar = 'Removing the trunk lid..',
    radio= 'Remove Radio',
    radioprogressbar = 'Disconnecting the radio..',
    chop= 'Chop Entire Vehicle',
    chopprogresbbar = 'Chopping the whole vehicle..',
    cooldownmessage= 'There is currently a cooldown for you, You must wait longer before doing this again.',
    cooldownended= 'You can go get a car to Chop',
    Doorsuccessful = 'Door removed',
    hoodremoved = 'Hood removed',
    trunkremoved = 'Trunk removed',
    radioremoved = 'Radio removed',
    carchopped = 'Sucessfully Chopped The Vehicle',
    cancelled = 'Cancelled',
    ----------------------------
    Vehicles = { --- 4 seat cars
        'asterope',
        'fugitive',
        'intruder',
        'washington',
        'tailgater',
        'patriot',
        'cavalcade2',
        'superd',
    },
    items = { -- materials you are getting.
        'plastic',
        'metalscrap',
        'copper',
        'aluminum',
        'iron',
        'steel',
        'rubber',
        'glass',
        'electronics',
    },
    itemsamount = math.random(1,20), -- amount of materials your getting from 1 to 20
    specialitems = { -- special materials you are getting.(separate amount)
            'diamond',
            'gold',
    },
    chancespecialitems = 50, -- %
    itemsamountspecial = math.random(1,4), -- amount of special materials your getting from 1 to 4
    payout = math.random(50,100), -- payout from 50$ to 100$
    Spawns = { 
        chopcars = { --- the positions where the cars spawn
                vector4(907.12, -1731.56, 30.58, 171.11), 
                vector4(920.0, -1579.84, 30.52, 50.16), 
                vector4(315.78, -206.38, 54.09, 67.64), 
                vector4(-943.33, 307.76, 71.17, 7.44), 
                vector4(-1667.91, 62.79, 63.4, 289.38), 
                vector4(-615.99, 330.76, 85.12, 171.04), 
                vector4(-1136.8, -757.76, 19.03, 286.33), 
        }
    }
}







