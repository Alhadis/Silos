// Frightful Presence

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    object oTarget ;

    oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 3.5, GetLocation(oPC), TRUE);


    int iTargetLevel;
    int iSourceLevel;
    int iDC;

    while( GetIsObjectValid(oTarget) )
    {
        if( GetIsEnemy(oTarget) && GetAbilityScore(oTarget, ABILITY_INTELLIGENCE) > 3 && GetLocalInt(oTarget, "nFrightImmune")==0 && oTarget != OBJECT_SELF )
        {
            iTargetLevel = GetHitDice(oTarget);
            iSourceLevel = GetHitDice(oPC);
            if( (iTargetLevel < iSourceLevel) )
            {
                if( GetHasFeat(FEAT_RENOWN) )
                    iDC = 10 + iSourceLevel/2 + GetAbilityModifier(ABILITY_CHARISMA, oPC) + 5;
                else
                    iDC = 10 + iSourceLevel/2 + GetAbilityModifier(ABILITY_CHARISMA, oPC);
                if( WillSave(oTarget, iDC, SAVING_THROW_WILL )==0 )
                {
                    FloatingTextStringOnCreature(GetName(oTarget)+" is frightened.", oPC, FALSE);
                    float  fEffectDuration = 6.0*(GetAbilityModifier(ABILITY_CHARISMA, OBJECT_SELF) + d6());
                    effect eDownAttackMisc = EffectAttackDecrease(2, ATTACK_BONUS_MISC);

                    effect eDownSave = EffectSavingThrowDecrease(2, SAVING_THROW_ALL);
                    effect eSkill = EffectSkillDecrease(2, SKILL_ALL_SKILLS);

                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDownAttackMisc, oTarget, fEffectDuration);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eDownSave, oTarget, fEffectDuration);
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSkill, oTarget, fEffectDuration);
                }
                else
                {
                    SetLocalInt(oTarget, "nFrightImmune", 1);
                    FloatingTextStringOnCreature(GetName(oTarget)+" resists the effect, and is immune for the rest of the day.", oPC, FALSE);
                }
            }
        }
    oTarget = GetNextObjectInShape(SHAPE_SPHERE, 3.5, GetLocation(OBJECT_SELF), TRUE);
    }
}
