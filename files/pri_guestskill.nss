//::///////////////////////////////////////////////
//:: Toggels Butler attacking Players in Sleep Variable
//:: pri_guestskill
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

This is a DM only script that is run when the DM
gives the command in the DM Butler Conversation.
This can be used to assisinate the players in their
sleep (well, try to) and could make for an interesting
quest opener. Running this script toggels it on if off and
off if on. A message is sent to the DM so the DM knows
if it is on or off.

The next time the player rests in his Suite, the Butler will
attack the player.

*/
//:://////////////////////////////////////////////
//:: Created By: Russell S. Ahlstrom
//:: Created On: July 11, 2002
//:://////////////////////////////////////////////

#include "pri_inc"
#include "pri_text"

void main()
{
object oPC = GetPCSpeaker();

GetInnArea(oPC);

string sButler = GetLocalString(oPC, "RSA_Butler");

object oButler = GetObjectByTag(sButler);

int iKill = GetLocalInt(oButler, "RSA_KillInSleep");

if (iKill == 1)
 {
  SetLocalInt(oButler, "RSA_KillInSleep", 0);
  SendMessageToPC(oPC, KILLOFF);
  return;
 }
SetLocalInt(oButler, "RSA_KillInSleep", 1);
SendMessageToPC(oPC, KILLON);
}
