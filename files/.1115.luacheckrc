unused_args = false
allow_defined_top = true

globals = {
	"beerchat",
	"beerchat_web"
}

read_globals = {
	-- Stdlib
	string = {fields = {"split", "trim"}},
	table = {fields = {"copy", "getn"}},

	-- Minetest
	"minetest",
	"vector", "ItemStack",
	"dump", "dump2"

	-- Deps

}
