// Defensive Position

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    int nMode = GetLocalInt(oPC, "nDefensivePositionMode");
    if (nMode == 0)
    {
        AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneImmobilize(), oPC));
        AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectACIncrease(2), oPC));
        AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSavingThrowIncrease(SAVING_THROW_REFLEX, 2), oPC));
        FloatingTextStringOnCreature("Defensive Position mode activated.", oPC, TRUE);
        SetLocalInt(oPC, "nDefensivePositionMode", 1);
     }
     else
     {
        FloatingTextStringOnCreature("Defensive Position mode deactivated.", oPC, TRUE);
        effect eEff = GetFirstEffect(oPC);
        while (GetIsEffectValid(eEff))
        {
            if (GetEffectType(eEff)==EFFECT_TYPE_CUTSCENEIMMOBILIZE && GetEffectCreator(eEff)==oPC && GetLocalInt(oPC, "nDeadAimMode")== 0)
                RemoveEffect(oPC, eEff);
            if (GetEffectType(eEff)==EFFECT_TYPE_AC_INCREASE && GetEffectCreator(eEff)==oPC)
                RemoveEffect(oPC, eEff);
                if (GetEffectType(eEff)==EFFECT_TYPE_SAVING_THROW_INCREASE && GetEffectCreator(eEff)==oPC)
                RemoveEffect(oPC, eEff);
            eEff = GetNextEffect(oPC);
        }
        SetLocalInt(oPC, "nDefensivePositionMode", 0);
     }
}
