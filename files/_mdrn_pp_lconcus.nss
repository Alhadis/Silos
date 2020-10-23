//manifest psychic power Lesser Concussion
#include "dmfi_dmw_inc"
#include "_mdrn_const"

void main()
{

    object oPC = OBJECT_SELF;

    //get, check and use up psionic points before manifestation
    int nPowerPoints = GetLocalInt(oPC, "nPowerPoints");
    if (nPowerPoints > 0)
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
    int nDamage = d6();
    //fortitude save for half damage, DC = 10 + power level + caster's ability modifier for power
    int nDC = 10 + 1 + GetAbilityModifier(ABILITY_CONSTITUTION,oPC);
    int nSaveroll = d20();
    int nFort = GetFortitudeSavingThrow(oTarget);
    string sString = "Fort Save: " + IntToString(nSaveroll) + " + " + IntToString(nFort) + " = " + IntToString(nSaveroll+nFort) + "vs DC" + IntToString(nDC);
    sString = ColorText(sString, "cyan");
    AssignCommand(oPC, SpeakString(sString,TALKVOLUME_SILENT_SHOUT));
    //if the save is made halve the damage
    if (nSaveroll + nFort >= nDC) nDamage = nDamage / 2;
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_LRG_WIMP), oPC, 1.5);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL), oTarget);

    //signal the manifestation to psionics nearby
    SetLocalString(oPC, "sPowername", "Lesser Concussion");
    ExecuteScript("_mdrn_psicrafttst",oPC);
    //trigger perils of psionic use event script if used
    if (GetLocalInt(GetModule(),"nUsePsionicPerils") == 1)
    {
        SetLocalInt(oPC, "nPerilLevel", 0);
        string sScript = GetLocalString(GetModule(),"sPerilsScript");
        ExecuteScript("sScript",oPC);
    }
}
