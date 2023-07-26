fx_version 'bodacious'

game 'gta5'
lua54 'yes'
author 'AnnaLou#1509'
github 'https://github.com/Annalouu'
Tebex 'https://annalouscripts.tebex.io/'
description 'an-craftcars by AnnaLou#1509'

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'client.lua',
} 

shared_scripts {
	'config.lua',
}

server_scripts {
	'server.lua',
	'@oxmysql/lib/MySQL.lua'
} 

escrow_ignore {
	"config.lua"
}

dependency '/assetpacks'