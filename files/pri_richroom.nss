//::///////////////////////////////////////////////
//:: Sells a Suite Room to the Player and flags as Full
//:: pri_richroom.nss
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

This script is called by the player from the InnKeeper
Conversation. The InnKeeper scans through his Local Variables
to find out if the suit is full. If yes, cancels selling of suite.

If Suite is not full, suite is sold to player and player is marked
as the renter of the suite using the "BoughtSuite" local variable.

The player is also marked with having already bought a room and
can not buy another room until he uses the first one.

*/
//:://////////////////////////////////////////////
//:: Created By: Russell S. Ahlstrom
//:: Created On: July 10, 2002
//:://////////////////////////////////////////////

#include "pri_inc"

void main()
{
object oPC = GetPCSpeaker();

string sWhereRoom = "Error in _rsa_normalroom script!";
string sFull = "RSA_FullSuite";

GetInnArea(oPC);

int iGold = GetGold(oPC);
int iPrice = GetLocalInt(oPC, "RSA_PriceRich");

string sInnKeeper = GetLocalString(oPC, "RSA_InnKeeper");
string sKey = GetLocalString(oPC, "RSA_KeyRich");
string sHaveRoom = GetLocalString(oPC, "RSA_HaveRoom");
string sNoMoreSuite = GetLocalString(oPC, "RSA_NoMoreSuite");
string sNotEnoughGold = GetLocalString(oPC, "RSA_NotEnoughGoldR");
sWhereRoom = GetLocalString(oPC, "RSA_WhereRich");

object oInnKeeper = GetObjectByTag(sInnKeeper);
int iFull = GetLocalInt(oInnKeeper, sFull);

int iHasRoom = GetLocalInt(oPC, "RSA_HasRoom");

if (iHasRoom == 1)
 {
  ActionSpeakString(sHaveRoom);
  return;
 }

//Checks to see if Suite Full

if(!(iFull < 1))
{
ActionSpeakString(sNoMoreSuite);
return;
}

//End Check

iFull++;
if (iGold - iPrice >= 0)
 {
  TakeGoldFromCreature(iPrice, oPC, TRUE);
  CreateItemOnObject(sKey, oPC, 1);
  ActionSpeakString(sWhereRoom);
  SetLocalInt(oInnKeeper, sFull, iFull);
  SetLocalInt(oPC, "RSA_HasRoom", 1);
  SetLocalInt(oPC, "RSA_BoughtSuite", 2);
 }
else
 {
  ActionSpeakString(sNotEnoughGold);
 }
}
