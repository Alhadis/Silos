std = "lua51"
max_line_length = false
exclude_files = {
    "Libs/",
    ".luacheckrc"
}
ignore = {
    "211", -- Unused local variable
    "211/L", -- Unused local variable "L"
    "211/CL", -- Unused local variable "CL"
    "212", -- Unused argument
    "213", -- Unused loop variable
    "311", -- Value assigned to a local variable is unused
    "314", -- Value of a field in a table literal is unused
    "42.", -- Shadowing a local variable, an argument, a loop variable.
    "43.", -- Shadowing an upvalue, an upvalue argument, an upvalue loop variable.
    "542", -- An empty if branch
}
globals = {
    -- Libs used
    "LibStub",
    "IsControlKeyDown", -- from ace

    -- lua
    "format",
    "time",
    "tremove",

    -- Blizz API
    "ChatFrame_OpenChat",
    "GetChannelName",
    "GetClassColor",
    "GetPlayerInfoByGUID",
    "InterfaceOptionsFrame_OpenToCategory",
    "IsInInstance",
    "PlaySound",
    "UnitGUID",
    "UnitName",

    -- Blizz Globals
    "CreateFrame",
    "DEFAULT_CHAT_FRAME",
    "ChatFrame1",
    "ChatFrame10",
    "ChatFrame2",
    "ChatFrame3",
    "ChatFrame4",
    "ChatFrame5",
    "ChatFrame6",
    "ChatFrame7",
    "ChatFrame8",
    "ChatFrame9",
    "NUM_CHAT_WINDOWS",
    "UIErrorsFrame",
    "UISpecialFrames",

    -- MCA Globals
    "MCAalertFrame",
    "MyChatAlert",
    "MyChatAlertLDBIconDB",
}
