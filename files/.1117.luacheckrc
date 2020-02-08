std = "lua51"

color = false
unused_args = false
allow_defined_top = true

read_globals = {
	"yamato",

	-- Minetest
	"minetest",
	"vector",
	"Settings",
	"ItemStack",
	"PseudoRandom",
	"PcgRandom",
	"VoxelManip",
	"VoxelArea",
	table = { fields = { "copy", "indexof" } },

	-- Minetest Game
	"beds",
	"bucket",
	"creative",
	"default",
	"doors",
	"dye",
	"farming",
	"fire",
	"flowers",
	"give_initial_stuff",
	"screwdriver",
	"sethome",
	"stairs",
	"tnt",
	"walls",
	"xpanes",

	-- Others
	"intllib",
}
