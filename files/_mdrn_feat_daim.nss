// Dead Aim

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    int nMode = GetLocalInt(oPC, "nDeadAimMode");
    if (nMode == 0)
    {
        AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneImmobilize(), oPC));
        AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectAttackIncrease(2, ATTACK_BONUS_MISC), oPC));
        FloatingTextStringOnCreature("Dead Aim mode activated.", oPC, TRUE);
        SetLocalInt(oPC, "nDeadAimMode", 1);
     }
     else
     {
        FloatingTextStringOnCreature("Dead Aim mode deactivated.", oPC, TRUE);
        effect eEff = GetFirstEffect(oPC);
        while (GetIsEffectValid(eEff))
        {
            if (GetEffectType(eEff)==EFFECT_TYPE_CUTSCENEIMMOBILIZE && GetEffectCreator(eEff)==oPC && GetLocalInt(oPC, "nDefensivePositionMode")==0)
                RemoveEffect(oPC, eEff);
            if (GetEffectType(eEff)==EFFECT_TYPE_ATTACK_INCREASE && GetEffectCreator(eEff)==oPC)
                RemoveEffect(oPC, eEff);
            eEff = GetNextEffect(oPC);
        }
        SetLocalInt(oPC, "nDeadAimMode", 0);
     }

}
