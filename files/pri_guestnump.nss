//::///////////////////////////////////////////////
//:: Add one to Guest count
//:: pri_guestnump
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

This is a DM Script run by a Converstaional trigger
with the Suite Butler. It adds one to the guest count
and can be useful for error correcting if that count
is off for some reason.

*/
//:://////////////////////////////////////////////
//:: Created By: Russell S. Ahlstrom
//:: Created On: July 11, 2002
//:://////////////////////////////////////////////

void main()
{
object oPC = GetPCSpeaker();
object oTrigger = GetNearestObjectByTag("SuiteAutoDoor");
int iNGuests = GetLocalInt(oTrigger, "RSA_NGuests");
iNGuests++;
SetLocalInt(oTrigger, "RSA_NGuests", iNGuests);
SendMessageToPC(oPC, "There are now "+IntToString(iNGuests)+" guest(s) in this suite.");
}
