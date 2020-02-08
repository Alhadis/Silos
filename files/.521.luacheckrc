local u = require('lib.util')

exclude_files = { 'vendor/**/*.lua' }
globals = u.concat({ '_DEBUG', 'love' }, u.keys(u))
self = false
std = 'lua51'
unused_secondaries = false
