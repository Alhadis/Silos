read_globals = { "cjson", "redis" }
ignore = {
  "212", -- unused argument
  "142/table", -- Setting an undefined field of a global variable.
  "143/table", -- Accessing an undefined field of a global variable.
}
