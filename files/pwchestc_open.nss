void main()
{
    object oContainer = OBJECT_SELF;
    object oUser = GetLastOpenedBy();
    string sDB = GetTag(oContainer) + "_" + GetPCPlayerName(oUser);
    string sTag = "INVENTORY";
    object oStash_Items = RetrieveCampaignObject(sDB, sTag, GetLocation(oUser), oContainer);
    object oItem = GetFirstItemInInventory(oStash_Items);
    while (GetIsObjectValid(oItem))
    {
        if (GetHasInventory(oItem))
        {
            CreateItemOnObject(GetResRef(oItem), oContainer);
        }
        else
        {
            CopyItem(oItem, oContainer);
        }
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oStash_Items);
    }
    DestroyObject(oStash_Items);
    SetLocalInt(oContainer, "INUSE", TRUE);
    SetLocalString(oContainer, "USER", GetPCPlayerName(oUser));
    SetLocked(oContainer, TRUE);  //Prevent other players from viewing contents
}
