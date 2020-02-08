std = "lua51"
max_line_length = false
exclude_files = {
    ".luacheckrc"
}

quiet = 1

exclude_files = {
    "Libs/*"
}

ignore = {
    "211/_.*", -- Unused local variable starting with _
    "212", -- Unused argument
    "542", -- empty if branch
    "432/self" -- shadowing upvalue self
}

globals = {

}

read_globals = {
    "LibStub",
    "tContains",
    "tinsert",

    -- WoW APIs
    "CreateFrame",
    "IsMouseButtonDown"
}
