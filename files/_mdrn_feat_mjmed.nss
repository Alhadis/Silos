// Major Medical Miracle

#include "inc_d20"

void main()
{

    object oPC = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();
    int nHealed = d6()-GetCurrentHitPoints(oTarget);
    effect eHeal = EffectHeal(nHealed);
    effect eRaise = EffectResurrection();
    if (nHealed < 0)
                nHealed = 0;
    int nSkill1 = GetSkillRank(SKILL_HEAL, oPC);
    if (GetLocalInt(oTarget, "nd203MinutesDead")==1)
    {
        FloatingTextStringOnCreature(GetName(oTarget)+" has been dead too long for a major medical miracle.", oTarget);
        return;
    }

    if (GetLocalInt(oTarget, "nd20NoMiracle")==0)
    {
        if (GetIsSkillSuccessful(oPC, SKILL_HEAL, 40)==TRUE)
        {
            if (FortitudeSave(oTarget, 20) > 0)
            {
                if (GetIsDead(oTarget))
                {
                    //Declare major variables

                    //Apply the heal, raise dead
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eRaise, oTarget);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
                }
            }
            else
            {
                FloatingTextStringOnCreature(GetName(oTarget)+" cannot be revived.", oPC);
                SetLocalInt(oTarget, "nd20NoMiracle", 1);
            }
        }
        else
            FloatingTextStringOnCreature(GetName(oPC)+" fails to perform a major medical miracle.", oPC);
    }
    else
         FloatingTextStringOnCreature(GetName(oTarget)+" cannot be revived.", oPC);

}

