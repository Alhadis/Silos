////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Spawn System
//     Filename : as_group_example.nss
//      Version : 1.0
//         Date : 2006-9-17
//       Author : Ronan
//
//  Description
//  This is a simple example of a spawn group script which is used by the ACR's
//  spawn system. Though the name of the script is "as_group_example", the spawn
//  point which uses this script would simply have "example" listed as a spawn
//  group name, since the "as_group_" is always added on to the beginning. For a
//  more complex example of spawn groups, see the script "as_group_complex".
//
//  Revision History
// Rick, made several types of beetles.
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// This line is required on all spawn group scripts.
#include "acr_spawn_i"

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

// This is the main function, which is what the spawn system runs when this
// spawn group is spawned.
void main();

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

void main() {

 

	object oBee1 = ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
	object oBee2 = ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
	object oBee3 = ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
	object oBee4 = ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
	
switch(Random(5)) {
        case 0:
            ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			break;
		case 1:
		 	{ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 break;
			}
		case 2:
		 	{ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 break;
			}
   		case 3:
		 	{ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 break;
			}
   	   case 4:
		 	{object oBee5 = ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 object oBee6 = ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 object oBee7 = ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 object oBee8 = ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 object oBee9 = ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 object oBee10 = ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 object oBee11 = ACR_SpawnObject("abr_cr_vm_bee", OBJECT_TYPE_CREATURE);
			 object oBeeHive = ACR_SpawnObject("plc_tree_hive", OBJECT_TYPE_PLACEABLE);
			 ChangeToStandardFaction(oBee1, STANDARD_FACTION_HOSTILE);
			 ChangeToStandardFaction(oBee2, STANDARD_FACTION_HOSTILE);
			 ChangeToStandardFaction(oBee3, STANDARD_FACTION_HOSTILE);
			 ChangeToStandardFaction(oBee4, STANDARD_FACTION_HOSTILE);
			 ChangeToStandardFaction(oBee5, STANDARD_FACTION_HOSTILE);
			 ChangeToStandardFaction(oBee6, STANDARD_FACTION_HOSTILE);
			 ChangeToStandardFaction(oBee7, STANDARD_FACTION_HOSTILE);
			 ChangeToStandardFaction(oBee8, STANDARD_FACTION_HOSTILE);
			 ChangeToStandardFaction(oBee9, STANDARD_FACTION_HOSTILE);
			 ChangeToStandardFaction(oBee10, STANDARD_FACTION_HOSTILE);
			 ChangeToStandardFaction(oBee11, STANDARD_FACTION_HOSTILE);
			 
			 break;
			}
	}
}