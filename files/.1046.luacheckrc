std = 'love+luajit'
max_line_length = false

globals = {
  -- crappy library, probably need to fix this small lib or find another that is better lua
  "perlin",
  -- standard lua ignore return value convention
  "_",
  -- needs to be globals as reload doesn't like it when they are not
  "player", "world", "start_position", "stache"
}
