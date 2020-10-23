//manifest psychic power Valor

#include "dmfi_dmw_inc"
#include "_mdrn_const"

void main()
{

    object oPC = OBJECT_SELF;

    //get, check and use up psionic points before manifestation

    int nWTPoints = GetLocalInt(oPC, "nWTPoints");
    int nPowerPoints = GetLocalInt(oPC, "nPowerPoints");
    if (nWTPoints > 0 && GetHasFeat(SKILL_WT_VALOR, oPC))
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
    int nRoll = d3();
    float fDur = (GetLevelByClass(CLASS_TYPE_TELEPATH, oPC) + GetLevelByClass(CLASS_TYPE_BATTLE_MIND, oPC)) * 60.0;
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSavingThrowIncrease(SAVING_THROW_ALL, nRoll, SAVING_THROW_TYPE_ALL), oPC, fDur);
    //signal the manifestation to psionics nearby
    SetLocalString(oPC, "sPowername", "Valor");
    ExecuteScript("_mdrn_psicrafttst",oPC);
    //trigger perils of psionic use event script if used
    if (GetLocalInt(GetModule(),"nUsePsionicPerils") == 1)
    {
        SetLocalInt(oPC, "nPerilLevel", 0);
        string sScript = GetLocalString(GetModule(),"sPerilsScript");
        ExecuteScript("sScript",oPC);
    }
}
