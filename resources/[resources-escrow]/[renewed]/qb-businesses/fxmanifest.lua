fx_version 'cerulean'
game 'gta5'


author "FjamZoo#0001, uShifty#1733"
description 'Advanced QBCore restaurant script all in 1 made by FjamZoo#0001'
version '1.2.0'

lua54 'yes'

shared_script {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'shared/config.lua',
    'shared/chairs.lua',
    'shared/stashes.lua',
    'shared/menus.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/cl_targets.lua',
    'client/cl_menu.lua',
    'client/cl_DuiZones.lua',
    'client/cl_buffs.lua',
    'client/cl_custom.lua',
    'client/cl_djbooths.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_menu.lua',
    'server/sv_values.lua',
    'server/sv_dui.lua',
    'server/sv_foodbuffs.lua',
    'server/sv_djbooths.lua',
}

escrow_ignore {
    'shared/*.lua',
    'locales/*.lua',
    'client/*.lua',
    'server/*.lua',
    'assets/*.*'
}
dependency '/assetpacks'