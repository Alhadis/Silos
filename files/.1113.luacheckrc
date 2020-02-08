allow_defined_top = true

globals = {
	"auth_proxy",
}

read_globals = {
	"xban",

	-- Stdlib
	string = {fields = {"split"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"minetest", "dump",
	"vector", "ItemStack"

}
