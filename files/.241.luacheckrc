stds.roblox = {
	globals = {
		"game"
	},
	read_globals = {
		-- Roblox globals
		"script",

		-- For plugins
		"plugin", "PluginManager",

		-- Extra functions
		"tick", "warn", "spawn",
		"wait", "settings", "typeof",
		"time", "delay",

		-- Types
		"Vector2", "Vector3",
		"Color3",
		"UDim", "UDim2",
		"Rect",
		"CFrame",
		"Enum",
		"Instance",

		-- Other
		"Random",
		"DockWidgetPluginGuiInfo",
		"LoadLibrary",
		"PhysicalProperties",
		"BrickColor",
	}
}

stds.testez = {
	read_globals = {
		"describe",
		"it", "itFOCUS", "itSKIP",
		"FOCUS", "SKIP", "HACK_NO_XPCALL",
		"expect",
	}
}

std = "lua51+roblox"

files["**/*.spec.lua"] = {
	std = "+testez",
}
codes = true
max_cyclomatic_complexity = 20

-- Skip our lib, these are third party
exclude_files = {
	"modules/"
}