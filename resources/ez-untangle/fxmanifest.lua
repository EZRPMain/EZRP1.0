
fx_version "cerulean"

games { "gta5" }

version "2.1.0"

ui_page 'nui/index.html'

files {
    'nui/**/*',
}

server_scripts {
    "server/sv_*.js",
}

client_scripts {
    "client/cl_*.js",
}