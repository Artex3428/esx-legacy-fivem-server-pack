resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

shared_script '@es_extended/imports.lua'

client_scripts {
    "main.lua"
}
server_script "server.lua"

ui_page 'index.html'

files {
    'index.html',
    'img.jpg'
}