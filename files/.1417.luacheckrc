unused_args = false
allow_defined_top = true

globals = {
	"gravity_manager",
	"registered_entities"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"minetest",
	"vector", "ItemStack",
	"dump",

	-- mods
	"armor", "player_monoids"
}
