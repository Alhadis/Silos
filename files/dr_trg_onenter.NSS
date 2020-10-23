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
//  October 2008, Wynna
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#include "acr_trigger_i"
#include "acr_quest_i"
#include "acr_i"




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

void main()
{
    ACR_TriggerOnEnter();

    // Custom code goes here.
	
 
//5b Settlestone Dungeon of the Ruins. 

if((GetTag(OBJECT_SELF) == "dr_mohrg_trg") && (GetLocalInt(OBJECT_SELF, "Mohrg") != 1))
        {SetLocalInt(OBJECT_SELF, "Mohrg", 1);
		 object oWP = GetLocalObject(OBJECT_SELF, "oWP");
	     if(oWP == OBJECT_INVALID)
		 	{oWP = GetWaypointByTag("003_cr_dr_mohrg_WP");
			 SetLocalObject(OBJECT_SELF, "oWP", oWP);
			 }
	 	 object oSkeleton = GetLocalObject(OBJECT_SELF, "oSkeleton");
	     if(oSkeleton == OBJECT_INVALID)
		 	{oSkeleton = GetObjectByTag("003_cr_dr_skeleton");
			 SetLocalObject(OBJECT_SELF, "oSkeleton", oSkeleton);
			 }
	 	 object oSkeleton2 = GetLocalObject(OBJECT_SELF, "oSkeleton2");
	     if(oSkeleton2 == OBJECT_INVALID)
		 	{oSkeleton2 = GetObjectByTag("003_cr_dr_skeleton2");
			 SetLocalObject(OBJECT_SELF, "oSkeleton2", oSkeleton2);
			 }
	 	 object oMohrg1 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_un_mohrg", GetLocation(oWP));
		 object oMohrg2 = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_un_skeleton_tombguard03", GetLocation(oSkeleton2));
		DestroyObject(oSkeleton, 1.0);
		 DestroyObject(oSkeleton2, 1.0);
		 }

if((GetTag(OBJECT_SELF) == "dr_skeleton_trg") && (GetIsPC(GetEnteringObject())) && (GetLocalInt(OBJECT_SELF, "Spawned") != 1))
        {object oWP = GetLocalObject(OBJECT_SELF, "oWP");
	     if(oWP == OBJECT_INVALID)
		 	{oWP = GetWaypointByTag("003_cr_dr_skel_hero_spellstitch");
			 SetLocalObject(OBJECT_SELF, "oWP", oWP);
			 }
	 object oSkeleton = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_dr_skel_hero_spellstitch", GetLocation(oWP));
		 SetLocalInt(OBJECT_SELF, "Spawned", 1);
		 }


if(GetTag(OBJECT_SELF) == "dr_illusion_arch")
	{SendMessageToPC(GetEnteringObject(), "From below, it becomes apparent that the arch above is illusory, for decoration only." );
     }


if(GetTag(OBJECT_SELF) == "dr_orc_privy_trg")
	{SendMessageToPC(GetEnteringObject(), "This room reeks like an orc privy. On closer inspection, it is an orc privy.");
	 }

if(GetTag(OBJECT_SELF) == "dr_tracks_trg")
	{SendMessageToPC(GetEnteringObject(), "This door is made of solid iron, at least a handwidth thick. Though covered in rust, it has survived the test of time. At the bottom, however, two channels have been melted out to provide a snug tunnel for mining tracks.");
	 }


if(GetTag(OBJECT_SELF) == "dr_yellowmold_trg")
	{int nSpores = GetLocalInt(GetEnteringObject(), "Spores") + 1;
	 effect eConLoss = EffectAbilityDecrease(ABILITY_CONSTITUTION, (Random(6) + 1) * nSpores);
	 SendMessageToPC(GetEnteringObject(), "A cloud of yellow spores squirts up from underfoot, filling your nose and mouth!");
	 object oSpores = CreateObject(OBJECT_TYPE_PLACED_EFFECT, "n2_fx_dust", GetLocation(GetEnteringObject()));
	 DestroyObject(oSpores, 30.0);
	 if(FortitudeSave(GetEnteringObject(), 15, SAVING_THROW_TYPE_POISON, OBJECT_SELF) == 0) 
	 	{ApplyEffectToObject(DURATION_TYPE_INSTANT, eConLoss, GetEnteringObject());
		 SendMessageToPC(GetEnteringObject(), "The poisonous spores burn your lungs and throat! Racked with coughing, you feel a weakness spreading through your limbs.");
	     }
	  else
	  	{SendMessageToPC(GetEnteringObject(), "By covering your mouth and nose, you avoid breathing any of the floating spores, this time.");
	     }
	 if(nSpores == 1)
	 	{SetLocalInt(GetEnteringObject(), "Spores", nSpores);
	     DelayCommand(60.0, ExecuteScript("dr_trg_onenter", OBJECT_SELF));
	 	}
	}


if(GetTag(OBJECT_SELF) == "dr_directional")
	{SetLocalInt(GetEnteringObject(), "Directional", 1);
	}
	
if((GetTag(OBJECT_SELF) == "dr_search_check_trg") && (GetLocalInt(GetEnteringObject(), "Directional") != 1))
	{if(GetIsSkillSuccessful(GetEnteringObject(), SKILL_SEARCH, 18))
		{SendMessageToPC(GetEnteringObject(), "For a moment, something seems out of place to you....");
			if(WillSave(GetEnteringObject(), 18, SAVING_THROW_TYPE_NONE, OBJECT_SELF) == 1) 
				{SendMessageToPC(GetEnteringObject(), "Could it be the light breeze that seems to blow /through/ the pillars beside you to chill your skin?");
				}
			else
				{SendMessageToPC(GetEnteringObject(), "But you can't put your finger on it and the thought fades.");
				}
			
		}
	}
	
	
	

	
//4b Fourthpeak caveboat lock system to raise/lower rowboats to level of high/low docks to access 5b Settlestone Dungeon of the Ruins. 
 
if((GetTag(OBJECT_SELF) == "dr_lock_trg") && (GetLocalInt(GetEnteringObject(), "dr_lock_message") != 1))
	{SendMessageToPC(GetEnteringObject(), "The roar of water is nearly deafening. Water pours from a crack in the ceiling, streams down the walls, thunders through a broken, rusty grate in the ground. An eerie blue light ripples on the walls, apparently emanating from a glowing blue fungus or moss growing there.");
	 if(GetIsSkillSuccessful(GetEnteringObject(), SKILL_LISTEN, 10))
		{SendMessageToPC(GetEnteringObject(), "Beneath the general roar, you can discern the sound of water thudding on metal, beneath your feet.");
	     SetLocalInt(GetEnteringObject(), "dr_lock_message", 1);
		 }
	 }

if(FindSubString(GetTag(OBJECT_SELF), "dr_rowboat") != -1)
	{object oMasterWP = GetLocalObject(OBJECT_SELF, "oMasterWP");
	 if(oMasterWP == OBJECT_INVALID)
	 	{oMasterWP = GetWaypointByTag("dr_lockdoor_up_WP");
		SetLocalObject(OBJECT_SELF, "oMasterWP", oMasterWP);
		}
	  object oMyBoat = GetLocalObject(OBJECT_SELF, "oMyBoat");
	  if(oMyBoat == OBJECT_INVALID)
	 	{oMyBoat = GetObjectByTag(GetTag(OBJECT_SELF) + "_boat");
		SetLocalObject(OBJECT_SELF, "oMyBoat", oMyBoat);
		}
	  object oMyLaunch = GetLocalObject(OBJECT_SELF, "oMyLaunch");
	  if(oMyLaunch == OBJECT_INVALID)
	 	{oMyLaunch = GetObjectByTag(GetTag(OBJECT_SELF) + "_go");
		SetLocalObject(OBJECT_SELF, "oMyLaunch", oMyLaunch);
		}
	  object oMyOpposite = GetLocalObject(OBJECT_SELF, "oMyOpposite");
	  if(oMyOpposite == OBJECT_INVALID)
	 	{if(FindSubString(GetTag(OBJECT_SELF), "1a") != -1)
			{oMyOpposite = GetObjectByTag("dr_rowboat" + "_1b");
			}
		if(FindSubString(GetTag(OBJECT_SELF), "1b") != -1)
			{oMyOpposite = GetObjectByTag("dr_rowboat" + "_1a");
			}
		if(FindSubString(GetTag(OBJECT_SELF), "2a") != -1)
			{oMyOpposite = GetObjectByTag("dr_rowboat" + "_2b");
			}
		if(FindSubString(GetTag(OBJECT_SELF), "2b") != -1)
			{oMyOpposite = GetObjectByTag("dr_rowboat" + "_2a");
			}
		SetLocalObject(OBJECT_SELF, "oMyOpposite", oMyOpposite);
		}
	  object oMyOppositeLaunch = GetLocalObject(OBJECT_SELF, "oMyOppositeLaunch");
	  if(oMyOppositeLaunch == OBJECT_INVALID)
	 	{if(FindSubString(GetTag(OBJECT_SELF), "1a") != -1)
			{oMyOppositeLaunch = GetObjectByTag("dr_rowboat" + "_1b_go");
			}
		if(FindSubString(GetTag(OBJECT_SELF), "1b") != -1)
			{oMyOppositeLaunch = GetObjectByTag("dr_rowboat" + "_1a_go");
			}
		if(FindSubString(GetTag(OBJECT_SELF), "2a") != -1)
			{oMyOppositeLaunch = GetObjectByTag("dr_rowboat" + "_2b_go");
			}
		if(FindSubString(GetTag(OBJECT_SELF), "2b") != -1)
			{oMyOppositeLaunch = GetObjectByTag("dr_rowboat" + "_2a_go");
			}
		SetLocalObject(OBJECT_SELF, "oMyOppositeLaunch", oMyOppositeLaunch);
		}
	  SetLocalObject(oMyLaunch, "oMyTrig", OBJECT_SELF);
	  SetLocalObject(oMyLaunch, "oMyBoat", oMyBoat);
	  SetLocalObject(oMyLaunch, "oMyOppositeLaunch", oMyOppositeLaunch);
	  int nCount = GetLocalInt(oMyBoat, "nCount");
	  object oBoater = GetEnteringObject();
	  if(oMyBoat != OBJECT_INVALID) 
	  	{if(nCount == 0)
			{SpeakString("The boat will hold three people, with difficulty.", TALKVOLUME_TALK);
		 	}
		 SetLocalInt(oMyBoat, "nCount", nCount + 1);
		 nCount = GetLocalInt(oMyBoat, "nCount");
	  	 if((nCount >= 1) && (nCount <= 3))
		 	{SendMessageToPC(oBoater, "You board the boat as passenger number " + IntToString(nCount));
			 SetLocalInt(oBoater, GetTag(OBJECT_SELF), nCount);
		 	}
		 if(nCount >3)
		 	{SpeakString("The boat is full.", TALKVOLUME_TALK);
		 	 }
		}		 
	 }
	 	 
if(FindSubString(GetTag(OBJECT_SELF), "dr_swimdown_trg") != -1)
	{object oMasterWP = GetLocalObject(OBJECT_SELF, "oMasterWP");
	 if(oMasterWP == OBJECT_INVALID)
	 	{oMasterWP = GetWaypointByTag("dr_lockdoor_up_WP");
		SetLocalObject(OBJECT_SELF, "oMasterWP", oMasterWP);
		}
	 int nLevel = GetLocalInt(oMasterWP, "nLevel");
	 effect eCold = EffectDamage(Random(6) + 1, DAMAGE_TYPE_COLD, DAMAGE_POWER_NORMAL, FALSE);
	 effect eDrown = EffectDamage(Random(6) + 1, DAMAGE_TYPE_ALL, DAMAGE_POWER_NORMAL, FALSE);
	 effect eBatter = EffectDamage(Random(10) + 1, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL, FALSE);
	 effect eSwim;
	 effect eUnconscious = EffectStunned();
	 object oWaterFloorWP = GetWaypointByTag("dr_water_4_WP");
	 object oSuccess = GetWaypointByTag(GetLocalString(OBJECT_SELF, "oSuccess"));
	 if(oSuccess == OBJECT_INVALID)
			{oSuccess = GetWaypointByTag("dr_current_10_WP");
			 SetLocalObject(OBJECT_SELF, "oSuccess", oSuccess);
			}
	 int nWeight = GetWeight(GetEnteringObject()); 
	 int nWeightPenalty = nWeight / 50;
	 int nSize = GetCreatureSize(GetEnteringObject());
	 int nSwimLevel;
	 if((GetMaster(GetEnteringObject()) != OBJECT_INVALID) || (GetRacialType(GetEnteringObject()) == RACIAL_TYPE_DWARF) || (nSize < 3))
		 {nSwimLevel = 5;}
	 else 
		 {nSwimLevel = 6;}
	 SetLocalInt(GetEnteringObject(), "nSwimLevel", nSwimLevel);
	 if(nLevel > 3)
	 	{SetLocalInt(GetEnteringObject(), "Swimming", 1);
	     SendMessageToPC(GetEnteringObject(), "You strike out into the water, swimming.");
	 	}
	 if((nLevel > 3) && (nLevel < 10))	
		 {int nUnconscious = GetLocalInt(GetEnteringObject(), "nUnconscious");	
					 
					if(GetIsSkillSuccessful(GetEnteringObject(), SKILL_SWIM, 5 + nLevel + nUnconscious, TRUE) == FALSE)
							{if(Random(3) == 0)
								{SendMessageToPC(GetEnteringObject(), "The swirling current slams you against a rock!");
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
							}
						 else 
							 {DelayCommand(3.0, SendMessageToPC(GetEnteringObject(), "You manage to avoid all hazards."));
							 }
						
		if((nLevel > 3) && (Random(20) + 1 + GetAbilityModifier(ABILITY_STRENGTH, GetEnteringObject()) - nWeightPenalty > 15))
				{object oSwim;
				if((nLevel > 8) && (Random(2) ==1))
				 	{oSwim = GetObjectByTag("dr_current_10_WP");}
				 else 
				 	{oSwim = GetNearestObjectByTag("alfa_swim_hard", GetEnteringObject(), Random(3));}
				 AssignCommand(GetEnteringObject(), ActionJumpToLocation(GetLocation(oSwim)));
				 SendMessageToPC(GetEnteringObject(), "Swimming strongly, you make for the nearest rock or handhold.");
				 SetLocalInt(GetEnteringObject(), "SwimmingSuccess", 1);
				 SetLocalInt(GetEnteringObject(), "Drowning", 0);
				 SetLocalInt(GetEnteringObject(), "nUnconscious", 0);
			     }
			else if(nLevel > 3)
				{object oSwim = GetNearestObjectByTag("alfa_swim_hard", GetEnteringObject(), Random(8));
				 SendMessageToPC(GetEnteringObject(), "You are not strong enough to reach or hang on to your intended handhold. You are swept away!");
				 AssignCommand(GetEnteringObject(), ActionJumpToLocation(GetLocation(oSwim)));
				 if(Random(20) + 1 + GetAbilityModifier(ABILITY_CONSTITUTION, GetEnteringObject()) < 10) 
					{SetLocalInt(GetEnteringObject(), "Drowning", GetLocalInt(GetEnteringObject(), "Drowning") + 1);
					 int nDrowning = GetLocalInt(GetEnteringObject(), "Drowning");
					 if(nDrowning == 1)
						{SendMessageToPC(GetEnteringObject(), "You go underwater and lose your sense of which direction is up! Thoughts of drowning fill your mind.");
						}
					if(nDrowning == 2)
							{SendMessageToPC(GetEnteringObject(), "You have been underwater too long. You start to black out! You are in danger of drowning.");
							}
					if(nDrowning == 3)
							{SendMessageToPC(GetEnteringObject(), "Spots swim before your eyes. Drowning is imminent.");
							}
					if(nDrowning == 4)
							{SendMessageToPC(GetEnteringObject(), "You are unconscious, unable to swim. You are drowning!");
							ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eUnconscious, GetEnteringObject(), 60.0);
						 	SetLocalInt(GetEnteringObject(), "nUnconscious", 10);
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
	 	 			
		 SetLocalInt(GetEnteringObject(), "SwimmingSuccess", 0);
		 SetLocalInt(GetEnteringObject(), "SwimmingSucceeded", 0);
		 }
		 
	else if(nLevel <= 0)
			{if((GetTag(OBJECT_SELF) != "dr_swimdown_trg_high") && (GetTag(OBJECT_SELF) != "dr_swimdown_trg_central"))
			 	{AssignCommand(GetEnteringObject(), ActionJumpToLocation(GetLocation(oWaterFloorWP)));
				SendMessageToPC(GetEnteringObject(), "The still waters allow you to reach the base of the platform, and climb it safely.");
			 	 }
			 else if(GetTag(OBJECT_SELF) != "dr_swimdown_trg_central") 
			 	{object oSplashdown = GetNearestObjectByTag("alfa_swim_hard", OBJECT_SELF, 1);
				 SendMessageToPC(GetEnteringObject(), "The water is far below but quiet. You throw yourself into the air, plummeting towards the still water.");
			 	 DelayCommand(3.0, SendMessageToPC(GetEnteringObject(), "Your splash is impressive but you hardly see it, plunging deeply into the freezing water."));
			 	 DelayCommand(5.0, AssignCommand(GetEnteringObject(), ActionJumpToLocation(GetLocation(oSplashdown))));
				 DelayCommand(20.0, SendMessageToPC(GetEnteringObject(), "You finally drag yourself up and out onto the central platform."));
			 	 DelayCommand(20.0, AssignCommand(GetEnteringObject(), ActionJumpToLocation(GetLocation(oWaterFloorWP))));
				 if(ReflexSave(GetEnteringObject(), 15, SAVING_THROW_TYPE_NONE, OBJECT_SELF) == 0) 
							{if(Random(3) == 0)
								{DelayCommand(6.0, SendMessageToPC(GetEnteringObject(), "Rocks lie just under the surface!"));
								 AssignCommand(GetEnteringObject(), ApplyEffectToObject(DURATION_TYPE_INSTANT, eBatter, GetEnteringObject()));
								 }
							 else if(Random(3) == 1)
								{DelayCommand(6.0, SendMessageToPC(GetEnteringObject(), "The bone-numbing cold takes its toll."));
								 AssignCommand(GetEnteringObject(), ApplyEffectToObject(DURATION_TYPE_INSTANT, eCold, GetEnteringObject()));
								 }
							 else if(Random(3) == 2)
								 {DelayCommand(6.0, SendMessageToPC(GetEnteringObject(), "You are hung up on a stalagtite, seeing red flashes before your fading vision before you can tear yourself free."));
								  AssignCommand(GetEnteringObject(), ApplyEffectToObject(DURATION_TYPE_INSTANT, eDrown, GetEnteringObject()));
								 }
							}
						 else 
							 {DelayCommand(6.0, SendMessageToPC(GetEnteringObject(), "You manage to avoid all hazards."));
							 }
					}
					
				else if(GetTag(OBJECT_SELF)=="dr_swimdown_trg_central")
					{SendMessageToPC(GetEnteringObject(), "It is certain death to leap into the water seething around exposed rocks. Wait until the waters are higher.");}
				}
			
		
		 
		
	else if(nLevel >= 10)
		{if(GetIsSkillSuccessful(GetEnteringObject(), SKILL_SWIM, 15, TRUE) == TRUE)
			{SendMessageToPC(GetEnteringObject(), "The deep, rippling water allows you to swim over the jagged rocks and ruins safely.");
			 if(GetDistanceBetween(oSuccess, OBJECT_SELF) > 5.0)
			 	{AssignCommand(GetEnteringObject(), ActionJumpToLocation(GetLocation(oSuccess)));
				}
			  else
			  	{AssignCommand(GetEnteringObject(), ActionJumpToLocation(GetLocation(oWaterFloorWP)));
				}
			}
		 else
		 	{SendMessageToPC(GetEnteringObject(), "Although the water is deep, the currents are still tiring.");
			 AssignCommand(GetEnteringObject(), ActionJumpToLocation(GetLocation(oSuccess)));
			 int nRandom = Random(3);
			 if(nRandom == 0)
					{SendMessageToPC(GetEnteringObject(), "Razor sharp rocks slice your skin.");
					AssignCommand(GetEnteringObject(), ApplyEffectToObject(DURATION_TYPE_INSTANT, eBatter, GetEnteringObject()));
					}
			  else if(nRandom == 1)
					{SendMessageToPC(GetEnteringObject(), "The bone-numbing cold takes its toll.");
					AssignCommand(GetEnteringObject(), ApplyEffectToObject(DURATION_TYPE_INSTANT, eCold, GetEnteringObject()));
					}
			  else if(nRandom == 2)
					{SendMessageToPC(GetEnteringObject(), "You choke on a mouthful of brackish water, asphyxiating.");
					AssignCommand(GetEnteringObject(), ApplyEffectToObject(DURATION_TYPE_INSTANT, eDrown, GetEnteringObject()));
					}
			}
				
		}
	
	else if(GetTag(OBJECT_SELF)=="dr_swimdown_trg_central")
		{SendMessageToPC(GetEnteringObject(), "It is certain death to leap into the water seething around exposed rocks. You won't even be able to get in until the waters are higher.");
		}
	else 
		{SendMessageToPC(GetEnteringObject(), "You may yet be /ripped/ from your perch, but choosing to leap into the water seething around exposed rocks is likely to end in your death. Wait until the waters still.");
		 ExitWater(OBJECT_SELF, GetEnteringObject());
				 
		}
	}

if(GetTag(OBJECT_SELF) == "dr_swimsucceeded_trg") 
	{SetLocalInt(GetEnteringObject(), "SwimmingSuccess", 1);
	 SetLocalInt(GetEnteringObject(), "SwimmingSucceeded", 1);
	 }
 
if((GetTag(OBJECT_SELF) == "slv_deandragon_e_water_3") && (GetLocalInt(OBJECT_SELF, "Triggered") != 1))
	{
	SetLocalInt(GetEnteringObject(), "WaterRep", 1);
	object oMyWaterWeird = GetNearestObjectByTag("003_slv_dq_w_creature", GetEnteringObject(),1);
	DelayCommand(5.0, AssignCommand(oMyWaterWeird, ActionSpeakString("*Pours off a rock and into the water with a splash, and vanishes beneath the surface.*", TALKVOLUME_TALK)));
	DelayCommand(6.0, ExecuteScript("slv_static_voice_cr_pc", GetEnteringObject()));
	
	SetLocalInt(OBJECT_SELF, "Triggered", 1);
	DelayCommand(43200.0, SetLocalInt(OBJECT_SELF, "Triggered", 0));
	object oVein1 = GetObjectByTag("elemental_watergem_vein_1");
	object oVein2 = GetObjectByTag("elemental_watergem_vein_2");
	object oVein3 = GetObjectByTag("elemental_watergem_vein_3");
	object oVein4 = GetObjectByTag("elemental_watergem_vein_4");
	object oVein5 = GetObjectByTag("elemental_watergem_vein_5");
	if(Random(2)==1)
		{CreateItemOnObject("abr_it_gem_007", oVein1, Random(3));
		}
	if(Random(2)==1)
		{CreateItemOnObject("abr_it_gem_030", oVein2, Random(3));
		}
	if(Random(2)==1)
		{CreateItemOnObject("abr_it_gem_083", oVein3, Random(3));
		}
	if(Random(2)==1)
		{CreateItemOnObject("003_it_harvest_moss_blue", oVein4, Random(3));
		}
	if(Random(2)==1)
		{CreateItemOnObject("003_it_harvest_moss_blue", oVein5, Random(3));
		}
	if(Random(5)==1)
		{CreateItemOnObject("abr_it_gem_038", oVein1, 1);
		}
	if(Random(5)==1)
		{CreateItemOnObject("abr_it_gem_038", oVein2, 1);
		}
	if(Random(5)==1)
		{CreateItemOnObject("abr_it_gem_038", oVein3, 1);
		}
	if(Random(5)==1)
		{CreateItemOnObject("abr_it_gem_038", oVein4, 1);
		}
	if(Random(5)==1)
		{CreateItemOnObject("abr_it_gem_038", oVein5, 1);
		}
	}
}