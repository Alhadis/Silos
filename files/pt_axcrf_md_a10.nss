//—брос страниц на первые

#include "pt_axcrf_md_cons"
#include "pt_frame000"


void main()
{
object oModule=GetModule();
object oActivator=GetPCSpeaker();

SetLocalInt(oActivator, "pt_craft_dialTok"+IntToString(pt_CUSTTOK_NODE_ONE)+"_Index", -1);
SetLocalInt(oActivator, "pt_craft_dialTok"+IntToString(pt_CUSTTOK_NODE_TWO)+"_Index", -1);
SetLocalInt(oActivator, "pt_craft_dialTok"+IntToString(pt_CUSTTOK_NODE_THREE)+"_Index", -1);
SetLocalInt(oActivator, "pt_craft_dialTok"+IntToString(pt_CUSTTOK_NODE_FOUR)+"_Index", -1);
SetLocalInt(oActivator, "pt_craft_dialTok"+IntToString(pt_CUSTTOK_NODE_FIVE)+"_Index", -1);


SetLocalInt(oActivator, "pt_craft_dialMinI", 0);
SetLocalInt(oActivator, "pt_craft_dialMaxI", 0);
}
