#include "inc_d20"
// Handler for On Disturbed of Scientific Improvisation supply creature.
void main()
{
    object oPC = GetLastDisturbed();                    // PC
    object oStore = OBJECT_SELF;                        // Supply
    object oItem = GetInventoryDisturbItem();           // Item taken
    object oThing;
    int nDur = GetLevelByClass(CLASS_TYPE_FIELDSCIENTIST, oPC);
    int nType = GetInventoryDisturbType();              // Take or add.
    {if (GetIsDM(oPC))
        return;
    }

    if (nType == INVENTORY_DISTURB_TYPE_REMOVED)        // Done - close it down.
    {
        // Time for craft check
        int nGold = GetGoldPieceValue(oItem);               // Value in dollars (gold)
        int nDC =  FloatToInt(log(nGold*1.0)*3.48-6.65);                    // Convert from dollars to DCs
        if (nDC < 5)
            nDC = 5;


        if (GetLocalInt(oItem, "nCraftDC")>0)
            nDC = GetLocalInt(oItem, "nCraftDC");

        string sSkill = GetLocalString(oItem, "Craft");         // Must be set on item as Craft variable; default to Mechanical
        int nSkill = GetSkillRank(SKILL_CRAFT_MECHANICAL, oPC);
        if (sSkill == "Chemical")
            nSkill = GetSkillRank(SKILL_CRAFT_CHEMICAL, oPC);
        if (sSkill == "Electronic")
            nSkill = GetSkillRank(SKILL_CRAFT_ELECTRONIC, oPC);
        if (sSkill == "Pharmaceutical")
            nSkill = GetSkillRank(SKILL_CRAFT_PHARMACEUTICAL, oPC);
        if (sSkill == "Structural")
            nSkill = GetSkillRank(SKILL_CRAFT_STRUCTURAL, oPC);
        if (sSkill == "")
            sSkill = "Mechanical";

        if (nSkill == 0)            // Check if has skill; if not, let them choose again.
        {
             CopyItem(oItem, oStore, TRUE);
             DestroyObject(oItem);
             SendMessageToPC(oPC, "You do not have the Craft "+sSkill+" skill required to make this item.");
             return;
        }
        int nRoll = d20();         // Make and report check
        SendMessageToPC(oPC, "Craft "+sSkill+" check: "+IntToString(nRoll)+" on d20 + "+IntToString(nSkill)+" = "+IntToString(nRoll+nSkill)+" vs. DC: "+IntToString(nDC));
        if (nRoll+nSkill<nDC)                    // Failure; take item back and destroy supply creature
        {
             CopyItem(oItem, oStore, TRUE);
             DestroyObject(oItem);
             SendMessageToPC(oPC, "Attempt failed.");
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


        SetPlotFlag(oStore, FALSE);
        oThing = GetFirstItemInInventory(oStore);
        while (GetIsObjectValid(oThing))
        {
               SetPlotFlag(oThing, FALSE);
               DestroyObject(oThing);
               oThing=GetNextItemInInventory(oStore);


        }
        DestroyObject(oStore);                   // Close supply creature and destroy object after set amount of time.
        DestroyObject(oItem, nDur*12.0);
        SendMessageToPC(oPC, "Item chosen.  Remember, it will only last "+IntToString(nDur*2)+" rounds.");
    }
    else if (nType == INVENTORY_DISTURB_TYPE_ADDED)     // Mistake - return to PC
    {
        CopyItem(oItem, oPC, TRUE);
        DestroyObject(oItem);

    }


}
