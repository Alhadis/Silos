#include "inc_d20"
// DM Widget for D20 Modern Actions
void main()
{
    object oPC = OBJECT_SELF;
    int nRep = GetLocalInt(oPC, "nReputation");
    location lTarg = GetItemActivatedTargetLocation();
    int nRoll = d20();
    int nTot = nRep + nRoll;
    int nDC = 24;
    object oTarg = GetItemActivatedTarget();
    SetLocalLocation(oPC, "lMdrnLocation", lTarg);
    SetLocalFloat(oPC, "fMdrnFacing", GetFacing(oPC));
    SetLocalLocation(oPC, "lMdrnLocSelf", GetLocation(oPC));
    SetLocalObject(oPC, "oMdrnTarget", oTarg);
    SetLocalObject(oPC, "dmfi_univ_target", oTarg);
    SetLocalLocation(oPC, "dmfi_univ_location", lTarg);
    SetLocalString(oPC, "dmfi_univ_conv", "pc_dicebag");

           AssignCommand(oPC, ActionStartConversation(oPC, "_mdrn_conv_wealt", TRUE));
}
