cache     = false
codes     = false
color     = true
formatter = "default"
std       = require "coronastd"
files ["**/*_spec.lua"] = {
  std = "+busted",
}
