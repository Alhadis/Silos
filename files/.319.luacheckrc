std             = "ngx_lua"
unused_args     = false
redefined       = false
max_line_length = false

globals = {
  "assert",
  "DDT_GLOBAL_ARGS",
  "it",
  "setup",
  "teardown",
  "lazy_setup",
  "lazy_teardown",
  "before_each",
  "after_each",
  "describe"
}

not_globals = {
  "string.len",
  "table.getn",
}


ignore = {
  "6.", -- ignore whitespace warnings
}

exclude_files = {
  "jsonpath.lua",
  "spec-old-api/fixtures/invalid-module.lua",
}
