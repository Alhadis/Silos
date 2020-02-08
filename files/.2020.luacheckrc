codes = true
color = true

std = "max"

include_files = {
    "lualib/*",
    "service/*",
    "script/*",
}

exclude_files = {
    "script/def/proto/*",
    "script/def/prop/*",
    "service/test.lua",
}

ignore = {
    "self",
    "i",
    "bash",
}
