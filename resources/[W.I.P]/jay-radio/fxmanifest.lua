fx_version 'cerulean'
game 'gta5'

description 'jay-radio'
version '1.2.1'

shared_script 'config.lua'

client_script 'client/cl_*.lua'
server_script 'server/sv_*.lua'

ui_page('html/ui.html')

files {
  'html/ui.html',
  'html/js/script.js',
  'html/css/style.css',
  'html/img/radio.png'
}

lua54 'yes'
