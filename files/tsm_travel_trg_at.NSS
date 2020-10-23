////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Configuration File
//     Filename : acf_trg_onenter.nss
//    $Revision:: 236        $ current version of the file
//        $Date:: 2007-01-21#$ date the file was created or modified
//       Author : Cipher
//
//    Var Prefix:
//  Dependencies:
//
//  Description
//  This script calls the ACR's OnEnter code for triggers, and any
//  custom code a server may need. It is not updated in ACR updates.
//
//  Revision History
//  2009/08/6  Wynna
//  2010/9/22  AcadiusLost - Bardsong disable
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#include "acr_trigger_i"



////////////////////////////////////////////////////////////////////////////////
// Constants ///////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Structures //////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Global Variables ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Function Prototypes /////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////


void main()
{
    ACR_TriggerOnEnter();
		
    // ATing out of or into Travel Map areas
	object oTraveller = GetEnteringObject();
	if(GetLocalInt(oTraveller,"travel_at") == 1)
		return;
	object oDestination = GetLocalObject(OBJECT_SELF, "oDestination");
	if(oDestination == OBJECT_INVALID)
		{string sDestination = GetLocalString(OBJECT_SELF, "sDestination");
	     oDestination = GetWaypointByTag(sDestination);
		 SetLocalObject(OBJECT_SELF, "oDestination", oDestination);
		 }
		 
			 	 
	if((!GetIsPC(oTraveller)) && (!GetIsDM(oTraveller))&& (!GetIsOwnedByPlayer(oTraveller))) 
	   {DestroyObject(oTraveller);
	    return;
	   }

	//First run a proximity check on party members and their owned creatures, then jump entire party if within range
	object oPartyMember = GetFirstFactionMember(oTraveller, TRUE);
	if(GetLocalInt(GetArea(OBJECT_SELF), "ACR_IS_TRAVEL_AREA") !=1)
		{while(oPartyMember != OBJECT_INVALID)
			{if((GetDistanceBetween(oPartyMember, oTraveller) > 20.0) || (GetArea(oTraveller) != GetArea(oPartyMember)))
				{FloatingTextStringOnCreature("You must gather your party together before going on.", oTraveller, TRUE);
				 return;
				}
			 oPartyMember = GetNextFactionMember(oTraveller, TRUE);
			}
		}	
			
	oPartyMember = GetFirstFactionMember(oTraveller, TRUE);		
	while(oPartyMember != OBJECT_INVALID)
		{SetCommandable(TRUE, oPartyMember);
		 //AssignCommand(oPartyMember, ActionJumpToObject(oDestination));
		 FloatingTextStringOnCreature("You gather your party and prepare to travel.", oTraveller, TRUE);
		 WriteTimestampedLogEntry(GetName(oPartyMember) + " ATing via TSM_TRAVEL_TRG_AT.NSS through " + GetName(OBJECT_SELF) + " to " + GetName(oDestination) + " with " + GetName(oTraveller) + " as party leader.");
		 int iType = 2;
			 object oAssociate = GetAssociate(iType, oPartyMember, 1);
			 while(iType < 4)
				{oAssociate = GetAssociate(iType, oPartyMember, 1);
			 	 
		         if(GetIsObjectValid(oAssociate))
			 			{
						AssignCommand(oAssociate, ActionJumpToObject(oDestination));
						WriteTimestampedLogEntry(GetName(oAssociate) + " is an associate of Type " + IntToString(iType) + " owned by " + GetName(oPartyMember) + " ATing with them.");
			 			}
				else { WriteTimestampedLogEntry(GetName(oPartyMember)+" Has no associates of type " + IntToString(iType)); }
			 	 iType++;
			 	}
		 if (GetHasFeat(FEAT_BARDSONG_INSPIRE_COURAGE, oPartyMember)) {
		 	// bard found- force-deactivate any inspirations, head off crashes
			SetActionMode(oPartyMember, 15, FALSE);
			SetActionMode(oPartyMember, 16, FALSE);	
			SetActionMode(oPartyMember, 17, FALSE);	
			SetActionMode(oPartyMember, 18, FALSE);	
			SetActionMode(oPartyMember, 19, FALSE);	
			SetActionMode(oPartyMember, 20, FALSE);	
			SetActionMode(oPartyMember, 21, FALSE);	
		 }	
		 SetLocalInt(oPartyMember,"travel_at", 1);
		 DelayCommand(10.0f, DeleteLocalInt(oPartyMember, "travel_at"));
		 oPartyMember = GetNextFactionMember(oTraveller, TRUE);
		}
	DelayCommand(6.5f, JumpPartyToArea(oTraveller, oDestination));
}