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
#include "acr_hazards_i"




void main()
{
    ACR_TriggerOnEnter();

    // Custom code goes here.
	
//deandragon quests

//deanddragon_b 
 if(GetTag(OBJECT_SELF) == "fey_chocolate_activate") 
 	{
	 if(((ACR_RetrieveQuestState("slv_deandragon_b", GetEnteringObject()) >= 5)&& (ACR_RetrieveQuestState("slv_deandragon_b", GetEnteringObject()) <= 6)) || ((ACR_RetrieveQuestState("slv_deansphinx_b", GetEnteringObject()) >= 1)&& (ACR_RetrieveQuestState("slv_deansphinx_b", GetEnteringObject()) <= 6)))
	 	{object oMyTree = GetLocalObject(OBJECT_SELF, "oMyTree");
		 if(oMyTree == OBJECT_INVALID)
		 	{oMyTree = GetObjectByTag("fey_chocolate_tree");
			 SetLocalObject(OBJECT_SELF, "oMyTree", oMyTree);
			} 
		 object oWP = GetLocalObject(OBJECT_SELF, "oWP");
		 if(oWP == OBJECT_INVALID)
			{oWP = GetNearestObjectByTag("ACR_SPAWN_WP", OBJECT_SELF);
			 SetLocalObject(OBJECT_SELF, "oWP", oWP);
			}
		object oFlute = GetLocalObject(OBJECT_SELF, "flute");
		if(oFlute == OBJECT_INVALID)
			{oFlute = GetObjectByTag("fey_dance_flute");
			 SetLocalObject(OBJECT_SELF, "flute", oFlute);
			 }
		if(GetLocalInt(OBJECT_SELF, "Spawned") == 0)
			{SetUseableFlag(oMyTree, TRUE);
		     SoundObjectPlay(oFlute);
			 SendMessageToPC(GetEnteringObject(), "A faint musical piping blows on the breeze. The urge to dance is almost irresistable.");
			 if(ACR_RetrieveQuestState("slv_deandragon_b", GetEnteringObject()) == 5)
			 	{ACR_AddPersistentJournalQuestEntry("slv_deandragon_b", 6, GetEnteringObject(), FALSE, FALSE, FALSE, FALSE);}
			 if((ACR_RetrieveQuestState("slv_deansphinx_b", GetEnteringObject()) >= 1) && (ACR_RetrieveQuestState("slv_deansphinx_b", GetEnteringObject()) <= 7))
			 	{CreateItemOnObject("slv_deansphinx_b_essence", oMyTree, 3);
				 CreateItemOnObject("slv_dq_bowl_create_food", oMyTree, 3);
				 SendMessageToPC(GetEnteringObject(), "A leathery pod lies across the roots of the tree, as if just harvested. Beneath it, something silver gleams.");
	 	 		}
			 ACR_SpawnGroup("fey_quest", oWP);
			 ACR_ForceSpawn(oWP);
			 SetLocalInt(OBJECT_SELF, "Spawned", 1);
			 DelayCommand(600.0, SetLocalInt(OBJECT_SELF, "Spawned", 0));
			 DelayCommand(3.0, AssignCommand(GetNearestObjectByTag("003_slv_dq_b_creature", oWP, 0), ActionRandomWalk()));
			 DelayCommand(4.0, AssignCommand(GetNearestObjectByTag("003_slv_dq_b_creature", oWP, 1), ActionRandomWalk()));
			 DelayCommand(5.0, AssignCommand(GetNearestObjectByTag("003_slv_dq_b_creature", oWP, 2), ActionRandomWalk()));
			 DelayCommand(3.0, AssignCommand(GetNearestObjectByTag("003_cr_fy_jermlaine_quest", oWP, 0), ActionRandomWalk()));
			 DelayCommand(4.0, AssignCommand(GetNearestObjectByTag("003_cr_fy_jermlaine_quest", oWP, 1), ActionRandomWalk()));
			 DelayCommand(5.0, AssignCommand(GetNearestObjectByTag("003_cr_fy_jermlaine_quest", oWP, 2), ActionRandomWalk()));
			 }
		}
	}	



//deanddragon_e_air & deansphinx_e_air && deansphinx a
if((GetTag(OBJECT_SELF) == "slv_deandragon_e_ice_activate") && (ACR_RetrieveQuestState("slv_deandragon_e_air", GetEnteringObject()) == 2) || (ACR_RetrieveQuestState("slv_deansphinx_e_air", GetEnteringObject()) == 2) || (ACR_RetrieveQuestState("slv_deansphinx_a", GetEnteringObject()) == 6 ))
 	{object oMyIce = GetLocalObject(OBJECT_SELF, "oMyIce");
	 if(oMyIce == OBJECT_INVALID)
	 	{oMyIce = GetObjectByTag("slv_deandragon_e_ice");
		 SetLocalObject(OBJECT_SELF, "oMyIce", oMyIce);
		} 
	 SetUseableFlag(oMyIce, TRUE);
	 if(ACR_RetrieveQuestState("slv_deansphinx_e_air", GetEnteringObject()) == 2)
	 	{CreateItemOnObject("slv_deansphinx_a_essence", oMyIce, 1);
		 CreateItemOnObject("slv_deansphinx_a_essence", oMyIce, 1);
		 CreateItemOnObject("slv_deansphinx_a_essence", oMyIce, 1);
		}
	
	object oMyArrowhawk1 = GetNearestObjectByTag("003_slv_dq_a_creature", GetEnteringObject(),1);
	object oMyArrowhawk2 = GetNearestObjectByTag("003_slv_dq_a_creature", GetEnteringObject(),2);
	object oMyArrowhawk3 = GetNearestObjectByTag("003_slv_dq_a_creature", GetEnteringObject(),3);
	object oMyArrowhawk4 = GetNearestObjectByTag("003_slv_dq_a_creature", GetEnteringObject(),4);
	AssignCommand(oMyArrowhawk1, ActionSpeakString("*Chirps in agitation", TALKVOLUME_TALK));
	DelayCommand(IntToFloat(Random(10)), AssignCommand(oMyArrowhawk1, ActionSpeakString("*Swoops overhead, with a keening shriek.*", TALKVOLUME_TALK))); 
	DelayCommand(IntToFloat(Random(10)+10), AssignCommand(oMyArrowhawk2, ActionSpeakString("*Swoops overhead, dive bombing anybody in reach.*", TALKVOLUME_TALK))); 
	}
		 
	 	 
/*if((GetTag(OBJECT_SELF) == "slv_deandragon_e_listener") && (GetTag(GetEnteringObject()) != "003_cr_slv_deanvoice_phoenix"))
	  {object oMyWP = GetLocalObject(OBJECT_SELF, "oMyWP");
	   if(oMyWP == OBJECT_INVALID)
		 	{oMyWP = GetWaypointByTag("slv_el_air_wp4");
			 SetLocalObject(OBJECT_SELF, "oMyWP", oMyWP);
			}
	   object oMyListener = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_deanvoice_phoenix", GetLocation(oMyWP));
	   SetLocalObject(GetEnteringObject(), "oMyListener", oMyListener);
	   SetLocalObject(oMyListener, "oStudent", GetEnteringObject());
	   object oStudent = GetLocalObject(oMyListener, "oStudent");
	   SendMessageToPC(oStudent, "oStudent local object");
	   SendMessageToPC(oStudent, "oMyListener = " + GetTag(oMyListener));
	   object oGoTo2 = GetLocalObject(OBJECT_SELF, "oGoTo2");
	   if(oGoTo2 == OBJECT_INVALID)
			 {oGoTo2 = GetWaypointByTag("slv_el_air_wp2");
			  SetLocalObject(OBJECT_SELF, "oGoTo2", oGoTo2);
			 }
	   object oGoTo3 = GetLocalObject(OBJECT_SELF, "oGoTo3");
	   if(oGoTo3 == OBJECT_INVALID)
			 {oGoTo3 = GetWaypointByTag("slv_el_air_wp3");
			  SetLocalObject(OBJECT_SELF, "oGoTo3", oGoTo3);
			 }
	   object oGoTo4 = GetLocalObject(OBJECT_SELF, "oGoTo4");
	   if(oGoTo4 == OBJECT_INVALID)
			 {oGoTo4 = GetWaypointByTag("slv_el_air_wp4");
			  SetLocalObject(OBJECT_SELF, "oGoTo4", oGoTo4);
			 }
	   location lGoTo2 = GetLocation(oGoTo2);
	   location lGoTo3 = GetLocation(oGoTo3);
	   location lGoTo4 = GetLocation(oGoTo4);
	   if(GetLocalInt(oStudent, "ColdRep") != 0)
			{SetLocalInt(oStudent, "ColdRep", 1);
			 DelayCommand(30.0, SendMessageToPC(oStudent, "The wrenching sense of teleportation is followed almost immediately by the reorientation of arrival. But something is wrong. You are falling. You are falling UP. By the time you recognize that your arrival had been in mid-air over a frozen landscape, you are already a significant distance higher...and it is bitterly cold."));
			 DelayCommand(35.0, AssignCommand(oStudent, ActionJumpToLocation(lGoTo2)));
			 DelayCommand(45.5, SendMessageToPC(oStudent, "You continue to fall upward helplessly, clearly in the grip of some arcane trap. It feels as if gravity has reversed!"));
			 DelayCommand(50.0, AssignCommand(oStudent, ActionJumpToLocation(lGoTo3)));
			 DelayCommand(60.5, SendMessageToPC(oStudent, "You continue to fall upward helplessly, away from the snow and ice that glitter as if strewn with diamonds."));
			 DelayCommand(65.0, AssignCommand(oStudent, ActionJumpToLocation(lGoTo4)));
			 DelayCommand(70.5, SendMessageToPC(oStudent, "You stop suddenly, as if you had hit an incorporeal barrier. Oscillating gently, you hang suspended 1000 meters in the air! You can only hope that gravity doesn't right itself, because a fall back DOWN from this height would maim or kill you before the cold has a chance to."));
			 DelayCommand(75.0, ExecuteScript("slv_static_voice_cr_pc", oStudent));
			}
	   }
	*/

	 if((GetTag(OBJECT_SELF) == "slv_deandragon_e_flightend") && (GetIsPC(GetEnteringObject())))
 	 	{object oCollWP = GetLocalObject(OBJECT_SELF, "oCollWP");
		 if(oCollWP == OBJECT_INVALID)
		    {oCollWP = GetWaypointByTag("slv_deandragon_e_air_collboxWP");
			 SetLocalObject(OBJECT_SELF, "oCollWP", oCollWP);
			 }
		 object oMyCollisionBox = GetLocalObject(oCollWP, "oMyCollisionBox");
		 if(oMyCollisionBox == OBJECT_INVALID)
			  {oMyCollisionBox = GetObjectByTag("slv_deandragon_e_air_collbox");
			   SetLocalObject(oCollWP, "oMyCollisionBox", oMyCollisionBox);
			   if(oMyCollisionBox == OBJECT_INVALID)
				  {oMyCollisionBox = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_deandragon_e_air_collbox", GetLocation(oCollWP));
				   SetLocalObject(oCollWP, "oMyCollisionBox", oMyCollisionBox);
				  }
			  }
		}	 
	 
//deanddragon_e_fire
if((GetTag(OBJECT_SELF) == "deandragon_firetrap_activate") && (GetIsPC(GetEnteringObject())) && (ACR_RetrieveQuestState("slv_deansphinx_e_fire", GetEnteringObject()) >=1))
 	{object oMyTrap = GetLocalObject(OBJECT_SELF, "oMyTrap");
	 if(oMyTrap == OBJECT_INVALID)
	 	{oMyTrap = GetObjectByTag("slv_deandragon_e_firetrap");
		 SetLocalObject(OBJECT_SELF, "oMyTrap", oMyTrap);
		} 
	 SetUseableFlag(oMyTrap, TRUE);
	 if(GetLocalInt(OBJECT_SELF, "MephitMsg") !=1)
	 	{SendMessageToPC(GetEnteringObject(), "The mephits dive into the mouth of the trap, vanishing from sight except for a glow between the teeth of the dragon-shaped fire trap!");
	 	 SetLocalInt(OBJECT_SELF, "MephitMsg", 1);
		 object oMephit1 = GetNearestObjectByTag("003_slv_dq_f_creature", OBJECT_SELF, 1);
		 object oMephit2 = GetNearestObjectByTag("003_slv_dq_f_creature", OBJECT_SELF, 2);
		 DestroyObject(oMephit1);
		 DestroyObject(oMephit2);	 
		}
	 }
	
	if((GetTag(OBJECT_SELF) == "deandragon_heatloop") && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject())))) 
	 	{if(GetLocalInt(GetEnteringObject(), "HeatRep") == 0)
				{SetLocalInt(GetEnteringObject(), "HeatRep", 1);
				 DelayCommand(1.0, ExecuteScript("slv_static_voice_cr_pc", GetEnteringObject()));
				}
		}
		
	if((GetTag(OBJECT_SELF) == "deandragon_coldloop") && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject()))))
	 	{if(GetLocalInt(GetEnteringObject(), "ColdRep") == 0)
				{SetLocalInt(GetEnteringObject(), "ColdRep", 1);
				 DelayCommand(1.0, ExecuteScript("slv_static_voice_cr_pc", GetEnteringObject()));
				}
		}

//deandragon_j

if((GetTag(OBJECT_SELF) == "003_cr_slv_deandragon_j_3") && (GetIsPC(GetEnteringObject())) && (ACR_RetrieveQuestState("slv_deandragon_j", GetEnteringObject()) >=3))
 	{ACR_AddPersistentJournalQuestEntry("slv_deandragon_j", 4, GetEnteringObject(), FALSE, FALSE, FALSE, FALSE);
	 }


// Deandragon_K toggle on archway with inscription
	if((GetTag(OBJECT_SELF) == "deandragon_k_inscription") && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject()))))
 	 {object oMyGateway = GetLocalObject(OBJECT_SELF, "oMyGateway");
	  if(oMyGateway == OBJECT_INVALID)
			 	{oMyGateway = GetObjectByTag(GetTag(OBJECT_SELF) + "_plc");
				 SetLocalObject(OBJECT_SELF, "oMyGateway", oMyGateway);
				 }
		  
	   if(GetLocalInt(OBJECT_SELF, "Useable") != 1)
		 	 {SetLocalInt(OBJECT_SELF, "Useable", 1);
			  SetUseableFlag(oMyGateway, TRUE);
		      DelayCommand(600.0, SetUseableFlag(oMyGateway, FALSE));
		   	  DelayCommand(601.0, SetLocalInt(OBJECT_SELF, "Useable", 0));
		   	 }
		
	   string sLang = GetLocalString(oMyGateway, "SJC_PLC_LANG");
       if(ACR_RetrieveQuestState("slv_deandragon_k", GetEnteringObject()) == 2)
		   	{if(DMFI_IsLanguageKnown(GetEnteringObject(), sLang) == TRUE)
				{ACR_AddPersistentJournalQuestEntry("slv_deandragon_k", 4, GetEnteringObject(), FALSE, FALSE, FALSE, 0);
				}
			 else if(DMFI_IsLanguageKnown(GetEnteringObject(), sLang) == FALSE)
				{ACR_AddPersistentJournalQuestEntry("slv_deandragon_k", 3, GetEnteringObject(), FALSE, FALSE, FALSE, 0);
				}
			}
	   SendMessageToPC(GetEnteringObject(), "Fresh scratchings through the moss of a nearby stalagtite arch catch your eye.");
	   }
	 
	 // Deandragon_K toggle silence
	if((GetTag(OBJECT_SELF) == "deandragon_k_silence") && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject()))))
	 	{if((ACR_RetrieveQuestState("slv_deandragon_k", GetEnteringObject()) == 3) || (ACR_RetrieveQuestState("slv_deandragon_k", GetEnteringObject()) == 4) ||(ACR_RetrieveQuestState("slv_deandragon_k", GetEnteringObject()) == 5))
			 {SetLocalInt(OBJECT_SELF, "Toggle", 1);}
		 if(GetLocalInt(OBJECT_SELF, "Toggle") == 1)	 
			  {effect eSilence = EffectSilence();
			   if(!WillSave(GetEnteringObject(), 15, SAVING_THROW_TYPE_MIND_SPELLS, OBJECT_SELF))
			 	{ApplyEffectToObject(DURATION_TYPE_PERMANENT, eSilence, GetEnteringObject());}
			  }
		}
	 
	 	// Deandragon_K create huts
	if((GetTag(OBJECT_SELF) == "deandragon_k_huts")  && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject()))))
 	 {if((ACR_RetrieveQuestState("slv_deandragon_k", GetEnteringObject()) == 3) || (ACR_RetrieveQuestState("slv_deandragon_k", GetEnteringObject()) == 4) ||(ACR_RetrieveQuestState("slv_deandragon_k", GetEnteringObject()) == 5))
		  {if(GetLocalInt(OBJECT_SELF, "Spawned") != 1)
		  {SetLocalInt(OBJECT_SELF, "Spawned", 1);
		   object oMyWaypoint1 = GetLocalObject(OBJECT_SELF, "oMyWaypoint1");
		  if(oMyWaypoint1 == OBJECT_INVALID)
				 	{oMyWaypoint1 = GetWaypointByTag("deandragon_k_leomund_1_WP");
					 SetLocalObject(OBJECT_SELF, "oMyWaypoint1", oMyWaypoint1);
					 }
		   object oHut1 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_leomund_sshelter", GetLocation(oMyWaypoint1));	  
		   object oMyWaypoint2 = GetLocalObject(OBJECT_SELF, "oMyWaypoint2");
		   if(oMyWaypoint2 == OBJECT_INVALID)
				 	{oMyWaypoint2 = GetWaypointByTag("deandragon_k_leomund_2_WP");
					 SetLocalObject(OBJECT_SELF, "oMyWaypoint2", oMyWaypoint2);
					 }
			  
		   object oHut2 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_leomund_sshelter", GetLocation(oMyWaypoint2));	  
		   object oMyWaypoint3 = GetLocalObject(OBJECT_SELF, "oMyWaypoint3");
		   if(oMyWaypoint3 == OBJECT_INVALID)
				 	{oMyWaypoint3 = GetWaypointByTag("deandragon_k_leomund_3_WP");
					 SetLocalObject(OBJECT_SELF, "oMyWaypoint3", oMyWaypoint3);
					 }
			  
		   object oHut3 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_leomund_sshelter", GetLocation(oMyWaypoint3));	  
		   object oMyWaypoint4 = GetLocalObject(OBJECT_SELF, "oMyWaypoint4");
		   if(oMyWaypoint4 == OBJECT_INVALID)
				 	{oMyWaypoint4 = GetWaypointByTag("deandragon_k_leomund_4_WP");
					 SetLocalObject(OBJECT_SELF, "oMyWaypoint4", oMyWaypoint4);
					 }
			  
		   object oHut4 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_leomund_sshelter", GetLocation(oMyWaypoint4));	  
		   object oMyWaypoint5 = GetLocalObject(OBJECT_SELF, "oMyWaypoint5");
		   if(oMyWaypoint5 == OBJECT_INVALID)
				 	{oMyWaypoint5 = GetWaypointByTag("deandragon_k_leomund_5_WP");
					 SetLocalObject(OBJECT_SELF, "oMyWaypoint5", oMyWaypoint5);
					 }
			  
		   	object oHut5 = CreateObject(OBJECT_TYPE_PLACEABLE, "003_plc_leomund_sshelter", GetLocation(oMyWaypoint5));	  
		    
			
			object oDoor1 = CreateObject(OBJECT_TYPE_PLACEABLE, "leomund_shelter_door", GetLocation(GetWaypointByTag("deandragon_k_leomund_door1_WP")));
			object oDoor2 = CreateObject(OBJECT_TYPE_PLACEABLE, "leomund_shelter_door", GetLocation(GetWaypointByTag("deandragon_k_leomund_door2_WP")));
			object oDoor3 = CreateObject(OBJECT_TYPE_PLACEABLE, "leomund_shelter_door", GetLocation(GetWaypointByTag("deandragon_k_leomund_door3_WP")));
			object oDoor4 = CreateObject(OBJECT_TYPE_PLACEABLE, "leomund_shelter_door", GetLocation(GetWaypointByTag("deandragon_k_leomund_door4_WP")));
			object oDoor5 = CreateObject(OBJECT_TYPE_PLACEABLE, "leomund_shelter_door", GetLocation(GetWaypointByTag("deandragon_k_leomund_door5_WP")));
			
			/*object oCollBox1 = CreateObject(OBJECT_TYPE_PLACEABLE, "leomund_shelter_door_collbox", GetLocation(GetWaypointByTag("deandragon_k_leomund_collbox1_WP")));
			object oCollBox2 = CreateObject(OBJECT_TYPE_PLACEABLE, "leomund_shelter_door_collbox", GetLocation(GetWaypointByTag("deandragon_k_leomund_collbox2_WP")));
			object oCollBox3 = CreateObject(OBJECT_TYPE_PLACEABLE, "leomund_shelter_door_collbox", GetLocation(GetWaypointByTag("deandragon_k_leomund_collbox3_WP")));
			object oCollBox4 = CreateObject(OBJECT_TYPE_PLACEABLE, "leomund_shelter_door_collbox", GetLocation(GetWaypointByTag("deandragon_k_leomund_collbox4_WP")));
			object oCollBox5 = CreateObject(OBJECT_TYPE_PLACEABLE, "leomund_shelter_door_collbox", GetLocation(GetWaypointByTag("deandragon_k_leomund_collbox5_WP")));
			
			SetLocalObject(oDoor1, "MyCollBox", oCollBox1);
			SetLocalObject(oDoor2, "MyCollBox", oCollBox2);
			SetLocalObject(oDoor3, "MyCollBox", oCollBox3);
			SetLocalObject(oDoor4, "MyCollBox", oCollBox4);
			SetLocalObject(oDoor5, "MyCollBox", oCollBox5);
			*/
			
			SetLockLockable(oDoor1, TRUE);
			SetLockLockable(oDoor2, TRUE);
			SetLockLockable(oDoor3, TRUE);
			SetLockLockable(oDoor4, TRUE);
			SetLockLockable(oDoor5, TRUE);
			
			SetLocked(oDoor1, TRUE);
			SetLocked(oDoor2, TRUE);
			SetLocked(oDoor3, TRUE);
			SetLocked(oDoor4, TRUE);
			SetLocked(oDoor5, TRUE);
			
			SetLockUnlockDC(oDoor1, Random(10) + 20);  
			SetLockUnlockDC(oDoor2, Random(10) + 20);  
			SetLockUnlockDC(oDoor3, Random(10) + 20);  
			SetLockUnlockDC(oDoor4, Random(10) + 20);  
			SetLockUnlockDC(oDoor5, Random(10) + 20);  
			
			int nTrapRandom1=Random(11);
			int nTrapRandom2=Random(11);
			int nTrapRandom3=Random(11);
			int nTrapRandom4=Random(11);
			int nTrapRandom5=Random(11);
			int nTrapType1=nTrapRandom1 * 4;
			int nTrapType2=nTrapRandom2 * 4;
			int nTrapType3=nTrapRandom3 * 4;
			int nTrapType4=nTrapRandom4 * 4;
			int nTrapType5=nTrapRandom5 * 4;
			
			CreateTrapOnObject(nTrapType1, oDoor1, STANDARD_FACTION_HOSTILE, "", "");
			CreateTrapOnObject(nTrapType2, oDoor2, STANDARD_FACTION_HOSTILE, "", "");
			CreateTrapOnObject(nTrapType3, oDoor3, STANDARD_FACTION_HOSTILE, "", "");
			CreateTrapOnObject(nTrapType4, oDoor4, STANDARD_FACTION_HOSTILE, "", "");
			CreateTrapOnObject(nTrapType5, oDoor5, STANDARD_FACTION_HOSTILE, "", "");
			
			int nRandomLockbox=Random(5) +1;
			if(nRandomLockbox==1)
				{SetLocalInt(oDoor1, "Deandragon_k_spawn", 1);}
			else if(nRandomLockbox==2)
				{SetLocalInt(oDoor2, "Deandragon_k_spawn", 1);}
			else if(nRandomLockbox==3)
				{SetLocalInt(oDoor3, "Deandragon_k_spawn", 1);}
			else if(nRandomLockbox==4)
				{SetLocalInt(oDoor4, "Deandragon_k_spawn", 1);}
			else {SetLocalInt(oDoor5, "Deandragon_k_spawn", 1);}
			
			SendMessageToPC(GetEnteringObject(), "nRandomLockbox=" + IntToString(nRandomLockbox));
			}
		    ACR_AddPersistentJournalQuestEntry("slv_deandragon_k", 5, GetEnteringObject());
			SendMessageToPC(GetEnteringObject(), "A bizarre sight greets you. Inside the large cavern chamber, huts seem to have sprouted out of the walls and floor, huts complete with locked doors and shuttered windows.");
	       }
		 DelayCommand(7.0, SendMessageToPC(GetEnteringObject(), "The silence is so thick it seems like another roof and set of walls around you."));
	       	
	 }
	 // Listening Triggers for Deandragon_k
	 if((FindSubString(GetTag(OBJECT_SELF), "deandragon_k_leomund") != -1)  && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject()))))
 	 {      object oDoor = GetNearestObjectByTag("leomund_shelter_door", OBJECT_SELF, 1);
			if(GetLocalInt(oDoor, "Deandragon_k_spawn") == 0)
				{string sName = GetName(GetEnteringObject());
				 if(GetLocalObject(OBJECT_SELF, sName) != GetEnteringObject())
				 	 {SetLocalObject(OBJECT_SELF, sName, GetEnteringObject());
					 if(GetIsSkillSuccessful(GetEnteringObject(), SKILL_LISTEN, Random(10) + 20, TRUE)) 
					   	{DelayCommand(1.0, SendMessageToPC(GetEnteringObject(), "You hear furtive movement from within this hut."));
						 }
				     else 
				   		{DelayCommand(1.0, SendMessageToPC(GetEnteringObject(), "You hear only silence from within this hut."));
						}
					 }			   
		   		 
				}
			else if(GetLocalInt(oDoor, "Deandragon_k_spawn") ==1 )
				{object oBox = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_deandragon_lockbox_plc", GetLocation(GetWaypointByTag(GetTag(OBJECT_SELF) + "_WP")));
				 object oRock = CreateItemOnObject("slv_deandragon_k_keepsake", oBox, 1);
				 if(GetIsSkillSuccessful(GetEnteringObject(), SKILL_LISTEN, 25, TRUE))
				   	{DelayCommand(1.0, SendMessageToPC(GetEnteringObject(), "You hear only silence from within this hut."));
					}
			    else 
			   		{DelayCommand(1.0, SendMessageToPC(GetEnteringObject(), "You hear only silence from within this hut."));
					}			   
		   		}
	 }
	 
//deanphoenix_l
if((GetTag(OBJECT_SELF)== "deandragon_l_mapnote") && (ACR_RetrieveQuestState("slv_deansphinx_l", GetEnteringObject()) == 4) && (GetLocalInt(OBJECT_SELF, "Cave_Mapped") != 1) && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject()))))
 	 {
	int nEnabled = TRUE;
	string sMapPinTag = GetLocalString(OBJECT_SELF, "MAP_NOTE_TAG");
	SetLocalInt(OBJECT_SELF, "Cave_Mapped", 1);
	DelayCommand(3600.0, SetLocalInt(OBJECT_SELF, "Cave_Mapped", 0));
	object oMapPin = GetNearestObjectByTag(sMapPinTag);
	DelayCommand(8.0, SendMessageToPC(GetEnteringObject(), "You orient the map Falloon gave you, and know just where the cave will be."));
	object oSpider = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_vm_spider_large", GetLocation(oMapPin));
	SetMapPinEnabled (oMapPin, nEnabled);
	}
	
if((GetTag(OBJECT_SELF)== "deandragon_l_ghost") && (ACR_RetrieveQuestState("slv_deansphinx_l", GetEnteringObject()) >= 3) && (ACR_RetrieveQuestState("slv_deandragon_l", GetEnteringObject()) <= 5)&& (GetLocalInt(OBJECT_SELF, "Doomguide_Ghost") != 1) && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject()))))
 	 {
	object oGhostOld = GetObjectByTag("003_cr_un_doomguide",0);
	DestroyObject(oGhostOld);
	object oGhost = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_un_doomguide", GetLocation(GetEnteringObject()), TRUE, "");
	if(ACR_RetrieveQuestState("slv_deansphinx_l", GetEnteringObject()) == 4)
		{DelayCommand(2.0, AssignCommand(oGhost, ActionSpeakString("*A breeze steals across your skin. The air glimmers, and an ethereal figure appears.")));
		 DelayCommand(3.0, AssignCommand(oGhost, ActionStartConversation(GetEnteringObject(), "", FALSE, FALSE, FALSE, FALSE)));
		}
	else
		{DelayCommand(2.0, AssignCommand(oGhost, ActionSpeakString("*A breeze steals across your skin.")));}
	SetLocalInt(OBJECT_SELF, "Doomguide_Ghost", 1);
	DelayCommand(3600.0, SetLocalInt(OBJECT_SELF, "Doomguide_Ghost", 0));
	object oGhostEnd = GetWaypointByTag("slv_deandragon_l_ghost_end");
	DelayCommand(5.0, AssignCommand(oGhost, ActionMoveToLocation(GetLocation(oGhostEnd))));
	}

if((GetTag(OBJECT_SELF)== "deandragon_l_ghost_end") && (ACR_RetrieveQuestState("slv_deandragon_l", GetEnteringObject()) == 5) && (GetLocalInt(OBJECT_SELF, "Doomguide_Ghost") != 1) && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject()))))
 	 {
	object oGhostOld = GetObjectByTag("003_cr_un_doomguide",0);
	DestroyObject(oGhostOld);
	object oGhostEnd = GetWaypointByTag("slv_deandragon_l_ghost_end");
	object oGhost = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_un_doomguide", GetLocation(GetEnteringObject()));
	object oBody = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_plc_skel_deandragon_l", GetLocation(oGhostEnd));
	SetLocalInt(OBJECT_SELF, "Doomguide_Ghost", 1);
	DelayCommand(3600.0, SetLocalInt(OBJECT_SELF, "Doomguide_Ghost", 0));
	DelayCommand(2.9, AssignCommand(oGhost, ClearAllActions(TRUE)));
	DelayCommand(3.0, AssignCommand(oGhost, ActionForceMoveToLocation(GetLocation(oGhostEnd))));
	DelayCommand(4.9, AssignCommand(oGhost, ClearAllActions(TRUE)));
	DelayCommand(5.0, AssignCommand(oGhost, ActionSpeakString("*Floats over to webs, where a drained husk that might have been a human once is rolled up in threads. Floats around and around body, holding his own throat as if to strangle himself and kicking ineffectively at the webbed closed hand of the corpse.", TALKVOLUME_TALK)));
	}
	
	
if((GetTag(OBJECT_SELF)== "deandragon_l_ghost_end") && (ACR_RetrieveQuestState("slv_deandragon_l", GetEnteringObject()) == 6) && (GetLocalInt(OBJECT_SELF, "Doomguide_Ghost") != 1) && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject()))))
 	 {
	object oGhostOld = GetObjectByTag("003_cr_un_doomguide",0);
	DestroyObject(oGhostOld);
	object oGhostEnd = GetWaypointByTag("slv_deandragon_l_ghost_end");
	object oGhost = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_un_doomguide", GetLocation(oGhostEnd));
	}
//deanddragon_q 			
if((GetTag(OBJECT_SELF) == "slv_deandragon_q_3") && (ACR_RetrieveQuestState("slv_deandragon_q", GetEnteringObject()) == 3))
 	{object oBeetleWP = GetWaypointByTag("deandragon_q_beetle");
	 object oBeetle = CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_vm_beetle_fire", GetLocation(oBeetleWP));
	 object oGland = CreateItemOnObject("003_it_harvest_btl_fgland", oBeetle, 1);
	 SetPlotFlag(oGland, TRUE);
	}
	
	
 //deanddragon_u 			
if((GetTag(OBJECT_SELF) == "slv_deandragon_u") && (ACR_RetrieveQuestState("slv_deandragon_u", GetEnteringObject()) == 1))
 	{object oFlitWP = GetWaypointByTag("slv_deandragon_u_flit_WP");
	 object oFlit = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_flit", GetLocation(oFlitWP));
	 }
	
		 //deanddragon_x 			
if((GetTag(OBJECT_SELF) == "slv_deandragon_x") && (ACR_RetrieveQuestState("slv_deandragon_x", GetEnteringObject()) > 0)&& (ACR_RetrieveQuestState("slv_deandragon_x", GetEnteringObject()) < 9))
 	{object oAlastrarraWP = GetLocalObject(OBJECT_SELF, "oAlastrarraWP");
	 if(oAlastrarraWP == OBJECT_INVALID)
	 	{oAlastrarraWP = GetWaypointByTag("slv_deansdragon_x_Alastrarra");
		 SetLocalObject(OBJECT_SELF, "oAlastrarraWP", oAlastrarraWP);
		}
		
	 	 DestroyObject(GetObjectByTag("003_slv_cr_procenc2"));
	 	 object oAlastrarra = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_procenc2", GetLocation(oAlastrarraWP));
		 DestroyObject(oAlastrarra, 1800.0);
	 } 
	

	 
	 // Xan's speech for Deandragon_x
	 if((GetTag(OBJECT_SELF) == "slv_deandragon_x_xan")  && (GetLocalInt(OBJECT_SELF, "Triggered") != 1) && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject()))))
 	 	{if(ACR_RetrieveQuestState("slv_deandragon_x", GetEnteringObject()) == 3)
			{ACR_AddPersistentJournalQuestEntry("slv_deandragon_x", 4, GetEnteringObject(), FALSE, FALSE, FALSE, FALSE);}
		 SetLocalInt(OBJECT_SELF, "Triggered", 1);
		 DelayCommand(3600.0, SetLocalInt(OBJECT_SELF, "Triggered", 0));
		 object oXanWP = GetWaypointByTag("slv_deandragon_x_dream");
		 object oXan = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_xan", GetLocation(oXanWP));
		 DestroyObject(oXan, 125.0);
		 DelayCommand(12.0, AssignCommand(oXan, ActionSpeakString("So I was right. We were all doomed. Or at least just me. *Muttered to himself*", TALKVOLUME_TALK)));
		 DelayCommand(24.0, AssignCommand(oXan, ActionSpeakString("We could converse on the tragedies of civilizations lost. Now...Occidian is but Evereska, writ in elder runes. Or ruins, as they both are today.", TALKVOLUME_TALK)));
		 DelayCommand(36.0, AssignCommand(oXan, ActionSpeakString("Thank you for activating my kiira. At least somebody wants to dream me alive, to hear something I have to say.  A hollow victory over death. *Glum*  You should all just give up now and save yourselves whatever effort you are involved in.", TALKVOLUME_TALK)));
		 DelayCommand(48.0, AssignCommand(oXan, ActionSpeakString("So, since we dream this cave, I presume you seek information I may have gathered on my trip through here on my way to ignominy, incarceration and ultimately unpleasant decapitation. It's useless, of course, but I will tell what I know.", TALKVOLUME_TALK)));
		 DelayCommand(60.0, AssignCommand(oXan, ActionSpeakString("What can I tell you, though? You already have passed the test of friendly knowledge by selecting the correct dragonkin to enter; you must have earned the Sage's trust..difficult enough with his constant distraction with carving the history and feeding his pet baby giant.", TALKVOLUME_TALK)));
		 DelayCommand(72.0, AssignCommand(oXan, ActionSpeakString("What? Wait? I see it in your own knowledge.... There is no Sage? Not anymore? Not even my kiira anymore? What wizardry is this? What am I? But a reflection? A captured memory? It is worse than even I thought.", TALKVOLUME_TALK)));
		 DelayCommand(84.0, AssignCommand(oXan, ActionSpeakString("Very well, then, since you know absolutely nothing.... *Looks around*  Here was the xorn tunnel, created by the Sage -- the /previous/ Sage -- (You truly are doomed, you know?) to reach the buried knowledge of Occidian. Clever chap. I suppose the xorn aren't behaving very well if he has gone to Labelas' side?", TALKVOLUME_TALK)));
		 DelayCommand(96.0, AssignCommand(oXan, ActionSpeakString("I don't dream any sign of activity here, at least, and though the xorn leave no trace, others would.  *Shakes head sadly.* They do not know enough to honor their predecessor's bargain with the xorn.", TALKVOLUME_TALK)));
		 DelayCommand(108.0, AssignCommand(oXan, ActionSpeakString("Well, that's it, then. All is lost from my lifetime and yours, all buried. Only a xorn can pass through the miles of accreted history -- and by that I mean dirt -- that separate any destination from any embarkation.", TALKVOLUME_TALK)));
		 DelayCommand(120.0, AssignCommand(oXan, ActionSpeakString("There's no sense in trying and you have wasted my entire dream learning that. Goodbye. I will now wake up.", TALKVOLUME_TALK)));
		 object oParty = GetFirstFactionMember(GetEnteringObject(), TRUE);
		 while(oParty != OBJECT_INVALID)
			{DelayCommand(125.0, FadeToBlack(GetEnteringObject(), FADE_SPEED_MEDIUM, 10.0));
			 DelayCommand(135.0, FadeFromBlack(GetEnteringObject(), FADE_SPEED_MEDIUM));
			 oParty = GetNextFactionMember(GetEnteringObject(), TRUE);
			}
		}
	 
	 // Xorn appearance for Deandragon_x
	 if((GetTag(OBJECT_SELF) == "slv_deansphinx_x_elderxorn")  && ((GetIsPC(GetEnteringObject())) || (GetIsDMPossessed(GetEnteringObject()))))
		  	{
			object oJannWP=GetWaypointByTag("slv_deansphinx_j_jann");
			object oJann = CreateObject(OBJECT_TYPE_CREATURE, "003_slv_dq_j_creature", GetLocation(oJannWP));
						 
			object oXornWP=GetWaypointByTag("slv_deandragon_x_xornlava_wp");
			 if(GetLocalInt(GetEnteringObject(), "Xorn_Summoned") == 1)
			 	{SetLocalInt(OBJECT_SELF, "Xorn_Summoned", 1);}
			 
			 if(GetItemPossessedBy(GetEnteringObject(), "slv_deansphinx_x_alloy") != OBJECT_INVALID) 
		 	 	{if(GetLocalInt(OBJECT_SELF, "Xorn_Summoned") == 1)
					{if(GetLocalInt(OBJECT_SELF, "Xorn") != 1)
						{SetLocalInt(OBJECT_SELF, "Xorn", 1);
						 object oXorn = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_deanphoenix_earth", GetLocation(oXornWP));
						 effect eHurt = EffectDamage(20, DAMAGE_TYPE_FIRE, DAMAGE_POWER_NORMAL, TRUE);
		  				 DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHurt, oXorn));
			 			 SendMessageToPC(GetEnteringObject(), "You see something ponderous moving in the darkness further into the lava tube. You have a quick glimpse of a gigantic creature, leaking fluid that might be blood all over its stony skin.");
						 }
					}
			 	}
			 }
		
	//slv_deandragon 'Y' 
	
	if((GetTag(OBJECT_SELF) == "slv_deandragon_y") && (GetLocalInt(OBJECT_SELF, "Spawned" ) != 1))
		{if(ACR_RetrieveQuestState("slv_deandragon_y", GetEnteringObject()) == 1)
			 {SetLocalInt(OBJECT_SELF, "Spawned", 1);
			  effect eParalyze = EffectParalyze();
			  object oPotionWP = GetWaypointByTag("deandragon_y_wp");
			  object oDeanWP = GetWaypointByTag("deandragon_y_dean");
			  object oAbjWP = GetWaypointByTag("deandragon_y_abj");
			  object oConWP = GetWaypointByTag("deandragon_y_con");
			  object oDivWP = GetWaypointByTag("deandragon_y_div");
			  object oEncWP = GetWaypointByTag("deandragon_y_enc");
			  object oEvoWP = GetWaypointByTag("deandragon_y_evo");
			  object oIllWP = GetWaypointByTag("deandragon_y_ill");
			  object oNecWP = GetWaypointByTag("deandragon_y_nec");
			  object oTraWP = GetWaypointByTag("deandragon_y_tra");
			  
			  object oPotion = CreateObject(OBJECT_TYPE_ITEM, "slv_deandragon_y_censor", GetLocation(oPotionWP));
			  object oDean = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_dean", GetLocation(oDeanWP), FALSE, "003_cr_slv_dean_Wand");
			  object oAbj = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_profabj", GetLocation(oAbjWP), FALSE, "003_cr_slv_profabj_Wand");
			  object oCon = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_profcon", GetLocation(oConWP), FALSE, "003_cr_slv_profcon_Wand");
			  object oDiv = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_profdiv", GetLocation(oDivWP), FALSE, "003_cr_slv_profdiv_Wand");
			  object oEnc = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_profenc", GetLocation(oEncWP), FALSE, "003_cr_slv_profenc_Wand");
			  object oIll = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_profill", GetLocation(oIllWP), FALSE, "003_cr_slv_profill_Wand");
			  object oNec = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_profnec", GetLocation(oNecWP), FALSE, "003_cr_slv_profnec_Wand");
			  object oTra = CreateObject(OBJECT_TYPE_CREATURE, "003_cr_slv_proftra", GetLocation(oTraWP), FALSE, "003_cr_slv_proftra_Wand");
			  
			  
			  SetLocalInt(oDean, "Walk_Off", 1);
			  SetLocalInt(oAbj, "Walk_Off", 1);
			  SetLocalInt(oCon, "Walk_Off", 1);
			  SetLocalInt(oDiv, "Walk_Off", 1);
			  SetLocalInt(oEnc, "Walk_Off", 1);
			  //SetLocalInt(oEvo, "Walk_Off", 1);
			  SetLocalInt(oIll, "Walk_Off", 1);
			  SetLocalInt(oNec, "Walk_Off", 1);
			  SetLocalInt(oTra, "Walk_Off", 1);
			  
			  SetPlotFlag(oCon, TRUE);
			  SetPlotFlag(oNec, TRUE);
			  
			  
			  DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oAbj, 600.0));
			  DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oCon, 600.0));
			  DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oDiv, 600.0));
			  DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oEnc, 600.0));
			  //DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oEvo, 600.0));
			  DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oIll, 600.0));
			  DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oNec, 600.0));
			  DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eParalyze, oTra, 600.0));
			  
			  DestroyObject(oPotion, 1800.0);
			  DestroyObject(oDean, 1800.0);
			  DestroyObject(oAbj, 1800.0);
			  DestroyObject(oCon, 1800.0);
			  DestroyObject(oDiv, 1800.0);
			  DestroyObject(oEnc, 1800.0);
			  //DestroyObject(oEvo, 1800.0);
			  DestroyObject(oIll, 1800.0);
			  DestroyObject(oNec, 1800.0);
			  DestroyObject(oTra, 1800.0);
			  
			  ACR_AddPersistentJournalQuestEntry("slv_deandragon_y", 2, GetEnteringObject(), FALSE, FALSE, FALSE, FALSE);
			  
			  }
		}	
		
		
	//deandragon_z maze Ocean currents
	
if(GetTag(OBJECT_SELF) == "deandragon_z_swim")
	{effect eCold = EffectDamage(Random(6) + 1, DAMAGE_TYPE_COLD, DAMAGE_POWER_NORMAL, FALSE);
	 effect eDrown = EffectDamage(Random(6) + 1, DAMAGE_TYPE_ALL, DAMAGE_POWER_NORMAL, FALSE);
	 effect eBatter = EffectDamage(Random(10) + 1, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL, FALSE);
	 effect eSwim = EffectKnockdown();
	 effect eUnconscious = EffectStunned();
	 object oSuccess = GetLocalObject(OBJECT_SELF, "oSuccess");
	 if(oSuccess == OBJECT_INVALID)
			{oSuccess = GetWaypointByTag("deandragon_z_pearl_WP");
			 SetLocalObject(OBJECT_SELF, "oSuccess", oSuccess);
			}
	 int nWeight = GetWeight(GetEnteringObject()); 
	 int nWeightPenalty = nWeight / 50;
	 SetLocalInt(GetEnteringObject(), "Swimming", 1);
	 SendMessageToPC(GetEnteringObject(), "You dive through the mysterious standing wall of water, swimming, and find the currents treacherous on the other side!");
	 
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
		 DelayCommand(60.0, ExecuteScript("slv_static_voice_trg_onenter", GetEnteringObject()));
		 	}
	 	 			
		 
		}
	

//deandragon_z_portal
if(GetTag(OBJECT_SELF) == "deandragon_z_portal")
	{if((ACR_RetrieveQuestState("slv_deandragon_z", GetEnteringObject()) == 1) || (ACR_RetrieveQuestState("slv_deandragon_z", GetEnteringObject()) == 2))
		{JumpPartyToArea(GetEnteringObject(), GetWaypointByTag("slv_deandragon_z_portal"));
		 }
	 if(ACR_RetrieveQuestState("slv_deandragon_z", GetEnteringObject()) == 1)	
		 {ACR_AddPersistentJournalQuestEntry("slv_deandragon_z", 2, GetEnteringObject(), FALSE, FALSE, FALSE, 0);
		 }
	}
//deandragon_z_ini
if((GetTag(OBJECT_SELF) == "deandragon_z_ini") && (GetLocalInt(OBJECT_SELF, "Init") != 1))
	{SetLocalInt(OBJECT_SELF, "Init", 1);
	 location lCenter = GetLocation(GetWaypointByTag("deandragon_z_center"));
	 object oDoor = GetFirstObjectInShape(SHAPE_CUBE, 50.0, lCenter, FALSE, OBJECT_TYPE_DOOR);
	 while(oDoor != OBJECT_INVALID)
	 	{ SetLockUnlockDC(oDoor, 35 + Random(10) - Random(10));
		  if(Random(3) == 1)
		  	{CreateTrapOnObject(4 * Random(10) + 1, oDoor, STANDARD_FACTION_HOSTILE);
			  SetTrapDetectable(oDoor, TRUE);
			  SetTrapDisarmable(oDoor, TRUE);
			  SetTrapDetectDC(oDoor, 25 + Random(10) - Random(10));
			  SetTrapDisarmDC(oDoor, 25 + Random(10) - Random(10));
		  	}
		  
		  oDoor = GetNextObjectInShape(SHAPE_CUBE, 50.0, lCenter, FALSE, OBJECT_TYPE_DOOR);
	 
		}
	 object oChest = GetFirstObjectInShape(SHAPE_CUBE, 50.0, lCenter, FALSE, OBJECT_TYPE_PLACEABLE);
	 while(oChest != OBJECT_INVALID)
	 	{ if(GetTag(oChest) != "slv_maze_crystal")
		 { SetLocked(oChest, TRUE);
		  SetLockUnlockDC(oChest, 35 + Random(10) - Random(10));
		  CreateTrapOnObject(4 * Random(10) + 1, oChest, STANDARD_FACTION_HOSTILE);
		  SetTrapDetectable(oChest, TRUE);
		  SetTrapDisarmable(oChest, TRUE);
		  SetTrapDetectDC(oChest, 25 + Random(10) - Random(10));
		  SetTrapDisarmDC(oChest, 30 + Random(10) - Random(10));
		  oChest = GetNextObjectInShape(SHAPE_CUBE, 50.0, lCenter, FALSE, OBJECT_TYPE_PLACEABLE);
	 	  }
	 	}
	 }
	 
	//deandragon_Z crystal ball
   if((GetTag(OBJECT_SELF) == "slv_maze_crystal_trg") && (GetLocalInt(OBJECT_SELF, "Sprung") != 1) && (ACR_RetrieveQuestState("slv_deandragon_z", GetEnteringObject()) == 2))
      	{SetLocalInt(OBJECT_SELF, "Sprung", 1);
		 object oBall = GetObjectByTag("slv_maze_crystal");
		 AssignCommand(oBall, ActionSpeakString("Congratulations! *Dean Vihuel's voice* You have successfully marched to the end of the research stage of your campaign for knowledge.", TALKVOLUME_TALK));
		 DelayCommand(10.0, AssignCommand(oBall, ActionSpeakString("As you are standing here, you have worked out the complete key phrase that you are to give to the gatekeeper. When you have provided it to her, she will summon her rocky steed to carry you further.", TALKVOLUME_TALK)));
		 DelayCommand(20.0, AssignCommand(oBall, ActionSpeakString("You may march on now in Oghma's vanguard to the fieldwork stage of your quest, or you may provision and seek your own way to the gatekeeper at a later time.", TALKVOLUME_TALK)));
		 DelayCommand(30.0, AssignCommand(oBall, ActionSpeakString("It is Occidian we seek, of course, and the Elestar Patterns. Both have waited long enough and may wait a little longer, despite an old man's growing excitement.", TALKVOLUME_TALK)));
		 DelayCommand(40.0, AssignCommand(oBall, ActionSpeakString("The end of decades of preparation is in sight. The final step has been assembling the right crew of scholars to assist in this triumph, and you have proven yourself, finding your way through the same maze of clues and false paths that I have followed for so long.", TALKVOLUME_TALK)));
		 DelayCommand(50.0, AssignCommand(oBall, ActionSpeakString("The moment I see you set out, I shall go ahead of you, and be there to greet you. Until then, know that I still work on final details. Avaunt and awake, troops, for tomorrow we charge the barricades of ignorance!", TALKVOLUME_TALK)));
		 DelayCommand(50.0, ACR_AddPersistentJournalQuestEntry("slv_deandragon_z", 3,GetEnteringObject(),  FALSE, FALSE, FALSE, FALSE));
		}

		 
}