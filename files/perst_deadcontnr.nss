/*
    Place in death event for a persistant container.
    Requires container and a waypoint to have unique tags.
    Waypoint tag must be cc_<tag of container>
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
    // copy items from creature's inventory
    object oItem =  GetFirstItemInInventory(oCreature);

    while (oItem != OBJECT_INVALID)
    {
        oCopy = CopyItem(oItem, OBJECT_SELF, TRUE);
        oItem =  GetNextItemInInventory(oCreature);
    }
    // destroy items in creature's inventory
    oItem =  GetFirstItemInInventory(oCreature);
    while (oItem != OBJECT_INVALID)
    {
        DestroyObject(oItem);
        oItem =  GetNextItemInInventory(oCreature);
    }
    StoreCampaignObject(sDBase,GetTag(oCreature),oCreature);
}
