local READ_ONLY = {
  read_only = true,
  other_fields = true,
}

local UNAVAILABLE_GLOBALS = {
  "dofile",
  "io",
  "loadfile",
  "socket",
}

local STD_TTS = {
  read_globals = {
    JSON = READ_ONLY,
    Player = READ_ONLY,
    Timer = READ_ONLY,
    Global = READ_ONLY,
  },
}

return {
  cache = "tmp/.luacheck.cache",
  codes = true,
  include_files = { "script/**/*.lua" },
  inline = true,
  not_globals = UNAVAILABLE_GLOBALS,
  redefined = true,
  self = true,
  std = "lua51c+tts",
  unused = true,
  unused_args = true,
  unused_secondaries = true,
  --
  files = {
    ["script/**/*.lua"] = { global = false },
  },
  stds = {
    tts = STD_TTS,
  },
}
