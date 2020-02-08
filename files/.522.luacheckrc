local c = require('src.vendor.chipmunk')

exclude_files = { 'dist/**/*.lua', 'src/vendor/**/*.lua' }
globals = c.concat({ '_DEBUG', 'love' }, c.keys(c))
self = false
std = 'lua51'
unused_secondaries = false
