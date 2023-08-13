fx_version 'cerulean'
game 'gta5'
author 'Aiakos#8317'
description 'Codem-Report V2'
ui_page {
	'html/index.html',
}
files {
	'html/*.css',
	'html/*.js',
	'html/*.html',
	'html/fonts/*.otf',
	'html/image/test/*.png',
	'html/image/*.png',
}

shared_script{
	'config.lua',
}



escrow_ignore {
	'config.lua',
	'GetFrameworkObject.lua',
	'reportdiscord.lua',
	
}

client_scripts {
	'GetFrameworkObject.lua',
	'client/*.lua',
}
server_scripts {
	'@oxmysql/lib/MySQL.lua',  -- MYSQL ASYNC
	-- '@mysql-async/lib/MySQL.lua',  -- MYSQL ASYNC
	'server/*.lua',
	'GetFrameworkObject.lua',
}

lua54 'yes'
dependency '/assetpacks'