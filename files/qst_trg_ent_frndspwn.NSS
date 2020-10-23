//010_qst_trg_ent_frndspwn
#include "acr_quest_i"

const string ACR_QUEST_SAVED_OBJECT = "SAVED_OBJECT_";
const string ACR_QUEST_SPAWN_RESREF = "ACR_QUEST_SPAWN_RESREF_";
const string ACR_QUEST_SPAWN_WAYPOINT = "ACR_QUEST_SPAWN_WAYPOINT_";
const string ACR_QUEST_SPAWN_TYPE = "ACR_QUEST_SPAWN_TYPE_";

void main()
{
	int count = 1;
	
	// If we already have a spawned quest NPC, we don't care about the rest of this.
	if(GetIsObjectValid(GetLocalObject(OBJECT_SELF, ACR_QUEST_SAVED_OBJECT + IntToString(count))))
		return;

	object oPC = GetEnteringObject();
	string sQuest = GetLocalString(OBJECT_SELF, ACR_QST_NAME);
	int nLowerStage = GetLocalInt(OBJECT_SELF, ACR_QST_LOWER_STATE);		
	
	if(ACR_RetrieveQuestState(sQuest, oPC) != nLowerStage)
		return;
	
	while(GetLocalString(OBJECT_SELF, ACR_QUEST_SPAWN_RESREF + IntToString(count)) != "")
	{
		object oSpawn = CreateObject(GetLocalInt(OBJECT_SELF, ACR_QUEST_SPAWN_TYPE + IntToString(count)),
			GetLocalString(OBJECT_SELF, ACR_QUEST_SPAWN_RESREF + IntToString(count)),
			GetLocation(GetWaypointByTag(GetLocalString(OBJECT_SELF, ACR_QUEST_SPAWN_WAYPOINT + IntToString(count)))));
		SetLocalObject(OBJECT_SELF, ACR_QUEST_SAVED_OBJECT + IntToString(count), oSpawn);
		count++;
	}
	
	SendMessageToPC(oPC, GetLocalString(OBJECT_SELF, ACR_QST_MESSAGE));
}

   