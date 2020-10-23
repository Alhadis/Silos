// Function Declarations
void lrgwsmeus_gwstn(object oActivator, location lLocation);
void lrgws_destroy_portals(object oPC);

////////////////////////////////////////////
// Script:  lrgws_include
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
//    This is the include file for the Gateway
//    Stone (gws) Project.
//::::::::::::::::::::::::::::::::::::::::::
// Requirements
//::::::::::::::::::::::::::::::::::::::::::
// Notes
//::::::::::::::::::::::::::::::::::::::::::
// Modification History
// Date       Who           Modifications
// ---------- ------------- ----------------
//  7/20/2002 Lord Random   Created script
////////////////////////////////////////////

// Functions

////////////////////////////////////////////
// Script:  lrgwsmeus_gwstn
// Author:  Lord Random
// Date:    July 20, 2002
// Version: 1.0
// Copyright (c) 2001 Bioware Corp.
//::::::::::::::::::::::::::::::::::::::::::
// Description
//    This function activates a conversation
//    with the Gateway Stone when it has been
//    "used".
//::::::::::::::::::::::::::::::::::::::::::
// Requirements
// 1. This function must be #include'd in the
//    module event script lrgwymeus.
//::::::::::::::::::::::::::::::::::::::::::
// Notes
//::::::::::::::::::::::::::::::::::::::::::
// Modification History
// Date       Who           Modifications
// ---------- ------------- ----------------
//  7/20/2002 Lord Random   Created script
////////////////////////////////////////////

void lrgwsmeus_gwstn(object oActivator, location lLocation)
{
   int nResult;

   SetLocalLocation(oActivator, "LRGWS_Clicked", lLocation);
   AssignCommand(oActivator,
      ActionStartConversation(oActivator, "lrgwso_gwstone", TRUE));
}

////////////////////////////////////////////
// Script:  lrgwsat_destroy_all
// Author:  Lord Random
// Date:    July 20, 2002
// Version: 1.0
// Copyright (c) 2001 Bioware Corp.
//::::::::::::::::::::::::::::::::::::::::::
// Description
//    This function destroys all active
// Gateways the PC has.
//::::::::::::::::::::::::::::::::::::::::::
// Requirements
// 1. This function must be #include'd in the
//    module event scripts lrgwsat_shutdown
//    and lrgwsat_gotogw.
//::::::::::::::::::::::::::::::::::::::::::
// Notes
//::::::::::::::::::::::::::::::::::::::::::
// Modification History
// Date       Who           Modifications
// ---------- ------------- ----------------
//  7/20/2002 Lord Random   Created script
////////////////////////////////////////////

void lrgws_destroy_portals(object oPC)
{
//
// If there is a home portal, turn off the flag that says there is and destroy it
//
   if (GetLocalInt(oPC, "LRGWS_HomeIsSet")==TRUE)
   {
      SetLocalInt(oPC, "LRGWS_HomeIsSet", FALSE);
      DestroyObject(GetLocalObject(oPC, "LRGWS_HomeObj"), 0.0f);
   }

//
// If there is a return portal, turn off the flag that says there is and destroy it
//
   if (GetLocalInt(oPC, "LRGWS_ReturnIsSet")==TRUE)
   {
      SetLocalInt(oPC, "LRGWS_ReturnIsSet", FALSE);
      DestroyObject(GetLocalObject(oPC, "LRGWS_ReturnObj"), 0.0f);
   }
}

// void main()
// {
// }
