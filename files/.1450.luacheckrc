-- vim:ft=lua:
std = "lua51"

-- Show codes for warnings
codes = true

-- Disable colour output
color = false

-- Suppress reports for files without warnings
quiet = 1

-- Disable max line length check
max_line_length = false

-- We don't want to check externals Libs or this config file
exclude_files = {
    ".release/",
    "Libs/",
    ".luacheckrc",
}

-- Ignored warnings
ignore = {
}

-- Globals that we read/write
globals = {
    -- Our globals
}

-- Globals that we only read
read_globals = {
    -- Libraries

    -- API Functions
    "GetItemInfo",
    "GetLocale",

    -- FrameXML Globals

    -- Frames
    "GameTooltip",
    "ItemRefTooltip",
}
