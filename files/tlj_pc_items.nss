////////////////////////////////////////////////////////////////////////////////
// This is the item stripper
////////////////////////////////////////////////////////////////////////////////

#include "tlj_inc_generic"
#include "tlj_inc_id"
#include "x2_inc_itemprop"


// MAIN ///////////////////////////////////////////////////////////////////////

void main() {
    object oPC = OBJECT_SELF;
    if (!GetIsPC(oPC) || GetIsDM(oPC) || GetIsDMPossessed(oPC)) return;

    // This section sets up PCs entering the module for the first time. They're
    // identified as new if they are below the starting level (see below).
    int nStartingLevel = 2;
    if (GetXP(oPC) < 1000) {

        // Set the PC to the starting level
        SetPCLevel(oPC, nStartingLevel);
        SendMessageToPC(oPC, "Your level has been set to (" + IntToString(nStartingLevel)+ ")");

        // Strip all gold
        AssignCommand(oPC, TakeGoldFromCreature(GetGold(oPC), oPC, TRUE));

        // Strip all items in the PC's slots
        int i;
        object oItem;
        for (i = 0; i < NUM_INVENTORY_SLOTS; i++) {
            oItem = GetItemInSlot(i, oPC);
            if (GetIsObjectValid(oItem)) {
                DestroyObject(oItem);
            }
        }

        // Strip all items in the PC's inventory
        oItem = GetFirstItemInInventory(oPC);
        while (GetIsObjectValid(oItem)) {
            DestroyObject(oItem);
            oItem = GetNextItemInInventory(oPC);
        }

        // Hand out the starting gold
        AssignCommand(oPC, GiveGoldToCreature(oPC, 50));

        // Hand out the starting gear
       // object oClothing = CreateItemOnObject("fatigues010", oPC);
        //DelayCommand(2.0, AssignCommand(oPC, ActionEquipItem(oClothing, INVENTORY_SLOT_CHEST)));
        //CreateItemOnObject("bp_mk_0", oPC);
        //CreateItemOnObject("vibrodagger", oPC);


    }


}
