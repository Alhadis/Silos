#include "inc_d20"
// Tactical Aid

void main()
{
    object oPC = OBJECT_SELF;
    object oAP = GetItemPossessedBy(oPC, "ActionPoint");
    if (GetIsObjectValid(oAP)==FALSE)
    {
        SendMessageToPC(oPC, "No Action Points remaining.");
        return;
    }
    SetPlotFlag(oAP, FALSE);
    int nStack = GetItemStackSize(oAP);
    if (nStack > 1)
        SetItemStackSize(oAP, nStack - 1);
    else
        DestroyObject(oAP);
    DelayCommand(0.5, SetPlotFlag(oAP, TRUE));
    float fDur =3.0*GetLevelByClass(CLASS_TYPE_SOLDIER, oPC);
    object oTarg = GetFirstFactionMember(oPC);
    while (GetIsObjectValid(oTarg))
    {
        if (GetDistanceToObject(oTarg) < 30.0)
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAttackIncrease(2), oTarg, fDur);
        }
        oTarg = GetNextFactionMember(oPC, TRUE);
    }
}
