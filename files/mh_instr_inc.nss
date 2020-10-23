#include "mh_constante"
#include "x2_inc_spellhook"


void ActiveModeCIMM(object oTarget)
{
    if(!GetLocalInt(oTarget,"use_CIMM") )
    {
    string sScript =  GetModuleOverrideSpellscript();
    if (sScript != "mh_spell_at_inst")
    {
        SetLocalString(GetModule(),"temp_spell_at_inst",sScript);
        SetModuleOverrideSpellscript("mh_spell_at_inst");
    }
    SetLocalInt(GetModule(),"nb_spell_at_inst",GetLocalInt(GetModule(),"nb_spell_at_inst")+1);
    FloatingTextStrRefOnCreature(16780240,oTarget);
    SetLocalInt(oTarget,"use_CIMM",TRUE);
    }
}

void UnactiveModeCIMM(object oTarget)
{
    if(GetLocalInt(oTarget,"use_CIMM") )
    {
    string sScript =  GetModuleOverrideSpellscript();
    SetLocalInt(GetModule(),"nb_spell_at_inst",GetLocalInt(GetModule(),"nb_spell_at_inst")-1);
    if (sScript == "mh_spell_at_inst" && GetLocalInt(GetModule(),"nb_spell_at_inst") == 0)
    {
        SetModuleOverrideSpellscript(GetLocalString(GetModule(),"temp_spell_at_inst"));
        GetLocalString(GetModule(),"temp_spell_at_inst");
        SetLocalString(GetModule(),"temp_spell_at_inst","");
    }
    FloatingTextStrRefOnCreature(16780241,oTarget);
    SetLocalInt(oTarget,"use_CIMM",FALSE);
    }
}
