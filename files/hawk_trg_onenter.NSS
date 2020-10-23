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
//  2015/07/7  Wynna
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#include "acr_trigger_i"
#include "acr_quest_i"
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

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

void main()
{
    ACR_TriggerOnEnter();

    // Custom code goes here.
	
object oQuester=GetEnteringObject();

if((GetTag(OBJECT_SELF) == "hawk_raid_01") && (ACR_RetrieveQuestState("hawk_raid_01", oQuester) == 1) && (GetIsPC(oQuester)) && (GetLocalString(OBJECT_SELF, GetName(oQuester)) != GetName(oQuester)))
 	{SetLocalString(OBJECT_SELF, GetName(oQuester), GetName(oQuester));
	 DelayCommand(3600.0, SetLocalString(OBJECT_SELF, GetName(oQuester), ""));
	 FloatingTextStringOnCreature("You hear the howl of a hunting wolf.", oQuester);
	 AssignCommand(oQuester, PlaySound("as_an_wolf_howling1", FALSE));
	 object oWolfSpawn = GetWaypointByTag("hawk_raid_01_wp");
	 object oDeerSpawn = GetWaypointByTag("hawk_raid_01_deer_wp");
	 object oDeer2Spawn = GetWaypointByTag("hawk_raid_01_deer2_wp");
	 object oWolf = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_wild_dogwolf_mad", GetLocation(oWolfSpawn));
	 object oWolfFood = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_wild_deer_stag", GetLocation(oWolfSpawn));
	 object oDeer = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_wild_deer_stag_hostile", GetLocation(oDeerSpawn));
	 object oDeer2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_an_wild_deer_stag_hostile", GetLocation(oDeer2Spawn));
	}
	
	
if((GetTag(OBJECT_SELF) == "hawk_raid_02") && (ACR_RetrieveQuestState("hawk_raid_02", oQuester) == 1)&& (GetIsPC(oQuester)) && (GetLocalString(OBJECT_SELF, GetName(oQuester)) != GetName(oQuester)))
 	{SetLocalString(OBJECT_SELF, GetName(oQuester), GetName(oQuester));
	DelayCommand(3600.0, SetLocalString(OBJECT_SELF, GetName(oQuester), ""));
	FloatingTextStringOnCreature("Shadows move amid the rockfall. A rock clatters.", oQuester);
	object oSkyPonySpawn = GetWaypointByTag("hawk_raid_02_wp");
	object oSkyPony = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_uthgardt_skypony_quest", GetLocation(oSkyPonySpawn));
	object oSkyPony2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_uthgardt_skypony_quest", GetLocation(oSkyPonySpawn));
	}
	
if((GetTag(OBJECT_SELF) == "hawk_raid_03") && (GetIsPC(oQuester)))
 	{if((GetLocalString(OBJECT_SELF, GetName(oQuester)) != GetName(oQuester)) && (ACR_RetrieveQuestState("hawk_raid_03", oQuester) == 1))
	   {SetLocalString(OBJECT_SELF, GetName(oQuester), GetName(oQuester));
	    DelayCommand(3600.0, SetLocalString(OBJECT_SELF, GetName(oQuester), ""));
	    SetLocalObject(OBJECT_SELF, "Quester", oQuester);
		FloatingTextStringOnCreature("Battle is already joined!", oQuester);
		object oOrcSpawn = GetNearestObjectByTag("ACR_SPAWN_WP", OBJECT_SELF, 4);
		object oKnightSpawn = GetNearestObjectByTag("ACR_SPAWN_WP", OBJECT_SELF, 3);
		object oOrc1 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oKnightSpawn));
		object oOrc2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oKnightSpawn));
		object oOrc3 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
		object oOrc4 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
		object oOrc5 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
		object oOrc6 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
		object oOrc7 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
		object oOrc8 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
		object oOrc9 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
		object oOrc10 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
		object oOrc11 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
		object oOrc12 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
		object oOrc13 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
		object oOrc14 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
		object oOrc15 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_hu_orcfighter_quest", GetLocation(oOrcSpawn));
		SetLocalObject(oQuester, "Orc1", oOrc1);
		SetLocalObject(oQuester, "Orc2", oOrc2);
		SetLocalObject(oQuester, "Orc3", oOrc3);
		SetLocalObject(oQuester, "Orc4", oOrc4);
		SetLocalObject(oQuester, "Orc5", oOrc5);
		SetLocalObject(oQuester, "Orc6", oOrc6);
		SetLocalObject(oQuester, "Orc7", oOrc7);
		SetLocalObject(oQuester, "Orc8", oOrc8);
		SetLocalObject(oQuester, "Orc9", oOrc9);
		SetLocalObject(oQuester, "Orc10", oOrc10);
		SetLocalObject(oQuester, "Orc11", oOrc11);
		SetLocalObject(oQuester, "Orc12", oOrc12);
		SetLocalObject(oQuester, "Orc13", oOrc13);
		SetLocalObject(oQuester, "Orc14", oOrc14);
		SetLocalObject(oQuester, "Orc15", oOrc15);
		
		object oKnight1 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_kis_atarms", GetLocation(oKnightSpawn));
		object oKnight2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_kis_atarms", GetLocation(oKnightSpawn));
		object oKnight3 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_kis_atarms", GetLocation(oKnightSpawn));
		object oKnight4 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_kis_atarms", GetLocation(oKnightSpawn));
		object oKnight5 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_kis_xbow", GetLocation(oKnightSpawn));
		object oKnight6 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_kis_xbow", GetLocation(oKnightSpawn));
		SetLocalObject(oQuester, "Knight1", oKnight1);
		SetLocalObject(oQuester, "Knight2", oKnight2);
		SetLocalObject(oQuester, "Knight3", oKnight3);
		SetLocalObject(oQuester, "Knight4", oKnight4);
		SetLocalObject(oQuester, "Knight5", oKnight5);
		SetLocalObject(oQuester, "Knight6", oKnight6);
		SetLocalObject(oQuester, "oQuester", oQuester);
		SetLocalObject(oKnight1, "oQuester", oQuester);
		SetLocalObject(oKnight2, "oQuester", oQuester);
		SetLocalObject(oKnight3, "oQuester", oQuester);
		SetLocalObject(oKnight4, "oQuester", oQuester);
		SetLocalObject(oKnight5, "oQuester", oQuester);
		SetLocalObject(oKnight6, "oQuester", oQuester);
		AssignCommand(oKnight1, PlaySound("as_pl_battlegrp1", FALSE));
		DelayCommand(5.0, AssignCommand(oOrc4, ActionMoveToLocation(GetLocation(oKnightSpawn), TRUE)));
		DelayCommand(6.0, AssignCommand(oOrc5, ActionMoveToLocation(GetLocation(oKnightSpawn), TRUE)));
		DelayCommand(7.0, AssignCommand(oOrc6, ActionMoveToLocation(GetLocation(oKnightSpawn), TRUE)));
		DelayCommand(8.0, AssignCommand(oOrc7, PlaySound("as_pl_battlegrp1", FALSE)));
		DelayCommand(9.0, AssignCommand(oOrc7, ActionMoveToLocation(GetLocation(oKnightSpawn), TRUE)));
		DelayCommand(10.0, AssignCommand(oOrc8, ActionMoveToLocation(GetLocation(oKnightSpawn), TRUE)));
		DelayCommand(11.0, AssignCommand(oOrc9, ActionMoveToLocation(GetLocation(oKnightSpawn), TRUE)));
		DelayCommand(12.0, AssignCommand(oOrc10, ActionMoveToLocation(GetLocation(oKnightSpawn), TRUE)));
		DelayCommand(13.0, AssignCommand(oOrc11, ActionMoveToLocation(GetLocation(oKnightSpawn), TRUE)));
		DelayCommand(14.0, AssignCommand(oOrc12, ActionMoveToLocation(GetLocation(oKnightSpawn), TRUE)));
		DelayCommand(15.0, AssignCommand(oOrc13, ActionMoveToLocation(GetLocation(oKnightSpawn), TRUE)));
		}
	}	
	
	
if((GetTag(OBJECT_SELF) == "hawk_scout_01") && (ACR_RetrieveQuestState("hawk_scout_01", oQuester) == 1)&& (GetIsPC(oQuester)) && (GetLocalString(OBJECT_SELF, GetName(oQuester)) != GetName(oQuester)))
 	{SetLocalString(OBJECT_SELF, GetName(oQuester), GetName(oQuester));
	 DelayCommand(3600.0, SetLocalString(OBJECT_SELF, GetName(oQuester), ""));
	if((GetIsSkillSuccessful(oQuester, SKILL_HIDE, 15, TRUE)) && (GetIsSkillSuccessful(oQuester, SKILL_MOVE_SILENTLY, 15, TRUE)))
		{SendMessageToPC(oQuester, "A hooded figure in robes bearing Auril's symbol is throwing raw meat down to ledge below. You hear a high, thin howl echoeing in the canyons, a howl that somehow freezes your heart and drives the cold of the surroundings deep into your flesh. A winter wolf is coming to feed! It is doubtful you would remain hidden should that predator arrive to find you still here.");
		object oAcolyteSpawn=GetWaypointByTag("hawk_scout_01_wp");
		object oAcolyte = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_auril_acolyte", GetLocation(oAcolyteSpawn));
		DelayCommand(3.0, ACR_AddPersistentJournalQuestEntry("hawk_scout_01", 2, oQuester));
	    }
	else
		{SendMessageToPC(oQuester, "A skin of ice on the snow crunches underfoot!");
		 SendMessageToPC(oQuester, "A shadow on the snowy path ahead shows a figure who had been standing out of sight suddenly turning and darting uphill. You hear an iron gate rattle, and its clang on hard stone as it closes.");
		 SendMessageToPC(oQuester, "You have been spotted, and must try again later if you want to complete Sergeant Filion's task.");
		}
	}

if((GetTag(OBJECT_SELF) == "hawk_scout_02") && (ACR_RetrieveQuestState("hawk_scout_02", oQuester) == 1)&& (GetIsPC(oQuester)) && (GetLocalString(OBJECT_SELF, GetName(oQuester)) != GetName(oQuester)))
 	{SetLocalString(OBJECT_SELF, GetName(oQuester), GetName(oQuester));
	 DelayCommand(3600.0, SetLocalString(OBJECT_SELF, GetName(oQuester), ""));
	 SendMessageToPC(oQuester, "You have found the entrance to the Halls of Artifice. The crystals beside and on top of the cave are about the same height as the cave entrance, which is as high as Sergeant Filion said they should be.");
	 ACR_AddPersistentJournalQuestEntry("hawk_scout_02", 2, oQuester);
     }
	 
if((GetTag(OBJECT_SELF) == "hawk_scout_03") && (ACR_RetrieveQuestState("hawk_scout_03", oQuester) == 1)&& (GetIsPC(oQuester)) && (GetLocalString(OBJECT_SELF, GetName(oQuester)) != GetName(oQuester)))
 	{SetLocalString(OBJECT_SELF, GetName(oQuester), GetName(oQuester));
	 DelayCommand(3600.0, SetLocalString(OBJECT_SELF, GetName(oQuester), ""));
	 SendMessageToPC(oQuester, "You have found your way into the crypt beneath Coal Dark Keep. Return to Sergeant Filion with a headcount of any ogres you have spotted.");
	 ACR_AddPersistentJournalQuestEntry("hawk_scout_03", 2, oQuester);
     }

	
}