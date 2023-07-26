
fx_version 'adamant'

game 'gta5'

shared_script 'config.lua'


client_scripts{
    'client/cl_*.lua',
}

server_scripts{
    -- '@oxmysql/lib/MySQL.lua',
    'server/sv_*.lua',
}
