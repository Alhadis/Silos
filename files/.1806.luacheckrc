
globals = {
	"minetest",
	"travelnet"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"vector", "ItemStack",
	"dump",

	-- deps
	"default",
	"stairsplus",
	"player_monoids",
	"epic"
}
