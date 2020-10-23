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
//  2007/01/20  Cipher  Inception
//  October 2008, Wynna
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#include "acr_trigger_i"
#include "acr_quest_i"



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

    // Custom code goes here.
	
 
//5b Settlestone Dungeon of the Ruins. 

	
	
if(FindSubString(GetTag(OBJECT_SELF), "dr_towerstars_portal") != -1)
	{location lDestination;
	 object oDest1 = GetLocalObject(OBJECT_SELF, "oDest1");
	 	{if(oDest1 == OBJECT_INVALID)
			{oDest1 = GetWaypointByTag("dr_trapdest1_WP");
			 SetLocalObject(OBJECT_SELF, "oDest1", oDest1);
			}
		}
	 object oDest2 = GetLocalObject(OBJECT_SELF, "oDest2");
	 	{if(oDest2 == OBJECT_INVALID)
			{oDest2 = GetWaypointByTag(GetTag(OBJECT_SELF) + "_WP");
			 SetLocalObject(OBJECT_SELF, "oDest2", oDest2);
			 }
		}	
	SetLocalInt(GetEnteringObject(), "Bluestone", 0);
    object oInventory = GetFirstItemInInventory(GetEnteringObject());
	while (oInventory != OBJECT_INVALID)
		 	 {if(FindSubString(GetName(oInventory), "Bluestone") == -1) 
			   	{oInventory = GetNextItemInInventory(GetEnteringObject());
				}
			  else if(FindSubString(GetName(oInventory), "Bluestone") != -1) 
    		  	{SetLocalInt(GetEnteringObject(), "Bluestone", 1);
				 break;}
			 }
		
	if(GetLocalInt(GetEnteringObject(), "Bluestone") == 1)
	    {lDestination = GetLocation(oDest2);
		 SendMessageToPC(GetEnteringObject(), "A voice speaks softly in your head: 'Your aura has been imprinted. Your journey will begin in 10 seconds, Master.'");
        }
    else if(GetLocalInt(GetEnteringObject(), "Bluestone") != 1)
	    {lDestination = GetLocation(oDest1);
		  SendMessageToPC(GetEnteringObject(), "A voice speaks softly in your head: 'You do not carry a key. Your journey will begin in 10 seconds, invader. There is nothing you can do to stop it.'");
          int n;
    object oStorage;
    object oTest;
    oStorage = CreateObject(OBJECT_TYPE_ITEM, "dr_sack", GetLocation(OBJECT_SELF));
    SetFirstName(oStorage, GetName(GetEnteringObject()) + "'s Equipment"); 
	oTest = GetFirstItemInInventory(GetEnteringObject());
	AssignCommand(GetEnteringObject(), ClearAllActions(TRUE));
    while (oTest!=OBJECT_INVALID)
    { // strip inventory items
        SetPlotFlag(oTest, FALSE);
        SetItemCursedFlag(oTest, FALSE);
        SetDroppableFlag(oTest, FALSE);
		AssignCommand(GetEnteringObject(), ActionGiveItem(oTest, oStorage));
        oTest = GetNextItemInInventory(GetEnteringObject());
    }
    for (n=0; n<18; n++)
    { // strip equiped items
        oTest = GetItemInSlot(n, GetEnteringObject());
        if (oTest!=OBJECT_INVALID)
        {
			AssignCommand(GetEnteringObject(), ActionUnequipItem(oTest));
            SetPlotFlag(oTest, FALSE);
            SetItemCursedFlag(oTest, FALSE);
            SetDroppableFlag(oTest, FALSE);
            AssignCommand(GetEnteringObject(), ActionGiveItem(oTest, oStorage));
        }
     }
    }
		  

	DelayCommand(9.0, SendMessageToPC(GetEnteringObject(), "You feel a wrenching sense of dislocation. You are suddenly elsewhere!"));
	DelayCommand(10.0, AssignCommand(GetEnteringObject(), ActionJumpToLocation(lDestination)));
	}
	

}