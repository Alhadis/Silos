//::///////////////////////////////////////////////
//:: Name ohs_i0_goals
//:: Copyright (c) 2004 OldMansBeard
//:://////////////////////////////////////////////
/*
   Utility functions to maintain personal goals in OHS
*/
//:://////////////////////////////////////////////
//:: Created By: OldMansBeard
//:: Created On: 2005-04-21
//:://////////////////////////////////////////////

#include "ohs_i0_toolkit"

const int OHS_GOAL_INVALID       = 0;
const int OHS_GOAL_POWER         = 1;
const int OHS_GOAL_MONEY         = 2;
const int OHS_GOAL_SEX           = 3;
const int OHS_GOAL_COMPANIONSHIP = 4;
const int OHS_GOAL_SECURITY      = 5;
const int OHS_GOAL_FUN           = 6;
const int OHS_GOAL_USER_DEFINED  = 7;

// Test if oCreature has iGoal as a primary or secondary goal
// Return 1 if primary, 2 if secondary, 0 otherwise
int OHS_HasGoal(object oCreature, int iGoal);

// Assign iGoal to oCreature.
// If oCreature has no primary goal yet, make it primary
// else if no secondary goal yet, make it secondary
// else do nothing
void OHS_SetGoal(object oCreature, int iGoal);

// Get the flirt level of oSubject regarding oObject
int OHS_GetFlirtLevel(object oSubject, object oObject);

// Set the flirt level of oSubject regarding oObject to nFlirt
void OHS_SetFlirtLevel(object oSubject, object oObject, int nFlirt);

/*******************/
/* Implementations */
/*******************/

// Test if oCreature has iGoal as a primary or secondary goal
// Return 1 if primary, 2 if secondary, 0 otherwise
int OHS_HasGoal(object oCreature, int iGoal)
{
  int iFlags = GetLocalInt(oCreature,"OHS_L_R2_FLAGS");
  int iPrimaryGoal = (iFlags >> 1) & 0x7;
  int iSecondaryGoal = (iFlags >> 4) & 0x7;
  if (iPrimaryGoal == iGoal) return 1;
  else if (iSecondaryGoal == iGoal) return 2;
  else return 0;
}

// Assign iGoal to oCreature.
// If oCreature has no primary goal yet, make it primary
// else if no secondary goal yet, make it secondary
// else do nothing
void OHS_SetGoal(object oCreature, int iGoal)
{
  int iFlags = GetLocalInt(oCreature,"OHS_L_R2_FLAGS");
  int iPrimaryGoal = (iFlags >> 1) & 0x7;
  int iSecondaryGoal = (iFlags >> 4) & 0x7;
  iGoal = iGoal & 0x7;
  if (iPrimaryGoal==OHS_GOAL_INVALID)
  {
    iFlags = iFlags | ((iGoal << 1) & 0xE);
    SetLocalInt(oCreature,"OHS_L_R2_FLAGS",iFlags);
  }
  else if (iPrimaryGoal!=iGoal && iSecondaryGoal==OHS_GOAL_INVALID)
  {
    iFlags = iFlags | ((iGoal << 4) & 0x70);
    SetLocalInt(oCreature,"OHS_L_R2_FLAGS",iFlags);
  }
}

// Get the flirt level of oSubject regarding oObject
int OHS_GetFlirtLevel(object oSubject, object oObject)
{
  string sDelimitedName = ","+GetTrueName(oObject)+",";
  string sNoList = GetLocalString(oSubject,"OHS_LIST_NOFLIRT");
  string sList1 = GetLocalString(oSubject,"OHS_LIST_FLIRT_1");
  string sList2 = GetLocalString(oSubject,"OHS_LIST_FLIRT_2");
  string sList3 = GetLocalString(oSubject,"OHS_LIST_FLIRT_3");

  if (FindSubString(sNoList,sDelimitedName)>=0) return -1;
  else if (FindSubString(sList3,sDelimitedName)>=0) return 3;
  else if (FindSubString(sList2,sDelimitedName)>=0) return 2;
  else if (FindSubString(sList1,sDelimitedName)>=0) return 1;
  else // Check for pre-V1.4.1 characters
  {
    int nFlirt = GetLocalInt(oSubject,"OHS_FLIRTED_"+GetTrueName(oObject));
    if (nFlirt!=0) OHS_SetFlirtLevel(oSubject,oObject,nFlirt);
    return nFlirt;
  }
}

// Set the flirt level of oSubject regarding oObject to nFlirt
void OHS_SetFlirtLevel(object oSubject, object oObject, int nFlirt)
{
  string sList;
  string sDelimitedName = ","+GetTrueName(oObject)+",";
  switch (nFlirt)
  {
    case -1:
      sList = GetLocalString(oSubject,"OHS_LIST_NOFLIRT");
      if (FindSubString(sList,sDelimitedName)==-1)
      {
        SetLocalString(oSubject,"OHS_LIST_NOFLIRT",sList+sDelimitedName);
      }
      break;
    case 3:
      sList = GetLocalString(oSubject,"OHS_LIST_FLIRT_3");
      if (FindSubString(sList,sDelimitedName)==-1)
      {
        SetLocalString(oSubject,"OHS_LIST_FLIRT_3",sList+sDelimitedName);
      }
    case 2:
      sList = GetLocalString(oSubject,"OHS_LIST_FLIRT_2");
      if (FindSubString(sList,sDelimitedName)==-1)
      {
        SetLocalString(oSubject,"OHS_LIST_FLIRT_2",sList+sDelimitedName);
      }
    case 1:
      sList = GetLocalString(oSubject,"OHS_LIST_FLIRT_1");
      if (FindSubString(sList,sDelimitedName)==-1)
      {
        SetLocalString(oSubject,"OHS_LIST_FLIRT_1",sList+sDelimitedName);
      }
      break;
  }
}



////////////////////////////////////////////////////////////////////////////////////////
//                                                                                    //
// (C) 2004, 2005, 2006 by bob@minors-ranton.fsnet.co.uk (aka "OldMansBeard")         //
//                                                                                    //
// The NWScript source code file to which this notice is attached is copyright.       //
// It may not be published or passed to a third party in part or in whole modified    //
// or unmodified without the express consent of the copyright holder.                 //
//                                                                                    //
// NWN byte code generated by compiling it or variations of it may be published       //
// or otherwise distributed notwithstanding under the terms of the Bioware EULA.      //
//                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////

