// Compelling Performance

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    object oTarget = GetSpellTargetObject();
    float fDur = 1.0*(d4()+1);






    int iSourceLevel = GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC);
    int iDC = 10+iSourceLevel+GetAbilityModifier(ABILITY_CHARISMA, oPC) ;


    if(WillSave(oTarget, iDC, SAVING_THROW_TYPE_MIND_SPELLS )==0)
    {

        FloatingTextStringOnCreature(GetName(oTarget)+" despairs.", oPC, TRUE);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectAttackDecrease(2), oTarget, fDur);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSavingThrowDecrease(SAVING_THROW_ALL, 2), oTarget, fDur);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillDecrease(SKILL_ALL_SKILLS, 2), oTarget, fDur);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDamageDecrease(2), oTarget, fDur);



    }
    else
    {
         FloatingTextStringOnCreature(GetName(oTarget)+" is not affected.", oPC, TRUE);
            return;
    }


}
