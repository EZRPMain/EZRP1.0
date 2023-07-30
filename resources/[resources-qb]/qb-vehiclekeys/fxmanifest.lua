fx_version 'cerulean'
game 'gta5'
description 'QB-VehicleKeys'
version '1.2.5'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/*.lua',
    'config.lua',
}

client_script 'client/main.lua'
server_script 'server/main.lua'

lua54 'yes'
