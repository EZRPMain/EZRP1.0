fx_version 'cerulean'
game 'gta5'

author 'Project Sloth'
description 'Repository for gathering core functionality for Project Sloth resources and utility functions'
version '1.0.0'
repository 'Project-Sloth/ps-core'

shared_script 'shared/config.lua'

-- Need to call them in a specific order since some can depend on another
client_scripts {'lua/client/main.lua', 'events.lua', 'lua/client/functions.lua', 'lua/client/models.lua'}
server_scripts {'lua/server/main.lua', 'lua/server/print.lua', 'lua/server/resource.lua', 'lua/server/functions.lua'}
