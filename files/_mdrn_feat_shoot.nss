// Sharpshooting  - REPLACED by changes to nw_c2_default5.

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    object oTarg = GetSpellTargetObject();
    int nMode = GetLocalInt(oPC, "nSharpShootMode");
    if (nMode == 0)
    {
        AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectACDecrease(2), oTarg, 6.0));
        FloatingTextStringOnCreature(GetName(oPC)+" takes careful aim at "+GetName(oTarg), oPC, TRUE);
        SetLocalInt(oPC, "nSharpShootMode", 1);
        DelayCommand(6.0, SetLocalInt(oPC, "nSharpShootMode", 0));
     }
     else
     {
        SendMessageToPC(oPC, "Sharpshooter can only be used once a round.");

     }

}
