/*

    Script:			This is the include script for the TELE plugin.  If contains very few functions however it does
					have the user configurable options to stay within code standard for the Legends Plugin framework.
	Version:		1.1
	Plugin Version: 1.92
	Author:			Marshall Vyper
	Parameters:		N/A
	
	Change Log:		06/23/2011 - 1.0 MV - Initial Release
					02/17/2013 - 1.1 MV - Fixed racial and feat bugs, added Sub Race option
	
*/


// /////////////////////////////////////////////////////////////////////////////////////////////////////
// USER CONFIGURABLE CONSTANTS
// /////////////////////////////////////////////////////////////////////////////////////////////////////
#include "leg_tele_constants"



// /////////////////////////////////////////////////////////////////////////////////////////////////////
// INCLUDES
// /////////////////////////////////////////////////////////////////////////////////////////////////////
#include "leg_all_masterinclude"




// /////////////////////////////////////////////////////////////////////////////////////////////////////
// FUNCTION DECLARATIONS
// /////////////////////////////////////////////////////////////////////////////////////////////////////



// ///////////////////////////////////////////////////////////////////////////
// Checks for the requirements on a teleporter and returns a destination
// waypoint if the PC has met them.  Could also return various keywords
// for other types such as "Campsite", "RezSite", "BindPoint" etc.
// object oPC					- Player or Object to assign variable to
// object oTeleporter			- Teleport object with vars on it
// string sDestID				- Which destination number we are checking
//	Returns: string of Waypoint Tag or keyword.
string LEG_TELE_CheckRequirements(object oPC, object oTeleporter, string sDestID);




// ///////////////////////////////////////////////////////////////////////////
// Rotates through all the destinations on a teleporter object and
// checks to see if a PC can use it.  If so, returns the Waypoint
// tag or keyword for other types such as "Campsite", "RezSite", "BindPoint" 
// etc.
// object oPC					- Player or Object to assign variable to
// object oTeleporter			- Teleport object with vars on it
//	Returns: string of Waypoint Tag or keyword.
string LEG_TELE_GetTPDestination(object oPC, object oTeleporter);




// ///////////////////////////////////////////////////////////////////////////
// Checks to see if there are any sounds, special effects or delays on
// a teleporter that is about to be used by a PC.  If so, plays them
// object oPC					- Player or Object to assign variable to
// object oTeleporter			- Teleport object with vars on it
//	Returns: float of any Delay that is set.
float LEG_TELE_FunStuff(object oPC, object oTeleporter, object oDestination = OBJECT_INVALID);




// /////////////////////////////////////////////////////////////////////////////////////////////////////
// FUNCTIONS
// /////////////////////////////////////////////////////////////////////////////////////////////////////


// //////////////////////////////////////////////////
// LEG_TELE_CheckRequirements
// //////////////////////////////////////////////////
string LEG_TELE_CheckRequirements(object oPC, object oTeleporter, string sDestID)
{
	int iPortalGo = TRUE;
	string sWPName = "";
	string sItem = GetLocalString(oTeleporter, "LEG_TELE_Item_" + sDestID);
	int iFeat = GetLocalInt(oTeleporter, "LEG_TELE_Feat_" + sDestID);
	int iMinLevel = GetLocalInt(oTeleporter, "LEG_TELE_MinLevel_" + sDestID);
	int iMaxLevel = GetLocalInt(oTeleporter, "LEG_TELE_MaxLevel_" + sDestID);
	int iRace = GetLocalInt(oTeleporter, "LEG_TELE_Race_" + sDestID);
	int iSubRace = GetLocalInt(oTeleporter, "LEG_TELE_SubRace_" + sDestID);
	string sQuestStarted = GetLocalString(oTeleporter, "LEG_TELE_QuestStarted_" + sDestID);
	string sQuestNotStarted = GetLocalString(oTeleporter, "LEG_TELE_QuestNotStarted_" + sDestID);
	string sQuestFinished = GetLocalString(oTeleporter, "LEG_TELE_QuestFinished_" + sDestID);
	string sAlignment = GetLocalString(oTeleporter, "LEG_TELE_Alignment_" + sDestID);
	int iSkill = GetLocalInt(oTeleporter, "LEG_TELE_Skill_" + sDestID);
	int iSkillDC = GetLocalInt(oTeleporter, "LEG_TELE_SkillDC_" + sDestID);
	int iShowSkill = GetLocalInt(oTeleporter, "LEG_TELE_SkillShow_" + sDestID);

	if (sItem != "")
	{
		// Do we have an Item Requirement for this destination?	
		if (!GetIsObjectValid(GetItemPossessedBy(oPC, sItem)))
		{
			iPortalGo = FALSE;
			SetLocalString(oPC, "TELE_FailMessage", "You do not have the required item");
		}
	}
	else if (iFeat >= 0)
	{
		// Do we have a Feat Requirement for this destination?
		if (!GetHasFeat(iFeat, oPC, TRUE))
		{
			iPortalGo = FALSE;
			SetLocalString(oPC, "TELE_FailMessage", "You do not have the required feat");
		}

	}
	else if (iSubRace >= 0)
	{
		// Do we have a Feat Requirement for this destination?
		if (GetSubRace(oPC) != iSubRace)
		{
			iPortalGo = FALSE;
			SetLocalString(oPC, "TELE_FailMessage", "You do not have the required Sub Race");
		}

	}
	else if (iRace >= 0)
	{
		// Do we have a Feat Requirement for this destination?
		if (GetRacialType(oPC) != iRace)
		{
			iPortalGo = FALSE;
			SetLocalString(oPC, "TELE_FailMessage", "You do not have the required race");
		}

	}
	else if (iMinLevel != 0)
	{
		// Do we have a Level Requirement for this destination?
		if (GetTotalLevels(oPC, FALSE) < iMinLevel)
		{
			iPortalGo = FALSE;
			SetLocalString(oPC, "TELE_FailMessage", "You are not high enough level");
		}
	}
	else if (iMaxLevel != 0)
	{
		// Do we have a Level Requirement for this destination?
		if (GetTotalLevels(oPC, FALSE) > iMaxLevel)
		{
			iPortalGo = FALSE;
			SetLocalString(oPC, "TELE_FailMessage", "You are too high level");
		}
	}
	else if (sQuestNotStarted != "")
	{
		if (GetLocalInt(GetModule(), "LEG_QUEST_ACTIVE"))
		{
			if (GetLocalInt(oPC, "QuestID_" + sQuestNotStarted + "_NPC") != 0)
			{
				iPortalGo = FALSE;
				SetLocalString(oPC, "TELE_FailMessage", "You are too far along the quest line");
			}
		}			
	}
	else if (sQuestStarted != "")
	{
		if (GetLocalInt(GetModule(), "LEG_QUEST_ACTIVE"))
		{
			if (GetLocalInt(oPC, "QuestID_" + sQuestStarted + "_NPC") == 0 || GetLocalInt(oPC, "QuestID_" + sQuestStarted + "_NPC") >= 998)
			{
				iPortalGo = FALSE;
				SetLocalString(oPC, "TELE_FailMessage", "You are not on the required quest");
			}
		}			
	}
	else if (sQuestFinished != "")
	{
		if (GetLocalInt(GetModule(), "LEG_QUEST_ACTIVE"))
		{
			if (GetLocalInt(oPC, "QuestID_" + sQuestFinished + "_NPC") < 998)
			{
				iPortalGo = FALSE;
				SetLocalString(oPC, "TELE_FailMessage", "You have not completed the required quest");
			}
		}			
	}
	else if (iSkillDC != 0)
	{
		if (!GetIsSkillSuccessful(oPC, iSkill, iSkillDC, iShowSkill))
		{
			iPortalGo = FALSE;
			SetLocalString(oPC, "TELE_FailMessage", "You failed in your attempt");
		}
	}
	
	// If we can GO portal as a result of these checks, we'll either Send back the WP
	// Rez Site, Portal ID, or campsite.  
	// WP is just a WP or Server ID
	// Campsite will either be a location or a server ID
	if (iPortalGo)
	{	
		// Meh, because we can't return two things we're sticking portal ID on the door/object
		string sPortalID = GetLocalString(oTeleporter, "LEG_TELE_PortalID_" + sDestID);
		if (sPortalID != "")
		{
			SetLocalString(oTeleporter, "TELE_PortalID", sPortalID);
		}
	
		string sWPType = GetLocalString(oTeleporter, "LEG_TELE_DestType_" + sDestID);
		if (sWPType == "WP")
			sWPName = GetLocalString(oTeleporter, "LEG_TELE_WPName_" + sDestID);
		else 
			sWPName = sWPType;
			
		if (sWPName == "" && sPortalID != "")
			return "ServerNOWP";
			
		return sWPName;
	}
	else 
		return "";
}






// //////////////////////////////////////////////////
// LEG_TELE_GetTPDestination
// //////////////////////////////////////////////////
string LEG_TELE_GetTPDestination(object oPC, object oTeleporter)
{

	// Check for rules.
	string sDestID, sWPName, sDestType, sPortalID, sMessage;
	int iIndex, iPartyTP;
	int iDestinations = GetLocalInt(oTeleporter, "LEG_TELE_Destinations");
	for (iIndex = 1; iIndex <= iDestinations; iIndex++)
	{
		sWPName = "";
		sDestID = IntToString(iIndex);
		sDestType = GetLocalString(oTeleporter, "LEG_TELE_DestType_" + sDestID);
		iPartyTP = GetLocalInt(oTeleporter, "LEG_TELE_TPParty_" + sDestID);
		if (iPartyTP)
		{
			object oMember = GetFirstFactionMember(oPC);
			while (GetIsObjectValid(oMember))
			{
				if (oMember != oPC)
				{
					sWPName = LEG_TELE_CheckRequirements(oMember, oTeleporter, sDestID);
					if (sWPName != "")
					{
						// Open GUI for the Party member
					}
				}
				else
				{
					sWPName = LEG_TELE_CheckRequirements(oMember, oTeleporter, sDestID);
					if (sWPName != "")
					{
						// Start the TP process for the clicker
						return sWPName;
					}					
				}
			}
		}
		else
		{
			sWPName = LEG_TELE_CheckRequirements(oPC, oTeleporter, sDestID);
			if (sWPName != "")
			{
				// Start the TP process for the clicker
				SetLocalInt(oPC, "TELE_DestID", iIndex);
				return sWPName;
			}					
		}
	}
	
	// The PC does not have ANY of the requirements for ANY of the desintations
	if (sWPName == "")
	{
		string sFailMessage = GetLocalString(oPC, "TELE_FailMessage");
		if (sFailMessage == "")
			sFailMessage = "You do not meet the requirements for item, feat, quest or level.";
		else
			SetLocalString(oPC, "TELE_FailMessage", "");
		LEG_COMMON_DisplayInfoBox(oPC, sFailMessage);
		return "";	
	}
	
	return sWPName;
}






// //////////////////////////////////////////////////
// LEG_TELE_FunStuff
// //////////////////////////////////////////////////
float LEG_TELE_FunStuff(object oPC, object oTeleporter, object oDestination = OBJECT_INVALID)
{
	float fDelay = 0.0;
	string sDestID = IntToString(GetLocalInt(oPC, "TELE_DestID"));
	
	int iEffect = GetLocalInt(oTeleporter, "LEG_TELE_Effect_" + sDestID);
	int iDelay = GetLocalInt(oTeleporter, "LEG_TELE_Delay_" + sDestID);
	string sSound = GetLocalString(oTeleporter, "LEG_TELE_SoundEffect_" + sDestID);
	string sMessage = GetLocalString(oTeleporter, "LEG_TELE_Message_" + sDestID);
	int iDelayEffect = GetLocalInt(oTeleporter, "LEG_TELE_SpecialDelayEffect_" + sDestID);
	string sDelayAnimation = GetLocalString(oTeleporter, "LEG_TELE_DelayAnimation_" + sDestID);
	string sReqType = GetLocalString(oTeleporter, "LEG_TELE_RequirementType_" + sDestID);
	
	if (sDelayAnimation == "")
		sDelayAnimation = "kneeltalk";
		
	if (iDelay > 0)
		fDelay = IntToFloat(iDelay);

	// Remove any items we need.
	if (sReqType == "Item")
	{
		string sItem = GetLocalString(oTeleporter, "LEG_TELE_Item_" + sDestID);
		int iRemoveItem = GetLocalInt(oTeleporter, "LEG_TELE_Option1_" + sDestID);
		if (iRemoveItem == 1)
		{
			DelayCommand(fDelay, LEG_COMMON_DestroyItemsByTag(oPC, sItem, 1));	
		}
	}
				
	if (GetLocalInt(GetModule(), "LEG_INFO_ACTIVE") && fDelay >= 2.0)
	{
		LEG_COMMON_ProgBar(oPC, iDelay, "Teleporting", 0, ANIMATION_LOOPING_KNEELIDLE, FALSE, FALSE, sDelayAnimation, 1, iDelay, "", 0, 0, oPC);
	}	
	if (iDelayEffect > -1)
	{
		// Perform Effect for TPing
		//effect eEffect = EffectVisualEffect(iDelayEffect);
		//ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eEffect, GetLocation(oPC), fDelay);
		LEG_COMMON_VisualEffect(iDelayEffect, oPC, OBJECT_INVALID, fDelay);
		//ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oPC, fDelay);
	}
	
	if (iEffect > -1)
	{
		// Perform Effect for TPing
		DelayCommand(fDelay, LEG_COMMON_VisualEffect(iEffect, oPC, OBJECT_INVALID, 4.0));
		//effect eEffect = EffectVisualEffect(iEffect);
		//DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC));
	}
	
	if (sSound != "")
	{
		if (GetObjectType(OBJECT_SELF) == OBJECT_TYPE_PLACEABLE)
			DelayCommand(fDelay, PlaySound(sSound));
		else
			DelayCommand(fDelay, AssignCommand(oPC, PlaySound(sSound)));
		
	}
	
	if (sMessage != "")
	{
		if (GetArea(oPC) == GetArea(oDestination))
			DelayCommand(fDelay + 0.5, LEG_COMMON_DisplayInfoBox(oPC, sMessage));
		else
			DelayCommand(fDelay + 5.0, LEG_COMMON_DisplayInfoBox(oPC, sMessage));
	}
	return fDelay;
}