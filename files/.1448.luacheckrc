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
    "211/race", -- Unused in Reset method
    "212/self", -- Unused in Reset method
}

-- Globals that we read/write
globals = {
    -- Our globals
    "Cosplay",
    "BINDING_NAME_CosplayButtonHeader",
    "BINDING_NAME_CosplayButtonName",
}

-- Globals that we only read
read_globals = {
    -- Libraries
    "LibStub",

    -- API Functions
    "CreateFrame",
    "GetBuildInfo",
    "PlaySound",
    "SetDressUpBackground",
    "SetPortraitTexture",
    "ShowUIPanel",
    "UnitIsPlayer",
    "UnitIsVisible",
    "UnitRace",

    -- Globals
    "DressUpBackgroundBotLeft",
    "DressUpBackgroundBotRight",
    "DressUpBackgroundTopLeft",
    "DressUpBackgroundTopRight",
    "DressUpFramePortrait",
    "SOUNDKIT",

    -- Fonts

    -- Frames
    "DressUpFrame",     -- Frame for regular Dress Up Model
    "DressUpModel",     -- Regular Dress Up Model
    "SideDressUpFrame", -- Auction House Dress Up Frame
    "SideDressUpModel", -- Auction House Dress Up Model
}
