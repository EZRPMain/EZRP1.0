fx_version 'adamant'
game 'gta5'

lua54 'yes'

author "Project Sloth"
description "place or find treasure boxes"
version '1.0.0'


shared_scripts {
    'config.lua'
}

client_scripts {
    -- need to add polyzone
    'client/cl_*.lua',
}

server_scripts {
    -- i forgot but there was something else i wanted to add here
    '@oxmysql/lib/MySQL.lua',
    'server/sv_*.lua',
}