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
	int nSupplyInc = GetLocalInt(oDM, "wand_supply_inc");
	int nSupplyDec = GetLocalInt(oDM, "wand_supply_dec");
	string sSupplyQuestTag = GetLocalString(oDM, "wand_supply_change");
	int nQuestState = ACR_GetPersistentInt(oPC, sSupplyQuestTag);
	int nALSupplyActive = ACR_GetPersistentInt(oPC, "i_qst_alsupply");
	int nRMSupplyActive = ACR_GetPersistentInt(oPC, "i_qst_rmsupply_d");
	int nHHSupplyActive = ACR_GetPersistentInt(oPC, "i_qst_hhsupply_d");
	int nQVSupplyActive = ACR_GetPersistentInt(oPC, "i_qst_qvsupply_d");
	int nWESupplyActive = ACR_GetPersistentInt(oPC, "i_qst_wesupply_d");
	int nRMSupplyReset = ACR_GetPersistentInt(oPC, "i_rst_rmsupply");
	int nHHSupplyReset = ACR_GetPersistentInt(oPC, "i_rst_hhsupply");
	int nQVSupplyReset = ACR_GetPersistentInt(oPC, "i_rst_qvsupply");
	int nWESupplyReset = ACR_GetPersistentInt(oPC, "i_rst_wesupply");
	string sRMSupplyActive = IntToString(nRMSupplyActive);
	string sHHSupplyActive = IntToString(nHHSupplyActive);
	string sQVSupplyActive = IntToString(nQVSupplyActive);
	string sWESupplyActive = IntToString(nWESupplyActive);
	string sRMSupplyReset = IntToString(nRMSupplyReset);
	string sHHSupplyReset = IntToString(nHHSupplyReset);
	string sQVSupplyReset = IntToString(nQVSupplyReset);
	string sWESupplyReset = IntToString(nWESupplyReset);
	
	string sALSupplyActive = IntToString(nALSupplyActive);
	
	
	
//University Rod Change TSM Supply Run States
	
 if((nSupplyInc == 0) && (nSupplyDec == 0)) {
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_alsupply active now = " + sALSupplyActive + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_rmsupply_d active now = " + sRMSupplyActive + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_rst_rmsupply reset days = " + sRMSupplyReset + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_hhsupply_d active now = " + sHHSupplyActive + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_rst_hhsupply reset days = " + sHHSupplyReset + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_qvsupply_d active now = " + sQVSupplyActive + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_rst_qvsupply reset days = " + sQVSupplyReset + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_qst_wesupply_d active now = " + sWESupplyActive + "." );
	SendMessageToPC(oDM, GetName(oPC) + " i_rst_wesupply reset days = " + sWESupplyReset + "." );
	}




	if(nSupplyInc != 0)
			 {if((GetIsDM(oDM)) || (GetIsDMPossessed(oDM)) || (FindSubString(GetName(oDM), "Wynna", 0) != -1))
				{SendMessageToPC(oDM, sSupplyQuestTag + " = " + IntToString(nQuestState) + " for " + GetName(oPC));
				 ACR_SetPersistentInt(oPC, sSupplyQuestTag, nQuestState +1);
				 SendMessageToPC(oDM, sSupplyQuestTag + " changed to " + IntToString(ACR_GetPersistentInt(oPC, sSupplyQuestTag)) + " for " + GetName(oPC));
				 SetLocalInt(oDM, "wand_supply_inc", 0);
				 }
			}
				
		else if(nSupplyDec != 0)
			 {if((GetIsDM(oDM)) || (GetIsDMPossessed(oDM))  || (FindSubString(GetName(oDM), "Wynna", 0) != -1))
				{SendMessageToPC(oDM, sSupplyQuestTag + " = " + IntToString(nQuestState) + " for " + GetName(oPC));
				 ACR_SetPersistentInt(oPC, sSupplyQuestTag, nQuestState - 1);
				 SendMessageToPC(oDM, sSupplyQuestTag + " changed to " + IntToString(ACR_GetPersistentInt(oPC, sSupplyQuestTag)) + " for " + GetName(oPC));
				 DelayCommand(3.0, SetLocalInt(oDM, "wand_supply_dec", 0));
				}
			}
	
	
		
}