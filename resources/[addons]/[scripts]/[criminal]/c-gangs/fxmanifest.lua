fx_version "cerulean"
game "gta5"

name "c-gangs"
description "A simple gang script"
author "Carlooss"
version "1"

lua54 'yes'

shared_script {
	'@ox_lib/init.lua',
	'@es_extended/imports.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	"Config.lua",
	"Client/*.lua",
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    '@es_extended/locale.lua',
	"Config.lua",
	"Server/*.lua",
}

dependency {
	'illenium-appearance',
	'ox_lib',
	'ox_inventory',
}
