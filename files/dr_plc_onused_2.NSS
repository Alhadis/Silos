////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Configuration File
//     Filename : acf_plc_onused.nss
//    $Revision:: 183        $ current version of the file
//        $Date:: 2006-12-21#$ date the file was created or modified
//       Author : Ronan
//
//  Local Variable Prefix =
//
//  Dependencies external of nwscript:
//
//  Description
//  This script calls the ACR's OnUsed code for placeables, and any
//  custom code a server may need. It is not updated in ACR updates.
//
//  Revision History
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

#include "acr_placeable_i"
#include "acr_trigger_i"

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

// The main event handler.
void main();

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

void main() {
    ACR_PlaceableOnUsed();

    // Custom code goes here.
	
	//Second Dungeon of the Ruins useable placeables script, executed by acf_plc_onused

	if(FindSubString(GetTag(OBJECT_SELF), "dr_lockdoor_lvr")  != -1)
	 {object oMasterWP = GetLocalObject(OBJECT_SELF, "oMasterWP");
	  if(oMasterWP == OBJECT_INVALID)
	 	{oMasterWP = GetWaypointByTag("dr_lockdoor_up_WP");
		SetLocalObject(OBJECT_SELF, "oMasterWP", oMasterWP);
		}
	  SetLocalInt(oMasterWP, "On", 1);
	  int nLevel = GetLocalInt(oMasterWP, "nLevel");
	  object oCollBox = GetLocalObject(oMasterWP, "oCollBox");
	  object oCollBoxWP = GetLocalObject(oMasterWP, "dr_collbox_WP");
	  if(oCollBoxWP == OBJECT_INVALID)
	  	{oCollBoxWP = GetWaypointByTag("dr_collbox_WP");}
	  int nRising = GetLocalInt(oMasterWP, "nRising");
	  int nState = GetLocalInt(oMasterWP, "nState");
	  object oMyGate = GetLocalObject(oMasterWP, "oMyGate");
	  object oUp = GetWaypointByTag("dr_lockdoor_up_WP");
	  object oDown = GetWaypointByTag("dr_lockdoor_down_WP");
	  object oRattle = GetObjectByTag("dr_rattle_sound");
	  object oMetal= GetObjectByTag("dr_metal_sound");
	  object oWaterHighest = GetWaypointByTag("dr_water_11_WP");
	  object oWaterLowest = GetWaypointByTag("dr_water_0_WP");
	  object oUnderwater = GetLocalObject(oMasterWP, "oUnderwater");
	  object oWaterLevel = GetWaypointByTag("dr_water_" + IntToString(nLevel) + "_WP");
	  object oWaterFloorWP = GetWaypointByTag("dr_water_4_WP");
	  object oWaterFloor = GetLocalObject(oMasterWP, "oWaterFloor");
	  object oUnderwaterLight = GetLocalObject(oMasterWP, "oUnderwaterLight");
	  object oUnderwaterLightWP = GetWaypointByTag("dr_water_8_WP");
	  effect eDrown = EffectDamage(Random(6) + 1, DAMAGE_TYPE_ALL, DAMAGE_POWER_NORMAL, FALSE);
	  effect eBatter = EffectDamage(Random(6) + 1, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL, FALSE);
	  effect eCold = EffectDamage(Random(6) + 1, DAMAGE_TYPE_COLD, DAMAGE_POWER_NORMAL, FALSE);
	  effect eUnconscious = EffectStunned();
	  object oSuccess = GetLocalObject(OBJECT_SELF, "oSuccess");
	  if(oSuccess == OBJECT_INVALID)
			{oSuccess = GetWaypointByTag("dr_current_10_WP");
			SetLocalObject(OBJECT_SELF, "oSuccess", oSuccess);
			}
	  object oSucceeded = GetLocalObject(OBJECT_SELF, "oSucceeded");
	  if(oSucceeded == OBJECT_INVALID)
			{oSucceeded = GetWaypointByTag("dr_success_WP");
			SetLocalObject(OBJECT_SELF, "oSucceeded", oSucceeded);
			}
	     if(nRising == 1)
		 	 {if(nLevel >= 10)
			  	{SetLocalInt(oMasterWP, "nLevel", 10);}
			  if(nLevel <= 0)
			  	{SetLocalInt(oMasterWP, "nLevel", 0);}
			  else if((nLevel >0) && (nLevel < 10))
			     {SetLocalInt(oMasterWP, "nLevel", nLevel + 1);}
			  if(nLevel == 5)
				  {oUnderwater = CreateObject(OBJECT_TYPE_PLACED_EFFECT, "n2_fx_splash2", GetLocation(oWaterFloorWP));
			       SetLocalObject(oMasterWP, "oUnderwater", oUnderwater);
				   }
				}
		else if(nRising == 2)
		 	 {if(nLevel >= 10)
			  	{SetLocalInt(oMasterWP, "nLevel", 10);}
			  if(nLevel <= 0)
			  	{SetLocalInt(oMasterWP, "nLevel", 0);}
			  else if((nLevel >0) && (nLevel < 10))
			  	{SetLocalInt(oMasterWP, "nLevel", nLevel - 1);}
			  if(nLevel == 4)
				  {SoundObjectPlay(oRattle);
				   SoundObjectPlay(oMetal);
				   DelayCommand(10.0, SoundObjectStop(oRattle));
				   DelayCommand(10.0, SoundObjectStop(oMetal));
				   DestroyObject(oMyGate);
				   object oGate = CreateObject(OBJECT_TYPE_PLACEABLE, "dr_lockdoor", GetLocation(oDown));
				   SetLocalObject(oMasterWP, "oMyGate", oGate);
				   DestroyObject(oCollBox);
				   SetLocalObject(oMasterWP, "oCollBox", OBJECT_INVALID);
				   DestroyObject(oUnderwater);
				   SetLocalObject(oMasterWP, "oUnderwater", OBJECT_INVALID);
				   }
			 }
  
		nLevel = GetLocalInt(oMasterWP, "nLevel");
		nState = GetLocalInt(oMasterWP, "nState");
		nRising = GetLocalInt(oMasterWP, "nRising");
		oWaterLevel = GetWaypointByTag("dr_water_" + IntToString(nLevel) + "_WP");
		object oWater = GetLocalObject(oMasterWP, "oWater");
		DestroyObject(oWater);
		SetLocalObject(oMasterWP, "oWater", OBJECT_INVALID);
		if(nLevel > 0)
			{oWater = CreateObject(OBJECT_TYPE_PLACEABLE, "tsm_water_6x6", GetLocation(oWaterLevel));
			SetLocalObject(oMasterWP, "oWater", oWater);	 
			}
		object oPC = GetFirstObjectInShape(SHAPE_SPHERE, 20.0, GetLocation(oWaterFloorWP), FALSE, OBJECT_TYPE_CREATURE); 
		int nSwimLevel;
		int nSwimSize = 83 + nLevel-5;
		if(nLevel==10)
			{nSwimSize = 87;}
		if((nLevel == 4) && (GetLocalInt(oPC, "Swimming") == 1))
			{ExitWater(OBJECT_SELF, oPC);
			 SetLocalInt(oPC, "Swimming", 0);
			 }
		if(nLevel >= 4) 
			{if(GetObjectByTag("DR_Swim_Well") != OBJECT_INVALID)
				{DestroyObject(GetObjectByTag("DR_Swim_Well"));
				}
			}
		
		if(nLevel >= 5) 
			{ ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectAreaOfEffect(nSwimSize, "abr_trg_swimonenter", "", "abr_trg_swimonexit", "DR_Swim_Well"), GetLocation(GetWaypointByTag("DR_AOE_WP")), 3600.0);
			 SetLocalInt(GetObjectByTag("DR_Swim_Well"), "ACR_SWIM_DC", 22 - nLevel);
			  if(nLevel == 5)
				{SetLocalInt(GetObjectByTag("DR_Swim_Well"), "ACR_SWIM_DC", 10);
				}
			if(nLevel == 10)
				{SetLocalInt(GetObjectByTag("DR_Swim_Well"), "ACR_SWIM_DC", 10);
				}
			}
		    int nDistance;
			while((oPC != OBJECT_INVALID) && ((GetIsPC(oPC))  ||!(GetIsPC(oPC)) || (GetMaster(oPC) != OBJECT_INVALID) || (GetIsDMPossessed(oPC))))
			 	{int nWeight = GetWeight(oPC); 
				 int nWeightPenalty = nWeight / 50;
				 if(nWeightPenalty < 1)
				 	{nWeightPenalty = 0;}
				 else if(nWeightPenalty < 2)
				 	{nWeightPenalty = 1;}
				 else if(nWeightPenalty < 3)
				 	{nWeightPenalty = 2;}
				 else if(nWeightPenalty < 4)
				 	{nWeightPenalty = 3;}
				else {nWeightPenalty = 4;}
				 int nSize = GetCreatureSize(oPC);
				 if((GetMaster(oPC) != OBJECT_INVALID) || (GetRacialType(oPC) == RACIAL_TYPE_DWARF) || (nSize < 3))
				 	{nSwimLevel = 5;}
				 else 
				 	{nSwimLevel = 6;}
				 SetLocalInt(oPC, "nSwimLevel", nSwimLevel);
				 if(GetDistanceBetween(oPC, oWaterFloorWP) < 25.0)
				 	{nDistance = 25;}
				 if(GetDistanceBetween(oPC, oWaterFloorWP) < 17.0)
				 	{nDistance = 17;}
				 if(GetDistanceBetween(oPC, oWaterFloorWP) < 13.0)
				 	{nDistance = 13;}
				 if(GetDistanceBetween(oPC, oWaterFloorWP) < 10.0)
				 	{nDistance = 10;}
				 if(GetDistanceBetween(oPC, oWaterFloorWP) < 7.5)
				 	{nDistance = 7;}
				 if(GetDistanceBetween(oPC, oWaterFloorWP) < 3.95)
				 	{nDistance = 4;}
					
				 if((nRising == 1) && (GetLocalInt(oMasterWP, "RisingMsg") != 1))
				 		{SendMessageToPC(oPC, "The water is rising!");
						 SetLocalInt(oMasterWP, "RisingMsg", 1);
						 DelayCommand(10.0, SetLocalInt(oMasterWP, "RisingMsg", 0));
						 }
				 
		 	     if((nRising == 2) && (GetLocalInt(oMasterWP, "FallingMsg") != 1))
					 {SendMessageToPC(oPC, "The water level is falling!");
					  SetLocalInt(oMasterWP, "FallingMsg", 1);
					  DelayCommand(10.0, SetLocalInt(oMasterWP, "FallingMsg", 0));
						}
			    
				 SetLocalInt(oPC, "nDistance", nDistance);
				 if((GetLocalInt(oPC, "SwimmingSuccess") != 1) && (GetLocalInt(oPC, "SwimmingSucceeded") != 1) )
				 	{if(GetLocalInt(oPC, "Swimming") != 1)
						{if(nLevel >= 4) 
								{SendMessageToPC(oPC, "The currents are strong and could knock you off your feet!");}
									    
							if((nLevel == 6)|| (nLevel == 5))
								{if(nLevel == GetLocalInt(oPC, "nSwimLevel")) 
									{if(GetLocalInt(oPC, "nDistance") <= 7) 
										{if(Random(20) + 1 + GetAbilityModifier(ABILITY_STRENGTH, oPC)< GetLocalInt(GetObjectByTag("DR_Swim_Well"), "ACR_SWIM_DC"))
											{SendMessageToPC(oPC, "Cold water rushes around you, knocking you off your feet!");
										     SetLocalInt(oPC, "Swimming", 1);
											}
										}
									}
								
								else if((nLevel == GetLocalInt(oPC, "nSwimLevel")) && (GetLocalInt(oPC, "nDistance") <= 7))
									{SendMessageToPC(oPC, "You struggle to stay on your feet!" + IntToString(nLevel) + "/" + IntToString(GetLocalInt(oPC, "nSwimLevel")));
									}
								}
							
							if((nLevel == 7) || (nLevel == 6))
								{if(nLevel == GetLocalInt(oPC, "nSwimLevel") +1) 
									{if(GetLocalInt(oPC, "nDistance") <= 10) 
										{if(Random(20) + 1 + GetAbilityModifier(ABILITY_STRENGTH, oPC)< GetLocalInt(GetObjectByTag("DR_Swim_Well"), "ACR_SWIM_DC"))
											{SendMessageToPC(oPC, "Cold water rushes around you, knocking you off your feet!");
										     SetLocalInt(oPC, "Swimming", 1);
											}
										}
									}
								
							else if((nLevel == GetLocalInt(oPC, "nSwimLevel") +1) && (GetLocalInt(oPC, "nDistance") <= 10))
									{SendMessageToPC(oPC, "You struggle to stay on your feet!" + IntToString(nLevel) + "/" + IntToString(GetLocalInt(oPC, "nSwimLevel")));
									}
								}
						
						if((nLevel == 8) || (nLevel == 7))
								{if(nLevel == GetLocalInt(oPC, "nSwimLevel") +2) 
									{if(GetLocalInt(oPC, "nDistance") <= 13) 
										{if(Random(20) + 1 + GetAbilityModifier(ABILITY_STRENGTH, oPC)< GetLocalInt(GetObjectByTag("DR_Swim_Well"), "ACR_SWIM_DC"))
											{SendMessageToPC(oPC, "Cold water rushes around you, knocking you off your feet!");
										     SetLocalInt(oPC, "Swimming", 1);
											}
										}
									}
								else if((nLevel == GetLocalInt(oPC, "nSwimLevel") +2) && (GetLocalInt(oPC, "nDistance") <= 13))
									{SendMessageToPC(oPC, "You struggle to stay on your feet!" + IntToString(nLevel) + "/" + IntToString(GetLocalInt(oPC, "nSwimLevel")));
									}
								}
							
							if((nLevel == 9)|| (nLevel == 8))
								{if(nLevel == GetLocalInt(oPC, "nSwimLevel") +3) 
									{if(GetLocalInt(oPC, "nDistance") <= 13) 
										{if(Random(20) + 1 + GetAbilityModifier(ABILITY_STRENGTH, oPC)< GetLocalInt(GetObjectByTag("DR_Swim_Well"), "ACR_SWIM_DC"))
											{SendMessageToPC(oPC, "Cold water rushes around you, knocking you off your feet!");
										     SetLocalInt(oPC, "Swimming", 1);
											}
										}
									}
								else if((nLevel == GetLocalInt(oPC, "nSwimLevel") +3) && (GetLocalInt(oPC, "nDistance") <= 13))
									{SendMessageToPC(oPC, "You struggle to stay on your feet!" + IntToString(nLevel) + "/" + IntToString(GetLocalInt(oPC, "nSwimLevel")));
									}
								}
								
							if(nLevel == 9)
								{if(nLevel == GetLocalInt(oPC, "nSwimLevel") +4) 
									{if(GetLocalInt(oPC, "nDistance") <= 13) 
										{if(Random(20) + 1 + GetAbilityModifier(ABILITY_STRENGTH, oPC)< GetLocalInt(GetObjectByTag("DR_Swim_Well"), "ACR_SWIM_DC"))
											{SendMessageToPC(oPC, "Cold water rushes around you, knocking you off your feet!");
										     SetLocalInt(oPC, "Swimming", 1);
											}
										}
									}
								else if((nLevel == GetLocalInt(oPC, "nSwimLevel") +4) && (GetLocalInt(oPC, "nDistance") <= 13))
									{SendMessageToPC(oPC, "You struggle to stay on your feet!" + IntToString(nLevel) + "/" + IntToString(GetLocalInt(oPC, "nSwimLevel")));
									}
								}
						 }
							 
						if(GetLocalInt(oPC, "Swimming") == 1)
							{SendMessageToPC(oPC, "Inside swimming");
							 int nUnconscious = GetLocalInt(oPC, "nUnconscious");	
							 if(FortitudeSave(oPC, 5 + nLevel + nUnconscious, SAVING_THROW_TYPE_NONE, oWater) == 0) 
									{int nRandom = Random(3);
									 if(nRandom == 0)
										{SendMessageToPC(oPC, "The swirling current slams you against a rock!");
										 ApplyEffectToObject(DURATION_TYPE_INSTANT, eBatter, oPC);
									     }
								 	else if(nRandom == 1)
										{SendMessageToPC(oPC, "The bone-numbing cold takes its toll.");
										 ApplyEffectToObject(DURATION_TYPE_INSTANT, eCold, oPC);
									     }
								 	else if(nRandom == 2)
										{SendMessageToPC(oPC, "You choke on a mouthful of brackish water, asphyxiating.");
										 ApplyEffectToObject(DURATION_TYPE_INSTANT, eDrown, oPC);
									     }
								 	}
							  else 
							  		{DelayCommand(3.0, SendMessageToPC(oPC, "You manage to avoid all hazards."));
									 }
								
							 if((Random(20) + 1 + GetAbilityModifier(ABILITY_STRENGTH, oPC) - nWeightPenalty > 15) && (nLevel > 8)) 
								{AssignCommand(oPC, ActionJumpToLocation(GetLocation(oSuccess)));
								 SendMessageToPC(oPC, "Swimming strongly, you make for the overhead dock and manage to grab the bottom of it. You might be able to haul yourself out of the water before you are swept away again.");
								 SetLocalInt(oPC, "SwimmingSuccess", 1);
								 SetLocalInt(oPC, "Drowning", 0);
								 SetLocalInt(oPC, "Swimming", 0);
								 SetLocalInt(oPC, "nUnconscious", 0);
								 }
							else 
								{SendMessageToPC(oPC, "You are swept away by the strong current.");
							     object oSwim = GetNearestObjectByTag("alfa_swim_hard", oPC, Random(8));
			  					 AssignCommand(oPC, ActionJumpToLocation(GetLocation(oSwim)));
								 int nHoldBreath = GetAbilityScore(oPC, ABILITY_CONSTITUTION, FALSE) * 2;
								 if(Random(20) + 1 + GetAbilityModifier(ABILITY_CONSTITUTION, oPC) < 10) 
									{SetLocalInt(oPC, "Drowning", GetLocalInt(oPC, "Drowning") + 1);
									 int nDrowning = GetLocalInt(oPC, "Drowning");
									 if(nDrowning == 1)
									 	{SendMessageToPC(oPC, "You go under water and lose your sense of which direction is up! Thoughts of drowning fill your mind.");
										}
									 if(nDrowning == 2)
										{SendMessageToPC(oPC, "You have been under water too long. You start to black out! You are in danger of drowning.");
										}
									 if(nDrowning == 3)
										{SendMessageToPC(oPC, "Spots swim before your eyes. Drowning is imminent.");
										}
									 if(nDrowning == 4)
										{SendMessageToPC(oPC, "You are unconscious, unable to swim. You are drowning!");
										ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eUnconscious, oPC, 60.0);
										SetLocalInt(oPC, "nUnconscious", 10);
										 }
									}
										
											
								 
								 else
								 	{SetLocalInt(oPC, "Drowning", 0);
									 SendMessageToPC(oPC, "You break through the surface of the water, taking in a welcome lungful of air. You stave off drowning for now, but the water holds other hazards.");
									 SetLocalInt(oPC, "nUnconscious", 0);
									 RemoveEffect(oPC, eUnconscious);
									 }
								 if(nWeightPenalty > 1)
								 	{DelayCommand(3.0, SendMessageToPC(oPC, "Lightening your load would make swimming easier."));
									}
								 
								
							}
						}
				 }		 
				else if((GetLocalInt(oPC, "SwimmingSuccess") == 1) && (GetLocalInt(oPC, "SwimmingSucceeded") != 1))
					{AssignCommand(oPC, ActionJumpToLocation(GetLocation(oSuccess)));
					 }
			if(nLevel <= 0)
				{if((GetLocalInt(oPC, "SwimmingSuccess") != 1)  && (nRising > 0) && (GetLocalInt(oPC, "Swimming") == 1))
					{AssignCommand(oPC, ActionJumpToLocation(GetLocation(oWaterFloorWP)));
			 		 SendMessageToPC(oPC, "Thanks to the still waters, you scramble up onto the central platform.");}
				}
			 oPC = GetNextObjectInShape(SHAPE_SPHERE, 20.0, GetLocation(oWaterFloorWP), FALSE, OBJECT_TYPE_CREATURE); 
			 }
		
		 if(nLevel <= 0)
			{SpeakString("The water stops draining and the currents quickly settle into placidly lapping water.", TALKVOLUME_TALK);
			 DestroyObject(oWater);
		     SetLocalObject(oMasterWP, "oWater", OBJECT_INVALID);	 
		     SetLocalInt(oPC, "Drowning", 0);
			 SetLocalInt(oPC, "Swimming", 0);
			 SetLocalInt(oPC, "nUnconscious", 0);
			return;
			} 
		if(nLevel <= 8)
			{object oCollBoxHighWP = GetLocalObject(OBJECT_SELF, "oCollBoxHighWP");
			 if(oCollBoxHighWP == OBJECT_INVALID)
			 	{oCollBoxHighWP = GetWaypointByTag("dr_collboxhigh_WP");
				 SetLocalObject(OBJECT_SELF, "oCollBoxHighWP", oCollBoxHighWP);
				 }
			 object oCollBoxHigh = GetLocalObject(OBJECT_SELF, "oCollBoxHigh");
			 if(oCollBoxHigh == OBJECT_INVALID)
			 	{oCollBoxHigh = GetObjectByTag("dr_collision_high");
				 if(oCollBoxHigh == OBJECT_INVALID)
				 	{oCollBoxHigh = CreateObject(OBJECT_TYPE_PLACEABLE, "dr_collision_high", GetLocation(oCollBoxHighWP));
					 }
				SetLocalObject(OBJECT_SELF, "oCollBoxHigh", oCollBoxHigh);
				}
			}
	    if(nLevel >= 9)
			{object oCollBoxHigh = GetObjectByTag("dr_collision_high");
			 DestroyObject(oCollBoxHigh);
			 
			}
	    		
		if(GetLocalInt(oMasterWP, "nLevel") == 10)
		  {if(Random(2)==1) 	
			{AssignCommand(oPC, ActionJumpToLocation(GetLocation(oSuccess)));
			 	SendMessageToPC(oPC, "As the pit stops filling and the currents slow, you are washed onto the high platform");
						}
			else 
					{AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetWaypointByTag("dr_rowboat_land_a_WP"))));
			 		 SendMessageToPC(oPC, "As the pit stops filling and the currents slow, you are washed onto the ramp of the platform");
					}
			 SpeakString("The water stops draining and the currents quickly settle into placidly lapping water.", TALKVOLUME_TALK);
			 SetLocalInt(oMasterWP, "nRising", 0);
			 return;
			}
			
			 
		if((nLevel > 0) && (nLevel < 10))
			{DelayCommand(60.0, ExecuteScript("dr_plc_onused_2", OBJECT_SELF));
			}
		}

}