#include "d0_functions_inc"
void main()
{
   object oPC     = GetPCSpeaker();
   object oItem   = GetLocalObject(GetPCSpeaker(), "stool_target_object");
   object oTarget = GetLocalObject(GetPCSpeaker(), "stool_fix_object");
   string sTag    = GetSubString(GetName(oTarget), 1, 4);

   SetLocalString(oItem, "NameCopy_ColorTag", sTag);
   SetCustomToken(11882, "<"+sTag+">"+sTag+"</c>");
}
