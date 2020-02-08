allow_defined_top = true

globals = {
	"enhanced_quarry"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},
	"VoxelManip",

	-- Minetest
	"minetest",
	"vector", "ItemStack",
	"dump", "VoxelArea",

	-- Deps
	"default", "monitoring",
	"digilines",
	"mesecons",
	"mesecon",
	"technic",
	"areas"
}
