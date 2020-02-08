local u = require('src.lib.util')

exclude_files = { 'dist/**/*.lua', 'src/vendor/**/*.lua' }
globals = u.concat({ '_DEBUG', 'love' }, u.keys(u))
self = false
std = 'lua51'
unused_secondaries = false
