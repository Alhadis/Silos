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
    "Libs/",
    ".luacheckrc",
}

-- Ignored warnings
ignore = {
    "212/colourize", -- getAbacus compat arg
    "212/info",      -- options args
    "212/self",      -- Various self arguments
    "212/value",     -- options args
    "212/uiTypes",   -- Taken by GetOptions but we don't use it
    "212/uiName",    -- Taken by GetOptions but we don't use it
}

-- Globals that we read/write
globals = {
    -- Our globals
    "Broker_MoneyFu",
}

-- Globals that we only read
read_globals = {
    -- Libraries
    "LibStub",

    -- API Functions
    "date",
    "time",
    "GetAddOnMetadata",
    "GetCoinTextureString",
    "GetGameTime",
    "GetMoney",
    "GetScreenHeight",
    "GetScreenWidth",
    "InterfaceOptionsFrame_OpenToCategory",
    "MouseIsOver",
    "OpenCoinPickupFrame",
    "UnitClass",
    "UnitName",

    -- FrameXML Globals
    "HONOR_THIS_SESSION",
    "HONOR_YESTERDAY",
    "NORMAL_FONT_COLOR_CODE",
    "RAID_CLASS_COLORS",

    -- Frames
    "CoinPickupFrame",
}
