-- http://luacheck.readthedocs.io/en/stable/config.html
stds.wow = {
   globals = {"BQuestErrors", "BQuestSavedVariables", "seterrorhandler", "StaticPopupDialogs"}, -- these globals can be set and accessed.
   read_globals = {"GetItemInfo", "GetSpellInfo", "GetRealmName", "UnitName", "hooksecurefunc", "StaticPopup_Show", "geterrorhandler", "tinsert", "date", "time", "GetContainerNumSlots", "GetContainerItemID", "GetContainerItemInfo", "CreateFrame", "getglobal", "UIParent", "tremove", "ShowUIPanel", "HideUIPanel"} -- these globals can only be accessed.
}

std = "min+wow"
