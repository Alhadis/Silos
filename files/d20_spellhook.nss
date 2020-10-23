//Include spellhooking for use with FX class feats and abilities

#include "x2_inc_switches"

void main()
{
    object oPC = OBJECT_SELF;
    int nSpell = GetSpellId();
    int nSpellDC = GetSpellSaveDC();
    int nCastLevel= GetCasterLevel(oPC);

    //trigger perils of psionic use event script if used for spells too
    if (GetLocalInt(GetModule(),"nUsePsionicPerils") == 1)
    {
        SetLocalInt(oPC, "nPerilLevel", nSpellDC - 10);
        string sScript = GetLocalString(GetModule(),"sPerilsScript");
        ExecuteScript("sScript",oPC);
    }
}
