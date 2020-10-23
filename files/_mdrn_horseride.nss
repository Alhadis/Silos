#include "zep_inc_phenos"
void main()
{
    object oPC = GetPCSpeaker();

    object oTarget = GetLocalObject(oPC, "oMdrnTarget");
    if (oTarget != oPC)
    {
        if (GetDistanceBetween(oPC, oTarget)>5.0)
        {
            SendMessageToPC(oPC, "You must be within 5 meters to ride.");
            return;

        }


        zep_Mount(oPC, oTarget);
        SetLocalInt(oPC, "nMdrnRiding", 1);
        if (GetLocalInt(oTarget, "nMdrnCombatTrained") != 1)

            SetLocalInt(oPC, "nMdrnRidingBad", 1);
    }
    else
    {
        zep_Dismount(oPC);
        SetLocalInt(oPC, "nMdrnRiding", 0);
        SetLocalInt(oPC, "nMdrnRidingBad", 0);
        FloatingTextStringOnCreature("No longer taking cover in saddle.", oPC, TRUE);
        effect eEff = GetFirstEffect(oPC);
        while (GetIsEffectValid(eEff))
        {
            if (GetEffectType(eEff)==EFFECT_TYPE_ATTACK_DECREASE && GetEffectCreator(eEff)==oPC)
                RemoveEffect(oPC, eEff);
            if (GetEffectType(eEff)==EFFECT_TYPE_AC_INCREASE && GetEffectCreator(eEff)==oPC)
                RemoveEffect(oPC, eEff);
            if (GetEffectType(eEff)==EFFECT_TYPE_SAVING_THROW_INCREASE && GetEffectCreator(eEff)==oPC)
                RemoveEffect(oPC, eEff);
            eEff = GetNextEffect(oPC);
        }
        SetLocalInt(oPC, "nMdrnRideCover", 0);


    }
}
