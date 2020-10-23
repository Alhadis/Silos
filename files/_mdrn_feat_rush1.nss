#include "inc_d20"
// Adrenaline Rush 1

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
    int nRoll = d4(1)+1;
    float fDur = 6.0*GetLevelByClass(CLASS_TYPE_DAREDEVIL, oPC);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAbilityIncrease(ABILITY_DEXTERITY, nRoll), oPC, fDur);


}
