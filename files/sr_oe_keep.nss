#include "sr_subracedark"
void main()
{
    ExploreAreaForPlayer(OBJECT_SELF, GetEnteringObject());

    int iFirstTime = GetLocalInt(GetEnteringObject(), "FirstTime");
    string sSubItem = GetLocalString(GetEnteringObject(), "sSubItem");

    if (!iFirstTime && GetIsPC(GetEnteringObject()) && sSubItem != "None") {
        SetLocalInt(GetEnteringObject(), "FirstTime", TRUE);
        object oEquiped = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, GetEnteringObject());
        if (!GetIsObjectValid(oEquiped)) {
            object oItem = GetFirstItemInInventory(GetEnteringObject());
            while (GetIsObjectValid(oItem)) {
                if (oItem == GetObjectByTag(sSubItem))
                    DestroyObject(oItem);
                oItem = GetNextItemInInventory(GetEnteringObject());
            }
        }
    }
    if (GetSubRace(GetEnteringObject()) == "Gray Dwarf"
            || GetSubRace(GetEnteringObject()) == "Drow Elf")
        SubRaceDark(GetEnteringObject());
}
