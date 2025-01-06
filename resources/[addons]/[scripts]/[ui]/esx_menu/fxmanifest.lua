-- Resource Metadata
fx_version 'cerulean'
games { 'gta5' }

author 'Artex'
description 'General esx context menu'
version '1.0.0'

shared_script '@es_extended/imports.lua'

-- What to run
client_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'config.lua',
    'client/client.lua',
    'client/functions.lua',
}
server_scripts {
    '@es_extended/locale.lua',
    'locales/*.lua',
    'config.lua',
    'server/server.lua',
}