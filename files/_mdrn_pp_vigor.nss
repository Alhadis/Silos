//manifest psychic power Vigor

#include "dmfi_dmw_inc"
#include "_mdrn_const"

void main()
{

    object oPC = OBJECT_SELF;

    //get, check and use up psionic points before manifestation

    int nWTPoints = GetLocalInt(oPC, "nWTPoints");
    int nPowerPoints = GetLocalInt(oPC, "nPowerPoints");
    if (nPowerPoints > 1)
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
    int nRoll = 3 + d6();
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectTemporaryHitpoints(nRoll), oPC, 60.0);
    //signal the manifestation to psionics nearby
    SetLocalString(oPC, "sPowername", "Vigor");
    ExecuteScript("_mdrn_psicrafttst",oPC);
    //trigger perils of psionic use event script if used
    if (GetLocalInt(GetModule(),"nUsePsionicPerils") == 1)
    {
        SetLocalInt(oPC, "nPerilLevel", 1);
        string sScript = GetLocalString(GetModule(),"sPerilsScript");
        ExecuteScript("sScript",oPC);
    }
}
