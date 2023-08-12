fx_version 'adamant'
game 'gta5'

author 'barbaroNNs Scripts'
description 'https://discord.barbaronn.shop/'
version 'final'

client_scripts {
    'locales/en.lua',
    
    'client/cconfig.lua',
    'client/cfuncs.lua',
    'client/cmain.lua'
}

server_scripts {
    'locales/en.lua',
    
    'server/sconfig.lua',
    'server/sfuncs.lua',
    'server/smain.lua'
}

ui_page 'nui/index.html'
files {
    'nui/**/*'
}

server_exports {
    'RegisterNewAction'
}