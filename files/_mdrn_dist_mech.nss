#include "inc_d20"
// Handler for On Disturbed of Craft supplies.
void main()
{
    object oPC = GetLastDisturbed();                    // PC
    object oStore = OBJECT_SELF;                        // Supply
    object oItem = GetInventoryDisturbItem();           // Item taken
    object oThing;
    int nHours = GetLocalInt(oPC, "nMdrnCraftHours");    // PC hours left to shop
    object oWealth = GetFirstItemInInventory(oPC);      // Calculate Wealth of PC
    int nWealth = 0;
    while (GetIsObjectValid(oWealth))
    {
        if (GetTag(oWealth)=="wealth")
        nWealth = nWealth + GetItemStackSize(oWealth);
        oWealth = GetNextItemInInventory(oPC);

    }

    int nType = GetInventoryDisturbType();              // Take or add.
    {if (GetIsDM(oPC))                                  // DM's get to just take things.
        return;
    }

    if (nType == INVENTORY_DISTURB_TYPE_REMOVED)        // Done - close it down.
    {
        // Time for craft cost
        int nGold = GetGoldPieceValue(oItem);               // Value in dollars (gold)

        int nDC =  FloatToInt(log(nGold*1.0)*3.48-6.65);                    // Convert from dollars to DCs
        if (nDC < 5)
            nDC = 5;                                                // Min DC 5 cost.

        int nCost = 0;                                              // Calculate cost of item.
        if (nDC > 14)
            nCost ++;                                               // DC > 14 always costs 1.
        if (nDC > nWealth && nDC < nWealth + 11)                    // DC > Wealth but less than 10 more costs 1 more.
            nCost ++;
        if (nDC > nWealth + 10 && nDC < nWealth + 16)               // DC of 11-15 more than Wealth costs d6 more.
            nCost = nCost + d6();
        if (nDC > nWealth + 15)                                     // DC of 16+ more than Wealth costs 2d6 more.
            nCost = nCost + d6(2);
        int  nRoll = d20();                                   // Do a Wealth check
        int nCheck = nRoll+ nWealth;


        SendMessageToPC(oPC, "Wealth check: "+IntToString(nRoll)+" on d20 + "+IntToString(nWealth)+" against DC: "+IntToString(nDC)+" of "+GetName(oItem));
        if (nCheck + 1 > nDC)
        {
            // Success
            SendMessageToPC(oPC, "You can afford the materials.");


        }
        else
        {
            // Failure - take item
            CopyItem(oItem, oStore, TRUE);
                DestroyObject(oItem);
                return;
            SendMessageToPC(oPC, "You can't afford the supplies you need to craft the item.");
        }

        int nIndex = SKILL_CRAFT_MECHANICAL;        // Check for the craft type of store, and adjust for whether they have a kit.
        string sSkill = GetLocalString(oItem, "nSkill");
        if (sSkill=="")
            sSkill = GetLocalString(oStore, "nSkill");
        if (sSkill=="Mechanical")
            nIndex = SKILL_CRAFT_MECHANICAL - 4*(!(GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_mechkit"))||GetHasFeat(FEAT_IMPROVISEDIMPLEMENTS, oPC)));
        if (sSkill=="Electronic")
            nIndex = SKILL_CRAFT_ELECTRONIC - 4*(!(GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_disable"))||GetHasFeat(FEAT_IMPROVISEDIMPLEMENTS, oPC)));
        if (sSkill=="Pharmaceutical")
            nIndex = SKILL_CRAFT_PHARMACEUTICAL - 4*(!(GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_pharm"))||GetHasFeat(FEAT_IMPROVISEDIMPLEMENTS, oPC)));
        if (sSkill=="Chemical")
            nIndex = SKILL_CRAFT_CHEMICAL - 4*(!(GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_chemkit"))||GetHasFeat(FEAT_IMPROVISEDIMPLEMENTS, oPC)));
        if (sSkill=="Structural")
            nIndex = SKILL_CRAFT_STRUCTURAL;
        if (sSkill == "")
            sSkill = "Mechanical";

        int nSkill = GetSkillRank(nIndex, oPC);
        if (GetLocalInt(oItem, "nCraftDC")>0)
            nDC = GetLocalInt(oItem, "nCraftDC");

        // Best approximation to the times listed in the rules for the various crafts.
        int nTime = nDC - 14;
        if (nTime < 1)
            nTime = 1;
        if (nTime > 1)
        {
            if (sSkill == "Pharmaceutical" || sSkill == "Chemical")
                nTime = nTime/2;
            else if (sSkill == "Structural")
                nTime = nTime*3;
            else
                nTime = nTime*2;
        }

        if (nHours > 0)             // Always allow one build a day
        {
            nHours = nHours + nTime;   // Use up DC hours for building
            if (nHours > 16)
            {
                // Too much building today to do this; failure.
                CopyItem(oItem, oStore, TRUE);
                DestroyObject(oItem);
                SendMessageToPC(oPC, "It would take "+IntToString(nDC)+" hour-equivalents to build this item, and you don't have enough time left today; you need to rest and try again tomorrow.");
                return;
            }


        }
        else
            nHours = nHours + nTime;    // Use up DC hours for building; these get replaced on rest.
        SetLocalInt(oPC, "nMdrnCraftHours", nHours);                                          // Record building hours.
        SendMessageToPC(oPC, "You spend "+IntToString(nTime)+" hour-equivalents building.");
        SendMessageToPC(oPC, "The materials to make the item cost "+IntToString(nCost)+" Wealth points.");



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

        nRoll = d20();         // Make and report check
        SendMessageToPC(oPC, "Craft "+sSkill+" check: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" = "+IntToString(nRoll+nSkill)+" vs. DC: "+IntToString(nDC));
        if (nRoll+nSkill<nDC)                    // Failure; take item back and destroy supply creature
        {
             CopyItem(oItem, oStore, TRUE);
             DestroyObject(oItem);
             SendMessageToPC(oPC, "You fail to craft the item.");
             oThing = GetFirstItemInInventory(oStore);
            while (GetIsObjectValid(oThing))
            {
                   SetPlotFlag(oThing, FALSE);
                   DestroyObject(oThing);
                   oThing=GetNextItemInInventory(oStore);


            }
            SetPlotFlag(oStore, FALSE);

            DestroyObject(oStore);
             return;
        }

        // Time to shut down the store.
        SetPlotFlag(oStore, FALSE);
        oThing = GetFirstItemInInventory(oStore);
        while (GetIsObjectValid(oThing))
        {
               SetPlotFlag(oThing, FALSE);
               DestroyObject(oThing);
               oThing=GetNextItemInInventory(oStore);


        }
        DestroyObject(oStore);                   // Close supply creature and destroy object after set amount of time.

    }
    else if (nType == INVENTORY_DISTURB_TYPE_ADDED)     // Mistake - return to PC
    {
        CopyItem(oItem, oPC, TRUE);
        DestroyObject(oItem);

    }


}
