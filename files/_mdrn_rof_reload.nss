#include "_mdrn_include"
#include "_mdrn_rof"
#include "nwnx_events"

void main()
{
    object oPC = OBJECT_SELF;
    object oGun1 = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    object oGun2 = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
   if (GetIsObjectValid(oGun1)==FALSE && GetIsObjectValid(oGun2)==FALSE)
        return;
    if (GetItemHasItemProperty(oGun1, ITEM_PROPERTY_UNLIMITED_AMMUNITION))
        return;
     if (GetItemHasItemProperty(oGun2, ITEM_PROPERTY_UNLIMITED_AMMUNITION))
        return;
     SendDebugMessage("ReloadFeat (" + IntToString(GetSpellId()) + ") Called by: " + GetName(OBJECT_SELF));
    SetLocalInt(oPC, "nd20Unequip", 1);
    DelayCommand(2.0, SetLocalInt(oPC, "nd20Unequip", 0));
    DestroyAmmoMag(OBJECT_SELF);
    ReloadAmmo(OBJECT_SELF, GetItemInSlot(INVENTORY_SLOT_RIGHTHAND));
}
