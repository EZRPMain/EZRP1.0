fx_version 'cerulean'
game 'gta5'

author 'EZRP Development'
description 'Storage'
version '1.0.0'

shared_script 'config.lua'

client_scripts {
    'client/cl_*.lua',
}
server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server/sv_*.lua'
}

lua54 'yes'
