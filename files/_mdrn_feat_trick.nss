// Trick

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();
    effect eSil = GetFirstEffect(oTarget);
    if (GetLocalInt(oTarget, "nTricked")==1)
    {
         FloatingTextStringOnCreature(GetName(oTarget)+" has already been tricked recently; the trick cannot work.", oPC, TRUE);
         return;

    }
    else
    {
        SetLocalInt(oTarget, "nTricked", 1);
        DelayCommand(300.0, SetLocalInt(oTarget, "nTricked", 0));
    }
    while (GetIsEffectValid(eSil))
    {
        if (GetEffectType(eSil)==EFFECT_TYPE_SILENCE)
        {
            FloatingTextStringOnCreature(GetName(oTarget)+" cannot hear; the trick cannot work.", oPC, TRUE);
            return;
        }
        eSil = GetNextEffect(oTarget);
    }
    if (GetRacialType(oTarget)==RACIAL_TYPE_ANIMAL)
    {
            FloatingTextStringOnCreature("Animals cannot be affected by the Trick feat.", oPC, TRUE);
            return;
    }
    int iSourceLevel = GetLevelByClass(CLASS_TYPE_SMART, oPC);
    int iDC = 10+iSourceLevel+GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
    int nCheck = d20()+GetAbilityModifier(ABILITY_INTELLIGENCE, oPC);
    if (nCheck < 15)
    {
         FloatingTextStringOnCreature("Intelligence check: "+IntToString(nCheck)+" vs. DC 15; it fails.", oPC, FALSE);
            return;
    }
    if(WillSave(oTarget, iDC, SAVING_THROW_TYPE_MIND_SPELLS )==0)
    {

                    FloatingTextStringOnCreature(GetName(oTarget)+" is tricked.", oPC, TRUE);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDazed(), oTarget, 6.0);
    }
    else
    {
         FloatingTextStringOnCreature(GetName(oTarget)+" resists the trick.", oPC, TRUE);
            return;
    }
}
