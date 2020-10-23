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
	
object oQuester=GetEnteringObject();
object oPC=GetEnteringObject();
//Rivermoot Exterior one-liner scripts.
 if(GetTag(OBJECT_SELF) == "rm_swordrock")
 	{SendMessageToPC(GetEnteringObject(), "This rock is a monument to the dead, roughly chiselled with the names of fallen warriors.");}

  if((GetTag(OBJECT_SELF) == "wyvernmessage") && (GetLocalInt(GetEnteringObject(), "wyvern") != 1))
	{SendMessageToPC(GetEnteringObject(), "It looks as if the kobolds tried to erect a barricade here, and failed. Smashed wood and stone litter the ground.");
	 SetLocalInt(GetEnteringObject(), "wyvern", 1);
	}

 if((GetTag(OBJECT_SELF) == "rm_scout_05_se_trig") && (ACR_RetrieveQuestState("rm_scout_05", oQuester) >= 1) && (ACR_RetrieveQuestState("rm_scout_05", oQuester) <= 4))
 	{SendMessageToPC(oQuester, "You can see the padlock on the crypts, solidly and reassuringly locked tight. This vantage completes the view from the southeast corner. Scout the other corners.");
	 	 
	if(ACR_RetrieveQuestState("rm_scout_05", oQuester) == 1)
		{ACR_AddPersistentJournalQuestEntry("rm_scout_05", 2, GetEnteringObject(), FALSE, FALSE, FALSE, FALSE);
		 }

	 int nHour = GetTimeHour();
	int nUndeadAtWP = 15;
	if((nHour >= 18) || (nHour <= 6))
		{nUndeadAtWP = 50;}
	int nSpawnChance=Random(100);
	SendMessageToAllDMs("Wendover Exterior nSpawnChance = " + IntToString(nSpawnChance) + " To spawn, must be < 80%");
	if(nSpawnChance<80)
		{SendMessageToAllDMs("nSpawnChance < 80%");
	     if(GetLocalInt(GetArea(OBJECT_SELF), "nZombies")==0)
			{SendMessageToAllDMs("60 minute delay on spawnability starting. Hour is " + IntToString(nHour) + " nUndeadAtWP possibility is " + IntToString(nUndeadAtWP) + "%" );
	         SetLocalInt(GetArea(OBJECT_SELF), "nZombies", 1);
			 DelayCommand(3600.0, SetLocalInt(GetArea(OBJECT_SELF), "nZombies", 0));
			 int nInc=1;
			 for(nInc=1; nInc<10; nInc++)
				{object oUndeadSpawn = GetObjectByTag("wc_undead_create_wp", nInc);
				 if(oUndeadSpawn != OBJECT_INVALID)
					{
					int nRandom = Random(100)+1;
					SendMessageToAllDMs(IntToString(nInc) + " " + GetTag(oUndeadSpawn) + " Spawn percent = " + IntToString(nRandom));
					
					 if(nRandom < nUndeadAtWP)
					 	{int nRandomUndeadLow = Random(18);
						 string sUndeadKind = "abr_cr_un_zombie01";
						 if(nRandomUndeadLow == 2)
						 	{sUndeadKind = "abr_cr_un_zombie02";}
						 else if(nRandomUndeadLow == 3)
						 	{sUndeadKind = "abr_cr_un_zombie03";}
						 else if(nRandomUndeadLow == 4)
						 	{sUndeadKind = "abr_cr_un_zombie04";}
						 else if(nRandomUndeadLow == 5)
						 	{sUndeadKind = "abr_cr_un_skeleton01";}
						 else if(nRandomUndeadLow == 6)
						 	{sUndeadKind = "abr_cr_un_skeleton02";}
						 else if(nRandomUndeadLow == 7)
						 	{sUndeadKind = "abr_cr_un_skeleton03";}
						 else if(nRandomUndeadLow == 8)
						 	{sUndeadKind = "abr_cr_un_skeleton04";}
						 else if(nRandomUndeadLow == 9)
						 	{sUndeadKind = "abr_cr_un_skeleton_defender01";}
						 else if(nRandomUndeadLow == 10)
						 	{sUndeadKind = "abr_cr_un_skeleton_defender02";}
						 else if(nRandomUndeadLow == 11)
						 	{sUndeadKind = "abr_cr_un_skeleton_defender03";}
						 else if(nRandomUndeadLow == 12)
						 	{sUndeadKind = "abr_cr_un_skeleton_dwarf";}
						 else if(nRandomUndeadLow == 13)
						 	{sUndeadKind = "abr_cr_un_skeleton_elf";}
						 else if(nRandomUndeadLow == 14)
						 	{sUndeadKind = "abr_cr_un_skeleton_gnome";}
						 else if(nRandomUndeadLow == 15)
						 	{sUndeadKind = "abr_cr_un_skeleton_halfling";}
						 else if(nRandomUndeadLow == 16)
						 	{sUndeadKind = "abr_cr_un_skeleton_halforc";}
						 else if(nRandomUndeadLow == 17)
						 	{sUndeadKind = "abr_cr_un_ghoul";}
						 else if(nRandomUndeadLow == 18)
						 	{sUndeadKind = "abr_cr_un_allip_01";}
						
						SendMessageToAllDMs("Waypoint " + IntToString(nInc) + " will spawn RandomUndeadLow - " + sUndeadKind);
						 
						if((nHour >= 18) || (nHour <= 6))
							{SendMessageToAllDMs("It's night! There is a 25% chance Low Undead will be changed to Med Undead");
							 int nRandomUndeadMed = Random(4);
							 SendMessageToAllDMs("nRandomUndeadMed = " + IntToString(nRandomUndeadMed));
							 if(nRandomUndeadMed == 1)
							 	{int nRandomUndeadMedKind = Random(8);
								 if(nRandomUndeadMedKind == 1)
								 	{sUndeadKind = "abr_cr_un_zombie_militia01";}
								 else if(nRandomUndeadMedKind == 2)
								 	{sUndeadKind = "abr_cr_un_zombie_militia02";}
								 else if(nRandomUndeadMedKind == 3)
								 	{sUndeadKind = "abr_cr_un_zombie_militia03";}
								 else if(nRandomUndeadMedKind == 4)
								 	{sUndeadKind = "abr_cr_un_zombie_militia04";}
								 else if(nRandomUndeadMedKind == 5)
								 	{sUndeadKind = "abr_cr_un_zombie_soldier01";}
								 else if(nRandomUndeadMedKind == 6)
								 	{sUndeadKind = "abr_cr_un_zombie_soldier02";}
								 else if(nRandomUndeadMedKind == 7)
								 	{sUndeadKind = "abr_cr_un_zombie_soldier03";}
								 else if(nRandomUndeadMedKind == 8)
								 	{sUndeadKind = "abr_cr_un_zombie_soldier04";}
								 
									SendMessageToAllDMs("25% chance triggered. Low Undead replaced by Med Undead - " + sUndeadKind);
								 
								}
							
							}
						 
						 CreateObject(OBJECT_TYPE_CREATURE, sUndeadKind, GetLocation(oUndeadSpawn));
						 SendMessageToPC(oQuester, "The dead rise!");
					     }
					}	
				}	
			}
		}	 
		 
		 
	}
		
 if(((GetTag(OBJECT_SELF) == "rm_scout_05_sw_trig")|| (GetTag(OBJECT_SELF) == "rm_scout_05_nw_trig")|| (GetTag(OBJECT_SELF) == "rm_scout_05_ne_trig") ) && (GetIsPC(oQuester)) && (GetLocalString(oQuester, "Triggered") != GetTag(OBJECT_SELF)))
 	{if((ACR_RetrieveQuestState("rm_scout_05", oQuester) == 2) || (ACR_RetrieveQuestState("rm_scout_05", oQuester) == 3) || (ACR_RetrieveQuestState("rm_scout_05", oQuester) == 4)) {
	
	SetLocalString(oQuester, "Triggered", GetTag(OBJECT_SELF));
	SendMessageToAllDMs(GetTag(OBJECT_SELF) + " triggered onenter by " + GetName(oQuester) + " with entering quest state of " + IntToString(ACR_RetrieveQuestState("rm_scout_05", oQuester )));
	if(ACR_RetrieveQuestState("rm_scout_05", oQuester) == 2)
		{SendMessageToAllDMs(GetTag(OBJECT_SELF) + " confirming " + GetName(oQuester) + " with quest state 2");
	     SendMessageToPC(oQuester, "You have scouted one corner of the Wendover Crypts grounds.");
	 	 ACR_AddPersistentJournalQuestEntry("rm_scout_05", 3, GetEnteringObject(), FALSE, FALSE, FALSE, FALSE);
		 }
	else if(ACR_RetrieveQuestState("rm_scout_05", oQuester) == 3)
		{SendMessageToAllDMs(GetTag(OBJECT_SELF) + " confirming " + GetName(oQuester) + " with quest state 3");
	     SendMessageToPC(oQuester, "You have scouted a second corner of the Wendover Crypts grounds.");
	 	 ACR_AddPersistentJournalQuestEntry("rm_scout_05", 4, GetEnteringObject(), FALSE, FALSE, FALSE, FALSE);
		 }
	else if(ACR_RetrieveQuestState("rm_scout_05", oQuester) == 4)
		{SendMessageToAllDMs(GetTag(OBJECT_SELF) + " confirming " + GetName(oQuester) + " with quest state 4");
	     SendMessageToPC(oQuester, "You have scouted the last corner of the Wendover Crypts grounds. Return to Kadalion.");
	 	 ACR_AddPersistentJournalQuestEntry("rm_scout_05", 5, GetEnteringObject(), FALSE, FALSE, FALSE, FALSE);
		 }
		 
	SendMessageToAllDMs(GetTag(OBJECT_SELF) + " - " + GetName(oQuester) + " should have been advanced to previous quest state +1. Reading quest state of " + IntToString(ACR_RetrieveQuestState("rm_scout_05", oQuester )));
		 
		}
	}

 if((GetTag(OBJECT_SELF) == "rm_wands_cave_pool_trigger") && (GetLocalInt(oPC, "rm_wands_pool_msg")))
 	{SetLocalInt(oPC, "rm_wands_pool_msg", 1);
	 DelayCommand(3600.0, SetLocalInt(oPC, "rm_wands_pool_msg", 0));
	 SendMessageToPC(GetEnteringObject(), "The surface of the pool is covered in scum and floating mats of cave vegetation, rocking gently. There appears to be a hole in the bottom of the pool, and at least the beginnings of a passage. Diving in to explore will mean swimming, for an unknown amount of time. To attempt it, lower yourself in with the rocking handhold.");
	 }

	
}