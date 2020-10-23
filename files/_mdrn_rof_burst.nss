// New Burst script by Forrestwolf
#include "_mdrn_rof"
#include "_mdrn_char_core"

void main()
{
    object oPC = OBJECT_SELF;
    int nMode = GetLocalInt(oPC, "nBurstMode");
    if (nMode == 0)
    {
        AssignCommand(oPC, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectAttackDecrease(4, ATTACK_BONUS_MISC), oPC));
        FloatingTextStringOnCreature("Burst mode activated.", oPC, TRUE);
        SetLocalInt(oPC, "nBurstMode", 1);
    }
    else
    {
        FloatingTextStringOnCreature("Burst mode deactivated.", oPC, TRUE);
        effect eEff = GetFirstEffect(oPC);
        while (GetIsEffectValid(eEff))
        {
            if (GetEffectType(eEff)==EFFECT_TYPE_ATTACK_DECREASE && GetEffectCreator(eEff)==oPC)
                RemoveEffect(oPC, eEff);
            eEff = GetNextEffect(oPC);
        }
        SetLocalInt(oPC, "nBurstMode", 0);
    }
}
