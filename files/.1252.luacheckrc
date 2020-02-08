unused_args = false
allow_defined_top = true

globals = {
	"redwood"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- mod deps
	"stairsplus",

	-- Minetest
	"minetest",
	"vector", "ItemStack",
	"dump",

	-- Deps
	"default"
}
