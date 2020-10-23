////////////////////////////////////////////
// Script:  lrgwsat_sethome
// Author:  Lord Random
// Date:    July 20, 2002
// Version: 1.0
// Copyright (c) 2001 Bioware Corp.
//::::::::::::::::::::::::::::::::::::::::::
// Source(s)
// 1. Lord Random's Gateway-Builder's
//    Playground Module
//::::::::::::::::::::::::::::::::::::::::::
// Description
//    This script set's a new home location
//    for a Gateway Stone.
//::::::::::::::::::::::::::::::::::::::::::
// Requirements
// 1. Must be attached to the conversation
//    lrgwso_gwstone.
//::::::::::::::::::::::::::::::::::::::::::
// Notes
//::::::::::::::::::::::::::::::::::::::::::
// Modification History
// Date       Who           Modifications
// ---------- ------------- ----------------
//  7/20/2002 Lord Random   Created script
//////////////////////////////////////////////::///////////////////////////////////////////////

void main()
{
   object oPC=GetPCSpeaker();
   object oPortal;
   location lLocation=GetLocalLocation(oPC, "LRGWS_Clicked");

//
// If the Gateway Home Portal exists, remove it now
//
   if (GetLocalInt(oPC, "LRGWS_HomeIsSet")==TRUE)
      DestroyObject(GetLocalObject(oPC, "LRGWS_HomeObj"), 0.0f);

   SetLocalInt(oPC, "LRGWS_HomeIsSet", TRUE);
   SetLocalLocation(oPC, "LRGWS_HomeLoc", lLocation);
   oPortal=CreateObject(OBJECT_TYPE_PLACEABLE, "lrgwspvb_hportal", lLocation,
      TRUE);
   SetLocalObject(oPC, "LRGWS_HomeObj", oPortal);

//
// Note who owns the portal, and store their name in case they leave
//
   SetLocalObject(oPortal, "LRGWS_Owner", oPC);
   SetLocalString(oPortal, "LRGWS_OwnerName", GetName(oPC));
}
