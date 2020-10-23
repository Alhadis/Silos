#include "inc_d20"

void main()
{
    object oPC = GetItemActivator();
    object oGun = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    if (GetBaseItemType(oGun)==8 || GetBaseItemType(oGun)==7)
    {


         object oNewGun = CopyItemAndModify(oGun, ITEM_APPR_TYPE_WEAPON_MODEL, ITEM_APPR_WEAPON_MODEL_TOP, 6, TRUE);
         AssignCommand(oPC, ClearAllActions());
         AssignCommand(oPC, ActionEquipItem(oNewGun, INVENTORY_SLOT_RIGHTHAND));
         DestroyObject(oGun, 1.0);
         AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyAttackBonus(1), oNewGun);
         AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyBonusFeat(IP_CONST_FEAT_DARKVISION), oNewGun);
          DestroyObject(GetItemActivated());

    }
    else
    {
        SendMessageToPC(oPC, "This can only be used on a rifle.");
        return;

    }
}
