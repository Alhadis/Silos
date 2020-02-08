std             = "ngx_lua"
unused_args     = false
redefined       = false
max_line_length = false
cache = true

not_globals = {
    "string.len",
    "table.getn",
}

ignore = {
    "143",     -- ignore Accessing an undefined field of a global variable
    "21/_.*",  -- (W212)unused argument '_arg'
    "6.",      -- ignore whitespace warnings
}

exclude_files = {
    "resty_modules/lualib/?.lua"
}