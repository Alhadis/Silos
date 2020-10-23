/*
    place in close event for a persistant chest
    requires chest and a store creature to have unique tags
    creature tag must be cc_<tag of container>
*/
void main()
{
    string sDBase  = GetTag(GetModule());
    string sCreature  = "cc_"+GetTag(OBJECT_SELF);
    object oCreature = GetObjectByTag(sCreature);
    object oCopy;

    if (oCreature == OBJECT_INVALID)
    {
        SendMessageToAllDMs("Container "+sCreature+" has a problem.");
    }
    // copy items from container's inventory
    object oItem =  GetFirstItemInInventory(OBJECT_SELF);

    while (oItem != OBJECT_INVALID)
    {
        oCopy = CopyItem(oItem, oCreature, TRUE);
        oItem =  GetNextItemInInventory(OBJECT_SELF);
    }
    // destroy items in container's inventory

    oItem =  GetFirstItemInInventory(OBJECT_SELF);
    while (oItem != OBJECT_INVALID)
    {
        DestroyObject(oItem);
        oItem =  GetNextItemInInventory(OBJECT_SELF);
    }
    StoreCampaignObject(sDBase,GetTag(oCreature),oCreature);
}

