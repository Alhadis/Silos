cache = true
std = "max"
read_globals = {"skynet"}
new_globals = {"import", "print"}

include_files = {
    "lualib/*",
    "examples/lualib/*",
    "examples/service/*",
}

exclude_files = {
    'lualib/test/luaunit.lua',
    'lualib/perf/MemoryReferenceInfo.lua',
    'examples/service/hotfix/mod.lua',

}

ignore = {
    "_", -- 忽略 _ 变量，我们用它来表示没有用到的变量
    "i",
    "k",
    "v",
    "bash",
    "SERVICE_NAME",
    "self",
    "423", -- Shadowing a loop variable
    "211", -- Unused local variable
    "212", -- Unused argument
}