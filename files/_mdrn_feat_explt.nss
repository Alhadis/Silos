// Exploit Weakness

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();
    if (GetLocalInt(oTarget, "nExploited")==1)
    {
           FloatingTextStringOnCreature(GetName(oTarget)+" has already had a weakness exploited; the attempt fails.", oPC, FALSE);
            return;

    }


    int nCheck = d20()+GetAbilityModifier(ABILITY_INTELLIGENCE, oPC)+GetLevelByClass(CLASS_TYPE_SMART, oPC) ;
    if (nCheck < 15)
    {
         FloatingTextStringOnCreature("Intelligence check: "+IntToString(nCheck)+" vs. DC 15; it fails.", oPC, FALSE);
            return;
    }

    else
    {
                    SetLocalInt(oTarget, "nExploited", 1);
                    DelayCommand(300.0, SetLocalInt(oTarget, "nExploited", 0));
                    FloatingTextStringOnCreature(GetName(oTarget)+" has a weakness to exploit.", oPC, FALSE);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectACDecrease(GetAbilityModifier(ABILITY_INTELLIGENCE, oPC)) , oTarget, 300.0);
    }



}
