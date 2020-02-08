color           = true
codes           = true
cache           = true
max_line_length = 80

files[ "scripts" ] = {
        std = "max",
        globals = {
                "redis",
                "cmsgpack",
                "cjson",
                "ARGV",
                "KEYS"
        }
}

files[ "spec" ] = {
        std = "+busted",
        globals = {
                "randomize",
        }
}
