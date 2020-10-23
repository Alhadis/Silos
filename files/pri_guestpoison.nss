//::///////////////////////////////////////////////
//:: Tell Butler to Poison the Players' Food
//:: pri_guestpoison
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

DM Option for the Suite Butler. This scritp toggels
a Local Variable on the Butler to either on or off.
If the Variable is toggeled on the Butler will posion
the players' food the next time they ask him to cook
for them.

Just for kicks or could make an intersting quest.

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

int iKill = GetLocalInt(oButler, "RSA_PoisonFood");

if (iKill == 1)
 {
  SetLocalInt(oButler, "RSA_PoisonFood", 0);
  SendMessageToPC(oPC, POISONOFF);
  return;
 }
SetLocalInt(oButler, "RSA_PoisonFood", 1);
SendMessageToPC(oPC, POISONON);
}
