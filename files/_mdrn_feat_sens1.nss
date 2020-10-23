// Combat Sense 1

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    object oTarg = GetSpellTargetObject();
    int nMode = GetLocalInt(oPC, "nCombatSenseMode");
    if (nMode == 0)
    {
        AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectACDecrease(1), oTarg, 6.0));
        SetLocalInt(oPC, "nCombatSenseMode", 1);
        DelayCommand(6.0, SetLocalInt(oPC, "nCombatSenseMode", 0));
     }
     else
     {
        SendMessageToPC(oPC, "Combat Sense can only be used once a round.");

     }

}
