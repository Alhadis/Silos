codes = true
std = "min"
self = false

new_read_globals = {
	"getfenv",
	"setfenv",
	"unpack",
}

include_files = {
	"**/*.lua",
	"package/**/files/lib/gluon/ebtables/*",
	"package/**/luasrc/**/*",
	"targets/*",
}

exclude_files = {
	"**/*.mk",
}

files["scripts/check_site.lua"] = {
	allow_defined = true,
	module = true,
}

files["**/check_site.lua"] = {
	new_read_globals = {
		"alternatives",
		"extend",
		"in_domain",
		"in_site",
		"need",
		"need_alphanumeric_key",
		"need_array",
		"need_array_of",
		"need_boolean",
		"need_chanlist",
		"need_domain_name",
		"need_number",
		"need_one_of",
		"need_string",
		"need_string_array",
		"need_string_array_match",
		"need_string_match",
		"need_table",
		"need_value",
		"obsolete",
		"table_keys",
		"this_domain",
	},
}

files["**/files/lib/gluon/ebtables/*"] = {
	new_read_globals = {
		"chain",
		"rule",
	},
	max_line_length = false,
}

files["**/luasrc/lib/gluon/config-mode/*"] = {
	globals = {
		"DynamicList",
		"Flag",
		"Form",
		"i18n",
		"ListValue",
		"renderer.render",
		"renderer.render_string",
		"Section",
		"TextValue",
		"_translate",
		"translate",
		"translatef",
		"Value",
	},
}

files["**/luasrc/lib/gluon/**/controller/*"] = {
	new_read_globals = {
		"_",
		"alias",
		"call",
		"entry",
		"model",
		"node",
		"template",
	},
}

files["targets/*"] = {
	new_read_globals = {
		"config",
		"defaults",
		"device",
		"env",
		"envtrue",
		"exec_capture_raw",
		"factory_image",
		"no_opkg",
		"packages",
		"sysupgrade_image",
		"try_config",
	},
}
