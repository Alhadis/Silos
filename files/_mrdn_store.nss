void main()
{
    object oPC = GetLastDisturbed();                    // PC
    if (GetIsDM(oPC))                                   // DM's don't use store system
        return;
    object oStore = OBJECT_SELF;                        // Store
    object oItem = GetInventoryDisturbItem();           // Item bought/sold
    int nReduce = GetItemStackSize(oItem);

    string sStore = GetTag(oStore);
    int nPawn = 0;                                      // Stolen goods not allowed
    if (GetStringLeft(sStore, 4)=="Pawn")
        nPawn = 1;                                      // Stolen goods allowed (just use tags with Pawn at the start)
    int nHours = GetLocalInt(oPC, "nMdrnShopHours");    // PC hours left to shop, they can't just keep shopping
    int nType = GetInventoryDisturbType();              // Buy or sell?
    int nGold = GetGoldPieceValue(oItem);               // Value in dollars (gold)
    int nDC =  FloatToInt(log(nGold*1.0)*3.48-6.65);    // Convert from dollars to DCs, a conversion table is in the manual to help here
    if (nDC < 5)
        nDC = 5;

    object oWealth = GetFirstItemInInventory(oPC);      // Calculate Wealth of PC
    int nWealth = 0;
    while (GetIsObjectValid(oWealth))
    {
        if (GetTag(oWealth)=="wealth")
        nWealth = nWealth + GetItemStackSize(oWealth);
        oWealth = GetNextItemInInventory(oPC);
    }
    int nCost = 0;                                      // Calculate cost of item.
    if (nDC > 14)
        nCost ++;
    if (nDC > nWealth && nDC <= nWealth + 10)
        nCost ++;
    if (nDC > nWealth + 10 && nDC <= nWealth + 15)
        nCost = nCost + d6();
    if (nDC > nWealth + 15)
        nCost = nCost + d6(2);

    if (nType == INVENTORY_DISTURB_TYPE_REMOVED)
    {
        // Buying something
        int nRoll = d20();          // Do a Wealth check
        int nCheck = nRoll+ nWealth;
        if (nHours > 0)             // Always allow one purchase a day
        {
            nHours = nHours + nDC;   // Use up DC hours for shopping
            if (nHours > 16)
            {
                // Too much shopping today to do this; failure.
                CopyItem(oItem, oStore, TRUE);
                DestroyObject(oItem);
                SendMessageToPC(oPC, "It would take "+IntToString(nDC)+" hour-equivalents to buy this item, and you don't have enough time left today; you need to rest and try again tomorrow.");
                return;
            }
        }
        else
            nHours = nHours + nDC;    // Use up DC hours for shopping

        // Report on Wealth check.
        SendMessageToPC(oPC, "Wealth check: "+IntToString(nRoll)+" on d20 + "+IntToString(nWealth)+" against DC: "+IntToString(nDC)+" of "+GetName(oItem));

        SetLocalInt(oPC, "nMdrnShopHours", nHours);                    // Record shopping hours.
        SendMessageToPC(oPC, "You spend "+IntToString(nDC)+" hour-equivalents shopping.");
        if (nCheck + 1 > nDC)
        {
            // Success
            SendMessageToPC(oPC, "You buy the item, costing "+IntToString(nCost)+" Wealth points.");

            if (GetLocalInt(oItem, "nMdrnShopUnlimited")==1)           // If this variable is set, item is unlimited in store.
            {
                CopyItem(oItem, oStore, TRUE);
                SetLocalInt(oItem, "nMdrnShopUnlimited", 0);
            }
            object oWealth = GetFirstItemInInventory(oPC);
            int nSize = GetItemStackSize(oWealth);
            while (GetIsObjectValid(oWealth) && nCost > 0)           // Remove appropriate number of Wealth points.
            {
                if (GetTag(oWealth)=="wealth")
                {
                    if (nSize < nCost + 1)
                    {
                        SetPlotFlag(oWealth, FALSE);
                        DestroyObject(oWealth);
                        nCost = nCost - nSize;
                    }
                    else
                    {
                        SetItemStackSize(oWealth, nSize - nCost);
                        nCost = 0;
                    }
                }
                oWealth = GetNextItemInInventory(oPC);
                nSize = GetItemStackSize(oWealth);
            }
        }
        else
        {
            // Failure - take item
            CopyItem(oItem, oStore, TRUE);
            DestroyObject(oItem);
            SendMessageToPC(oPC, "You fail to buy the item.");
        }
    }
    else if (nType == INVENTORY_DISTURB_TYPE_ADDED)
    {
        // Selling something
        if (GetStolenFlag(oItem)==TRUE)          // Check if a stolen item
        {
            if (nPawn == 0)                      // Check if this is a 'pawn shop'
            {
                CopyItem(oItem, oPC, TRUE);
                DestroyObject(oItem);
                SendMessageToPC(oPC, "Stolen items are not allowed to be sold at this store.");
            }
            else
                nDC = nDC - 3;              // Stolen items sell for DC 3 less
        }
        nDC = nDC - 3;
        nCost = 0;
        if (nDC < 1)                                 // Calculate Wealth value
            nDC = 1;
        if (nDC > 14)
            nCost ++;
        if (nDC > nWealth && nDC < nWealth + 11)
            nCost ++;
        if (nDC > nWealth + 10 && nDC < nWealth + 16)
            nCost = nCost + d6();
        if (nDC > nWealth + 15)
            nCost = nCost + d6(2);

        SendMessageToPC(oPC, "You sell the item, for an increase of "+IntToString(nCost)+" Wealth points.");
        CreateItemOnObject("wealth", oPC, nCost);
    }
}
