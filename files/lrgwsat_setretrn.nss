////////////////////////////////////////////
// Script:  lrgwsat_setretrn
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
//    This script set's a new return location
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
// If the Gateway Return Portal exists, remove it now
//
   if (GetLocalInt(oPC, "LRGWS_ReturnIsSet")==TRUE)
      DestroyObject(GetLocalObject(oPC, "LRGWS_ReturnObj"), 0.0f);

   SetLocalInt(oPC, "LRGWS_ReturnIsSet", TRUE);
   SetLocalLocation(oPC, "LRGWS_ReturnLoc", lLocation);
   oPortal=CreateObject(OBJECT_TYPE_PLACEABLE, "lrgwspvb_rportal", lLocation,
      TRUE);
   SetLocalObject(oPC, "LRGWS_ReturnObj", oPortal);

//
// Note who owns the portal, and store their name in case they leave
//
   SetLocalObject(oPortal, "LRGWS_Owner", oPC);
   SetLocalString(oPortal, "LRGWS_OwnerName", GetName(oPC));
}
