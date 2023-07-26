fx_version 'bodacious'

game 'gta5'
lua54 'yes'
author 'AnnaLou#1509'
github 'https://github.com/Annalouu'
Tebex 'https://annalouscripts.tebex.io/'
description 'Humane Labs heist by AnnaLou#1509'

version '1.0.0'

server_scripts {
    "server.lua",
}
client_scripts {
        '@PolyZone/client.lua',
        '@PolyZone/BoxZone.lua',
        '@PolyZone/EntityZone.lua',
        '@PolyZone/CircleZone.lua',
        '@PolyZone/ComboZone.lua',
        "client.lua",
}

shared_scripts {
	"config.lua"
}

escrow_ignore {
    "config.lua"
}

dependencies {
	'ps-ui',
}