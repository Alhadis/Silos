std = "lua51"
max_line_length = false
exclude_files = {
    ".luacheckrc"
}
ignore = {
    "211/L", -- Unused local variable "L"
    "43.", -- Shadowing an upvalue, an upvalue argument, an upvalue loop variable.
}
globals = {
    -- TradeSkillUIImproved
    "TradeSkillUIImproved",
    "TradeSkillUIImprovedDB",
    "SLASH_TSUII1",
    "SLASH_TSUII2",
    "TradeSkillUIImproved_CheckButtonHasMaterials",
    "TradeSkillUIImproved_CheckButtonHasSkillUp",
    "TradeSkillUIImproved_OptionsCheckBoxAuctionatorText",
    "TradeSkillUIImproved_OptionsCheckBoxRecipeText",
    "TradeSkillUIImproved_OptionsCheckBoxRecipeBagText",
    "TradeSkillUIImproved_OptionsCheckBoxRecipeBankText",
    "TradeSkillUIImproved_OptionsSliderSizeText",
    "TradeSkillUIImproved_OptionsSliderSizeLow",
    "TradeSkillUIImproved_OptionsSliderSizeHigh",
    "TradeSkillUIImproved_CheckButtonHasMaterialsText",
    "TradeSkillUIImproved_CheckButtonHasSkillUpText",

    -- Other Addon
    "Auctionator_Search",

    -- WoW API Function
    "CreateFrame",
    "GetNumCollectedInfo",
    "GetContainerItemLink",
    "GetMerchantNumItems",
    "GetMerchantItemLink",
    "GetAuctionItemLink",
    "FauxScrollFrame_GetOffset",
    "GetNumAuctionItems",
    "SetItemButtonTextureVertexColor",
    "HybridScrollFrame_CreateButtons",
    "ContainerFrame_UpdateAll",
    "HideUIPanel",
    "IsCurrentSpell",
    "GetSpellInfo",
    "GetProfessions",
    "GetProfessionInfo",
    "IsSpellKnown",
    "GetSpellBookItemInfo",
    "SlashCmdList",
    "strsplit",
    "IsAddOnLoaded",
    "InCombatLockdown",
    "GetAddOnMetadata",
    "GetLocale",
    "hooksecurefunc",
    "InterfaceOptionsFrame_OpenToCategory",
    "InterfaceOptions_AddCategory",
    "floor",

    -- WoW Frame
    "TradeSkillFrame",
    "BrowseScrollFrame",
    "AuctionFrameBrowse",
    "GameMenuFrame",
    "MerchantFrame",

    -- WoW CONSTANT
    "ITEM_SPELL_KNOWN",
    "MERCHANT_ITEMS_PER_PAGE",
    "NUM_BROWSE_TO_DISPLAY",
    "NUM_AUCTION_ITEMS_PER_PAGE",
    "BOOKTYPE_PROFESSION",
    "TRADESKILL_FILTER_HAS_SKILL_UP",
    "CRAFT_IS_MAKEABLE",

    -- WoW Globals var
    "C_TradeSkillUI",
    "UIParent",
    "UIPanelWindows",
    "GameFontHighlightSmall",
}
