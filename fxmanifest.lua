fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Realistic Scripts'
name 'RS AI Controller'
description 'AI controller that adjusts or removes ambient traffic and pedestrians in FiveM.'
version 'v1.0.0'
repository 'https://github.com/RealisticScripts/rs-ai-controller'
license 'MIT'

shared_scripts {
    'config.lua'
}

server_script {
    'server.lua'
}

client_script {
    'client.lua'
}
