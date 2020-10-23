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
////////////////////////////////////////////////////////////////////////////////
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

void main()
{
    ACR_TriggerOnEnter();

    // Custom code goes here.
	object oPC = GetEnteringObject();

// Silvy Wards vs. Race && Alignment 
if(FindSubString(GetTag(OBJECT_SELF), "sm_ward") != -1) 
	{object oGuard = GetLocalObject(OBJECT_SELF, "oGuard");
	 if(oGuard == OBJECT_INVALID)
		 {oGuard = GetNearestObjectByTag("003_cr_kis_sgt_gate");
			 if((oGuard == OBJECT_INVALID) || (GetDistanceBetween(oGuard, GetEnteringObject()) > 20.0))
			 	{oGuard = GetNearestObjectByTag("003_cr_sm_palaceguard");
				if((oGuard == OBJECT_INVALID) || (GetDistanceBetween(oGuard, GetEnteringObject()) > 20.0))
				 	{oGuard = GetNearestObjectByTag("003_cr_sm_palaceguard2");
					if((oGuard == OBJECT_INVALID) || (GetDistanceBetween(oGuard, GetEnteringObject()) > 20.0))
					 	{oGuard = GetNearestObjectByTag("003_cr_kis_sgt");
						if((oGuard == OBJECT_INVALID) || (GetDistanceBetween(oGuard, GetEnteringObject()) > 20.0))
						 	{oGuard = GetNearestObjectByTag("003_cr_kis_knight");
							if((oGuard == OBJECT_INVALID) || (GetDistanceBetween(oGuard, GetEnteringObject()) > 20.0))
							 	{oGuard = GetNearestObjectByTag("003_cr_kis_atarms");
								if((oGuard == OBJECT_INVALID) || (GetDistanceBetween(oGuard, GetEnteringObject()) > 20.0))
								 	{oGuard = GetNearestObjectByTag("003_cr_kis_xbow");
									if((oGuard == OBJECT_INVALID) || (GetDistanceBetween(oGuard, GetEnteringObject()) > 20.0))
									 	{oGuard = GetNearestObjectByTag("003_cr_kis_anders");
										}
									}
								}
							}
						}
					}
				}
	  		SetLocalObject(OBJECT_SELF, "oGuard", oGuard);
			DelayCommand(300.0, SetLocalObject(OBJECT_SELF, "oGuard", OBJECT_INVALID));
	 		}
	 object oPost = GetLocalObject(OBJECT_SELF, "oPost");
	 if(oPost == OBJECT_INVALID)
		 	{oPost = GetNearestObject(OBJECT_TYPE_WAYPOINT, oGuard, 1);
			 SetLocalObject(OBJECT_SELF, "oPost", oPost);
			}
	 object oTeleportWP = GetLocalObject(OBJECT_SELF, "oTeleportWP");
	 if(oTeleportWP == OBJECT_INVALID)
		 	{oTeleportWP = GetNearestObjectByTag("gate_teleport_WP");
			 SetLocalObject(OBJECT_SELF, "oTeleportWP", oTeleportWP);
			}
	 object oSpellguard = GetLocalObject(oGuard, "oSpellguard");
	 object oSpellguard2 = GetLocalObject(oGuard, "oSpellguard2");
	 effect eTeleport = EffectVisualEffect(VFX_DUR_SOOTHING_LIGHT, FALSE);
		 	 
		 
	 //There is a prevailing Invisibility Purge throughout Silvy
	 if((GetHasSpellEffect(SPELL_INVISIBILITY, GetEnteringObject())) || (GetHasSpellEffect(SPELL_INVISIBILITY_SPHERE, GetEnteringObject()))|| (GetHasSpellEffect(SPELL_MASS_INVISIBILITY, GetEnteringObject())))
	 	{object oSpellguard = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_spellguard_adam", GetLocation(oGuard));
		 AssignCommand(oSpellguard, SetFacingPoint(GetPositionFromLocation(GetLocation(GetEnteringObject()))));
	     AssignCommand(oSpellguard, SpeakString("Invisibility has been detected and is not allowed within Silverymoon.", TALKVOLUME_TALK));
		 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eTeleport, oSpellguard, 5.0);
		 SetLocalObject(oGuard, "oSpellguard", oSpellguard);
		 AssignCommand(oSpellguard, ActionCastSpellAtObject(SPELL_INVISIBILITY_PURGE, GetEnteringObject(), METAMAGIC_ANY, TRUE, 3, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
		 DelayCommand(30.0, SetLocalObject(oGuard, "oSpellguard", OBJECT_INVALID));
		 DestroyObject(oSpellguard, 30.0);
		 }
	 
	 //Drow and Duergar are not allowed to walk freely around Silvy. They require a duraph token given by someone of importance
	 //Drow and Duergar of evil alignment are detected by the wards and automatically rejected with an antipathy spell. They would never get a duraph token
	 if(GetItemPossessedBy(GetEnteringObject(), "003_it_ward_duraph") == OBJECT_INVALID)
		 {if((GetLocalInt(GetEnteringObject(), "sm_Ward_Warned") == 2) && (_GetNLDState(GetEnteringObject()) != 2))
		 	{AssignCommand(GetEnteringObject(), ActionForceMoveToLocation(GetLocation(oTeleportWP), TRUE));
			 AssignCommand(oGuard, SetFacingPoint(GetPositionFromLocation(GetLocation(GetEnteringObject()))));
	         AssignCommand(oGuard, ActionSpeakString("You were warned! The antipathy spell is in effect and you will be subdued. Do not resist and when you wake up, you can walk away.", TALKVOLUME_TALK));
			 if(GetLocalObject(oGuard, "oSpellguard") == OBJECT_INVALID)
			 	{object oSpellguard = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_spellguard_adam", GetLocation(oGuard));
			 	 AssignCommand(oSpellguard, SetFacingPoint(GetPositionFromLocation(GetLocation(GetEnteringObject()))));
	             ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eTeleport, oSpellguard, 5.0);
			     SetLocalObject(oGuard, "oSpellguard", oSpellguard);
			 	 DelayCommand(600.0, SetLocalObject(oGuard, "oSpellguard", OBJECT_INVALID));
				 DestroyObject(oSpellguard, 600.0);
				 }
			 if(GetLocalObject(oGuard, "oSpellguard2") == OBJECT_INVALID)
			 	{object oSpellguard2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_spellguard_amada", GetLocation(oGuard));
			 	 AssignCommand(oSpellguard2, SetFacingPoint(GetPositionFromLocation(GetLocation(GetEnteringObject()))));
	             ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eTeleport, oSpellguard2, 5.0);
			     SetLocalObject(oGuard, "oSpellguard2", oSpellguard2);
			 	 DelayCommand(600.0, SetLocalObject(oGuard, "oSpellguard2", OBJECT_INVALID));
				 DestroyObject(oSpellguard2, 600.0);
				 }
			 object oArrest = GetEnteringObject();
			 AssignCommand(oSpellguard, ActionForceMoveToObject(oArrest, TRUE, 0.0));
			 AssignCommand(oSpellguard2, ActionForceMoveToObject(oArrest, TRUE, 0.0));
			 AssignCommand(oGuard, ActionForceMoveToObject(oArrest, TRUE, 0.0));
			 if(GetLocalInt(oGuard, "NLD") == 0)
				{ACR_ToggleNLDMode(oGuard);
				 SetLocalInt(oGuard, "NLD", 1);
				 }
			 if(_GetNLDState(oArrest) != 2)
				{AssignCommand(oGuard, ActionAttack(oArrest, FALSE));
				 }
			  if(GetLocalInt(oSpellguard, "Resist") != 1)
				{AssignCommand(oSpellguard, SpeakString("Do not resist!", TALKVOLUME_TALK));
				 SetLocalInt(oSpellguard, "Resist", 1);
				 DelayCommand(IntToFloat(Random(60)), SetLocalInt(oSpellguard, "Resist", 0));
				 }
			 if(GetLocalInt(oSpellguard2, "Resist") != 1)
				{AssignCommand(oSpellguard2, SpeakString("Do not resist!", TALKVOLUME_TALK));
				 SetLocalInt(oSpellguard2, "Resist", 1);
				 DelayCommand(IntToFloat(Random(60)), SetLocalInt(oSpellguard2, "Resist", 0));
				 }
			 if(GetLocalInt(oSpellguard, "NLD") == 0)
				{ACR_ToggleNLDMode(oSpellguard);
				 SetLocalInt(oSpellguard, "NLD", 1);
				 }
			 if(GetLocalInt(oSpellguard2, "NLD") == 0)
				{ACR_ToggleNLDMode(oSpellguard2);
				 SetLocalInt(oSpellguard2, "NLD", 1);
				 }
			  int nSpell;
			  int nSpell2;
			  object oTarget;
		 	  int nRandom = Random(10);
			  int nRandom2 = Random(10);
			  if(nRandom == 0)
				 	{nSpell = SPELL_MAGE_ARMOR;
					 oTarget = OBJECT_SELF;
					 }
					
				 if(nRandom == 1)
				 	{nSpell = SPELL_PROTECTION_FROM_EVIL;
					 oTarget = OBJECT_SELF;
					 }
				 
				 if(nRandom == 2)
				 	{nSpell = SPELL_DAZE;
					 oTarget = oArrest;
					 }
				 
				 if(nRandom == 3)
				 	{nSpell = SPELL_FEAR;
					 oTarget = oArrest;
					 }
				 
				 if(nRandom == 4)
				 	{nSpell = SPELL_GLOBE_OF_INVULNERABILITY;
					 oTarget = OBJECT_SELF;
					 }
				 
				 if(nRandom == 5)
				 	{nSpell = SPELL_HOLD_PERSON;
					 oTarget = oArrest;
					 }
				
				 if(nRandom == 6)
				 	{nSpell = SPELL_SLEEP;
					 oTarget = oArrest;
					 }
				 
				 if(nRandom == 7)
				 	{nSpell = SPELL_COLOR_SPRAY;
					 oTarget = oArrest;
					 }
				 
				 if(nRandom == 8)
				 	{nSpell = SPELL_POWER_WORD_STUN;
					 oTarget = oArrest;
					 }
				 
				 if(nRandom == 9)
				 	{nSpell = SPELL_RAY_OF_ENFEEBLEMENT;
					 oTarget = oArrest;
					 }
				if(nRandom2 == 0)
				 	{nSpell2 = SPELL_MAGE_ARMOR;
					 oTarget = OBJECT_SELF;
					 }
					
				 if(nRandom2 == 1)
				 	{nSpell2 = SPELL_PROTECTION_FROM_EVIL;
					 oTarget = OBJECT_SELF;
					 }
				 
				 if(nRandom2 == 2)
				 	{nSpell2 = SPELL_DAZE;
					 oTarget = oArrest;
					 }
				 
				 if(nRandom2 == 3)
				 	{nSpell2 = SPELL_FEAR;
					 oTarget = oArrest;
					 }
				 
				 if(nRandom2 == 4)
				 	{nSpell2 = SPELL_GLOBE_OF_INVULNERABILITY;
					 oTarget = OBJECT_SELF;
					 }
				 
				 if(nRandom2 == 5)
				 	{nSpell2 = SPELL_HOLD_PERSON;
					 oTarget = oArrest;
					 }
				
				 if(nRandom2 == 6)
				 	{nSpell2 = SPELL_SLEEP;
					 oTarget = oArrest;
					 }
				 
				 if(nRandom2 == 7)
				 	{nSpell2 = SPELL_COLOR_SPRAY;
					 oTarget = oArrest;
					 }
				 
				 if(nRandom2 == 8)
				 	{nSpell2 = SPELL_POWER_WORD_STUN;
					 oTarget = oArrest;
					 }
				 
				 if(nRandom2 == 9)
				 	{nSpell2 = SPELL_RAY_OF_ENFEEBLEMENT;
					 oTarget = oArrest;
					 }
			if(_GetNLDState(oArrest) != 2)
				{AssignCommand(oSpellguard, ActionCastSpellAtObject(nSpell, oTarget, METAMAGIC_ANY, TRUE, 3, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
				 AssignCommand(oSpellguard2, ActionCastSpellAtObject(nSpell2, oTarget, METAMAGIC_ANY, TRUE, 3, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
				 DelayCommand(60.0, AssignCommand(oGuard, ActionForceMoveToObject(oPost, TRUE, 0.0)));
			     DelayCommand(10.0, ExecuteScript("sm_trg_onenter", OBJECT_SELF));
			     }
			 else if(_GetNLDState(oArrest) == 2)
			 	{AssignCommand(oGuard, ActionForceMoveToObject(oPost, TRUE, 0.0));
			     DelayCommand(5.0, AssignCommand(oGuard, SetFacingPoint(GetPositionFromLocation(GetLocation(oArrest)))));
	    		 DestroyObject(oSpellguard, 9.0);
				 DelayCommand(9.1, SetLocalObject(oGuard, "oSpellguard", OBJECT_INVALID));
				 DestroyObject(oSpellguard2, 9.0);
				 DelayCommand(9.1, SetLocalObject(oGuard, "oSpellguard2", OBJECT_INVALID));
			 	 }
			 }
		
		if(GetLocalInt(GetEnteringObject(), "sm_Ward_Warned") == 1)
		 	{SetLocalInt(GetEnteringObject(), "sm_Ward_Warned", 2);
			 AssignCommand(oGuard, SetFacingPoint(GetPositionFromLocation(GetLocation(GetEnteringObject()))));
	         AssignCommand(oGuard, ActionSpeakString("This is your last warning! You are not allowed through the gates of Silverymoon! An antipathy spell will now push you back from the gate!", TALKVOLUME_TALK));
			 AssignCommand(GetEnteringObject(), ActionForceMoveToLocation(GetLocation(oTeleportWP), TRUE));
			 SendMessageToPC(GetEnteringObject(), "You feel yourself compelled toward the fastest way out of Silverymoon.");
			 if(GetLocalObject(oGuard, "oSpellguard") == OBJECT_INVALID)
			 	{object oSpellguard = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_spellguard_adam", GetLocation(oGuard));
			 	 AssignCommand(oSpellguard, SetFacingPoint(GetPositionFromLocation(GetLocation(GetEnteringObject()))));
	             ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eTeleport, oSpellguard, 5.0);
			     SetLocalObject(oGuard, "oSpellguard", oSpellguard);
			 	 DelayCommand(600.0, SetLocalObject(oGuard, "oSpellguard", OBJECT_INVALID));
				 DestroyObject(oSpellguard, 600.00);
				 }
			 if(GetLocalObject(oGuard, "oSpellguard2") == OBJECT_INVALID)
			 	{object oSpellguard2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_spellguard_amada", GetLocation(oGuard));
			 	 AssignCommand(oSpellguard2, SetFacingPoint(GetPositionFromLocation(GetLocation(GetEnteringObject()))));
	             ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eTeleport, oSpellguard2, 5.0);
			     SetLocalObject(oGuard, "oSpellguard2", oSpellguard2);
			 	 DelayCommand(600.0, SetLocalObject(oGuard, "oSpellguard2", OBJECT_INVALID));
				 DestroyObject(oSpellguard2, 600.00);
				 }
			 }
	
		if((GetLocalInt(GetEnteringObject(), "sm_Ward_Warned") == 0)  && ((GetSubRace(oPC) == RACIAL_SUBTYPE_DROW) || (GetSubRace(oPC) == RACIAL_SUBTYPE_GRAY_DWARF)))
		 	{SetLocalInt(GetEnteringObject(), "sm_Ward_Warned", 1);
			 AssignCommand(oGuard, SetFacingPoint(GetPositionFromLocation(GetLocation(GetEnteringObject()))));
	         AssignCommand(oGuard, ActionSpeakString("Stop! You are not allowed within Silverymoon! We will subdue you if you attempt to enter!", TALKVOLUME_TALK));
			 }
		}
	
	if((GetLocalObject(GetEnteringObject(), "oHench") != OBJECT_INVALID) && (GetIsPC(GetEnteringObject())))
		{object oHench = GetLocalObject(GetEnteringObject(), "oHench");
		 object oMaster = GetLocalObject(GetEnteringObject(), "oMaster");
		 AssignCommand(oHench, ClearAllActions(TRUE));
		 AssignCommand(oHench, ActionJumpToObject(oMaster, FALSE));
		 AssignCommand(oHench, ActionForceFollowObject(oMaster, 0.5, 0));
		 }
	}
//Silverymoon Hammer & Helm one-liner script.

 if((GetTag(OBJECT_SELF) == "sm_hammer_helm") && (GetLocalInt(GetEnteringObject(), "HammerHelm") != 1))
 	{SendMessageToPC(GetEnteringObject(), "Thunderous laughter and conversation assault your ears as an errant fowl wing flies by your head. Pipesmoke hangs thick in the air, and it is clear from the onset that this is a dwarven tavern.");
	 SetLocalInt(GetEnteringObject(), "HammerHelm", 1);
	 }


//Silverymoon Maskarran entrance. Triggers hidden grate entrance in base of statue for Maskarrans carrying the right key. Tunnel leads to hidden Mask shrine underneath Fochlucan

if((GetTag(OBJECT_SELF) == "mask_entry") && (GetItemPossessedBy(GetEnteringObject(), "tsm_maskarranshrine_cratekey") != OBJECT_INVALID))
	{object oGrateWP = GetObjectByTag("Secret_Mask_Entry");
	 object oGrate = CreateObject(OBJECT_TYPE_PLACEABLE, "003_masktunnel_statue", GetLocation(oGrateWP));
	 SendMessageToPC(GetEnteringObject(), "A grate lies almost hidden at the base of the statue, covered by leaves and litter.");  
	 DestroyObject(oGrate, 60.0);
	 }

// Sylune's Headstone portals in Palace and Silvy Catacombs Level 1. Triggering invisible listener for voice commands.
	  

if((GetTag(OBJECT_SELF) == "sm_sylune_listener") && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject()))))
 	 {string sArea = "_palace";
	  if(GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_catacombs_1")
				{sArea = "_catacombs";
				}
	  object oMyHeadstone = GetLocalObject(OBJECT_SELF, "oMyHeadstone");
	  if(oMyHeadstone == OBJECT_INVALID)
			 	{oMyHeadstone = GetObjectByTag(GetTag(OBJECT_SELF) + sArea);
				 SetLocalObject(OBJECT_SELF, "oMyHeadstone", oMyHeadstone);
				 }
		  
	  if(GetLocalInt(OBJECT_SELF, "Localized") != 1)
	 	{SetLocalInt(OBJECT_SELF, "Localized", 1);
		  if(GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_catacombs_1")
				{object oGoTo2 = GetLocalObject(oMyHeadstone, "oGoTo2");
			     if(oGoTo2 == OBJECT_INVALID)
							 {oGoTo2 = GetWaypointByTag("sm_sylune_WP2");
							  SetLocalObject(oMyHeadstone, "oGoTo2", oGoTo2);
							 }
				 object oGoTo3 = GetLocalObject(oMyHeadstone, "oGoTo3");
				 if(oGoTo3 == OBJECT_INVALID)
							 {oGoTo3 = GetWaypointByTag("sm_sylune_WP3");
							  SetLocalObject(oMyHeadstone, "oGoTo3", oGoTo3);
							 }
				 object oGoTo4 = GetLocalObject(oMyHeadstone, "oGoTo4");
				 if(oGoTo4 == OBJECT_INVALID)
							 {oGoTo4 = GetWaypointByTag("sm_sylune_WP4");
							  SetLocalObject(oMyHeadstone, "oGoTo4", oGoTo4);
							 }
				 location lGoTo2 = GetLocation(oGoTo2);
				 SetLocalLocation(oMyHeadstone, "lGoTo2", lGoTo2);
				 location lGoTo3 = GetLocation(oGoTo3);
				 SetLocalLocation(oMyHeadstone, "lGoTo3", lGoTo3);
				 location lGoTo4 = GetLocation(oGoTo4);
				 SetLocalLocation(oMyHeadstone, "lGoTo4", lGoTo4);
				 }
				 
		   if(GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_highpalace")
				{object oStormWP = GetLocalObject(OBJECT_SELF, "oStormWP");
				 if(oStormWP == OBJECT_INVALID)
					 	{oStormWP = GetWaypointByTag("storm_sylune_WP");
						 SetLocalObject(OBJECT_SELF, "oStormWP", oStormWP);
						 }
				}		 
			}
			
	  if(GetTag(GetArea(OBJECT_SELF)) == "6d_int_silvy_highpalace")
				{object oStormWP = GetLocalObject(OBJECT_SELF, "oStormWP");
				 object oStorm = GetLocalObject(GetModule(), "oStorm");
		 		 if(oStorm == OBJECT_INVALID)
					 {oStorm = GetObjectByTag("003_cr_silverhand_storm");
					  SetLocalObject(GetModule(), "oStorm", oStorm);
					  if(oStorm == OBJECT_INVALID)
						 	{oStorm = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_silverhand_storm", GetLocation(oStormWP));
						 	 SetLocalObject(GetModule(), "oStorm", oStorm);
							 }
					  }
				 if((ACR_RetrieveQuestState("slv_deandragon_h", GetEnteringObject()) >= 4)|| (ACR_RetrieveQuestState("slv_deansphinx_h", GetEnteringObject()) >= 4)) 
				 	{DelayCommand(10.0, AssignCommand(oStorm, ActionSpeakString("Well, well. Greetings, indeed. Welcome to the Hall of Greetings at the High Palace. *The warm, feminine voice is similar, if not the same, as the one that granted one-time passage through the portal from the catacombs.", TALKVOLUME_TALK)));
					 DelayCommand(13.0, AssignCommand(oStorm, ActionStartConversation(GetEnteringObject(), "sm_silverhand_storm")));
					}
		 
		 		} 
					 
	  object oMyListener = GetLocalObject(oMyHeadstone, "oMyListener");
	  if(oMyListener == OBJECT_INVALID)
	 	{oMyListener = GetObjectByTag("003_cr_voice");
		 SetLocalObject(oMyHeadstone, "oMyListener", oMyListener);
		 if(oMyListener == OBJECT_INVALID)
		 	 {oMyListener = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_voice", GetLocation(oMyHeadstone));
			  SetLocalObject(oMyHeadstone, "oMyListener", oMyListener);
			  SetLocalObject(oMyListener, "oMyTrigger", OBJECT_SELF);
			  SetLocalObject(OBJECT_SELF, "oMyListener", oMyListener);
			 }
		}
	}
	
	 
	 
	 	 	// KiS Escort
			if((GetTag(OBJECT_SELF) == "kis_escort")  && (GetLocalObject(GetEnteringObject(), "oHench") != OBJECT_INVALID))
		 	   {object oHench = GetLocalObject(GetEnteringObject(), "oHench");
			    object oMaster = GetLocalObject(GetEnteringObject(), "oMaster");
			    int iHench = GetLocalInt(OBJECT_SELF, "kis_escort");
			    AssignCommand(oHench, ClearAllActions(TRUE));
		        AssignCommand(oHench, ActionJumpToObject(oMaster, FALSE));
				AssignCommand(oHench, ActionForceFollowObject(oMaster, 0.5, 0));
				if((GetTag(oHench) == "003_cr_foch_mothermay") && (GetLocalInt(OBJECT_SELF, "kis_escort") != 1))
					{AssignCommand(oMaster, ClearAllActions(TRUE));
		        	 AssignCommand(oHench, ClearAllActions(TRUE));
					 AssignCommand(oHench, ActionJumpToObject(oMaster, FALSE));
				     AssignCommand(oHench, ActionStartConversation(oMaster, "fochlucan_mothermay", FALSE, TRUE, FALSE, FALSE));
					 DelayCommand(5.0, AssignCommand(oHench, ActionForceFollowObject(oMaster, 0.5, 0)));
					}
				 }
	   
			// KiS Escort_03
			if((GetTag(OBJECT_SELF) == "kis_escort_03")  && (ACR_RetrieveQuestState("kis_escort_03", GetEnteringObject()) == 2)) 
		 	   {object oHench = GetLocalObject(GetEnteringObject(), "oHench");
			    object oMaster = GetLocalObject(GetEnteringObject(), "oMaster");
			    AssignCommand(oHench, ClearAllActions(TRUE));
		        AssignCommand(oHench, ActionJumpToObject(oMaster, FALSE));
				if(GetTag(oHench) == "003_cr_argent_marilee_stallings")  
					{object oStallingsWP = GetLocalObject(OBJECT_SELF, "oStallingsWP");
					 if(oStallingsWP == OBJECT_INVALID)
					 	{oStallingsWP = GetWaypointByTag("stallings_escort");
						 SetLocalObject(OBJECT_SELF, "oStallingsWP", oStallingsWP);
						 }
					 object oStallings = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_argent_lt_stallings", GetLocation(oStallingsWP));
					 object oLairdmoor = GetObjectByTag("003_cr_argent_lt_lairdmoor");
					 if(oLairdmoor==OBJECT_INVALID)
						 {object oLairdmoorWP = GetLocalObject(OBJECT_SELF, "oLairdmoorWP");
						  if(oLairdmoorWP == OBJECT_INVALID)
						 	{oLairdmoorWP = GetWaypointByTag("lairdmoor_escort");
							 SetLocalObject(OBJECT_SELF, "oLairdmoorWP", oLairdmoorWP);
							 }
						  oLairdmoor = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_argent_lt_lairdmoor", GetLocation(oLairdmoorWP));
						 }
					 AssignCommand(oHench, ActionForceMoveToObject(oLairdmoor, TRUE, 0.5f));
					}
				 }
	   
				 
				 
			// KiS Patrol Silvy Sewers
			if((GetTag(OBJECT_SELF) == "kis_patrol_03")  && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject()))) && (ACR_RetrieveQuestState("kis_patrol_03", GetEnteringObject()) >= 1) && (GetLocalString(OBJECT_SELF, GetName(GetEnteringObject())) != GetName(GetEnteringObject())))
		 	   {SetLocalString(OBJECT_SELF, GetName(GetEnteringObject()), GetName(GetEnteringObject()));
			    int nQuestState = ACR_RetrieveQuestState("kis_patrol_03", GetEnteringObject());
			    ACR_AddPersistentJournalQuestEntry("kis_patrol_03", nQuestState + 1, GetEnteringObject(), FALSE);
			    SendMessageToPC(GetEnteringObject(), "You have reached the corner of the sewers in this direction and can go no further.");
			    if(ACR_RetrieveQuestState("kis_patrol_03", GetEnteringObject()) == 5)
					{ACR_AddPersistentJournalQuestEntry("kis_patrol_03", 6, GetEnteringObject(), FALSE);
			         SendMessageToPC(GetEnteringObject(), "You have explored the sewers completely, all four corners. Return to the Recruiting Master.");
			    	} 
			   }
	   
	   // KiS Courier 3 Haywood
			if((GetTag(OBJECT_SELF) == "kis_courier_03_haywood")  && (ACR_RetrieveQuestState("kis_courier_03", GetEnteringObject()) == 6)) 
		 	   {object oHaywood = GetObjectByTag("003_cr_kis_jessica_haywood");
			    DestroyObject(oHaywood);
			    object oHaywoodWP = GetLocalObject(OBJECT_SELF, "oHaywoodWP");
				if(oHaywoodWP == OBJECT_INVALID)
					 {oHaywoodWP = GetWaypointByTag("slv_deandragon_k_dez");
					  SetLocalObject(OBJECT_SELF, "oHaywoodWP", oHaywoodWP);
					}
				oHaywood = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_kis_jessica_haywood", GetLocation(oHaywoodWP));
					 
				 }
				 
		
}
	   