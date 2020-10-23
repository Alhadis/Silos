// Give starting occupation
#include "inc_d20"
void main()
{
    object oPC = GetPCSpeaker();
    object oToken = GetItemPossessedBy(oPC, "occupation");
    if (GetIsObjectValid(oToken))

        DestroyObject(oToken);

    oToken = CreateItemOnObject("occupation", oPC);
    AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyBonusFeat(IP_CONST_FEAT_ACADEMIC), oToken);
}
