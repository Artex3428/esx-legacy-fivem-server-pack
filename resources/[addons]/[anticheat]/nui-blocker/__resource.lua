resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

fx_version 'bodacious'
game 'gta5'


client_script "client/main.lua"
server_script {
	"server/server.lua"
}

ui_page 'client/index.html'

files {
	'client/index.html'
}