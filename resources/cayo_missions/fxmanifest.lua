fx_version "bodacious"
game "gta5"

author 'ezrp'
description 'cayo shitzngigz'

shared_script 'shared/sh_*.lua'
client_script 'client/cl_*.lua'
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/sv_*.lua'
}

dependency 'qb-target'


-- TO DO



-- COMPLETED
-- - quests system (maybe add rep)
-- - vehicle rental