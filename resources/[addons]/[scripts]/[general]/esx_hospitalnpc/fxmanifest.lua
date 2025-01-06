fx_version 'adamant'

game 'gta5'

shared_script '@es_extended/imports.lua'

client_scripts {
	'client/*.lua'
}

server_scripts { 
	'@oxmysql/lib/MySQL.lua',
	'server/sv_main.lua',
	'server/sv_utils.lua',
}

shared_script {
	'config.lua'
}