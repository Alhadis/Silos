std = "lua53"

ignore = {
  "143",  --Accessing an undefined field of a global variable.
  "431",  --Shadowing an upvalue.
  "432",  --Shadowing an upvalue argument.
  "611",  --A line consists of nothing but whitespace.
  "631"   --Line is too long.
}

globals = {
  "describe",
  "it",
  "after_each",
  "before_each",
  "setup",
  "teardown",
  "spy"
}

exclude_files = {
  "deps"
}
