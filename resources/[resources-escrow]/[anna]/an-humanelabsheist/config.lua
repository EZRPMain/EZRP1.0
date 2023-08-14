Config = Config or {}


Config.humane = {
    --------------------------------------------- COPS STUFF
    Cops = 0, -- How many cops you desire to be available
    --------------------------------------------- TIMER STUFF
    CoolDown = 3, -- The Cooldown server sided which the heist can't be done when the cooldown is on
    Progressbartime = 25, -- Progressbar time in seconds
    --------------------------------------------- SCRIPT STUFF
    Menu = 'qb-menu', -- menu script 
    fuelscript = 'ps-fuel', -- fuel script
    DoorId = 'humane', -- name of the door in your doorlock config
    DoorId2 = 'humane2', -- name of the door in your doorlock config
    DoorId3 = 'humane3', -- name of the door in your doorlock config
    DoorId4 = 'humane4', -- name of the door in your doorlock config
    --------------------------------------------- PAYOUT/REWARD STUFF
    Minpayout = 100000, -- Minimum payout
    Maxpayout = 200000, -- Maximum payout
    Lootitem = 'security_card_01', -- You put the item you want in the reward
    --------------------------------------------- MESSAGES STUFF
    startingmsg = "Get to the lab and try to get inside.", -- MSG
    Hackingmsg = "Now hack the keypad to open the doors", -- Msg
    Dnamsg = "Now make your way to the Dna sample quick !!", -- Msg
    Aimsg = "i will need you to get me that AI on the computer", -- Msg
    Runmsg = "Run to the elevator and then the sewers!", -- Msg
    ---------------------------------------------LABEL STUFF
    itemmissing = 'You do not have the right items here..',
    cooldownmsg = 'Comeback later when the heat has cooled down',
    notingroup = 'I cannot give you a job if you are not in a group...',
    notingroupleader = 'I cannot give you a job if you are not the group leader...',
    alreadystarted = 'Someone has already started it',
    nocopsmsg = 'Where are the cops ?',
    missingitemsdelivery = 'Something is missing..',
    missinghelicopter = 'Where is my helicopter?',
    Cancelprogress = 'Canelled..',
    startpedlabel= 'Talk to Barry',
    keypadhackmsglabel= 'Hack the keypad',
    firstdoorthermitelabel = 'Force the door open!',
    seconddoorlabel = 'Force the door open!',
    seconddoorprogress = 'Forcing the door..',
    dnamessagelabel = 'Get the dna sample',
    dnaprogressbar= 'Getting the Dna sample..',
    aimessagelabel= 'Extract the AI',
    aiprogressbar= 'Extracting the AI..',
    delivermsglabel= 'Talk to Garry',
    deliverprogress = 'Handing over the goodies',
    elevatoraccess = 'Now you can access the elevator since the AI has been disabled!',
    failed = 'git gud scrub',
    elevator = 'Elevator',
    elevatorprogress = 'Waiting for the Elevator...',
    divingsuiton = 'Put on a diving suit',
    divingsuitoff = 'Pull out a diving suit ..',
    divingsuithelp = '/divinggear to take off your one time use suit',
    notdivingsuit = 'You are not wearing a diving gear ..',
    ---------------------------------------------ITEM STUFF
    Blowtorch = 'blowtorch', --Blowtorch
    Divingitem = 'diving_tank', -- The diving gear
    Forceitem = 'thermite', -- thermite
    Hackingdevice = 'hacking_device',  -- The hacking device needed to hack the keypad
    Dnaitem = 'dna_sample', -- the dna sample
    Aiitem = 'ai_usb', -- the USB AI 
    ---------------------------------------------VEHICLE STUFF
    Cars = { `fbi2`, `fbi`, `police4` , `mesa3`}, -- parked cars
    Helicoptermodel = 'frogger', -- The helicopter's model hash
    Helicopterpos = vector4(3851.86, 3632.19, 7.02, 140.66), --The helicopter's position
    ----------------------------------------------PED STUFF
    Weapon = { `WEAPON_SMG`, `WEAPON_PISTOL`, `WEAPON_PUMPSHOTGUN`, `WEAPON_ASSAULTRIFLE` }, -- the weapons that the peds use 
    Attackped = { `s_m_m_armoured_02` , `s_m_y_blackops_02`, `s_m_m_fibsec_01` }, -- Attack peds models
    Scientistped = `s_m_m_scientist_01`,
    pedarmor = 0, -- the attacking peds armor (0-100)
    pedhealth = 100, -- the attacking peds health (1-200)
    pedaccuracy = 50, -- the attacking peds accuracy (0-100)
    PedHash = `cs_barry`, -- start Ped model
    PedPos = vector4(-2148.7, 229.18, 184.6, 267.11), -- initiation ped location
    Peddeliverpos = vector4(-1819.01, -2805.0, 13.94, 148.25), -- the last ped where you deliver the goodies
    Attack = { -- Locations the attack peds spawn
        [1] = {
            cars = {
                vector4(3638.14, 3754.39, 28.52, 122.1),
                vector4(3629.89, 3756.83, 28.52, 24.59),
                vector4(3611.58, 3741.72, 28.69, 288.56),
                vector4(3619.44, 3735.13, 28.69, 329.59),
            },
          firstambush = { 
             vector4(3623.62, 3726.25, 28.69, 5.52),
              vector4(3605.3, 3735.68, 28.69, 301.79),
              vector4(3608.06, 3745.59, 28.69, 292.46), 
              vector4(3625.43, 3731.18, 28.69, 27.22),
              vector4(3608.96, 3721.02, 29.69, 316.85),
              vector4(3602.19, 3707.81, 29.69, 324.0),
              vector4(3598.73, 3713.31, 29.69, 173.35),
          },
          secondambush = {
            vector4(3593.39, 3719.66, 29.69, 332.39),
            vector4(3596.13, 3717.37, 29.69, 38.54),
            vector4(3589.4, 3706.79, 29.64, 329.97),
            vector4(3593.44, 3705.79, 29.69, 347.26),
            vector4(3590.15, 3693.71, 28.82, 44.53),
            vector4(3596.26, 3694.92, 28.82, 130.32),
            vector4(3598.36, 3690.19, 28.82, 64.65),
          },
          thirdambush = {
            vector4(3595.23, 3683.51, 27.62, 355.33),
            vector4(3588.13, 3682.71, 27.62, 297.53),
            vector4(3587.25, 3688.11, 27.62, 235.11),
            vector4(3578.5, 3691.28, 27.12, 251.25),
            vector4(3567.26, 3700.48, 28.12, 224.24),
            vector4(3561.03, 3695.22, 30.12, 257.77),
          },
        fourthambush = {
            vector4(3552.63, 3656.04, 28.12, 38.57),
            vector4(3544.98, 3645.2, 28.12, 311.72),
            vector4(3546.19, 3641.35, 28.12, 57.53),
            vector4(3539.58, 3643.81, 28.12, 291.08),
            vector4(3531.93, 3648.54, 27.52, 255.68),
            vector4(3529.44, 3657.51, 27.74, 195.4),
            vector4(3535.7, 3660.03, 28.12, 38.52),
            vector4(3540.39, 3662.38, 28.12, 32.23),
            vector4(3542.13, 3670.95, 28.12, 85.49),
            vector4(3541.06, 3676.41, 28.12, 164.94),
            vector4(3526.91, 3673.77, 28.12, 241.92),
            vector4(3535.97, 3672.66, 28.12, 120.11),
          },
        fifrthambush = {
          vector4(3522.45, 3674.26, 20.99, 258.29),
          vector4(3521.59, 3679.37, 20.99, 193.51),
          vector4(3523.12, 3687.12, 20.99, 173.4),
          vector4(3527.92, 3698.18, 20.99, 159.77),
          vector4(3523.74, 3711.22, 20.99, 183.04),
        },
        }
      }
}

