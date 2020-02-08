globals = {
  "screen",
  "mouse",
  "client"
}

read_globals = {
  "awesome",
  "button",
  "dbus",
  "drawable",
  "drawin",
  "key",
  "keygrabber",
  "mousegrabber",
  "root",
  "selection_getter",
  "selection",
  "selection_watcher",
  "tag",
  "window",
  "table.unpack",
  "math.atan2",
}

ignore = {"631", "412", "111", "113", "421", "211", "212"}

std = "lua51c+lua52c+lua53c+luajit+love"

files["awesomerc.lua"].allow_defined_top = true

cache = true
