//manifest psychic power Detect Psionics

#include "dmfi_dmw_inc"
#include "_mdrn_const"

void main()
{

    object oPC = OBJECT_SELF;

    //get, check and use up psionic points before manifestation

    int nWTPoints = GetLocalInt(oPC, "nWTPoints");
    int nPowerPoints = GetLocalInt(oPC, "nPowerPoints");
    if (nWTPoints > 0 && GetHasFeat(SKILL_WT_DETECTPSIONICS, oPC))
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
    int nRoll = d20();
    int nMod = GetSkillRank(SKILL_CONCENTRATION,oPC);
    string sString = ColorText("Check, Roll 1d20:" + IntToString(nRoll) + " + Modifier:" + IntToString(nMod) + " = Total:" + IntToString(nRoll + nMod), "cyan");
    AssignCommand(oPC, SpeakString(sString,TALKVOLUME_SILENT_SHOUT));
    if (nRoll > 30)
        sString = ColorText("Your psionic abilities reveal full information concerning psionic auras in the immediate area.", "cyan");
    else if (nRoll > 20)
        sString = ColorText("Your psionic abilities reveal number of different psionic auras, and the strength of the strongest aura, in the immediate area.", "cyan");
    else if (nRoll > 15)
        sString = ColorText("Your psionic abilities can tell you whether there is a psionic aura in the immediate area.", "cyan");
    else
        sString = ColorText("Your psionic abilities are clouded and fail you.", "cyan");
    //report the result
    AssignCommand(oPC, SpeakString(sString,TALKVOLUME_SILENT_SHOUT));
    sString = ColorText("(You have " + IntToString(nPowerPoints) + " remaining.)", "cyan");
    AssignCommand(oPC, SpeakString(sString,TALKVOLUME_SILENT_SHOUT));
}
