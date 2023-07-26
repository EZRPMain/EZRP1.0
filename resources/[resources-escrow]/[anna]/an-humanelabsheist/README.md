# An-humanelabsheist
- A Qbcore heist involving the humane labs and the group system


# Feats
- Custom heist made from the ground up
- Uses qb-phone group system to have fun with your friends
- Very fun and challenging

# Video
- https://www.youtube.com/watch?v=_XMLDA5r7uk

# Install
- Drag an-humanelabsheist to your resource folder.
- Drag the images in the image folder to your inventory images.
- Add whatever item you want to your item.lua and add them to your config as you see fit.

# dependency 
- QBcore
- qb-target
- qb-phone (renewed)
- qb-doorlock
- ps-ui (for the minigame)
- cdn-fuel/ps-fuel/cdn-fuel (change it in the config)

# Put these in the qb-doorlock/config.lua

Config.DoorList['humane'] = {
	doors = {
		{objHash = -1081024910, objHeading = 148.2, objCoords = vector3(3620.89, 3751.39, 28.69)},
		{objHash = -1081024910, objHeading = 148.2, objCoords = vector3(3627.34, 3746.91, 28.69)}
	},
	slides = true,
	lockpick = false,
	locked = true,
	garage = true,
	maxDistance = 1.0,
	fixText = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
}

Config.DoorList['humane2'] = {
	doors = {
		{objHash = 161378502, objHeading = 148.2, objCoords = vector3(3554.86, 3664.89, 28.12)},
		{objHash = -1572101598, objHeading = 148.2, objCoords = vector3(3553.4, 3665.27, 28.12)}
	},
	slides = true,
	lockpick = false,
	locked = true,
	garage = false,
	maxDistance = 1.0,
	fixText = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
}

Config.DoorList['humane3'] = {
	doors = {
		{objHash = -421709054, objHeading = 329.88, objCoords = vector3(3600.35, 3719.06, 29.69)},
		{objHash = 1282049587, objHeading = 329.88, objCoords = vector3(3601.59, 3718.15, 29.69)}
	},
	slides = false,
	lockpick = false,
	locked = true,
	garage = false,
	maxDistance = 1.0,
	fixText = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
}

Config.DoorList['humane4'] = {
	doors = {
		{objHash = -421709054, objHeading = 329.88, objCoords = vector3(3596.85, 3690.22, 28.82)},
		{objHash = 1282049587, objHeading = 329.88, objCoords = vector3(3598.12, 3689.3, 28.82)}
	},
	slides = false,
	lockpick = false,
	locked = true,
	garage = false,
	maxDistance = 1.0,
	fixText = false,
	audioRemote = false,
	authorizedJobs = { ['police']=0 },
}

# Items to add in your qb-core/shared/items.lua 

['hacking_device']			  = {['name'] = "hacking_device",					['label'] = "Hacking device",			['weight'] = 500,		['type'] = 'item', 		['image'] = 'hacking_device.png',			['unique'] = true,		['useable']	= true,		['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "A multi purpose hacking device"},
['dna_sample']			  = {['name'] = "dna_sample",					['label'] = "dna_sample",			['weight'] = 500,		['type'] = 'item', 		['image'] = 'dna_sample.png',			['unique'] = true,		['useable']	= true,		['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = "A Dna sample from Humane labs facility"},
['diving_tank'] 			     = {['name'] = 'diving_tank', 					['label'] = 'diving_tank', 				['weight'] = 10000, 	['type'] = 'item', 		['image'] = 'diving_gear.png', 			['unique'] = true, 	    ['useable'] = true, 	['shouldClose'] = true,    ['combinable'] = nil,   ['description'] = 'An oxygen tank and a rebreather'},
['ai_usb'] 				 	 = {['name'] = 'ai_usb', 			  	  	['label'] = 'AI USB', 				['weight'] = 0, 		['type'] = 'item', 		['image'] = 'ai_usb.png', 			['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'AI software from Humane labs facility'},
['thermite']                    = {['name'] = 'thermite',                       ['label'] = 'Thermite',                 ['weight'] = 1000,      ['type'] = 'item',      ['image'] = 'thermite.png',             ['unique'] = false,     ['useable'] = true,     ['shouldClose'] = true,    	['combinable'] = nil,   	 ['description'] = 'Sometimes you\'d wish for everything to burn'},




