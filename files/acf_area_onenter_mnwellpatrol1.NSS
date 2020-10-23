////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Configuration File
//     Filename : acf_area_onenter_mnwellpatrol1.nss
//      Version : 0.1
//         Date : 7/25/06
//       Author : Zelknof
//
//  Local Variable Prefix =
//
//
//  Dependencies external of nwscript:
//
//  Description
//  This script calls the ACR's OnAreaEnter code, and any custom code a server
//  may need. It is not updated in ACR updates.
//  If you want to make more than a single patrol copy this script and the matching 
//  onexit script and make the changes as out outlined below
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

const string AreaStartCount = "AREA_START_COUNT";  // this will be the quest state as you enter the area. Add as a variable to your start area 
const string WaypointPrefix = "AREA_PATROL_MW1_"; //Add a distinct discriptive here for EACH patrol 
const string AoEPrefix = "MOONWELL1_PATROL_AOE_";//change this on both the onenter and onexit script to the name of your patrol, they must match
const string SpawnpointPrefix = "AREA_PATROL_SPAWN_MW1_";//Add a distinct Discriptive here for each spawn point( MW1)
const string QuestName = "AREA_QUEST_NAME";// Add as a variable to your patrol area [AREA_QUEST_NAME = <tag_of_quest>]

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
		// Uncommon 1 in 50 encounter, CR 7
		effect AoE = EffectAreaOfEffect(86, "acf_trg_onenter", "acf_trg_onheartbeat", "acf_trg_onexit", AoEPrefix + IntToString(count));
		ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, SupernaturalEffect(AoE), GetLocation(QuestWP));
		object spawnedAoE = GetObjectByTag(AoEPrefix + IntToString(count));
		
		string spawnedCritter = "";
		string spawnedCritterName = "";
		int CR = 0;
		switch(Random(3))
		{
			case 0:
				spawnedCritter = "tg_lgstagbet";
				spawnedCritterName = "Large Beetle";
				CR = 7;
				break;
			case 1:
				spawnedCritter = "abr_cr_mb_manticore";
				spawnedCritterName = "Winged Monstrosity";
				CR = 6;
				break;
			case 2:
				spawnedCritter = "010_cr_beardire";
				spawnedCritterName = "Hulking Bear";
				CR = 7;
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
		// Uncommon 1 in 50 encounter, CR 5-6
		effect AoE = EffectAreaOfEffect(86, "acf_trg_onenter", "acf_trg_onheartbeat", "acf_trg_onexit", AoEPrefix + IntToString(count));
		ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, SupernaturalEffect(AoE), GetLocation(QuestWP));
		object spawnedAoE = GetObjectByTag(AoEPrefix + IntToString(count));
		
		string spawnedCritter = "";
		string spawnedCritterName = "";
		int CR = 0;
		switch(Random(5))
		{
			case 0:
				spawnedCritter = "abr_cr_an_wild_bear";
				spawnedCritterName = " Brown Bear";
				CR = 5;
				break;
			case 1:
				spawnedCritter = "tg_hgbombbet";
				spawnedCritterName = " huge beetle";
				CR = 6;
				break;
			case 2:
				spawnedCritter = "abr_cr_mh_greenhag";
				spawnedCritterName = " Old green woman";
				CR = 4;
				break;
			case 3:
				spawnedCritter = "abr_cr_vm_spider_huge";
				spawnedCritterName = " Huge Spider";
				CR = 5;
				break;
			case 4:
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
	else if(spawnChance <= 80)
	{
		// Common 1 in 25 encounter, CR 3-4
		effect AoE = EffectAreaOfEffect(86, "acf_trg_onenter", "acf_trg_onheartbeat", "acf_trg_onexit", AoEPrefix + IntToString(count));
		ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, SupernaturalEffect(AoE), GetLocation(QuestWP));
		object spawnedAoE = GetObjectByTag(AoEPrefix + IntToString(count));
		
		string spawnedCritter = "";
		string spawnedCritterName = "";
		int CR = 0;
		switch(Random(8))
		{
			case 0:
				spawnedCritter = "010_cr_badgerdire";
				spawnedCritterName = " dire badger";
				CR = 4;
				break;
			case 1:
				spawnedCritter = "abr_cr_fy_pixie";
				spawnedCritterName = " Pixie";
				CR = 3;
				break;
			case 2:
				spawnedCritter = "010_cr_wolverinedire";
				spawnedCritterName = " dire wolverine";
				CR = 4;
				break;
			case 3:
				spawnedCritter = "abr_cr_an_wild_mountainlion";
				spawnedCritterName = " Big Cat";
				CR = 3;
				break;
			case 4:
				spawnedCritter = "010_cr_boardire";
				spawnedCritterName = " dire boar";
				CR = 4;
				break;
			case 5:
				spawnedCritter = "010_cr_wolfdire";
				spawnedCritterName = " Large Wolf";
				CR = 3;
				break;
			case 6:
				spawnedCritter = "tg_cr_medspid";
				spawnedCritterName = " big spider";
				CR = 3;
				break;
			case 7:
				spawnedCritter = "010_cr_magbeast_ankheg";
				spawnedCritterName = " Upright Bug";
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