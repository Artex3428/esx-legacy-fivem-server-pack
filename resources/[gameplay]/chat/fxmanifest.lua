version '1.0.0'
author 'Cfx.re <root@cfx.re>, Edited by Artex'
description 'Provides baseline chat functionality using a NUI-based interface.'
repository 'https://github.com/citizenfx/cfx-server-data'

ui_page 'dist/ui.html'

client_script 'cl_chat.lua'
server_script 'sv_chat.lua'

files {
  'dist/ui.html',
  'dist/index.css',
}

fx_version 'adamant'
games { 'gta5' }