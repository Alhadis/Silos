max_line_length = false

exclude_files = {
	"libs",
    ".luacheckrc",
}

ignore = {
	"12.", -- ignore "Setting a read-only global variable/Setting a read-only field of a global variable."
	"43.", -- Shadowed upvalues happens often when writing scripts or trying to work with another module.
	"542", -- disable warnings for empty if branches. These are useful sometimes and easy to notice otherwise.
	"611", -- disable "line contains only whitespace"
    "211/L", -- Nice to declare even if a file isn't currently using localization.
    "21[23]", -- Disable unused loop/arguments warnings.
}

std = "+WoW"

-- Most of the FrameXML related globals
stds["WoW"] = {
	globals = {
		-- Lua Additions
		string = { fields = { "join", "rtgsub", "split", "trim", }},
		table = { fields = { "removemulti", "wipe", }},

		"format", "Mixin", "Item", "BreakUpLargeNumbers", "EmbeddedItemTooltip", "GetCurrencyInfo", "hooksecurefunc",
		"C_MountJournal", "C_PetJournal", "C_Heirloom", "C_AzeriteEssence", "C_Reputation", "ReputationListScrollFrame",
		"GetNumFactions", "FauxScrollFrame_GetOffset", "GetFactionInfo", "IsFactionInactive", "PlayerHasToy", "UnitFactionGroup",
		"MOUNT", "PET", "TOY", "ITEM_QUALITY7_DESC", "AZERITE_ESSENCE_ITEM_TYPE", "ADDON_MISSING", "REWARDS", "REPUTATION_PROGRESS_FORMAT", 
		"RETRIEVING_ITEM_INFO", "NUM_FACTIONS_DISPLAYED", "FONT_COLOR_CODE_CLOSE", "HIGHLIGHT_FONT_COLOR_CODE", "ITEM_SPELL_KNOWN",
	}
}