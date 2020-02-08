std = "min+busted+eso"
stds.eso = {
    globals = {
        "LibClockTST",
        "SLASH_COMMANDS",
    },
    read_globals = {
        "d",
        "EVENT_MANAGER",
        "GetTimeStamp",
        "EVENT_ADD_ON_LOADED",
    }
}
self = false
exclude_files = {
    "Test/ZOMock.lua",
}
include_files = {
    "Lib/**/*.lua",
    "Test/**/*.lua"
}