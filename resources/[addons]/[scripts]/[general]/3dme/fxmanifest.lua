fx_version 'adamant'
game 'gta5'

shared_script '@es_extended/imports.lua'

client_scripts {'client/*.lua'}
shared_script 'config.lua'
server_scripts {'server/*.lua', '@oxmysql/lib/MySQL.lua'}