//Conversation driven for all Silvy Uni critters  
//Wynna February 2008


#include "acr_creature_i"
#include "acr_quest_i"
#include "silvy_univ_inc"
#include "silvy_univ_func"

void main()
{
	object oStudent = GetPCSpeaker();
    effect eKnockdown = EffectKnockdown();
	effect eStruck = EffectDamage(1, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_NORMAL, FALSE);			
   
	SetLocalString(OBJECT_SELF, "Conversation", "Yes");
	SetLocalString(OBJECT_SELF, "PC_Speaker", GetName(oStudent));
	DelayCommand(300.00, SetLocalString(OBJECT_SELF, "Conversation", "No"));
			 	
	if(FindSubString(GetTag(OBJECT_SELF), "003_cr_slv_prof") != -1)
		{SetLocalString(oStudent, "Professor", GetTag(OBJECT_SELF));
		 SetLocalString(OBJECT_SELF, "Professor", GetTag(OBJECT_SELF));
		 }
	     	
		 
		 
	//Standard Enchantment
    if(GetTag(OBJECT_SELF) == "003_cr_slv_procenc2")

                   {object oMyMirrorWP = GetLocalObject(OBJECT_SELF, "oMyMirrorWP");
					if (oMyMirrorWP == OBJECT_INVALID)
						{oMyMirrorWP = GetWaypointByTag("Enc_All_Quests_Mirror_WP");
						 SetLocalObject(OBJECT_SELF, "oMyMirrorWP", oMyMirrorWP);
						}
					object oExit = GetLocalObject(OBJECT_SELF, "oExit");
				    if(oExit == OBJECT_INVALID)
						{oExit = GetObjectByTag("slv_door_Enchantment1");
                    	SetLocalObject(OBJECT_SELF, "oExit", oExit);
						}
					SetLocked(oExit, FALSE);
					object oDown = GetLocalObject(OBJECT_SELF, "oDown");
				    if(oDown == OBJECT_INVALID)
						{oDown = GetWaypointByTag("GL2_Down_AT");
                    	SetLocalObject(OBJECT_SELF, "oDown", oDown);
						}
					object oUp = GetLocalObject(OBJECT_SELF, "oUp");
				    if(oUp == OBJECT_INVALID)
						{oUp = GetWaypointByTag("GL3_Up_AT");
                    	SetLocalObject(OBJECT_SELF, "oUp", oUp);
						}
					object oProfessor = GetLocalObject(OBJECT_SELF, "oProfessor");
					if(oProfessor == OBJECT_INVALID)
						{oProfessor = GetWaypointByTag("003_cr_slv_profenc_Class");
						 SetLocalObject(OBJECT_SELF, "oProfessor", oProfessor);
						 }
					object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oStudent, 1);
					object oEye1 = GetObjectByTag("003_cr_slv_enc100eyes", 0);
					object oEye2 = GetObjectByTag("003_cr_slv_enc100eyes", 1);
					object oEye3 = GetObjectByTag("003_cr_slv_enc100eyes", 2);
					object oEye4 = GetObjectByTag("003_cr_slv_enc100eyes", 3);
					object oEye5 = GetObjectByTag("003_cr_slv_enc100eyes", 4);
					
					SetLocked(oExit, FALSE);
					DelayCommand(1.0, ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE));
					DelayCommand(3.0, ChangeToStandardFaction(oEye1, STANDARD_FACTION_DEFENDER));
					DelayCommand(3.0, ChangeToStandardFaction(oEye2, STANDARD_FACTION_DEFENDER));
					DelayCommand(3.0, ChangeToStandardFaction(oEye3, STANDARD_FACTION_DEFENDER));
					DelayCommand(3.0, ChangeToStandardFaction(oEye4, STANDARD_FACTION_DEFENDER));
					DelayCommand(3.0, ChangeToStandardFaction(oEye5, STANDARD_FACTION_DEFENDER));
					DelayCommand(4.0, ActionUnlockObject(oExit));
            		DelayCommand(7.5, ClearAllActions(TRUE));
					DelayCommand(8.0, ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_COMMONER));
					DelayCommand(8.5, ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE));
					DelayCommand(8.75, ClearAllActions(TRUE));
					DelayCommand(9.0, ActionForceMoveToObject(oEye1, TRUE, 0.0));
				    if(GetLocalInt(OBJECT_SELF, "Charmed") != 1)
					{DelayCommand(10.0, SpeakString("Stupid eye beasts! Do not defend the student! I only pretend! If the scholar gets scratched, that is not my fault!", TALKVOLUME_TALK));
						}
					DelayCommand(19.75, ClearAllActions(TRUE));
					DelayCommand(20.0, ActionUnlockObject(oExit));
            	    DelayCommand(20.1, ActionForceMoveToObject(oExit, TRUE, 0.0));
					DelayCommand(21.0, ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_COMMONER));
					DelayCommand(24.0, ActionOpenDoor(oExit));
					 if(GetLocalInt(OBJECT_SELF, "Charmed") != 1)
						{DelayCommand(25.0, SpeakString("The student's insolence and clumsiness caused any harm taken, Master Silverbrook!", TALKVOLUME_TALK));
						}
					//DelayCommand(28.0, SpeakString("Yes, Master, I'll find something to engage myself elsewhere. Thank you for the teleport lesson and dispensation.", TALKVOLUME_TALK));
				   // DelayCommand(30.0, ActionJumpToLocation(GetLocation(GetWaypointByTag("Grove_WP"))));
					DelayCommand(28.0, ActionForceMoveToObject(oUp, TRUE, 0.0));
					}
				   
// 300 Level scribe for all classes		
	if(GetTag(OBJECT_SELF) == "003_cr_slv_300_quill")
		{DestroyObject(OBJECT_SELF);
		}
		
// Bookorder scribe for Library		
			
	if(GetTag(OBJECT_SELF) == "003_cr_slv_bookorder_quill")
		{DestroyObject(OBJECT_SELF);
		}			
		
//Foch_Forgery

	if(((GetTag(OBJECT_SELF) == "003_cr_foc_marysteele")|| (GetTag(OBJECT_SELF) == "003_cr_felbarr_durnen")) && (ACR_RetrieveQuestState("foch_forgery", oStudent) == 1))
		{int iInt = GetAbilityModifier(ABILITY_INTELLIGENCE, oStudent);
		 int iForgeRoll = Random(20) +1;
		 if(iInt + iForgeRoll + 4 >= 15)
		 	{SetLocalInt(oStudent, "ForgedSuccess", 1);
			}
		}
		

}			 			 