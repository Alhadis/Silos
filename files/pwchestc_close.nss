/*This script creates seperate DB files for each player that uses the chest
the name of the DB file Tag of the object calling the script and name of player's
account.
*/
void main()
{
    object oContainer = OBJECT_SELF;
    object oUser = GetLastOpenedBy();
    object oStash_Items = CreateObject(OBJECT_TYPE_CREATURE, "pwstash_items", GetLocation(oContainer));
    string sDB = GetTag(oContainer) + "_" + GetPCPlayerName(oUser);
    DestroyCampaignDatabase(sDB);
    object oItem = GetFirstItemInInventory(oContainer);
    while (GetIsObjectValid(oItem))
    {
        if (GetHasInventory(oItem))
        {
            CreateItemOnObject(GetResRef(oItem), oStash_Items);
        }
        else
        {
            CopyItem(oItem, oStash_Items);
        }
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oContainer);
    }
    StoreCampaignObject(sDB, "INVENTORY", oStash_Items);
    DestroyObject(oStash_Items);
    SetLocalInt(oContainer, "INUSE", FALSE);
    DeleteLocalString(oContainer, "USER");
    SetLocked(oContainer, FALSE);
//following code used to prevent server from locking DB files
//needed when multiple servers share DB files
    sDB = "CLEAN_DB_" + GetTag(GetModule());
    SetCampaignString(sDB, "CLEAN_DB", "CLEAN_DB");
    DestroyCampaignDatabase(sDB);
}
