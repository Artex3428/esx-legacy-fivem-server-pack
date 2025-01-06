resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description "Jail Script With Working Job"

shared_scripts {
	'@es_extended/imports.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	"config.lua",
	"server/server.lua"
}

client_scripts {
	"config.lua",
	"client/utils.lua",
	"client/client.lua"
}