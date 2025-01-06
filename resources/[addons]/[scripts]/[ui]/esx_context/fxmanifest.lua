fx_version 'bodacious'

game 'gta5'
author 'ESX-Framework & Brayden'
description 'A simplistic context menu for ESX.'
lua54 'yes'
version '1.10.10'

ui_page 'html/index.html'

shared_script '@es_extended/imports.lua'

client_scripts {
    'config.lua',
    'client/client.lua',
}

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
}

dependencies {
    'es_extended'
}
