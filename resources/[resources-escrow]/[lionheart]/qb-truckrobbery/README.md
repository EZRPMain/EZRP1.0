Made by Lionh34rt#4305
Discord: https://discord.gg/AWyTUEnGeN
Tebex: https://lionh34rt.tebex.io/

# Description
* **Two in one truckrobbery! Players have two options to rob a Gruppe6 security truck.**
* **1) using a black security card**
* **2) using thermite.**
* **The banktrucks reward players with cashrolls, inked money and security cards that are used for bank robberies**

# Dependencies
* [QBCore Framework](https://github.com/qbcore-framework)
* [qb-target by BerkieBb](https://github.com/BerkieBb/qb-target)
* [Memorygame by pushkart2](https://github.com/pushkart2/memorygame)

# Installation
* **Add the items to your shared.lua**
* **Add the stockade to your popgroups or use the one included if you want them part of regular trafic**

# Items for shared.lua
```lua
['security_card_01'] 			 = {['name'] = 'security_card_01', 			  	['label'] = 'Security Card A', 			['weight'] = 0, 		['type'] = 'item', 		['image'] = 'security_card_01.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A green security card'},
['security_card_02'] 			 = {['name'] = 'security_card_02', 			  	['label'] = 'Security Card B', 			['weight'] = 0, 		['type'] = 'item', 		['image'] = 'security_card_02.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A gold security card'},
['security_card_03'] 			 = {['name'] = 'security_card_03', 			  	['label'] = 'Purple Security Card', 	['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'security_card_03.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A purple security card.'},
['security_card_04'] 			 = {['name'] = 'security_card_04', 			  	['label'] = 'Black Security Card', 		['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'security_card_04.png', 	['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'A black security card.'},
["cash_roll"] 			 		 = {["name"] = "cash_roll", 					["label"] = "Roll with money", 			["weight"] = 0, 		["type"] = "item", 		["image"] = "cash_roll.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Roll with banknotes"},
```

# LOGGING: ADD FOLLOWING ENTRY TO YOUR QB-LOGS/CONFIG:
['truckrobbery'] = {webhook},
