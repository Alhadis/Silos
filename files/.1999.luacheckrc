cache = true
std = 'ngx_lua'
ignore = {
    "_",
    "6..",
}

unused = false

unused_args = false
unused_secondaries = false
redefined = false

globals = {
    "ngx"
}

local old_sytel_modules = {

}

for _, path in ipairs(old_sytel_modules) do
    files[path].module = true
    files[path].allow_defined_top = true
end

files["test/*_spec.lua"].std = "+busted"

excluded_files = {
    "ngx/resty"
}

