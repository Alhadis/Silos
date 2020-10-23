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
//  Feb 2009 -- Wynna All Dean's Exam (deandragon) quest trigger onenters
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#include "acr_trigger_i"
#include "acr_quest_i"
#include "acr_spawn_i"
#include "dmfi_inc_langexe" 



void main()
{
    ACR_TriggerOnEnter();

    // Custom code goes here.
	

	 
	 // Xorn appearance inside Occidian cave
	 if(GetTag(OBJECT_SELF) == "slv_deandragon_x_xorn")  
		  	{if(GetLocalInt(OBJECT_SELF, "Xorn") != 1)
				{SetLocalInt(OBJECT_SELF, "Xorn", 1);
				 object oXornArm1WP = GetWaypointByTag("xorn_arm_1");
				 object oXorn = CreateObject(OBJECT_TYPE_CREATURE, "003_slv_dq_x_creature", GetLocation(oXornArm1WP), FALSE);
				 SetLocalObject(OBJECT_SELF, "oXorn", oXorn);
				 DelayCommand(1.0, AssignCommand(oXorn, ActionSpeakString("*A creature slides up out of the ground without a ripple in the earth.", TALKVOLUME_TALK)));
				 DelayCommand(8.0, AssignCommand(oXorn, ActionSpeakString("The bargain was struck. We honor the bargain. Place two stone of sustainance into the feeding orifice.", TALKVOLUME_TALK)));
				 }
			 }
			 
		 // Xorn appearance to descend into Occidian
	 if(GetTag(OBJECT_SELF) == "occ_xorn_low_in")  
		  	{if((GetLocalInt(OBJECT_SELF, "Xorn") != 1) && ((GetIsPC(GetEnteringObject()))|| (GetIsDMPossessed(GetEnteringObject()))))  
				{SetLocalInt(OBJECT_SELF, "XornGroup", 1);
				 SetLocalInt(OBJECT_SELF, "Xorn", 1);
				 DelayCommand(300.0, SetLocalInt(OBJECT_SELF, "Xorn", 0));
				 DelayCommand(3600.0, SetLocalInt(OBJECT_SELF, "XornGroup", 0));
				 object oXornCrownWP = GetWaypointByTag("xorn_crown_low_in");
				 object oXornBodyWP = GetWaypointByTag("xorn_body_low_in");
				 object oXornArm1WP = GetWaypointByTag("xorn_arm_1_low_in");
				 object oXornArm2WP = GetWaypointByTag("xorn_arm_2_low_in");
				 object oXornArm3WP = GetWaypointByTag("xorn_arm_3_low_in");
				 object oXornEye2WP = GetWaypointByTag("xorn_eye_2_low_in");
				 object oXornEye3WP = GetWaypointByTag("xorn_eye_3_low_in");
				 object oXornEye4WP = GetWaypointByTag("xorn_eye_4_low_in");
				 object oXornEye5WP = GetWaypointByTag("xorn_eye_5_low_in");
				 object oXornEye6WP = GetWaypointByTag("xorn_eye_6_low_in");
				 
				 object oXornBody = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_body", GetLocation(oXornBodyWP));
				 object oXornCrown = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_crown", GetLocation(oXornCrownWP));
				 object oXornArm1 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_xorn_arm", GetLocation(oXornArm1WP), FALSE, "003_cr_xorn_arm_1_low_in");
				 object oXornArm2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_xorn_arm", GetLocation(oXornArm2WP), FALSE, "003_cr_xorn_arm_2_low_in");
				 object oXornArm3 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_xorn_arm", GetLocation(oXornArm3WP), FALSE, "003_cr_xorn_arm_3_low_in");
				 object oXornEye2 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_eyes", GetLocation(oXornEye2WP), FALSE, "003_plc_xorn_eyes_2_low_in");
				 object oXornEye3 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_eyes", GetLocation(oXornEye3WP), FALSE, "003_plc_xorn_eyes_3_low_in");
				 object oXornEye4 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_eyes", GetLocation(oXornEye4WP), FALSE, "003_plc_xorn_eyes_4_low_in");
				 object oXornEye5 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_eyes", GetLocation(oXornEye5WP), FALSE, "003_plc_xorn_eyes_5_low_in");
				 object oXornEye6 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_eyes", GetLocation(oXornEye6WP), FALSE, "003_plc_xorn_eyes_6_low_in");
				 
				 DestroyObject(oXornBody, 300.0);
				 DestroyObject(oXornCrown, 300.0);
				 DestroyObject(oXornArm1, 300.0);
				 DestroyObject(oXornArm2, 300.0);
				 DestroyObject(oXornArm3, 300.0);
				 DestroyObject(oXornEye2, 300.0);
				 DestroyObject(oXornEye3, 300.0);
				 DestroyObject(oXornEye4, 300.0);
				 DestroyObject(oXornEye5, 300.0);
				 DestroyObject(oXornEye6, 300.0);
				 
				 DelayCommand(1.0, AssignCommand(oXornArm1, ActionSpeakString("*A creature slides up out of the ground without a ripple in the earth.", TALKVOLUME_TALK)));
				 DelayCommand(8.0, AssignCommand(oXornArm1, ActionSpeakString("None may remain behind. If you go...all go. The price is five stone of high quality nourishment.", TALKVOLUME_TALK)));
				 }
				
			 }
			 
	// Xorn appearance to depart from Occidian
	 if(GetTag(OBJECT_SELF) == "occ_xorn_low_out")  
		  	{if((GetLocalInt(OBJECT_SELF, "Xorn") != 1) && ((GetIsPC(GetEnteringObject()))|| (GetIsDMPossessed(GetEnteringObject())))) 
				{SetLocalInt(OBJECT_SELF, "XornGroup", 1);
				 SetLocalInt(OBJECT_SELF, "Xorn", 1);
				 DelayCommand(300.0, SetLocalInt(OBJECT_SELF, "Xorn", 0));
				 DelayCommand(3600.0, SetLocalInt(OBJECT_SELF, "XornGroup", 0));
				 object oXornCrownWP = GetWaypointByTag("xorn_crown_low_out");
				 object oXornBodyWP = GetWaypointByTag("xorn_body_low_out");
				 object oXornArm1WP = GetWaypointByTag("xorn_arm_1_low_out");
				 object oXornArm2WP = GetWaypointByTag("xorn_arm_2_low_out");
				 object oXornArm3WP = GetWaypointByTag("xorn_arm_3_low_out");
				 object oXornEye2WP = GetWaypointByTag("xorn_eye_2_low_out");
				 object oXornEye3WP = GetWaypointByTag("xorn_eye_3_low_out");
				 object oXornEye4WP = GetWaypointByTag("xorn_eye_4_low_out");
				 object oXornEye5WP = GetWaypointByTag("xorn_eye_5_low_out");
				 object oXornEye6WP = GetWaypointByTag("xorn_eye_6_low_out");
				 
				 object oXornBody = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_body", GetLocation(oXornBodyWP));
				 object oXornCrown = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_crown", GetLocation(oXornCrownWP)); 
				 object oXornArm1 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_xorn_arm", GetLocation(oXornArm1WP), FALSE, "003_cr_xorn_arm_1_low_out");
				 object oXornArm2 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_xorn_arm", GetLocation(oXornArm2WP), FALSE, "003_cr_xorn_arm_2_low_out");
				 object oXornArm3 = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_xorn_arm", GetLocation(oXornArm3WP), FALSE, "003_cr_xorn_arm_3_low_out");
				 object oXornEye2 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_eyes", GetLocation(oXornEye2WP), FALSE, "003_plc_xorn_eyes_2_low_out");
				 object oXornEye3 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_eyes", GetLocation(oXornEye3WP), FALSE, "003_plc_xorn_eyes_3_low_out");
				 object oXornEye4 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_eyes", GetLocation(oXornEye4WP), FALSE, "003_plc_xorn_eyes_4_low_out");
				 object oXornEye5 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_eyes", GetLocation(oXornEye5WP), FALSE, "003_plc_xorn_eyes_5_low_out");
				 object oXornEye6 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_xorn_eyes", GetLocation(oXornEye6WP), FALSE, "003_plc_xorn_eyes_6_low_out");
				 
				 DestroyObject(oXornBody, 300.0);
				 DestroyObject(oXornCrown, 300.0);
				 DestroyObject(oXornArm1, 300.0);
				 DestroyObject(oXornArm2, 300.0);
				 DestroyObject(oXornArm3, 300.0);
				 DestroyObject(oXornEye2, 300.0);
				 DestroyObject(oXornEye3, 300.0);
				 DestroyObject(oXornEye4, 300.0);
				 DestroyObject(oXornEye5, 300.0);
				 DestroyObject(oXornEye6, 300.0);
				 
				 DelayCommand(1.0, AssignCommand(oXornArm1, ActionSpeakString("*A creature slides up out of the ground without a ripple in the earth.", TALKVOLUME_TALK)));
				 DelayCommand(8.0, AssignCommand(oXornArm1, ActionSpeakString("None may remain behind. If you go...all go. The price is five stone of high quality nourishment.", TALKVOLUME_TALK)));
				 }
				
			 }
//occidian swim into chamber			 
if(FindSubString(GetTag(OBJECT_SELF), "occ_swim") != -1) 
	{effect eCold = EffectDamage(Random(6) + 1, DAMAGE_TYPE_COLD, DAMAGE_POWER_NORMAL, FALSE);
	 effect eDrown = EffectDamage(Random(6) + 1, DAMAGE_TYPE_ALL, DAMAGE_POWER_NORMAL, FALSE);
	 effect eBatter = EffectDamage(Random(10) + 1, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL, FALSE);
	 effect eSwim = EffectKnockdown();
	 effect eUnconscious = EffectStunned();
	 object oSuccess = GetLocalObject(OBJECT_SELF, "oSuccess");
	 if(oSuccess == OBJECT_INVALID)
			{oSuccess = GetWaypointByTag(GetTag(OBJECT_SELF) + "_WP");
			 SetLocalObject(OBJECT_SELF, "oSuccess", oSuccess);
			}
	 int nWeight = GetWeight(GetEnteringObject()); 
	 int nWeightPenalty = nWeight / 50;
	 SetLocalInt(GetEnteringObject(), "Swimming", 1);
	 SendMessageToPC(GetEnteringObject(), "You dive into the water!");
	 
	 if(GetLocalInt(GetEnteringObject(), "Swimming") == 1)	
		 {int nUnconscious = GetLocalInt(GetEnteringObject(), "nUnconscious");	
					 
			if(GetIsSkillSuccessful(GetEnteringObject(), SKILL_SWIM, 10 + nUnconscious + nWeightPenalty, TRUE) == TRUE)
							{SendMessageToPC(GetEnteringObject(), "You manage to avoid all hazards.");
							 AssignCommand(GetEnteringObject(), ActionJumpToLocation(GetLocation(oSuccess)));
							 SendMessageToPC(GetEnteringObject(), "Swimming strongly, you make for the way out. If you swim upward hard and fast, you may haul yourself out of the water before you are swept away again.");
							 SetLocalInt(GetEnteringObject(), "Drowning", 0);
							 SetLocalInt(GetEnteringObject(), "Swimming", 0);
							 SetLocalInt(GetEnteringObject(), "nUnconscious", 0);
						     RemoveEffect(GetEnteringObject(), eSwim);
				
							}
			else 
				{if(Random(3) == 0)
					{SendMessageToPC(GetEnteringObject(), "The swirling current slams you against a wall!");
					 ApplyEffectToObject(DURATION_TYPE_INSTANT, eBatter, GetEnteringObject());
					 }
				else if(Random(3) == 1)
					{SendMessageToPC(GetEnteringObject(), "The bone-numbing cold takes its toll.");
					 ApplyEffectToObject(DURATION_TYPE_INSTANT, eCold, GetEnteringObject());
					 }
				else if(Random(3) == 2)
					{SendMessageToPC(GetEnteringObject(), "You choke on a mouthful of brackish water, asphyxiating.");
					  ApplyEffectToObject(DURATION_TYPE_INSTANT, eDrown, GetEnteringObject());
						}
				object oSwim = GetNearestObjectByTag("alfa_swim_hard", GetEnteringObject(), Random(3) +1);
				 SendMessageToPC(GetEnteringObject(), "You are not strong enough to reach safety. You are swept away!");
				 AssignCommand(GetEnteringObject(), ActionJumpToLocation(GetLocation(oSwim)));
				 int nHoldBreath = GetAbilityScore(GetEnteringObject(), ABILITY_CONSTITUTION, FALSE) * 2;
				 if(Random(20) + 1 + GetAbilityModifier(ABILITY_CONSTITUTION, GetEnteringObject()) < 10) 
					{SetLocalInt(GetEnteringObject(), "Drowning", GetLocalInt(GetEnteringObject(), "Drowning") + 1);
					 int nDrowning = GetLocalInt(GetEnteringObject(), "Drowning");
					 if(nDrowning == 1)
						{SendMessageToPC(GetEnteringObject(), "You go underwater and lose your sense of which direction is up! Thoughts of drowning fill your mind.");
						}
					 if((nHoldBreath < 42) && (nHoldBreath >= 20))
						{if(nDrowning == 2)
							{SendMessageToPC(GetEnteringObject(), "You have been underwater too long. You start to black out! You are in danger of drowning.");
							 if((nHoldBreath < 42) && (nHoldBreath >= 30))
								{if(nDrowning == 3)
									{SendMessageToPC(GetEnteringObject(), "Spots swim before your eyes. Drowning is imminent.");
									}
								 if(nDrowning == 4)
									{SendMessageToPC(GetEnteringObject(), "You are unconscious, unable to swim. You are drowning!");
									 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eUnconscious, GetEnteringObject(), 60.0);
									 SetLocalInt(GetEnteringObject(), "nUnconscious", 10);
									}
								 }
							  if((nHoldBreath < 30) && (nHoldBreath >=20))
									{if(nDrowning == 3)
										{SendMessageToPC(GetEnteringObject(), "You are unconscious, unable to swim. You are drowning!");
									     ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eUnconscious, GetEnteringObject(), 60.0);
										 SetLocalInt(GetEnteringObject(), "nUnconscious", 10);
									    }
									}
								}
							 }
						if(nHoldBreath < 20)
							{if(nDrowning == 2)
							  	{SendMessageToPC(GetEnteringObject(), "You are unconscious, unable to swim. You are drowning!");
								 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eUnconscious, GetEnteringObject(), 60.0);
								 SetLocalInt(GetEnteringObject(), "nUnconscious", 10);
								 }
							}
						}
						else
							{SetLocalInt(GetEnteringObject(), "Drowning", 0);
							 SendMessageToPC(GetEnteringObject(), "You break through the surface of the water, taking in a welcome lungful of air! You stave off drowning for now, but the water holds other hazards.");
							 SetLocalInt(GetEnteringObject(), "nUnconscious", 0);
							 RemoveEffect(GetEnteringObject(), eUnconscious);
							 }
						if(nWeightPenalty > 1)
							{DelayCommand(3.0, SendMessageToPC(GetEnteringObject(), "Lightening your load would make swimming easier."));
							}
					}
		 DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSwim, GetEnteringObject(), IntToFloat(Random(10))));
		 DelayCommand(30.0, ExecuteScript("occidian_trg_onenter", GetEnteringObject()));
		 	}
	 	 			
		 
		}
	
 if(GetTag(OBJECT_SELF) == "alfa_wildmagic")
 	{SetLocalInt(GetEnteringObject(), "WildMagic", 1);
	}
	
}