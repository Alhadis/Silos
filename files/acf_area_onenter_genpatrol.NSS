////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Configuration File
//     Filename : acf_area_onenter.nss
//      Version : 0.1
//         Date : 7/25/06
//       Author : Ronan
//
//  Local Variable Prefix =
//
//
//  Dependencies external of nwscript:
//
//  Description
//  This script calls the ACR's OnAreaEnter code, and any custom code a server
//  may need. It is not updated in ACR updates.
//
//  Revision History
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

#include "acr_area_i"
#include "acr_quest_i"

////////////////////////////////////////////////////////////////////////////////
// Constants ///////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

const string AreaStartCount = "AREA_START_COUNT";
const string WaypointPrefix = "AREA_PATROL_";
const string AoEPrefix = "KINGSBAY_PATROL_AOE_";
const string SpawnpointPrefix = "AREA_PATROL_SPAWN_";
const string QuestName = "AREA_QUEST_NAME";

////////////////////////////////////////////////////////////////////////////////
// Structures //////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Global Variables ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Function Prototypes /////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

//! The main event handler.
void main();

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

void CreateQuestStep(object QuestWP, int count)
{	
	int spawnChance = Random(1000);
	if(spawnChance <= 10)
	{
		// Uncommon 1 in 50 encounter, CR 5
		effect AoE = EffectAreaOfEffect(86, "acf_trg_onenter", "acf_trg_onheartbeat", "acf_trg_onexit", AoEPrefix + IntToString(count));
		ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, SupernaturalEffect(AoE), GetLocation(QuestWP));
		object spawnedAoE = GetObjectByTag(AoEPrefix + IntToString(count));
		
		string spawnedCritter = "";
		string spawnedCritterName = "";
		int CR = 0;
		switch(Random(3))
		{
			case 0:
				spawnedCritter = "abr_cr_vm_beetle_stag";
				spawnedCritterName = " monstrous beetle";
				CR = 5;
				break;
			case 1:
				spawnedCritter = "abr_cr_vm_spider_hugehun";
				spawnedCritterName = " Big Nasty spider";
				CR = 5;
				break;
			case 2:
				spawnedCritter = "009_hu_dangerous";
				spawnedCritterName = " Dangerous Human";
				CR = 5;
				break;
		}
		
		SetLocalString(spawnedAoE, ACR_QST_NAME, GetLocalString(OBJECT_SELF, QuestName));
		SetLocalString(spawnedAoE, ACR_QST_SPAWN_CRESREF, spawnedCritter);
		SetLocalString(spawnedAoE, ACR_QST_SPAWN_WAYPOINT, SpawnpointPrefix + IntToString(count));
		SetLocalInt(spawnedAoE, ACR_QST_LOWER_STATE, count);
		SetLocalInt(spawnedAoE, ACR_QST_UPPER_STATE, count+1);
		SetLocalString(spawnedAoE, ACR_QST_MESSAGE, "You spot a"+spawnedCritterName+" along the route. It will need to be dispatched to call the road secured.");
	}
	else if(spawnChance <= 30)
	{
		// Uncommon 1 in 50 encounter, CR 3-4
		effect AoE = EffectAreaOfEffect(86, "acf_trg_onenter", "acf_trg_onheartbeat", "acf_trg_onexit", AoEPrefix + IntToString(count));
		ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, SupernaturalEffect(AoE), GetLocation(QuestWP));
		object spawnedAoE = GetObjectByTag(AoEPrefix + IntToString(count));
		
		string spawnedCritter = "";
		string spawnedCritterName = "";
		int CR = 0;
		switch(Random(5))
		{
			case 0:
				spawnedCritter = "010_cr_badgerdire";
				spawnedCritterName = " dire badger";
				CR = 4;
				break;
			case 1:
				spawnedCritter = "010_cr_boardire";
				spawnedCritterName = " dire boar";
				CR = 4;
				break;
			case 2:
				spawnedCritter = "010_cr_wolverinedire";
				spawnedCritterName = " dire wolverine";
				CR = 4;
				break;
			case 3:
				spawnedCritter = "010_cr_magbeast_ankheg";
				spawnedCritterName = "Upright Beetle";
				CR = 3;
				break;
			case 4:
				spawnedCritter = "010_cr_wolfdire";
				spawnedCritterName = " dire wolf";
				CR = 3;
				break;
		}
		
		SetLocalString(spawnedAoE, ACR_QST_NAME, GetLocalString(OBJECT_SELF, QuestName));
		SetLocalString(spawnedAoE, ACR_QST_SPAWN_CRESREF, spawnedCritter);
		SetLocalString(spawnedAoE, ACR_QST_SPAWN_WAYPOINT, SpawnpointPrefix + IntToString(count));
		SetLocalInt(spawnedAoE, ACR_QST_LOWER_STATE, count);
		SetLocalInt(spawnedAoE, ACR_QST_UPPER_STATE, count+1);
		SetLocalString(spawnedAoE, ACR_QST_MESSAGE, "You spot a"+spawnedCritterName+" along the route. It will need to be dispatched to call the road secured.");
	}
	else if(spawnChance <= 80)
	{
		// Common 1 in 25 encounter, CR 1-2
		effect AoE = EffectAreaOfEffect(86, "acf_trg_onenter", "acf_trg_onheartbeat", "acf_trg_onexit", AoEPrefix + IntToString(count));
		ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, SupernaturalEffect(AoE), GetLocation(QuestWP));
		object spawnedAoE = GetObjectByTag(AoEPrefix + IntToString(count));
		
		string spawnedCritter = "";
		string spawnedCritterName = "";
		int CR = 0;
		switch(Random(8))
		{
			case 0:
				spawnedCritter = "abr_cr_an_direbadger";
				spawnedCritterName = " dire badger";
				CR = 2;
				break;
			case 1:
				spawnedCritter = "abr_cr_vm_beetle_bomb";
				spawnedCritterName = " beetle";
				CR = 2;
				break;
			case 2:
				spawnedCritter = "010_cr_wolverinedire";
				spawnedCritterName = " dire wolverine";
				CR = 2;
				break;
			case 3:
				spawnedCritter = "abr_cr_ve_centi_huge";
				spawnedCritterName = " monstrous centipede";
				CR = 2;
				break;
			case 4:
				spawnedCritter = "abr_cr_ve_spider_large";
				spawnedCritterName = " monstrous spider";
				CR = 2;
				break;
			case 5:
				spawnedCritter = "abr_cr_ve_centi_large";
				spawnedCritterName = " monstrous centipede";
				CR = 1;
				break;
			case 6:
				spawnedCritter = "abr_cr_vm_spider_medium";
				spawnedCritterName = " monstrous spider";
				CR = 1;
				break;
			case 7:
				spawnedCritter = "abr_cr_an_direrat";
				spawnedCritterName = " dire rat";
				CR = 1;
				break;
		}
		
		SetLocalString(spawnedAoE, ACR_QST_NAME, GetLocalString(OBJECT_SELF, QuestName));
		SetLocalString(spawnedAoE, ACR_QST_SPAWN_CRESREF, spawnedCritter);
		SetLocalString(spawnedAoE, ACR_QST_SPAWN_WAYPOINT, SpawnpointPrefix + IntToString(count));
		SetLocalInt(spawnedAoE, ACR_QST_LOWER_STATE, count);
		SetLocalInt(spawnedAoE, ACR_QST_UPPER_STATE, count+1);
		SetLocalString(spawnedAoE, ACR_QST_MESSAGE, "You spot a"+spawnedCritterName+" along the route. It will need to be dispatched to call the road secured.");
		
	}
	else
	{
		// No encounter; this is just a "scout" trigger
		effect AoE = EffectAreaOfEffect(86, "acf_trg_onenter", "acf_trg_onheartbeat", "acf_trg_onexit", AoEPrefix + IntToString(count));
		ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, SupernaturalEffect(AoE), GetLocation(QuestWP));
		object spawnedAoE = GetObjectByTag(AoEPrefix + IntToString(count));
		
		SetLocalString(spawnedAoE, ACR_QST_NAME, GetLocalString(OBJECT_SELF, QuestName));
		SetLocalInt(spawnedAoE, ACR_QST_LOWER_STATE, count);
		SetLocalInt(spawnedAoE, ACR_QST_UPPER_STATE, count+1);
		SetLocalString(spawnedAoE, ACR_QST_MESSAGE, "You progress on the patrol, finding no particular threats here.");
	}
}

void main() 
{
    ACR_AreaOnEnter();
	
	// Custom code goes below this line.
	int count = GetLocalInt(OBJECT_SELF, AreaStartCount);
	if(ACR_RetrieveQuestState(GetLocalString(OBJECT_SELF, QuestName), GetEnteringObject()) >= count &&
		!GetIsObjectValid(GetObjectByTag(AoEPrefix + IntToString(count))))
	{
		object QuestWP = GetWaypointByTag(WaypointPrefix + IntToString(count));
		while(GetIsObjectValid(QuestWP))
		{
			CreateQuestStep(QuestWP, count);
			count++;
			QuestWP = GetWaypointByTag(WaypointPrefix + IntToString(count));
		}
	}
}