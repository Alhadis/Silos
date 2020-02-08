local standards = require "luacheck.standards"

-- stds global is provided by luacheck
-- https://luacheck.readthedocs.io/en/stable/config.html#custom-sets-of-globals
stds.ngx = {
    read_globals = {
        coroutine = standards.def_fields('_yield', '_create', '_resume')
    }
}

std = 'ngx_lua+lua52+ngx' -- lua52 has table.pack

busted = {std = "+busted", globals = { 'fixture' } }
files["**/spec/**/*_spec.lua"] = busted

globals = { 'rawlen' }

files['gateway/config/*.lua'] = { globals = { 'context' } }
