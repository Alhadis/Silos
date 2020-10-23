//OnFailToOpen for all Silvy Uni placeables outside the classrooms
//Wynna December 2007


#include "acr_placeable_i"
#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_spawn_i"
#include "acr_tools_i"

void main()
{
	ACR_PlaceableOnUsed();
    object oStudent = GetLastUsedBy();
						 
   
	      //Elementary Abjuration    			
			if(GetTag(OBJECT_SELF) == "slv_abj100_chest")
				      {int nSchool = 1;
					   string sCurrentCourse = GetSilvyUniversityCurrentSchoolRegistration(oStudent, nSchool);
					   if (GetHasSpellEffect(SPELL_ENDURE_ELEMENTS, oStudent))
				            {SetLocked(OBJECT_SELF, FALSE);
				             SendMessageToPC(oStudent, "You feel the comforting warmth of your Endure Elements spell protecting your fingers from the cold of the chest. The iced-shut lock on the chest visibly thaws at your touch.");
				             DelayCommand(300.0, SetLocked(OBJECT_SELF, TRUE));
				             if((sCurrentCourse == "Elementary Abjuration") && (GetLocalString(oStudent, sCurrentCourse) != sCurrentCourse))
					             {SetLocalString(oStudent, sCurrentCourse, "Elementary Abjuration, chest");
					              }
				             }
				        else
				            {object oMyIceLeaveWP = GetLocalObject(OBJECT_SELF, "oMyIceLeaveWP");
							 if(oMyIceLeaveWP == OBJECT_INVALID)
								{oMyIceLeaveWP = GetNearestObjectByTag("Abj_All_Quests_IceGo_WP", OBJECT_SELF, 1);
							     SetLocalObject(OBJECT_SELF, "oMyIceLeaveWP", oMyIceLeaveWP);
								 }
							 SendMessageToPC(oStudent, "The cold pouring off the chest of ice stings your fingers and drives you away.");
				             AssignCommand(oStudent, ActionForceMoveToObject(oMyIceLeaveWP, TRUE, 0.0, 10.0));
				             if((sCurrentCourse == "Elementary Abjuration") && (GetLocalString(oStudent, sCurrentCourse) != sCurrentCourse))
					             {SetLocalString(oStudent, sCurrentCourse, "Elementary Abjuration, chest");
					              }
				            }
				        }
}