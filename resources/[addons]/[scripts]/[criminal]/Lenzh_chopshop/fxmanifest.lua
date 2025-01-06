-- compatibility wrapper
fx_version 'adamant'
game 'gta5'

description 'Lenzh Chop Shop'
author 'Lenzh'
version 'v2'

shared_script '@es_extended/imports.lua'

server_scripts {
	'@es_extended/locale.lua',
	'@oxmysql/lib/MySQL.lua',
	'locales/*',
	'config.lua',
	'server/*',
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/*',
	'config.lua',
	'client/*',
}
