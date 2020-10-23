#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_quest_i"
#include "acr_db_persist_i"



void main()
{
    object oDM = GetItemActivator();
	if(oDM == OBJECT_INVALID)
		{oDM = OBJECT_SELF;
		}
    
    object oPC = GetItemActivatedTarget();
	int nMailInc = GetLocalInt(oDM, "wand_mail_inc");
	int nMailDec = GetLocalInt(oDM, "wand_mail_dec");
	string sMailQuestTag = GetLocalString(oDM, "wand_mail_change");
	int nQuestState = ACR_GetPersistentInt(oPC, sMailQuestTag);
	int nTSMMail = ACR_GetPersistentInt(oPC, "i_qst_tsmmail_delivery");
	int nQVMail = ACR_GetPersistentInt(oPC, "i_qst_mailqv0_d");
	int nHHMail = ACR_GetPersistentInt(oPC, "i_qst_mailhh1_d");
	int nRMMail = ACR_GetPersistentInt(oPC, "i_qst_mailrm2_d");
	int nKHMail = ACR_GetPersistentInt(oPC, "i_qst_mailkh3_d");
	int nCFMail = ACR_GetPersistentInt(oPC, "i_qst_mailcf4_d");
	int nSBMail = ACR_GetPersistentInt(oPC, "i_qst_mailsb5_d");
	int nAVMail = ACR_GetPersistentInt(oPC, "i_qst_mailav6_d");
	int nWEMail = ACR_GetPersistentInt(oPC, "i_qst_mailwe7_d");
	int nSSMail = ACR_GetPersistentInt(oPC, "i_qst_mailss8_d");
	string sTSMMail = IntToString(nTSMMail);
	string sHHMail = IntToString(nHHMail);
	string sQVMail = IntToString(nQVMail);
	string sRMMail = IntToString(nRMMail);
	string sKHMail = IntToString(nKHMail);
	string sCFMail = IntToString(nCFMail);
	string sSBMail = IntToString(nSBMail);
	string sWEMail = IntToString(nWEMail);
	string sAVMail = IntToString(nAVMail);
	string sSSMail = IntToString(nSSMail);
	
	
//University Rod List TSM Mail Quest States
	
 if((nMailInc == 0) && (nMailDec == 0)) {
	
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_tsmmail_delivery = " + sTSMMail + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_mailqv0_d = " + sQVMail + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_mailhh1_d = " + sHHMail + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_mailrm2_d = " + sRMMail + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_mailkh3_d = " + sKHMail + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_mailcf4_d = " + sCFMail + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_mailsb5_d = " + sSBMail + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_mailav6_d = " + sWEMail + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_mailwe7_d = " + sAVMail + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_mailss8_d = " + sSSMail + "." );
	}
	
  if(nMailInc != 0)
			 {if((GetIsDM(oDM)) || (GetIsDMPossessed(oDM)) || (FindSubString(GetName(oDM), "Wynna", 0) != -1))
				{SendMessageToPC(oDM, sMailQuestTag + " = " + IntToString(nQuestState) + " for " + GetName(oPC));
				 ACR_SetPersistentInt(oPC, sMailQuestTag, nQuestState +1);
				 SendMessageToPC(oDM, sMailQuestTag + " changed to " + IntToString(ACR_GetPersistentInt(oPC, sMailQuestTag)) + " for " + GetName(oPC));
				 SetLocalInt(oDM, "wand_mail_inc", 0);
				 }
			}
				
		else if(nMailDec != 0)
			 {if((GetIsDM(oDM)) || (GetIsDMPossessed(oDM))  || (FindSubString(GetName(oDM), "Wynna", 0) != -1))
				{SendMessageToPC(oDM, sMailQuestTag + " = " + IntToString(nQuestState) + " for " + GetName(oPC));
				 ACR_SetPersistentInt(oPC, sMailQuestTag, nQuestState - 1);
				 SendMessageToPC(oDM, sMailQuestTag + " changed to " + IntToString(ACR_GetPersistentInt(oPC, sMailQuestTag)) + " for " + GetName(oPC));
				 SetLocalInt(oDM, "wand_mail_dec", 0);
				}
			}
		
		
}