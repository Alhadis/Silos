cache = true
color = true
self = false
-- The default config may set global variables
files["rc.lua"].allow_defined_top = true
-- These globals can be set and accessed.
globals = {
    -- external
    "awful",
    "beautiful",
    "wibox",
    -- helpers
    "notify",
    "try_var",
    -- other
    "globals",
    "widgets",
    "panels",
    -- defined in C
    "client"
    "mouse",
    "root",
    "screen",
},
-- These globals can only be accessed.
read_globals = {
    -- defined in C
    "awesome",
    "button",
    "dbus",
    "drawable",
    "drawin",
    "key",
    "keygrabber",
    "math.atan2",
    "mousegrabber",
    "selection",
    "table.unpack",
    "tag",
    "window",
},
