# An-craftcars
- A Qbcore script that makes you craft cars and own them

# Tebex:
- https://annalouscripts.tebex.io/

# Discord:
- https://discord.gg/8eHVNtJK23

# Feats
- Craft cars and own them.
- Very simple and configurable

# Video
- https://youtu.be/AVnK7p3On3E

# Install
- Drag an-craftcars to your resource folder.
- Add the items provided.
- Thats it

# dependency 
- QBcore
- qb-target
- qb / gks / qs phones
- cdn-fuel/ps-fuel/LegacyFuel (change it in the config)

# items 
Add these items to your Shared/items.lua

["leftdoor"] 					 	 	 = {["name"] = "leftdoor",  	    						["label"] = "leftdoor",	 				["weight"] = 250, 		["type"] = "item", 		["image"] = "", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   	 ["description"] = "A brand new left car door", },
["rightdoor"] 					 	 	 = {["name"] = "rightdoor",  	    						["label"] = "rightdoor",	 				["weight"] = 250, 		["type"] = "item", 		["image"] = "", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   	 ["description"] = "A brand new right car door", },
["tyres"] 					 	 	 = {["name"] = "tyres",  	    						["label"] = "tyres",	 				["weight"] = 250, 		["type"] = "item", 		["image"] = "", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   	 ["description"] = "A brand new tyre", },
["trunk"] 					 	 	 = {["name"] = "trunk",  	    						["label"] = "trunk",	 				["weight"] = 250, 		["type"] = "item", 		["image"] = "", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   	 ["description"] = "A brand new trunk lid", },
["hood"] 					 	 	 = {["name"] = "hood",  	    						["label"] = "hood",	 				["weight"] = 250, 		["type"] = "item", 		["image"] = "", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   	 ["description"] = "A brand new hood", },
["engine"] 					 	 	 = {["name"] = "engine",  	    						["label"] = "engine",	 				["weight"] = 250, 		["type"] = "item", 		["image"] = "", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   	 ["description"] = "A brand new engine", },
["vehicleseats"] 					 	 	 = {["name"] = "vehicleseats",  	    						["label"] = "vehicle seats",	 				["weight"] = 250, 		["type"] = "item", 		["image"] = "", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = false,   	["combinable"] = nil,   	 ["description"] = "brand new car seats", },

# Known issues: 

Some qb-target can't interact with the vehicle, that its due to qb-target not including all the bones target.
To fix this, navigate to your [Qb-target/data/Bones.lua]

You gonna see something similar to this: 
# local Bones = {Options = {}, Vehicle = {'chassis', 'spoiler', 'bumper_r', 'windscreen_r', 'windscreen' , 'seat_pside_r', 'seat_dside_r', 'bodyshell', 'suspension_lm', 'suspension_lr', 'platelight', 'attach_female', 'attach_male', 'bonnet', 'boot', 'chassis_dummy', 'chassis_Control', 'door_dside_f', 'door_dside_r', 'door_pside_f', 'door_pside_r', 'Gun_GripR', 'windscreen_f', 'platelight', 'VFX_Emitter', 'window_lf', 'window_lr', 'window_rf', 'window_rr', 'engine', 'gun_ammo', 'ROPE_ATTATCH', 'wheel_lf', 'wheel_lr', 'wheel_rf', 'wheel_rr', 'exhaust', 'overheat', 'seat_dside_f', 'seat_pside_f', 'Gun_Nuzzle', 'seat_r'}}

Search for these terms, if not found add them like they were shown above.
- 'spoiler',
- 'bumper_r',
- 'windscreen_r',
- 'seat_dside_f',
- 'seat_dside_f',
- 'seat_dside_f',
- 'seat_dside_f',
- 'exhaust',
- 'bumper_f',
- 'carriage',