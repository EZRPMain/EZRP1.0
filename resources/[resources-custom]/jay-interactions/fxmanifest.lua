fx_version 'adamant'
game 'gta5'
lua54 'yes'

shared_scripts {
    'config.lua'
 
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/cl_*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    
    'server/sv_*.lua',
}