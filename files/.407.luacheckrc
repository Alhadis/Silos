std = "lua51"
max_line_length = false
exclude_files = {
	".luacheckrc"
}
ignore = {
	"11./SLASH_.*", -- Setting an undefined (Slash handler) global variable
	"11./BINDING_.*", -- Setting an undefined (Keybinding header) global variable
	"113/LE_.*", -- Accessing an undefined (Lua ENUM type) global variable
	"113/NUM_LE_.*", -- Accessing an undefined (Lua ENUM type) global variable
	"211", -- Unused local variable
	"211/L", -- Unused local variable "L"
	"211/CL", -- Unused local variable "CL"
	"212", -- Unused argument
	"213", -- Unused loop variable
	-- "231", -- Set but never accessed
	"311", -- Value assigned to a local variable is unused
	"314", -- Value of a field in a table literal is unused
	"42.", -- Shadowing a local variable, an argument, a loop variable.
	"43.", -- Shadowing an upvalue, an upvalue argument, an upvalue loop variable.
	"542", -- An empty if branch
}
globals = {
	"_G",
	"bit",
	"date",
	"debugstack",
	"strsplit",
	"strtrim",
	"table",
	"time",

	-- DBM
	"DBM",
	"DBM_DISABLE_ZONE_DETECTION",

	-- RaidLeadTools
	"DBM_AddItemToDKP",
	"DBM_BidBot_ItemHistory",

	-- WoW
	"ACCEPT",
	"CANCEL",
	"GameFontHighlightSmall",
	"GameFontNormalSmall",
	"SlashCmdList",
	"StaticPopupDialogs",
	"UIParent",
	"WOW_PROJECT_ID",
	"WOW_PROJECT_CLASSIC",

	-- FrameXML
	"ChatFrame_AddMessageEventFilter",
	"ConvertToRaid",
	"CreateFrame",
	"GetChannelList",
	"GetChannelName",
	"GetFriendInfo",
	"GetGuildRosterInfo",
	"GetItemInfo",
	"GetLocale",
	"GetLootMaster",
	"GetNumFriends",
	"GetNumGroupMembers",
	"GetNumGuildMembers",
	"GetNumSubgroupMembers",
	"GetRaidTargetIndex",
	"GetRealZoneText",
	"GuildControlGetNumRanks",
	"GuildControlGetRankName",
	"GuildRoster",
	"InviteUnit",
	"IsGuildMember",
	"IsInRaid",
	"PromoteToAssistant",
	"SendAddonMessage",
	"SendChatMessage",
	"SetRaidTarget",
	"StaticPopup_Show",
	"UnitIsGroupAssistant",
	"UnitIsGroupLeader",
	"UnitName"
}
