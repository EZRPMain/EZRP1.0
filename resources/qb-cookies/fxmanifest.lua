

fx_version 'cerulean'
game 'gta5'

ui_page {'html/index.html'}

shared_script 'config.lua'
client_script'client/cl_*.lua'
server_script 'server/sv_*.lua'

exports {
'GetActiveRegister',
}

files {
 'html/index.html',
 'html/css/style.css',
 'html/js/script.js',
}