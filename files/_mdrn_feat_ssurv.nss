// Smart Survival
#include "inc_d20"
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
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(5), oPC);
}
