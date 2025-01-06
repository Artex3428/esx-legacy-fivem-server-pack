fx_version 'cerulean'
game 'gta5'
author 'ogidevs'
version '0.0.2'
description 'Car audio system for QBCore/QBox/ESX'

client_scripts {
	"locales/main.lua",
	"client.lua",
}

server_scripts {
	"locales/main.lua",
	"server.lua",
	"vercheck.lua",
}

shared_scripts {
    "@ox_lib/init.lua",
	"config.lua",
    'locales/main.lua',
}

dependencies {
	'xsound',
	'ox_lib'
}

lua54 "yes"

-- THIS IS IMPORTANT, DO NOT REMOVE IT if you want to use the youtube feature as well as change volume of the radio
-- based on the url below, we know on which radio to open the options menu
supersede_radio "RADIO_08_MEXICAN" { url = "options", name = "Options" }
-- THIS IS IMPORTANT, DO NOT REMOVE IT if you want to use the youtube feature as well as change volume of the radio
