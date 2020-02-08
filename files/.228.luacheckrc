unused_args = false
allow_defined_top = true
max_line_length = 999

globals = {
	"minetest", "map",
}

read_globals = {
	string = {fields = {"split", "trim"}},
	table = {fields = {"copy", "getn"}},

	"core", "vector", "awards",
}
