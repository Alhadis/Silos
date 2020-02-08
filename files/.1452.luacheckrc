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
    "212/tt",   -- Unused tt variable
    "412/cost", -- Shadowed cost variable
}

-- Globals that we read/write
globals = {
    -- Our globals
    "ManaPerc",
}

-- Globals that we only read
read_globals = {
    -- Libraries
    "LibStub",

    -- API Functions
    "BreakUpLargeNumbers",
    "GetAddOnMetadata",
    "InterfaceOptionsFrame_OpenToCategory",
    "UnitPower",
    "UnitPowerMax",

    -- FrameXML Globals
    "MANA_COST",
    "SPELL_POWER_MANA",

    -- Frames
    "GameTooltip",
    "GameTooltipTextLeft2",
}
