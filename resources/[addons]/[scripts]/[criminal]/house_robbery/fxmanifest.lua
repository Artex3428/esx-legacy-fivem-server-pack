fx_version 'cerulean'
games { 'gta5' }
author 'Fly Development'
lua54 'yes'

shared_script '@es_extended/imports.lua'

server_scripts {
     'server.lua',
     'config.lua'
} 
client_scripts {
     'client.lua',
     'config.lua'
}

shared_scripts {
    '@ox_lib/init.lua'
}
