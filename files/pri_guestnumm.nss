//::///////////////////////////////////////////////
//:: Subtracts one from guest count
//:: pri_guestnumm
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

This is an DM only script called from the DM options
of the Suite Butler. It subtracts one from the guest
count. Useful if a guest logs out while still flagged
a guest and can be used to update the count so that a
player can still close the door after all other guests
have left.

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
iNGuests--;
SetLocalInt(oTrigger, "RSA_NGuests", iNGuests);
SendMessageToPC(oPC, "There are now "+IntToString(iNGuests)+" guest(s) in this suite.");
}
