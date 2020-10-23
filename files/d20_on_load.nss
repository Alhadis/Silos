/*
    The D20 Modern On Mod Load event script
    Sets module variables
*/
#include "x2_inc_switches"
#include "nwnx_events"

void main()
{

    // this stops dropping of random NWN treasure
    SetLocalInt(GetModule(), "X2_L_NOTREASURE", TRUE);
    //If you want PC's to be able to use DMFI DM-only wands, set dmfi_PCUse equal to TRUE.
    SetLocalInt(GetModule(), "dmfi_PCUse", FALSE);
    //If you want to limit PC's health gain from resting set to 1.
    SetLocalInt(GetModule(), "nMdrnRest", 0);
    //If you want PC's to have limits to rest time set to 1.
    SetLocalInt(GetModule(), "nModernTimeRest", 0);
    //If you want PC's to use the modern wealth system set to 1.
    SetLocalInt(GetModule(), "nUseModernWealth", 1);
    //If you want PC's to use the modern wealth system set to 1.
    SetLocalInt(GetModule(), "nUsePsionicPerils", 1);
    SetLocalString(GetModule(),"sPerilsScript", "_mdrn_psiperils");
    //Include spellhooking for use with FX class feats and abilities
    SetLocalString(GetModule(),"X2_S_UD_SPELLSCRIPT", "d20_spellhook");
    //Initialises sly music wand system
    ExecuteScript("sly_music_onload",GetModule());
    SetModuleSwitch(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS, TRUE);
    // Event subscription NWNX
    //NWNX_Events_SubscribeEvent("NWNX_ON_USE_FEAT_BEFORE","anim_reload");
}


