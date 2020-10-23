/*

    Script:			Called by the Master On Death script when crafting is active, this script wil
					setup a skinning corpse for crafters to obtain items from dead creatures.  It is
					essentially a harvesting wrapper to pass on variables stored on a creature to
					a placeable object that is spawned on their death for use with harvesting.
	Version:		1.00
	Plugin Version: 1.93
	Author:			Marshall Vyper
	Parameters:		N/A
	
	Change Log:		06/23/2011 - 1.00 MV - Initial Release
	
*/


// /////////////////////////////////////////////////////////////////////////////////////////////////////
// INCLUDES
// /////////////////////////////////////////////////////////////////////////////////////////////////////
#include "leg_craft_include"


// /////////////////////////////////////////////////////////////////////////////////////////////////////
// MAIN ROUTINE
// /////////////////////////////////////////////////////////////////////////////////////////////////////
void main()
{
	// This script will basically create a custom placeable object at the corpse site for the PC to be able to 
	// use as a harvestable object.  First we need to see if this critter is a craft object.
	int iSkill = GetLocalInt(OBJECT_SELF, "LEG_CRAFT_Skill");
	
	if (iSkill)
	{
		// Why yes it is, now lets place some MEAT!
		location lLoc = GetLocation(OBJECT_SELF);
		string sResource = GetLocalString(OBJECT_SELF, "LEG_CRAFT_ResourceRef");
		string sName = GetName(OBJECT_SELF) + " Corpse";
		int iTimer = GetLocalInt(OBJECT_SELF, "LEG_CRAFT_Timer");
		
		// Create the Meat and transfer the variables over.
		object oResource = CreateObject(OBJECT_TYPE_PLACEABLE, sResource, lLoc, FALSE);
		SetFirstName(oResource, sName);
		SetLocalInt(oResource, "LEG_CRAFT_Skill", iSkill);
		SetLocalString(oResource, "LEG_CRAFT_Skill_Method", GetLocalString(OBJECT_SELF, "LEG_CRAFT_Skill_Method"));
		SetLocalString(oResource, "LEG_CRAFT_Skill_Tool", GetLocalString(OBJECT_SELF, "LEG_CRAFT_Skill_Tool"));
		SetLocalString(oResource, "LEG_CRAFT_Harvest", GetLocalString(OBJECT_SELF, "LEG_CRAFT_Harvest"));
		SetLocalString(oResource, "LEG_CRAFT_HarvestFail", GetLocalString(OBJECT_SELF, "LEG_CRAFT_HarvestFail"));
		SetLocalString(oResource, "LEG_CRAFT_HarvestAdd", GetLocalString(OBJECT_SELF, "LEG_CRAFT_HarvestAdd"));
		SetLocalInt(oResource, "LEG_CRAFT_MinSkill", GetLocalInt(OBJECT_SELF, "LEG_CRAFT_MinSkill"));
		SetLocalInt(oResource, "LEG_CRAFT_MaxSkill", GetLocalInt(OBJECT_SELF, "LEG_CRAFT_MaxSkill"));
		SetLocalInt(oResource, "LEG_CRAFT_HarvestMin", GetLocalInt(OBJECT_SELF, "LEG_CRAFT_HarvestMin"));
		SetLocalInt(oResource, "LEG_CRAFT_HarvestMax", GetLocalInt(OBJECT_SELF, "LEG_CRAFT_HarvestMax"));
		SetLocalInt(oResource, "LEG_CRAFT_HarvestFailMin", GetLocalInt(OBJECT_SELF, "LEG_CRAFT_HarvestFailMin"));
		SetLocalInt(oResource, "LEG_CRAFT_HarvestFailMax", GetLocalInt(OBJECT_SELF, "LEG_CRAFT_HarvestFailMax"));
		SetLocalInt(oResource, "LEG_CRAFT_HarvestFailChance", GetLocalInt(OBJECT_SELF, "LEG_CRAFT_HarvestFailChance"));
		SetLocalInt(oResource, "LEG_CRAFT_HarvestAddMin", GetLocalInt(OBJECT_SELF, "LEG_CRAFT_HarvestAddMin"));
		SetLocalInt(oResource, "LEG_CRAFT_HarvestAddMax", GetLocalInt(OBJECT_SELF, "LEG_CRAFT_HarvestAddMax"));
		SetLocalInt(oResource, "LEG_CRAFT_HarvestAddChance", GetLocalInt(OBJECT_SELF, "LEG_CRAFT_HarvestAddChance"));
		SetLocalInt(oResource, "LEG_CRAFT_ToolDamage", GetLocalInt(OBJECT_SELF, "LEG_CRAFT_ToolDamage"));
		SetLocalInt(oResource, "LEG_CRAFT_StrengthMin", GetLocalInt(OBJECT_SELF, "LEG_CRAFT_StrengthMin"));
		SetLocalInt(oResource, "LEG_CRAFT_StrengthMax", GetLocalInt(OBJECT_SELF, "LEG_CRAFT_StrengthMax"));
		
		// If the Info Plugin is active, we'll want to transfer over those variables as well.
		if (GetLocalInt(GetModule(), "LEG_INFO_ACTIVE"))
		{
			SetLocalString(oResource, "LEG_INFO_ProgBarTitle", GetLocalString(OBJECT_SELF, "LEG_INFO_ProgBarTitle"));
			SetLocalString(oResource, "LEG_INFO_ProgBarItem", GetLocalString(OBJECT_SELF, "LEG_INFO_ProgBarItem"));
			SetLocalInt(oResource, "LEG_INFO_ProgBarDuration", GetLocalInt(OBJECT_SELF, "LEG_INFO_ProgBarDuration"));
			SetLocalString(oResource, "LEG_INFO_ProgBarCallScript", GetLocalString(OBJECT_SELF, "LEG_INFO_ProgBarCallScript"));
			SetLocalInt(oResource, "LEG_INFO_FollowUpDeactivate", GetLocalInt(OBJECT_SELF, "LEG_INFO_FollowUpDeactivate"));
		}
		
		// Tell the crafting system that there is a parent corpse so when destroyed, we want the parent to go too.
		SetLocalObject(oResource, "LEG_CRAFT_Parent", OBJECT_SELF);

		// Cleanup in the event no one wrecked it.
		DestroyObject(oResource, IntToFloat(iTimer));
	}
}