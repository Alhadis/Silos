#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_quest_i"



void main()
{
    object oDM = GetItemActivator();
	if(oDM == OBJECT_INVALID)
		{oDM = OBJECT_SELF;
		}
    
    object oStudent = GetItemActivatedTarget();
	string sDQInc = GetLocalString(oDM, "deanquest_inc");
	string sDQDec = GetLocalString(oDM, "deanquest_dec");
	
	
	
	

//University Rod Change Dean's Quest States
	
if(sDQInc != "")
		 {if((GetIsDM(oDM)) || (GetIsDMPossessed(oDM)))
			{int nQuestState= ACR_RetrieveQuestState("slv_deandragon_" + sDQInc,  oStudent);
			 SendMessageToPC(oDM, "DeanDragon " + sDQInc + " = " + IntToString(ACR_RetrieveQuestState("slv_deandragon_" + sDQInc, oStudent)) + " for " + GetName(oStudent));
			 ACR_AddPersistentJournalQuestEntry("slv_deandragon_" + sDQInc, nQuestState +1, oStudent, 0, 0, 0, 0);
			 SendMessageToPC(oDM, "DeanDragon " + sDQInc + " changed to " + IntToString(ACR_RetrieveQuestState("slv_deandragon_" + sDQInc, oStudent)) + " for " + GetName(oStudent));
			 SetLocalString(oStudent, "deanquest_inc", "");
			}
		}
			
	else if(sDQDec != "")
		 {if((GetIsDM(oDM)) || (GetIsDMPossessed(oDM)))
			{int nQuestState= ACR_RetrieveQuestState("slv_deandragon_" + sDQDec,  oStudent);
			 int nNewState = nQuestState-1;
			 SendMessageToPC(oDM, "DeanDragon " + sDQDec + " = " + IntToString(ACR_RetrieveQuestState("slv_deandragon_" + sDQDec, oStudent)) + " for " + GetName(oStudent));
			 ACR_RemovePersistentJournalQuestEntry("slv_deandragon_" + sDQDec, oStudent, 0, 0);
			 DelayCommand(1.0, ACR_AddPersistentJournalQuestEntry("slv_deandragon_" + sDQDec, nNewState, oStudent, 0, 0, 0, 0));
			 DelayCommand(2.0, SendMessageToPC(oDM, "DeanDragon " + sDQDec + " changed to " + IntToString(ACR_RetrieveQuestState("slv_deandragon_" + sDQDec, oStudent)) + " for " + GetName(oStudent)));
			 DelayCommand(3.0, SetLocalString(oStudent, "deanquest_dec", ""));
			}
		}
	

}