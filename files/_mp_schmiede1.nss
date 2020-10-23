#include "x2_inc_itemprop"
void main()
{
    object oPC = GetLastSpeaker();

    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND,oPC);


    object oTarget = GetNearestObjectByTag("mp_amboss1",oPC);

    SetLocalString(oTarget,"MP_CHARNAME",GetName(oPC));

    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyEnhancementBonus(1), oWeapon);

    //SetItemCursedFlag(oWeapon,TRUE);

    //object oCopy = SafeCopyItem(oWeapon,oTarget,TRUE);

    TakeGoldFromCreature(859,oPC);
    SetXP(oPC,GetXP(oPC)-1000);
}
