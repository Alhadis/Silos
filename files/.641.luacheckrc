files['.luacheckrc'].global = false
std = 'max+busted'
max_line_length = false

globals = {
    'love',
    'getVersion',
    'getTitle'
}

global = false

exclude_files = {
    './lua_install/*'
}

ignore = {
    '/self'
}