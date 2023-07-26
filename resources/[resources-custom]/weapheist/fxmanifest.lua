fx_version 'cerulean'

game 'gta5'
lua54 'yes'

shared_scripts {
    'shared/sh_*.lua',
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
    'server/sv_*.lua',
}