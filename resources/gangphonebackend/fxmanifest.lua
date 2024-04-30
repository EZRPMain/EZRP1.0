fx_version 'cerulean'

games {"gta5", "rdr3"}

author "Project Error"
version '1.0.0'

lua54 'yes'

ui_page 'web/build/index.html'

client_script "src/client/**/*"
server_scripts {
  "@oxmysql/lib/MySQL.lua",
  "src/server/**/*"
}

files {
  'web/build/index.html',
  'web/build/**/*'
}
