
globals = {
	"epic_weather"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"minetest",
	"vector", "ItemStack",
	"dump", "VoxelArea",

	-- deps
	"epic", "screwdriver",
	"lightning",
	"areas"
}
