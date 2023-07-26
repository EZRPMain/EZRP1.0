fx_version 'cerulean'
game 'gta5'

shared_script 'shared/sh_*.lua'
client_script 'client/cl_*.lua'
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_*.lua'
}

lua54 'yes'
