//manifest psychic power Finger of Fire

#include "dmfi_dmw_inc"
#include "_mdrn_const"

void main()
{

    object oPC = OBJECT_SELF;

    //get, check and use up psionic points before manifestation

    int nWTPoints = GetLocalInt(oPC, "nWTPoints");
    int nPowerPoints = GetLocalInt(oPC, "nPowerPoints");
    if (nWTPoints > 0 && GetHasFeat(SKILL_WT_FINGEROFFIRE, oPC))
    {
        nWTPoints = nWTPoints - 1;
        SetLocalInt(oPC, "nWTPoints", nWTPoints);
    }
    else if (nPowerPoints > 0)
    {
        nPowerPoints = nPowerPoints - 1;
        SetLocalInt(oPC, "nPowerPoints", nPowerPoints);
    }
    else
    {
        string sString = ColorText("Your psionic abilities are exhausted and need rest.", "cyan");
        AssignCommand(oPC, SpeakString(sString,TALKVOLUME_SILENT_SHOUT));
        return;
    }

    //manifest the power
    object oTarget = GetSpellTargetObject();
    int nTouch = TouchAttackRanged(oTarget);
    if (nTouch !=0)
    {
        int nRoll = d4();
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nRoll, DAMAGE_TYPE_FIRE, DAMAGE_POWER_NORMAL), oTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_FIRE_W_SILENT, oPC, BODY_NODE_HAND, FALSE), oPC, 0.5);
    }
    //signal the manifestation to psionics nearby
    SetLocalString(oPC, "sPowername", "Far Punch");
    ExecuteScript("_mdrn_psicrafttst",oPC);
    //trigger perils of psionic use event script if used
    if (GetLocalInt(GetModule(),"nUsePsionicPerils") == 1)
    {
        SetLocalInt(oPC, "nPerilLevel", 0);
        string sScript = GetLocalString(GetModule(),"sPerilsScript");
        ExecuteScript("sScript",oPC);
    }
}
