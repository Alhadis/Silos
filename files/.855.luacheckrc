unused_args = false
allow_defined_top = true

globals = {
    "minetest",
	"qeffects",
}

read_globals = {
    string = {fields = {"split"}},
    table = {fields = {"copy", "getn"}},
    "vector", "ItemStack",
    "dump", "DIR_DELIM", "VoxelArea", "Settings",
    "default", "sfinv", "creative", "stairs",
}
