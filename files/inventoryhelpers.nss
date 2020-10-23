/// Useful inventory functions

void debug(string msg)
{
    SendMessageToPC(GetFirstPC(),msg);
}

int GetNumberItemPossessedBy(object oObject, string sTag)
{
    if(!GetHasInventory(oObject))
    return 0;

    int count=0;
    object oItem = GetFirstItemInInventory(oObject);
    while(GetIsObjectValid(oItem))
    {
        //debug("looking at "+GetName(oItem)+"("+GetTag(oItem)+")");
        if(GetTag(oItem) == sTag)
            count+=GetItemStackSize(oItem);

        oItem = GetNextItemInInventory(oObject);
    }
    return count;
}

int GetIsEquipped(object oObject, string sTag)
{
    int i = 0;
    for(i = 0; i < NUM_INVENTORY_SLOTS; ++i)
    {
        object oItem = GetItemInSlot(i, oObject);
        if(GetIsObjectValid(oItem) && (GetTag(oItem) == sTag))
            return TRUE;
    }
    return FALSE;
}

int GetItemSlot(object oItem, object oPC)
{
    int i;
    for(i=0; i<NUM_INVENTORY_SLOTS; i++)
    {
        if(GetItemInSlot(i,oPC)==oItem)
            return i;
    }
    return -1;
}



/*

/// Useful inventory functions

int GetNumberItemPossessedBy(object oObject, string sTag)
{
    if(!GetHasInventory(oObject))
    return 0;

    int count=0;
    object oItem = GetFirstItemInInventory(oObject);
    while(GetIsObjectValid(oItem))
    {
        if(GetTag(oItem) == sTag)
            count+=GetItemStackSize(oItem);
        else if(GetHasInventory(oItem))
            count+=GetNumberItemPossessedBy(oItem,sTag);

        oItem = GetNextItemInInventory(oObject);
    }
    return count;
}


int GetIsEquipped(object oObject, string sTag)
{
    int i = 0;
    for (i = 0; i < NUM_INVENTORY_SLOTS; ++i)
    {
        object oItem = GetItemInSlot(i, oMember);
        if(GetIsObjectValid(oItem) && (GetTag(oItem) == sTag))
            return TRUE;
    }
    return FALSE;
}

