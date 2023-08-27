fx_version 'cerulean'
game 'gta5'

version '1.0.0'

shared_script 'config.lua'

client_scripts {
	"client/decors.lua",
	"client/functions.lua",
	"client/main.lua"
}

server_scripts {
	"@oxmysql/lib/MySQL.lua",
	"server/main.lua"
}