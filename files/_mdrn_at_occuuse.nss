#include "inc_d20"
void main()
{
    object oPC = GetPCSpeaker();
     SetLocalInt(oPC, "nMdrnOccuSet", 1);
     AssignCommand(oPC, ActionEquipItem(GetItemPossessedBy(oPC, "occupation"), INVENTORY_SLOT_LEFTRING));
}
