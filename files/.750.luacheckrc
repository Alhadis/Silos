
self = false
unused_args = false

exclude_files = {
	"example/kloveui",
}

read_globals = {
	"love",
}

files["example/main.lua"] = {
	globals = { "print" },
}

files["example/conf.lua"] = {
	globals = { "love" },
}
