////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Spawn System
//     Filename : as_group_tower.nss
//      Version : 1.1
//         Date : 2007-4-24
//       Author : Ronan
//	Modified by : Wynna 10/10/2007
//
//  Description
//  This is a complex example of a spawn group script which is used by the ACR's
//  spawn system. Though the name of the script is "as_group_complex", the spawn
//  point which uses this script would simply have "complex" listed as a spawn
//  group name, since the "as_group_" is always added on to the beginning. This
//  example is intended for people familiar with programming. For a simpler
//  example, see the script as_group_example.
//
//  Revision History
//  1.0 2006-09-17: Ronan - Inception
//  1.1 2007-04-24: AcadiusLost: altered to use ABR resource names.
//  1.1.1 2007-10-10: Wynna: used the original to build spawn group for Silvy Uni Dorms
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// This line is required on all spawn group scripts.
#include "acr_spawn_i"
#include "bbs_include"

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

object oSpeaker =GetNearestObject(OBJECT_TYPE_PLACEABLE, OBJECT_SELF, 1);
	   	    

if((GetSubString(GetName(OBJECT_SELF), 3, 18) == "_Dorm_1_Armoire_WP") || (GetSubString(GetName(OBJECT_SELF), 3, 18) == "_Dorm_2_Armoire_WP")|| (GetSubString(GetName(OBJECT_SELF), 3, 18) == "_Dorm_3_Armoire_WP"))



	   {object oMyDoorTrig=GetNearestObjectByTag("slv_dorm", OBJECT_SELF, 1);
      	object oMyArmoire = ACR_SpawnObject("slv_armoire0", OBJECT_TYPE_PLACEABLE);
        SetLocalString(oMyArmoire, "ACR_PSO_NAME", GetName(oMyDoorTrig) + "_Armoire");
		SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Armoire", oMyArmoire);
		object oMyBench = ACR_SpawnObjectAtLocation("003_bench", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Bench_WP")));
        object oMyBookshelf = ACR_SpawnObjectAtLocation("slv_bookshelf0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Bookshelf_WP")));
    	SetLocalString(oMyBookshelf, "ACR_PSO_NAME", GetName(oMyDoorTrig) + "_Bookshelf");
		object oMyChair = ACR_SpawnObjectAtLocation("003_chair", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Chair_WP")));
        object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Chair2_WP")));
        object oMyChest = ACR_SpawnObjectAtLocation("slv_chest0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Chest_WP")));
   		SetLocalString(oMyChest, "ACR_PSO_NAME", GetName(oMyDoorTrig) + "_Chest");
		object oMyCurtainPull = ACR_SpawnObjectAtLocation("slv_curtainpull0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_CurtainPull_WP")));
   		object oMyDesk = ACR_SpawnObjectAtLocation("slv_desk0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Desk_WP")));
        SetLocalString(oMyDesk, "ACR_PSO_NAME", GetName(oMyDoorTrig) + "_Desk");
		object oMyFirestarter = ACR_SpawnObjectAtLocation("slv_firestarter0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Firestarter_WP")));
        object oMyStool = ACR_SpawnObjectAtLocation("003_stool", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Stool_WP")));
      	object oMySofa = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Sofa_WP")));
      	object oMySofa2 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Sofa2_WP")));
      	}

if((GetSubString(GetName(OBJECT_SELF), 3, 19) == "_Dorm_1s_Armoire_WP") || (GetSubString(GetName(OBJECT_SELF), 3, 19) == "_Dorm_2s_Armoire_WP")|| (GetSubString(GetName(OBJECT_SELF), 3, 19) == "_Dorm_3_low_Armoire_WP"))



	   {object oMyDoorTrig=GetNearestObjectByTag("slv_dorm", OBJECT_SELF, 1);
      	object oMyArmoire = ACR_SpawnObject("slv_armoire0", OBJECT_TYPE_PLACEABLE);
        SetLocalString(oMyArmoire, "ACR_PSO_NAME", GetName(oMyDoorTrig) + "_Armoire");
		SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Armoire", oMyArmoire);
		object oMyBench = ACR_SpawnObjectAtLocation("003_low_bench", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Bench_WP")));
        object oMyBookshelf = ACR_SpawnObjectAtLocation("slv_bookshelf0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Bookshelf_WP")));
    	SetLocalString(oMyBookshelf, "ACR_PSO_NAME", GetName(oMyDoorTrig) + "_Bookshelf");
		object oMyChair = ACR_SpawnObjectAtLocation("003_low_chair", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Chair_WP")));
        object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Chair2_WP")));
        object oMyChest = ACR_SpawnObjectAtLocation("slv_chest0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Chest_WP")));
   		SetLocalString(oMyChest, "ACR_PSO_NAME", GetName(oMyDoorTrig) + "_Chest");
		object oMyCurtainPull = ACR_SpawnObjectAtLocation("slv_curtainpull0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_CurtainPull_WP")));
   		object oMyDesk = ACR_SpawnObjectAtLocation("slv_desk2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Desk_WP")));
        SetLocalString(oMyDesk, "ACR_PSO_NAME", GetName(oMyDoorTrig) + "_Desk");
		object oMyFirestarter = ACR_SpawnObjectAtLocation("slv_firestarter0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Firestarter_WP")));
        object oMyStool = ACR_SpawnObjectAtLocation("003_low_stool", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Stool_WP")));
      	object oMySofa = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Sofa_WP")));
      	object oMySofa2 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Sofa2_WP")));
      	}	

if(GetSubString(GetName(OBJECT_SELF), 3, 22) == "_Dorm_3_low_Armoire_WP")

	   {object oMyDoorTrig=GetNearestObjectByTag("slv_dorm", OBJECT_SELF, 1);
      	object oMyArmoire = ACR_SpawnObject("slv_armoire0", OBJECT_TYPE_PLACEABLE);
        SetLocalString(oMyArmoire, "ACR_PSO_NAME", GetName(oMyDoorTrig) + "_Armoire");
		SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Armoire", oMyArmoire);
		object oMyBookshelf = ACR_SpawnObjectAtLocation("slv_bookshelf0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Bookshelf_WP")));
    	SetLocalString(oMyBookshelf, "ACR_PSO_NAME", GetName(oMyDoorTrig) + "_Bookshelf");
		object oMyChair = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Chair_WP")));
        object oMyChair2 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Chair2_WP")));
        object oMyChest = ACR_SpawnObjectAtLocation("slv_chest0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Chest_WP")));
   		SetLocalString(oMyChest, "ACR_PSO_NAME", GetName(oMyDoorTrig) + "_Chest");
		object oMyDesk = ACR_SpawnObjectAtLocation("slv_desk2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Desk_WP")));
        SetLocalString(oMyDesk, "ACR_PSO_NAME", GetName(oMyDoorTrig) + "_Desk");
		object oMyFirestarter = ACR_SpawnObjectAtLocation("slv_firestarter0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Firestarter_WP")));
        object oMyStool = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Stool_WP")));
      	object oMySofa = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Sofa_WP")));
      	object oMySofa2 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Sofa2_WP")));
      	}	
		
if(GetName(OBJECT_SELF) == "Dean_Box_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBox = ACR_SpawnObject("plc_mc_lbox01", OBJECT_TYPE_PLACEABLE);
        SetLocalString(oMyBox, "ACR_PSO_NAME", GetName(oMyTrig) + "_Box");
		SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Box", oMyBox);
		object oMyCabinet = ACR_SpawnObjectAtLocation("slv_cabinet", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cabinet_WP")));
        SetLocalString(oMyCabinet, "ACR_PSO_NAME", GetName(oMyTrig) + "_Cabinet");
		object oMyCabinet2 = ACR_SpawnObjectAtLocation("slv_cabinet", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cabinet2_WP")));
        SetLocalString(oMyCabinet2, "ACR_PSO_NAME", GetName(oMyTrig) + "_Cabinet2");
		object oMyCabinet3 = ACR_SpawnObjectAtLocation("slv_cabinet", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cabinet3_WP")));
        SetLocalString(oMyCabinet3, "ACR_PSO_NAME", GetName(oMyTrig) + "_Cabinet3");
		object oMyChair = ACR_SpawnObjectAtLocation("003_chair2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair_WP")));
        object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_low_chair3", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_chair3", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair4_WP")));
        object oMyChair5 = ACR_SpawnObjectAtLocation("003_low_chair5", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair5_WP")));
        object oMyChair6 = ACR_SpawnObjectAtLocation("003_chair3", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair6_WP")));
        object oMyDesk = ACR_SpawnObjectAtLocation("slv_desk0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Desk_WP")));
        SetLocalString(oMyDesk, "ACR_PSO_NAME", GetName(oMyTrig) + "_Desk");
		object oMyFirestarter = ACR_SpawnObjectAtLocation("slv_firestarter0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Firestarter_WP")));
        object oMyDean = ACR_SpawnObjectAtLocation("003_cr_slv_dean", OBJECT_TYPE_CREATURE, GetLocation(GetWaypointByTag("Dean_Dean_Savengriff_WP")));
        }		

if(GetName(OBJECT_SELF) == "Registrar_Desk_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyDesk = ACR_SpawnObject("slv_desk0", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Desk", oMyDesk);
		SetLocalString(oMyDesk, "ACR_PSO_NAME", GetName(oMyTrig) + "_Desk");
		object oMyChair = ACR_SpawnObjectAtLocation("003_chair", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair_WP")));
        //object oMyRegistrar = ACR_SpawnObjectAtLocation("003_cr_slv_registrar", OBJECT_TYPE_CREATURE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Registrar_WP")));
        object oMyArmoireReg = ACR_SpawnObjectAtLocation("slv_armoire_reg", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Armoire_WP")));
        SetLocalString(oMyArmoireReg, "ACR_PSO_NAME", GetName(oMyTrig) + "_Armoire");
							}	
if(GetName(OBJECT_SELF) == "Records_Treant_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyTreant = ACR_SpawnObject("003_cr_slv_recordsclerk", OBJECT_TYPE_CREATURE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Treant", oMyTreant);
		}	
				
if(GetName(OBJECT_SELF) == "Entry_NE_Armoire_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyArmoire = ACR_SpawnObject("slv_armoire0", OBJECT_TYPE_PLACEABLE);
        SetLocalString(oMyArmoire, "ACR_PSO_NAME", GetName(oMyTrig) + "_Armoire");
		SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Armoire", oMyArmoire);
		object oMyBench = ACR_SpawnObjectAtLocation("003_bench_wood", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bench_WP")));
        object oMyBench2 = ACR_SpawnObjectAtLocation("003_low_bench", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Bench2_WP")));
        }
		
if(GetName(OBJECT_SELF) == "Entry_NW_Bench_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBench = ACR_SpawnObject("003_bench_wood", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bench", oMyBench);
	    object oMyBench4 = ACR_SpawnObjectAtLocation("003_low_bench", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Bench4_WP")));
        }
if(GetName(OBJECT_SELF) == "Scribery_All_Scribe_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyScribe = ACR_SpawnObject("003_cr_slv_scribe", OBJECT_TYPE_CREATURE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Scribe", oMyScribe);
		}	
				
if(GetName(OBJECT_SELF) == "Scribery_Center_Bookshelf2_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBookshelf2 = ACR_SpawnObject("slv_bookshelf2", OBJECT_TYPE_PLACEABLE);
        SetLocalString(oMyBookshelf2, "ACR_PSO_NAME", GetName(oMyTrig) + "_Bookshelf2");
		SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bookshelf2", oMyBookshelf2);
		object oMyCabinet2 = ACR_SpawnObjectAtLocation("slv_cabinet", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cabinet2_WP")));
        SetLocalString(oMyCabinet2, "ACR_PSO_NAME", GetName(oMyTrig) + "_Cabinet2");
		object oMyCabinet3 = ACR_SpawnObjectAtLocation("slv_cabinet", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cabinet3_WP")));
        SetLocalString(oMyCabinet3, "ACR_PSO_NAME", GetName(oMyTrig) + "Cabinet3");
		object oMyWeaponRack = ACR_SpawnObjectAtLocation("slv_weaponrack", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_WeaponRack_WP")));
        SetLocalString(oMyWeaponRack, "ACR_PSO_NAME", GetName(oMyTrig) + "_WeaponRack");
		}
										
if(GetName(OBJECT_SELF) == "Scribery_S_Archive_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyArchive = ACR_SpawnObject("slv_archive", OBJECT_TYPE_PLACEABLE);
        SetLocalString(oMyArchive, "ACR_PSO_NAME", GetName(oMyTrig) + "_Archive");
		SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Archive", oMyArchive);
		object oMyBookshelf1 = ACR_SpawnObjectAtLocation("slv_bookshelf3", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bookshelf1_WP")));
        SetLocalString(oMyBookshelf1, "ACR_PSO_NAME", GetName(oMyTrig) + "_Bookshelf1");
		object oMyCabinet1 = ACR_SpawnObjectAtLocation("slv_cabinet", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cabinet1_WP")));
        SetLocalString(oMyCabinet1, "ACR_PSO_NAME", GetName(oMyTrig) + "Cabinet1");
		}	
		
if(GetName(OBJECT_SELF) == "Scribery_E_Chest_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChest = ACR_SpawnObject("slv_chest0", OBJECT_TYPE_PLACEABLE);
        SetLocalString(oMyChest, "ACR_PSO_NAME", GetName(oMyTrig) + "_Chest");
		SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chest", oMyChest);
		object oMyBookshelf4 = ACR_SpawnObjectAtLocation("slv_bookshelf4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bookshelf4_WP")));
        SetLocalString(oMyBookshelf4, "ACR_PSO_NAME", GetName(oMyTrig) + "_Bookshelf4");
		object oMyBookshelf3 = ACR_SpawnObjectAtLocation("slv_bookshelf0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bookshelf3_WP")));
        SetLocalString(oMyBookshelf3, "ACR_PSO_NAME", GetName(oMyTrig) + "_Bookshelf3");
		object oMyDesk = ACR_SpawnObjectAtLocation("slv_desk0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Desk_WP")));
        SetLocalString(oMyDesk, "ACR_PSO_NAME", GetName(oMyTrig) + "_Desk");
		object oMyScribe = ACR_SpawnObjectAtLocation("003_cr_slv_scribe", OBJECT_TYPE_CREATURE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Scribe_WP")));
        object oMyChair = ACR_SpawnObjectAtLocation("003_chair", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair_WP")));
        }	
		
if(GetName(OBJECT_SELF) == "Aerasume_Low_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair1 = ACR_SpawnObject("003_low_chair2", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair1);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_low_chair2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair4_WP")));
        }
		
if(GetName(OBJECT_SELF) == "Library_NE_Low_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair1 = ACR_SpawnObject("003_low_chair5", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair1);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_low_chair5", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair2_WP")));
        }

if(GetName(OBJECT_SELF) == "Library_NW_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair1 = ACR_SpawnObject("003_chair6", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair1);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair5", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        }		
		
if(GetName(OBJECT_SELF) == "Library_SW_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair1 = ACR_SpawnObject("003_chair6", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair1);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_low_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair2_WP")));
        }
		
if(GetName(OBJECT_SELF) == "Library_SE_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair1 = ACR_SpawnObject("003_chair6", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair1);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair4_WP")));
        object oMyWorktable = ACR_SpawnObjectAtLocation("plc_cft_magical", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Worktable_WP")));
        SetLocalString(oMyWorktable, "ACR_PSO_NAME", GetName(oMyTrig) + "_Worktable");
	}
	
if(GetName(OBJECT_SELF) == "Library_All_Librarian_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyLibrarian = ACR_SpawnObject("003_cr_slv_librarian", OBJECT_TYPE_CREATURE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Librarian", oMyLibrarian);
		}	
if(GetName(OBJECT_SELF) == "Library_Stairs_BookOrders_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBookOrders = ACR_SpawnObject("slv_bookorders", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_BookOrders", oMyBookOrders);
		object oMyCabinet = ACR_SpawnObjectAtLocation("slv_stationary_cabinet", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cabinet_WP")));
        SetLocalString(oMyCabinet, "ACR_PSO_NAME", GetName(oMyTrig) + "_Cabinet");
		object oMyCabinet2 = ACR_SpawnObjectAtLocation("slv_stationary_cabinet2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cabinet2_WP")));
        SetLocalString(oMyCabinet2, "ACR_PSO_NAME", GetName(oMyTrig) + "_Cabinet2");
		object oMyLibrarian = ACR_SpawnObjectAtLocation("003_cr_slv_librarian", OBJECT_TYPE_CREATURE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Librarian_WP")));
        }	

if(GetName(OBJECT_SELF) == "Kitchen_Belad_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBelad = ACR_SpawnObject("003_cr_slv_belad", OBJECT_TYPE_CREATURE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Belad", oMyBelad);
		}	
				
	
if(GetName(OBJECT_SELF) == "Kitchen_Table_1_Bench_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBench = ACR_SpawnObject("003_bench_rural", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bench", oMyBench);
		object oMyBench2 = ACR_SpawnObjectAtLocation("003_bench_rural", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bench2_WP")));
        }	
		
if(GetName(OBJECT_SELF) == "Kitchen_Table_2_Low_Bench_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBench = ACR_SpawnObject("003_bench_rural_low", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bench", oMyBench);
		object oMyBench2 = ACR_SpawnObjectAtLocation("003_bench_rural_low", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Bench2_WP")));
        object oMyBench3 = ACR_SpawnObjectAtLocation("003_bench_rural_low", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Bench3_WP")));
        object oMyBench4 = ACR_SpawnObjectAtLocation("003_bench_rural_low", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Bench4_WP")));
        }	
		
if(GetName(OBJECT_SELF) == "Kitchen_Table_3_Bench_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBench = ACR_SpawnObject("003_bench_rural", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bench", oMyBench);
		object oMyBench2 = ACR_SpawnObjectAtLocation("003_bench_rural", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bench2_WP")));
        }
		
if(GetName(OBJECT_SELF) == "Kitchen_Stools_1_Stool_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyStool = ACR_SpawnObject("003_stool", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Stool", oMyStool);
		object oMyStool2 = ACR_SpawnObjectAtLocation("003_stool", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Stool2_WP")));
        object oMyStool3 = ACR_SpawnObjectAtLocation("003_low_stool", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Stool3_WP")));
        object oMyStool4 = ACR_SpawnObjectAtLocation("003_low_stool", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Stool4_WP")));
        }	
		
if(GetName(OBJECT_SELF) == "Kitchen_Stools_2_Low_Stool_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyStool = ACR_SpawnObject("003_low_stool", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Stool", oMyStool);
		object oMyStool2 = ACR_SpawnObjectAtLocation("003_low_stool", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Stool2_WP")));
        object oMyStool3 = ACR_SpawnObjectAtLocation("003_stool", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Stool3_WP")));
        object oMyStool4 = ACR_SpawnObjectAtLocation("003_stool", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Stool4_WP")));
        }	
if(GetName(OBJECT_SELF) == "LadyHall_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	    object oMyChair1 = ACR_SpawnObject("003_chair4", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair1);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair4_WP")));
        object oMyChair5 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair5_WP")));
        object oMyChair6 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair6_WP")));
        object oMyChair7 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair7_WP")));
        object oMyChair8 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair8_WP")));
        }
if(GetName(OBJECT_SELF) == "Hornblade_Table1_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	    object oMyChair1 = ACR_SpawnObject("003_chair6", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair1);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair4_WP")));
        object oMyChair5 = ACR_SpawnObjectAtLocation("003_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair5_WP")));
        object oMyChair6 = ACR_SpawnObjectAtLocation("003_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair6_WP")));
        object oMyChair7 = ACR_SpawnObjectAtLocation("003_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair7_WP")));
        object oMyChair8 = ACR_SpawnObjectAtLocation("003_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair8_WP")));
        }
if(GetName(OBJECT_SELF) == "Hornblade_Table2_Low_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	    object oMyChair1 = ACR_SpawnObject("003_low_chair6", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair1);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_low_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_low_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_low_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair4_WP")));
        object oMyChair5 = ACR_SpawnObjectAtLocation("003_low_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair5_WP")));
        object oMyChair6 = ACR_SpawnObjectAtLocation("003_low_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair6_WP")));
        object oMyChair7 = ACR_SpawnObjectAtLocation("003_low_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair7_WP")));
        object oMyChair8 = ACR_SpawnObjectAtLocation("003_low_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair8_WP")));
        }	
if(GetName(OBJECT_SELF) == "Valamaradace_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair1 = ACR_SpawnObject("003_chair6", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair1);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair6", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        }
if(GetName(OBJECT_SELF) == "Supplies_Cabinet_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyCabinet = ACR_SpawnObject("slv_bookshelf_cross", OBJECT_TYPE_PLACEABLE);
        SetLocalString(oMyCabinet, "ACR_PSO_NAME", GetName(oMyTrig) + "_Cabinet");
		SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cabinet", oMyCabinet);
		}
if(GetName(OBJECT_SELF) == "Restricted_Cabinet_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyCabinet = ACR_SpawnObject("slv_cabinet", OBJECT_TYPE_PLACEABLE);
        SetLocalString(oMyCabinet, "ACR_PSO_NAME", GetName(oMyTrig) + "_Cabinet");
		SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cabinet", oMyCabinet);
		}
if(GetName(OBJECT_SELF) == "Entry_SW_Low_Bench_1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBench = ACR_SpawnObject("003_low_bench", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bench_1", oMyBench);
		object oMyBench2 = ACR_SpawnObjectAtLocation("003_bench_wood", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bench_2_WP")));
        object oMyBench3 = ACR_SpawnObjectAtLocation("003_low_bench", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Bench_3_WP")));
        }	
if(GetName(OBJECT_SELF) == "Entry_SE_Bench_1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBench = ACR_SpawnObject("003_bench_wood", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bench_1", oMyBench);
		object oMyBench2 = ACR_SpawnObjectAtLocation("003_low_bench", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Bench_2_WP")));
        object oMyBench3 = ACR_SpawnObjectAtLocation("003_bench_wood", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bench_3_WP")));
        }													
if(GetName(OBJECT_SELF) == "ComW_Set1_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair = ACR_SpawnObject("003_chair3", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair3", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_low_chair5", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair3_WP")));
        object oMySofa1 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Sofa1_WP")));
        object oMySofa1b = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Sofa1b_WP")));
        object oMySofa1c = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Sofa1c_WP")));
        object oMySofa2 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa2_WP")));
        object oMySofa2b = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa2b_WP")));
        object oMySofa2c = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa2c_WP")));
        object oMyLiquor = ACR_SpawnObjectAtLocation("slv_liquorcab", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Liquor_WP")));
        }													
if(GetName(OBJECT_SELF) == "ComW_Set2_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair = ACR_SpawnObject("003_chair4", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_low_chair2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_low_chair2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair4_WP")));
        object oMySofa1 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa1_WP")));
        object oMySofa1b = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa1b_WP")));
        object oMySofa1c = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa1c_WP")));
        }
if(GetName(OBJECT_SELF) == "ComW_Set3_Sofa1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMySofa = ACR_SpawnObject("003_mid_sitbox", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa1", oMySofa);
		object oMySofa1b = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa1b_WP")));
        object oMySofa1c = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa1c_WP")));
        object oMySofa2 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Sofa2_WP")));
        object oMySofa2b = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Sofa2b_WP")));
        object oMySofa2c = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Sofa2c_WP")));
        object oMyStool1 = ACR_SpawnObjectAtLocation("003_low_stool", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Stool1_WP")));
        object oMyStool2 = ACR_SpawnObjectAtLocation("003_stool", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Stool2_WP")));
        object oMyFirestarter = ACR_SpawnObjectAtLocation("slv_firestarter0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Firestarter_WP")));
        }															
if(GetName(OBJECT_SELF) == "ComW_Fireplace1_Firestarter_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyFirestarter = ACR_SpawnObject("slv_firestarter0", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Firestarter", oMyFirestarter);
		}					
if(GetName(OBJECT_SELF) == "ComW_Fireplace2_Firestarter_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyFirestarter = ACR_SpawnObject("slv_firestarter0", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Firestarter", oMyFirestarter);
		object oMyCushion = ACR_SpawnObjectAtLocation("slv_cushion", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cushion_WP")));
        }					
if(GetName(OBJECT_SELF) == "ComW_Set4_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair1 = ACR_SpawnObject("003_chair2", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair1);
		object oMyDesk = ACR_SpawnObjectAtLocation("slv_desk0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Desk_WP")));
        SetLocalString(oMyDesk, "ACR_PSO_NAME", GetName(oMyTrig) + "_Desk");
		}																													

if(GetName(OBJECT_SELF) == "ComE_Set1_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair = ACR_SpawnObject("003_chair3", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair3", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_low_chair5", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair3_WP")));
        object oMySofa1 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Sofa1_WP")));
        object oMySofa1b = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Sofa1b_WP")));
        object oMySofa1c = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Sofa1c_WP")));
        object oMySofa2 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa2_WP")));
        object oMySofa2b = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa2b_WP")));
        object oMySofa2c = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa2c_WP")));
        object oMyLiquor = ACR_SpawnObjectAtLocation("slv_liquorcab", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Liquor_WP")));
        }													
if(GetName(OBJECT_SELF) == "ComE_Set2_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair = ACR_SpawnObject("003_chair4", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_low_chair2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_low_chair2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair4_WP")));
        object oMySofa1 = ACR_SpawnObjectAtLocation("slv_mid_bench2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa1_WP")));
        object oMySofa1b = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa1b_WP")));
        object oMySofa1c = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa1c_WP")));
        }
if(GetName(OBJECT_SELF) == "ComE_Set3_Cushion_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyCushion = ACR_SpawnObject("003_mid_sitbox", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cushion1", oMyCushion);
		object oMyCushion2 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cushion2_WP")));
        object oMyCushion3 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cushion3_WP")));
        object oMyCushion4 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Cushion4_WP")));
        object oMyCushion5 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Cushion5_WP")));
        object oMyCushion6 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Cushion6_WP")));
        object oMyFirestarter = ACR_SpawnObjectAtLocation("slv_firestarter0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Firestarter_WP")));
        }															
if(GetName(OBJECT_SELF) == "ComE_Fireplace1_Firestarter_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyFirestarter = ACR_SpawnObject("slv_firestarter0", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Firestarter", oMyFirestarter);
		}					
if(GetName(OBJECT_SELF) == "ComE_Fireplace2_Firestarter_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyFirestarter = ACR_SpawnObject("slv_firestarter0", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Firestarter", oMyFirestarter);
		object oMyCushion = ACR_SpawnObjectAtLocation("slv_cushion", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cushion_WP")));
        }					
if(GetName(OBJECT_SELF) == "ComE_Set4_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyStool1 = ACR_SpawnObject("slv_mid_stool6", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Stool1", oMyStool1);
		}																													
if(GetName(OBJECT_SELF) == "Entry_BBS1_Book_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBBS = ACR_SpawnObject("bbs_book", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Book", oMyBBS);
		}	
if(GetName(OBJECT_SELF) == "Entry_BBS2_Class_Schedule_WP")
	{   //AssignCommand(oSpeaker, ActionSpeakString("as called", TALKVOLUME_TALK));
		object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBBS = ACR_SpawnObject("bbs_schedule_down", OBJECT_TYPE_PLACEABLE);
        //AssignCommand(oSpeaker, ActionSpeakString("AS: oMyBBS = " + GetName(oMyBBS), TALKVOLUME_TALK));
		SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Schedules", oMyBBS);
	  	//AssignCommand(oSpeaker, ActionSpeakString("AS: oMyTrig = " + GetName(oMyTrig), TALKVOLUME_TALK));
		//AssignCommand(oSpeaker, ActionSpeakString("AS: Initialize = " + IntToString(GetLocalInt(OBJECT_SELF, "Initialize")), TALKVOLUME_TALK));
		if(GetLocalInt(OBJECT_SELF, "Initialize") != 1)
				 {  SetLocalInt(OBJECT_SELF, "Initialize", 1);
				    string sSchool;
					string sMaster;
					string sTime100;
					string sTime200;
					string sTime300;
					string sTime400;
		
				      sSchool = "Abjuration";
					  sMaster = "Mistress Melindia";
					  sTime100 = "0900";
					  sTime200 = "1300";
					  sTime300 = "1700";
					  sTime400 = "2400";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
				      //AssignCommand(oSpeaker, ActionSpeakString("AS: Abj = " + sSchool + sMaster + sTime100 + sTime200 + sTime300 + sTime400, TALKVOLUME_TALK));
		
					  sSchool = "Conjuration";
					  sMaster = "Master Gasen";
					  sTime100 = "0600";
					  sTime200 = "0800";
					  sTime300 = "1000";
					  sTime400 = "1200";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					// AssignCommand(oSpeaker, ActionSpeakString("AS: Con = " + sSchool + sMaster + sTime100 + sTime200 + sTime300 + sTime400, TALKVOLUME_TALK));
							  
					  sSchool = "Divination";
					  sMaster = "Master Clarvue";
					  sTime100 = "1000";
					  sTime200 = "1200";
					  sTime300 = "1400";
					  sTime400 = "2400";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					 //AssignCommand(oSpeaker, ActionSpeakString("AS: Div = " + sSchool + sMaster + sTime100 + sTime200 + sTime300 + sTime400, TALKVOLUME_TALK));
		
					  sSchool = "Enchantment";
					  sMaster = "Master Silverbrook";
					  sTime100 = "1900";
					  sTime200 = "0900";
					  sTime300 = "0600";
					  sTime400 = "0300";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					  //AssignCommand(oSpeaker, ActionSpeakString("AS: Enc = " + sSchool + sMaster + sTime100 + sTime200 + sTime300 + sTime400, TALKVOLUME_TALK));
		
					  sSchool = "Evocation";
					  sMaster = "Master Arcadavera";
					  sTime100 = "When there's time to burn";
					  sTime200 = "Moments of truth";
					  sTime300 = "Seasonally in discontent";
					  sTime400 = "Blue moons";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					 // AssignCommand(oSpeaker, ActionSpeakString("AS: Evo = " + sSchool + sMaster + sTime100 + sTime200 + sTime300 + sTime400, TALKVOLUME_TALK));
		
					  sSchool = "Illusion";
					  sMaster = "Master Volebane";
					  sTime100 = "2000";
					  sTime200 = "1600";
					  sTime300 = "1400";
					  sTime400 = "1200";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					  //AssignCommand(oSpeaker, ActionSpeakString("AS: Ill = " + sSchool + sMaster + sTime100 + sTime200 + sTime300 + sTime400, TALKVOLUME_TALK));
		
					  sSchool = "Necromancy";
				      sMaster = "Mistress Ostelle";
				 	  sTime100 = "Noon";
					  sTime200 = "Sunrise";
					  sTime300 = "Sunset";
					  sTime400 = "Midnight";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					  //AssignCommand(oSpeaker, ActionSpeakString("AS: Nec = " + sSchool + sMaster + sTime100 + sTime200 + sTime300 + sTime400, TALKVOLUME_TALK));
		
					  sSchool = "Transmutation";
					  sMaster = "Master Auroneous";
					  sTime100 = "1300";
					  sTime200 = "1400";
					  sTime300 = "1500";
					  sTime400 = "1600";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
			   		  //AssignCommand(oSpeaker, ActionSpeakString("AS: Tra = " + sSchool + sMaster + sTime100 + sTime200 + sTime300 + sTime400, TALKVOLUME_TALK));
					} 	
				}
				
if(GetName(OBJECT_SELF) == "Lobby_BBS1_Book_WP")
	{  // AssignCommand(oSpeaker, ActionSpeakString(GetName(OBJECT_SELF) + " AS called."));
		object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBBS = ACR_SpawnObject("bbs_book", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Book", oMyBBS);
		}	
if(GetName(OBJECT_SELF) == "Lobby_BBS2_Class_Schedule_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyBBS = ACR_SpawnObject("bbs_schedule_up", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Schedules", oMyBBS);
		if(GetLocalInt(OBJECT_SELF, "Initialize") != 1)
				 {  SetLocalInt(OBJECT_SELF, "Initialize", 1);
				    string sSchool;
					string sMaster;
					string sTime100;
					string sTime200;
					string sTime300;
					string sTime400;
		
				      sSchool = "Abjuration";
					  sMaster = "Mistress Melindia";
					  sTime100 = "0900";
					  sTime200 = "1300";
					  sTime300 = "1700";
					  sTime400 = "2400";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
				     
					  sSchool = "Conjuration";
					  sMaster = "Master Gasen";
					  sTime100 = "0600";
					  sTime200 = "0800";
					  sTime300 = "1000";
					  sTime400 = "1200";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					 					  
					  sSchool = "Divination";
					  sMaster = "Master Clarvue";
					  sTime100 = "1000";
					  sTime200 = "1200";
					  sTime300 = "1400";
					  sTime400 = "2400";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					 
					  sSchool = "Enchantment";
					  sMaster = "Master Silverbrook";
					  sTime100 = "1900";
					  sTime200 = "0900";
					  sTime300 = "0600";
					  sTime400 = "0300";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					  
					  sSchool = "Evocation";
					  sMaster = "Master Arcadavera";
					  sTime100 = "When there's time to burn";
					  sTime200 = "Moments of truth";
					  sTime300 = "Seasonally in discontent";
					  sTime400 = "Blue moons";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					  
					  sSchool = "Illusion";
					  sMaster = "Master Volebane";
					  sTime100 = "2000";
					  sTime200 = "1600";
					  sTime300 = "1400";
					  sTime400 = "1200";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					  
					  sSchool = "Necromancy";
				      sMaster = "Mistress Ostelle";
				 	  sTime100 = "Noon";
					  sTime200 = "Sunrise";
					  sTime300 = "Sunset";
					  sTime400 = "Midnight";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					  
					  sSchool = "Transmutation";
					  sMaster = "Master Auroneous";
					  sTime100 = "1300";
					  sTime200 = "1400";
					  sTime300 = "1500";
					  sTime400 = "1600";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
			   		  } 	
				} 
		
if(GetName(OBJECT_SELF) == "Lobby1_Low_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair1 = ACR_SpawnObject("003_low_chair2", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair1);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_low_chair2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair4_WP")));
        }
if(GetName(OBJECT_SELF) == "Lobby2_Low_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair1 = ACR_SpawnObject("003_low_chair2", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair1);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_low_chair2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair4_WP")));
        }
if(GetName(OBJECT_SELF) == "Lobby3_Low_Chair1_WP")
	{   object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyChair1 = ACR_SpawnObject("003_low_chair2", OBJECT_TYPE_PLACEABLE);
        SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1", oMyChair1);
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_low_chair2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_chair4", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair4_WP")));
        }
if((GetName(OBJECT_SELF) == "MT4_Dorm_1_Armoire1_WP") || (GetName(OBJECT_SELF) == "MT3_Dorm_1_Armoire1_WP") || (GetName(OBJECT_SELF) == "MT4_Dorm_2_Armoire1_WP") || (GetName(OBJECT_SELF) == "MT3_Dorm_2_Armoire1_WP"))

	   {object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	object oMyArmoire1 = ACR_SpawnObject("slv_armoire0", OBJECT_TYPE_PLACEABLE);
        SetLocalString(oMyArmoire1, "ACR_PSO_NAME", GetName(oMyTrig) + "_Armoire1");
		SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Armoire1", oMyArmoire1);
		object oMyArmoire2 = ACR_SpawnObjectAtLocation("slv_armoire0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Armoire2_WP")));
    	SetLocalString(oMyArmoire2, "ACR_PSO_NAME", GetName(oMyTrig) + "_Armoire2");
		object oMyBench = ACR_SpawnObjectAtLocation("003_bench", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bench_WP")));
        object oMyBookshelf1 = ACR_SpawnObjectAtLocation("slv_bookshelf0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bookshelf1_WP")));
    	SetLocalString(oMyBookshelf1, "ACR_PSO_NAME", GetName(oMyTrig) + "_Bookshelf1");
		object oMyBookshelf2 = ACR_SpawnObjectAtLocation("slv_bookshelf0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Bookshelf2_WP")));
    	SetLocalString(oMyBookshelf2, "ACR_PSO_NAME", GetName(oMyTrig) + "_Bookshelf2");
		object oMyChair1 = ACR_SpawnObjectAtLocation("003_chair", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair1_WP")));
        object oMyChair2 = ACR_SpawnObjectAtLocation("003_chair", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_chair5", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_chair5", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair4_WP")));
        object oMyChest1 = ACR_SpawnObjectAtLocation("slv_chest0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chest1_WP")));
   		SetLocalString(oMyChest1, "ACR_PSO_NAME", GetName(oMyTrig) + "_Chest1");
		object oMyChest2 = ACR_SpawnObjectAtLocation("slv_chest0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chest2_WP")));
   		SetLocalString(oMyChest2, "ACR_PSO_NAME", GetName(oMyTrig) + "_Chest2");
		object oMyDesk = ACR_SpawnObjectAtLocation("slv_desk0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Desk_WP")));
        SetLocalString(oMyDesk, "ACR_PSO_NAME", GetName(oMyTrig) + "_Desk");
		object oMyFirestarter = ACR_SpawnObjectAtLocation("slv_firestarter0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Firestarter_WP")));
        object oMyStool = ACR_SpawnObjectAtLocation("003_stool", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Stool_WP")));
      	}
if((GetName(OBJECT_SELF) == "MH1_Armoire_WP") || (GetName(OBJECT_SELF) == "MH2_Armoire_WP") || (GetName(OBJECT_SELF) == "MH3_Armoire_WP") || (GetName(OBJECT_SELF) == "MH6_Armoire_WP") || (GetName(OBJECT_SELF) == "MH7_Armoire_WP") || (GetName(OBJECT_SELF) == "MH8_Armoire_WP"))

	   {object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	//AssignCommand(oSpeaker, ActionSpeakString("MyTrig = " + GetName(oMyTrig), TALKVOLUME_TALK));
		object oMyArmoire = ACR_SpawnObject("slv_armoire0", OBJECT_TYPE_PLACEABLE);
        SetLocalString(oMyArmoire, "ACR_PSO_NAME", GetName(oMyTrig) + "_Armoire");
		SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Armoire", oMyArmoire);
		object oMyChair = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair_WP")));
        object oMyChair2 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair4_WP")));
        object oMyLowChair = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair_WP")));
        object oMyLowChair2 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair2_WP")));
        object oMyLowChair3 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair3_WP")));
        object oMyLowChair4 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair4_WP")));
        object oMySofa = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa_WP")));
        object oMySofa2 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa2_WP")));
        object oMySofa3 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa3_WP")));
        object oMySofa4 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa4_WP")));
        object oMyLowSofa = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Sofa_WP")));
        object oMyLowSofa2 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Sofa2_WP")));
        object oMyDesk = ACR_SpawnObjectAtLocation("slv_desk0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Desk_WP")));
        SetLocalString(oMyDesk, "ACR_PSO_NAME", GetName(oMyTrig) + "_Desk");
		object oMyLowDesk = ACR_SpawnObjectAtLocation("slv_desk2", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Desk_WP")));
        SetLocalString(oMyDesk, "ACR_PSO_NAME", GetName(oMyTrig) + "_Desk");
		object oMyFirestarter = ACR_SpawnObjectAtLocation("slv_firestarter0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Firestarter_WP")));
        object oMyStool = ACR_SpawnObjectAtLocation("003_stool", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Stool_WP")));
      	object oMyLowStool = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Stool_WP")));
      	object oMyTrashcan = ACR_SpawnObjectAtLocation("slv_trashcan", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Trashcan_WP")));
      	object oMyCushions = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cushions_WP")));
      	}
		
	if((GetName(OBJECT_SELF) == "MH4_Armoire_WP") || (GetName(OBJECT_SELF) == "MH5_Armoire_WP"))
		{object oMyTrig=GetLocalObject(OBJECT_SELF, "MyTrig");
	   	//AssignCommand(oSpeaker, ActionSpeakString("MyTrig = " + GetName(oMyTrig), TALKVOLUME_TALK));
		object oMyArmoire = ACR_SpawnObject("slv_armoire0", OBJECT_TYPE_PLACEABLE);
        SetLocalString(oMyArmoire, "ACR_PSO_NAME", GetName(oMyTrig) + "_Armoire");
		SetLocalObject(oMyTrig, GetName(oMyTrig) + "_Armoire", oMyArmoire);
		object oMyChair = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair_WP")));
        object oMyDesk = ACR_SpawnObjectAtLocation("slv_desk0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Desk_WP")));
        SetLocalString(oMyDesk, "ACR_PSO_NAME", GetName(oMyTrig) + "_Desk");
		object oMyChair2 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair2_WP")));
        object oMyChair3 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair3_WP")));
        object oMyChair4 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Chair4_WP")));
        object oMyLowChair = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair_WP")));
        object oMyLowChair2 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair2_WP")));
        object oMyLowChair3 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair3_WP")));
        object oMyLowChair4 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Chair4_WP")));
        object oMySofa = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa_WP")));
        object oMySofa2 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa2_WP")));
        object oMySofa3 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa3_WP")));
        object oMySofa4 = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Sofa4_WP")));
        object oMyLowSofa = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Sofa_WP")));
        object oMyLowSofa2 = ACR_SpawnObjectAtLocation("003_low_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Low_Sofa2_WP")));
        object oMyFirestarter = ACR_SpawnObjectAtLocation("slv_firestarter0", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Firestarter_WP")));
        object oMyStool = ACR_SpawnObjectAtLocation("003_stool", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Stool_WP")));
      	object oMyTrashcan = ACR_SpawnObjectAtLocation("slv_trashcan", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Trashcan_WP")));
      	object oMyCushions = ACR_SpawnObjectAtLocation("003_mid_sitbox", OBJECT_TYPE_PLACEABLE, GetLocation(GetLocalObject(oMyTrig, GetName(oMyTrig) + "_Cushions_WP")));
      	}	
}