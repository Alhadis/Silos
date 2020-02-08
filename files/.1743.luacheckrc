std = {
  globals = {
    -- these globals can only be accessed.
    -- Standard Lua library
    "math",
    "pairs",
    "ipairs",
    "string",
    "require",
    "table",
    "assert",
    "tostring",
    "print",
    "setfenv",
    "type",
    "loadstring",
    "match",
    "package",
    "tonumber",
    -- Third party libraries
    "love",
    "resources",
    "Vector",
    "Timer",
    "ECS",
    "Entity",
    "Component",
    "System",
    "Instance",
    "Camera",
    "_util",
    "luassert",
    "Mappy",
    "HC",
    "Talkies",
    "ripple",
    -- Our globals
    "_constants",
    "_components",
    "_entities",
    "_systems",
    "_debug",
    "_sprites",
    "_audio",
    "_fonts",
    "_dialogue"
  },
  read_globals = {}
}

max_line_length = 140

codes = true

exclude_files = {"src/shaders/**/*.lua", "tests/**/*.lua"}
