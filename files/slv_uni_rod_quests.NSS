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
	string sQuestSchool = GetLocalString(oDM, "slv_uni_school_quests");
	string sQuestLevel = GetLocalString(oDM, "slv_uni_level_quests");
	int nQuestUpDown = GetLocalInt(oDM, "slv_uni_updown_quests");
	string sQuest = ("slv_" + sQuestSchool + sQuestLevel);
	
	

//Change Quest States
	
if(sQuest != "")
		 {if((GetIsDM(oDM)) || (GetIsDMPossessed(oDM))  || (FindSubString(GetName(oDM), "Wynna", 0) != -1))
			{int nQuestStateBefore= ACR_RetrieveQuestState(sQuest,  oStudent);
			 int nQuestStateAfter = nQuestStateBefore + nQuestUpDown;
			 SendMessageToPC(oDM, sQuest + " = " + IntToString(ACR_RetrieveQuestState(sQuest, oStudent)) + " for " + GetName(oStudent));
			 if(nQuestUpDown < 0)
			 	{ACR_RemovePersistentJournalQuestEntry(sQuest, oStudent, 0, 0);}
			 DelayCommand(1.0, ACR_AddPersistentJournalQuestEntry(sQuest, nQuestStateAfter, oStudent, 0, 0, 0, 0));
			 SendMessageToPC(oDM, sQuest + " changed to " + IntToString(ACR_RetrieveQuestState(sQuest, oStudent)) + " for " + GetName(oStudent));
			 SetLocalString(oDM, "slv_uni_school_quests", "");
			 SetLocalString(oDM, "slv_uni_level_quests", "");
			 SetLocalInt(oDM, "slv_uni_updown_quests", 0);
			 }
		}
		
	

}