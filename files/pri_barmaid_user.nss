//::///////////////////////////////////////////////
//:: Custom File for the Barmaid to make her wait tables and respond to commands
//:: pri_barmaid_user
//:: Copyright (c) 2002 Shepherd Software Inc.
//:://////////////////////////////////////////////
/*

This script borrows from the barmaid script in the World Builder
Guide and many other similar barmaid scripts.

*/
//:://////////////////////////////////////////////
//:: Created By: Russell S. Ahlstrom
//:: Created On: July 11, 2002
//:://////////////////////////////////////////////

#include "pri_inc"

void main()
{

int iTalk = GetListenPatternNumber();
int iUser = GetUserDefinedEventNumber();


object oPC = GetLastSpeaker();
object oBarmaid = OBJECT_SELF;

string sReturnOrder = "";

GetInnArea(oBarmaid);

int iRandom = GetLocalInt(oBarmaid, "RSA_RandomBar");

string sInnKeeper = GetLocalString(oBarmaid, "RSA_InnKeeper");
string sServant = GetLocalString(oBarmaid, "RSA_Servant");
string sBar = GetLocalString(oBarmaid, "RSA_BarWP");
string sWait = GetLocalString(oBarmaid, "RSA_WaitWP");
string sAsk1 = GetLocalString(oBarmaid, "RSA_Ask1");
string sReturn1 = GetLocalString(oBarmaid, "RSA_Return1");
string sAsk2 = GetLocalString(oBarmaid, "RSA_Ask2");
string sReturn2 = GetLocalString(oBarmaid, "RSA_Return2");
string sAsk3 = GetLocalString(oBarmaid, "RSA_Ask3");
string sReturn3 = GetLocalString(oBarmaid, "RSA_Return3");
string sAsk4 = GetLocalString(oBarmaid, "RSA_Ask4");
string sReturn4 = GetLocalString(oBarmaid, "RSA_Return4");
string sBarmaidTalk = GetLocalString(oBarmaid, "RSA_BarmaidTalk");

int nRandom = Random(iRandom);
object oCustomer = GetLocalObject(oBarmaid, "RSA_Customer");

object oBar = GetObjectByTag(sBar);
object oWaitPoint = GetObjectByTag(sWait);

 if (iUser == 1001)
 {
  if (!GetIsObjectValid(oCustomer) && (GetLocalInt(oBarmaid, "RSA_BarmaidAction") < 1))
  {
   // Randomly seek out up to the nRandom-nearest non-PC
   oCustomer = GetNearestCreature (CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, oBarmaid, nRandom);
   //Make sure she's not going to ask the Barkeeper if he wants a drink
   if (oCustomer != GetObjectByTag(sInnKeeper) && oCustomer != GetObjectByTag(sServant) && oCustomer != oBarmaid && GetIsObjectValid(oCustomer) )
   {
    // Move to Customer and ask what he/she wants
    SetLocalInt(oBarmaid, "RSA_BarmaidAction", 1);
    SetLocalObject(oBarmaid, "RSA_Customer", oCustomer);
    ActionMoveToObject(oCustomer);
    switch(Random(4))
    {
     case 0:
      ActionSpeakString(sAsk1);
      sReturnOrder = sReturn1;
      break;
     case 1:
      ActionSpeakString(sAsk2);
      sReturnOrder = sReturn2;
      break;
     case 2:
      ActionSpeakString(sAsk3);
      sReturnOrder = sReturn3;
      break;
     case 3:
      ActionSpeakString(sAsk4);
      sReturnOrder = sReturn4;
      break;
    }
    ActionWait(3.0); //Wait 3 secs.
    // Move to the Bar to get the Drinks
    ActionDoCommand (SetLocalInt(oBarmaid, "RSA_BarmaidAction", 2));
    ActionMoveToObject(oBar);
    ActionWait(5.0);//Wait 5 secs.
    // Move back to the Customer and give him/her the drinks
    ActionDoCommand(SetLocalInt(oBarmaid, "RSA_BarmaidAction", 3));
    ActionMoveToObject(oCustomer);
    ActionSpeakString(sReturnOrder);
    ActionWait(2.0);//Wait 2 secs.
    ActionDoCommand (SetLocalObject(oBarmaid, "RSA_Customer", OBJECT_INVALID));
    // Move back to the other side of the bar to take a needed break
    ActionMoveToObject(oWaitPoint);
    ActionWait(2.0);//Wait 2 secs.
    ActionDoCommand (SetLocalInt(oBarmaid, "RSA_BarmaidAction", 0));
   }
  }
 }

if (iUser == 1004)
 {
  AssignCommand(oBarmaid, ClearAllActions());
  SetLocalObject(oBarmaid, "RSA_Customer", OBJECT_INVALID);
  SetLocalInt(oBarmaid, "RSA_BarmaidAction", 0);
  if (iTalk == 2001 || iTalk == 2002)
   {
    ActionWait(3.0);
    AssignCommand(oBarmaid, ActionMoveToObject(oPC));
    AssignCommand(oBarmaid, ActionStartConversation(oPC, sBarmaidTalk, TRUE));
   }

return;
 }
}
