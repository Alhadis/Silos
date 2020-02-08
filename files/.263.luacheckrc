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
    "ButterGUITestFrame"
}

read_globals = {
    "LibStub",
    "tinsert",
    "tContains",

    -- WoW APIs
    "CreateFrame",
    "PlaySound",
    "GetCursorPosition",

    -- WoW Variables
    "UIParent",
    "NORMAL_FONT_COLOR",
    "HIGHLIGHT_FONT_COLOR",
    "SOUNDKIT",
    "UIDROPDOWNMENU_BUTTON_HEIGHT",
    "TOOLTIP_DEFAULT_COLOR",
    "C_Timer",
    "GameTooltip"
}
