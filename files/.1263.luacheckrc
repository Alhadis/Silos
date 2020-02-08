std = 'ngx_lua+lua52' -- lua52 has table.pack

busted = {std = "+busted", globals = { 'fixture' } }
files["**/spec/**/*_spec.lua"] = busted

globals = { 'rawlen' }
