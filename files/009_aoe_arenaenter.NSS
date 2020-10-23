//010_aoe_arenaenter
#include "009_arena_i"

void main()
{
	if(GetObjectType(GetEnteringObject()) != OBJECT_TYPE_CREATURE) return;
	string sAoE = GetTag(OBJECT_SELF);
	if(sAoE == "ARENA_CENTER_AOE")
	{
		object oPC = GetEnteringObject();
		_resetRep(oPC);
		_heartBeat(oPC, GetCurrentHitPoints(oPC));
		SendMessageToPC(oPC, "You have entered an arena.");
	}
	else if(sAoE == "ARENA_RED_AOE")
	{
		object oPC = GetEnteringObject();
		Remove("BLUE", oPC);
		Push("RED", oPC);
		SetLocalString(oPC, "ARENA_TEAM", "RED");
		SendMessageToPC(oPC, "You have joined the red team.");
	}
	else if(sAoE == "ARENA_BLUE_AOE")
	{
		object oPC = GetEnteringObject();
		Remove("RED", oPC);
		Push("BLUE", oPC);
		SetLocalString(oPC, "ARENA_TEAM", "BLUE");
		SendMessageToPC(oPC, "You have joined the blue team.");
	}
	else if(sAoE == "ARENA_MC_AOE")
	{
		object oPC = GetEnteringObject();
		SetLocalObject(GetArea(OBJECT_SELF), "MC", oPC);
		if(CheckAllReady())
		{
			NotifyPlayer(oPC, NOTIFY_TYPE_TIP, "Match is ready to begin!", "The match is ready to begin! Are you ready to announce?", NOTIFY_WINDOW_MESSAGE_BOX, "gui_arena_start", "gui_arena_cancel", "Begin!", "Not yet!");
		}
		SendMessageToPC(oPC, "You have taken the master of ceremonies position.");
	}
}