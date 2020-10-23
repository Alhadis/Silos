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

void ACR_ApplyNLDDamageToCreature(object oTarget, int nSubdualDamage)
{
    int nNLDTotal = _GetNLDTotal(oTarget);
    int nHPMax = GetMaxHitPoints(oTarget);
    int nCap = nHPMax + 10;
    nNLDTotal = ((nNLDTotal + nSubdualDamage) > nCap) ? nCap :
            nNLDTotal + nSubdualDamage;
    _SetNLDTotal(oTarget, nNLDTotal);
    ACR_ApplyNLDEffects(oTarget, nNLDTotal);
}



////////////////////////////////////////////////////////////////////////////////


void main()
{
    ACR_TriggerOnEnter();

    // Custom code goes here.
	object oPC = GetEnteringObject();
    int nSkillDC = GetLocalInt(OBJECT_SELF, "SKILL_DC_INT");
	string sMessageSuccess=GetLocalString(OBJECT_SELF, "MESSAGE_SUCCESS_STRING");
	string sMessageFail=GetLocalString(OBJECT_SELF, "MESSAGE_FAIL_STRING");
	string sSkillName = GetLocalString(OBJECT_SELF, "SKILL_NAME_STRING");
	int	nSkillName = StringToInt("SKILL_" + sSkillName);
	if(sSkillName == "CLIMB")
		{nSkillName = SKILL_CLIMB;}
	string sWPSuccess=GetLocalString(OBJECT_SELF, "WP_SUCCESS_STRING");
	string sWPFail=GetLocalString(OBJECT_SELF, "WP_FAIL_STRING");
	object oWPSuccess = GetNearestObjectByTag(sWPSuccess);
	object oWPFail = GetNearestObjectByTag(sWPFail);
	int nKnockdown = GetLocalInt(OBJECT_SELF, "KNOCKDOWN");
	effect eKnockdown = EffectKnockdown();
	float fKDTime = GetLocalFloat(OBJECT_SELF, "KDTIME");
	int nFallDistance = GetLocalInt(OBJECT_SELF, "FAIL_DISTANCE");	
	int nFallDamage = Random(6*nFallDistance/10) + (nFallDistance/10);
	int nTumbleDmg = nFallDamage - Random(6) - Random(6);
	effect eDamage = EffectDamage(nFallDamage, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL, FALSE);
	effect eTumbleDmg = EffectDamage(nTumbleDmg, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL, FALSE);
	object oRope = GetFirstItemInInventory(oPC); 
	string sRope = GetTag(oRope);
	while (oRope != OBJECT_INVALID) {
	if(FindSubString(sRope, "Rope", 0)!= -1) {
		nSkillDC = nSkillDC - 10;
		SendMessageToPC(oPC, "The rope you carry surely comes in handy in situations like this.");
		break;
		}
	 oRope = GetNextItemInInventory(oPC);
	}
	
	
 if(GetTag(OBJECT_SELF) == "003_tr_skillcheck")
		{ if(GetIsSkillSuccessful(oPC, nSkillName, nSkillDC, TRUE))
		 	{SendMessageToPC(oPC, sMessageSuccess);
			 
		 	}
		}
 if(GetTag(OBJECT_SELF) == "003_trg_skillmove")
		{if(GetIsSkillSuccessful(oPC, nSkillName, nSkillDC, TRUE))
		 	{SendMessageToPC(oPC, sMessageSuccess);
			 AssignCommand(oPC, ActionJumpToLocation(GetLocation(oWPSuccess)));
		 	 }
	 	 else {SendMessageToPC(oPC, sMessageFail);
			 AssignCommand(oPC, ActionJumpToLocation(GetLocation(oWPFail)));
		 	 if(GetIsSkillSuccessful(oPC, SKILL_TUMBLE, nSkillDC, TRUE))
			 	{SendMessageToPC(oPC, sMessageFail);
			     SendMessageToPC(oPC, "Your ability to tumble keeps your on your feet and saves you from hurting yourself badly.");
			 	 ApplyEffectToObject(DURATION_TYPE_INSTANT, eTumbleDmg, oPC);
			     ACR_ApplyNLDDamageToCreature(oPC, d6());
				 DelayCommand(1.0, ACR_NLD_ReportTotal(oPC, oPC, 0));
				}
			 else   
			 	{ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
			     if(nKnockdown == 1) { 
					 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnockdown, oPC, fKDTime);
					 SendMessageToPC(oPC, sMessageFail);
			         SendMessageToPC(oPC, "You are knocked flat by the fall!");
			 	     }
				}
			 }
		}
	  
			   
}