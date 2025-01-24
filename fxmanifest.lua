fx_version 'bodacious'
game 'gta5'

shared_script '@vrp/lib/lib.lua'

client_scripts {
    '@vrp/lib/utils.lua',
    'skdev_config/*.lua',
    'skdev_client/*.lua'
}

server_scripts {
    '@vrp/lib/utils.lua',
    'skdev_config/*.lua',
    'skdev_server/*.lua'
}

ui_page 'nui/index.html'
files {
    '**/*.html',
    '**/**/**/*.css',
    '**/**/**/*.js',
    '**/**/**/*.png',
    '**/**/**/*.gif',
    '**/**/**/*.jpg',
    '**/**/**/*',
    '**/**/**/*.ttf',
}