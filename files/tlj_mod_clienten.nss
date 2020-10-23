////////////////////////////////////////////////////////////////////////////////
// On Client Enter script //////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

#include "tlj_inc_force"

void main() {
    object oPC = GetEnteringObject();
    string sPCName = GetName(oPC);

    // This ensures that nobody rushes the server.
    /*if (GetLocalInt(GetModule(), "ANTI_RUSH")) {
        BootPC(oPC);
        //return;
    }*/

// PC Copy machine ////////////////////////////////////////////////////////////
    // This section clones the PC into another area. We can use the clone
    // for just about anything...
    object oCopyMachine = GetObjectByTag("PC_COPY_MACHINE");
    object oCloneRoom = GetArea(oCopyMachine);
    object oClone = GetFirstObjectInArea(oCloneRoom);
    int nIsCreated;

    // Check to make sure there isn't already a clone in the vault area
    while (GetIsObjectValid(oClone) && !nIsCreated) {
        if (GetName(oClone) == sPCName)
            nIsCreated = TRUE;
        oClone = GetNextObjectInArea(oCloneRoom);
    }

    // If a clone was found in the vault area then nIsCreated is set to TRUE
    // and we skip this next section entirely. Otherwise, make the clone.
    // Oh yeah, and we also make everything on the clone undroppable.
    if (!nIsCreated) {
        oClone = CopyObject(oPC, GetLocation(oCopyMachine));

        // Store login info on the clone
        SetLocalPCLogin(oClone, "LOGIN_INFO", GetPCLogin(oPC));

        object oItem = GetFirstItemInInventory(oClone);
        while (oItem != OBJECT_INVALID) {
            SetDroppableFlag(oItem, FALSE);
            oItem = GetNextItemInInventory(oClone);
        }
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_ARMS, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_ARROWS, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_BELT, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_BOLTS, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_BOOTS, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_BULLETS, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_CARMOUR, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_CHEST, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_CLOAK, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_HEAD, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_LEFTRING, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_NECK, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oClone), FALSE);
        SetDroppableFlag(GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oClone), FALSE);
    }
// End PC Copy Machine /////////////////////////////////////////////////////////

    // This starts up the fatigue recovery for force users
    AssignCommand(oPC, InnitiateForceRecovery());

    // Start the PC items script
    ExecuteScript("tlj_pc_items", oPC);
    // Start the PC properties script
    DelayCommand(1.0, ExecuteScript("tlj_pc_props", oPC));
}
