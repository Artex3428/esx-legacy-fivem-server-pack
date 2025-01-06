fx_version 'cerulean'

game 'gta5'

author "Pa1nlessz#2021"

description "A simple starterpack for esx"

shared_script '@es_extended/imports.lua'

client_scripts {
  'Client/Modules/*.lua',
  'Client/*.lua',

}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'Server/Modules/Functions.lua',
  'Server/*.lua',
}

shared_scripts {
  'Config.lua'
}

