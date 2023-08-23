fx_version 'cerulean'
game 'gta5'
name 'hyon_owned_safes'
version      '1.0.0'
description 'Player Owned Safes'

dependencies {
	'ox_lib',
}

shared_script {
	'@ox_lib/init.lua',
	'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}

lua54 'yes'

