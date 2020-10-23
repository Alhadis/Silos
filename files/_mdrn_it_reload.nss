#include "_mdrn_include"
#include "_mdrn_rof"

void main()
{
    object oPC = OBJECT_SELF;
    SendDebugMessage("ReloadFeat (" + IntToString(GetSpellId()) + ") Called by: " + GetName(OBJECT_SELF));
    SetLocalInt(oPC, "nd20Unequip", 1);
    DelayCommand(2.0, SetLocalInt(oPC, "nd20Unequip", 0));
    DestroyAmmoMag(OBJECT_SELF);
    ReloadAmmo(OBJECT_SELF, GetItemInSlot(INVENTORY_SLOT_RIGHTHAND));
    AssignCommand(oPC,PlayAnimation(17));
}
