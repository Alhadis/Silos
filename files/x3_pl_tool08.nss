//::///////////////////////////////////////////////
//:: Player Tool 8 Instant Feat
//:: x3_pl_tool08
//:: Copyright (c) 2007 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This is a blank feat script for use with the
    10 Player instant feats provided in NWN v1.69.

    Look up feats.2da, spells.2da and iprp_feats.2da
*/
//:://////////////////////////////////////////////
//:: Created By: Brian Chung
//:: Created On: 2007-12-05
//:://////////////////////////////////////////////

// Copied from dac_ohs_lbsummon

#include "inc_debug_dac"
#include "ohs_i0_commands"

void ForceAddHenchman(object oLinkboy);
int IsLinkboyAttached();
void GetLinkboy();
//void ForceMaxHenchmen(object oPC);

void main()
{
   debugVarObject("x3_pl_tool08", OBJECT_SELF);

   object oPC = OBJECT_SELF;
   SendMessageToPC(oPC, "Player Tool 08 activated - OHS Henchmen.");

   if (GetLocalInt(GetModule(), "OHS_SYSTEM_DISABLED") == TRUE)
   {
      //debugMsg("OHS disabled");
      return;
   }

   if (! IsLinkboyAttached())
   {
      //debugMsg("linkboy not attached");
      float fDelay = 0.0;
      int respawn = GetLocalInt(oPC, "OHS_RESPAWN_LOCALS");
      //debugVarInt("respawn", respawn);
      if (GetLocalInt(oPC, "OHS_RESPAWN_LOCALS") != 4)
      {
         fDelay = 10.0;
         string sSoon = "Your linkboy will be here soon.";
         SendMessageToPC(oPC, sSoon);
      }
      //debugVarFloat("fDelay", fDelay);
      DelayCommand(fDelay, GetLinkboy());
   }
}

void ForceAddHenchman(object oLinkboy)
{
   object oPC = GetItemActivator();
   ForceMaxHenchmen(oPC);
   AddHenchman(oPC, oLinkboy);
}

// Test to see if you have a linkboy.
// If so, all the attachment pointers will get set correctly.
int IsLinkboyAttached()
{
   object oPC = GetItemActivator();
   // Quickest check first - normally true
   object oLinkboy = GetLocalObject(oPC, "OHS_O_MY_LINKBOY");
   if (GetIsObjectValid(oLinkboy) &&
   GetMaster(oLinkboy) == oPC &&
   GetLocalString(oLinkboy, "OHS_S_MY_MASTER") == GetName(oPC))
   {
      return TRUE;
   }

   // No, something needs fixing
   if (GetIsObjectValid(oLinkboy))
   {
      // He exists, just needs claiming
      if(GetMaster(oLinkboy) != oPC)
      {
         ForceAddHenchman(oLinkboy);
      }
      SetLocalString(oLinkboy,"OHS_S_MY_MASTER", GetName(oPC));
      return TRUE;
   }

   // Check all linkboys to see if any of them is really yours
   oLinkboy = OBJECT_INVALID;
   int nNth = 0;
   object oCandidate = GetObjectByTag("OHS_LINKBOY", nNth);
   while (GetIsObjectValid(oCandidate) && !GetIsObjectValid(oLinkboy))
   {
      if (GetMaster(oCandidate)==oPC)
      {
         oLinkboy = oCandidate;
         SetLocalObject(oPC, "OHS_O_MY_LINKBOY", oLinkboy);
         SetLocalString(oLinkboy, "OHS_S_MY_MASTER", GetName(oPC));
      }
      else if (GetLocalString(oCandidate,"OHS_S_MY_MASTER") == GetName(oPC))
      {
         oLinkboy = oCandidate;
         ForceAddHenchman(oLinkboy);
         SetLocalObject(oPC,"OHS_O_MY_LINKBOY", oLinkboy);
      }
      else
      {
         nNth++;
         oCandidate = GetObjectByTag("OHS_LINKBOY", nNth);
      }
   }
   return GetIsObjectValid(oLinkboy);
}

// Create a Linkboy Henchman for the calling PC
void GetLinkboy()
{
   //debugVarObject("GetLinkboy()", OBJECT_SELF);
   object oPC = GetItemActivator();
   // See if there is a convenient doorway for a linkboy to appear from
   // Otherwise make him appear 1.0m in front of you
   int nNth = 1;
   object oDoor = GetNearestObject(OBJECT_TYPE_DOOR, oPC, nNth);
   while (GetIsObjectValid(oDoor) && GetLocked(oDoor))
   {
      nNth++;
      oDoor = GetNearestObject(OBJECT_TYPE_DOOR, oPC, nNth);
   }
   float fFacing, fOpposite;
   vector vSpot;
   location lSpot;
   //debugVarObject("oDoor", oDoor);
   if (GetIsObjectValid(oDoor))
   {
      fFacing = VectorToAngle(GetPosition(oDoor)-GetPosition(oPC));
      fOpposite = (fFacing >= 180.0) ? fFacing - 180.0 : fFacing + 180.0;
      vSpot = GetPosition(oDoor) + 1.0 * AngleToVector(fFacing);
      lSpot = Location(GetArea(oPC), vSpot, fOpposite);
   }
   else
   {
      fFacing = GetFacing(oPC);
      fOpposite = (fFacing >= 180.0) ? fFacing - 180.0 : fFacing + 180.0;
      vSpot = GetPosition(oPC) + 1.0f * AngleToVector(fFacing);
      lSpot = Location(GetArea(oPC), vSpot, fOpposite);
   }
   //debugVarLoc("lSpot", lSpot);
   string sResRef = GetLocalString(oPC, "OHS_S_LINKBOY_RESREF");
   if (sResRef == "") sResRef = "ohs_linkboy";
   //debugVarString("sResRef", sResRef);
   object oLinkboy = CreateObject(OBJECT_TYPE_CREATURE, sResRef, lSpot, FALSE);
   //debugVarObject("oLinkboy", oLinkboy);
   ForceAddHenchman(oLinkboy);
   SetLocalObject(oPC, "OHS_O_MY_LINKBOY", oLinkboy);
   SetLocalString(oLinkboy, "OHS_S_MY_MASTER", GetName(oPC));
   if (GetIsObjectValid(oDoor)) AssignCommand(oLinkboy, ActionOpenDoor(oDoor));
   SendMessageToPC(oPC, GetName(oLinkboy) + " has arrived.");
}

/*
// Force the MaxHenchmen parameter to be high enough to get one more in
void ForceMaxHenchmen(object oPC)
{
  int nNth=1;
  int nExtras = 0;
  object oHenchman = GetHenchman(oPC,nNth);
  while (GetIsObjectValid(oHenchman))
  {
    if (FindSubString(GetTag(oHenchman),"OHS_")==0) nExtras++;
    nNth++;
    oHenchman = GetHenchman(oPC,nNth);
  }
  int nTotal = nNth-1;
  int nMaxHenchmen = GetMaxHenchmen();
  int nBaseMax = GetLocalInt(GetModule(),"OHS_BASE_MAX_HENCHMEN");
  if (nBaseMax==0)
  {
    nBaseMax = nMaxHenchmen;
    SetLocalInt(GetModule(),"OHS_BASE_MAX_HENCHMEN",nBaseMax);
  }
  int nNeeded = nBaseMax+nExtras+1;
  if (nTotal-nExtras > nBaseMax) nNeeded = nTotal+1;
  if (nNeeded>nMaxHenchmen)
  {
    SetMaxHenchmen(nNeeded);
    PrintString("MaxHenchmen => "+IntToString(GetMaxHenchmen()));
  }
}
*/
