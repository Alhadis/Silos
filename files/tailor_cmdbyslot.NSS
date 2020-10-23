#include "acr_items_i"

void main(int inventorySlot, int command, int param1, int param2)
{
	object oPC = GetPCSpeaker();
	object oItem = GetItemInSlot(inventorySlot, oPC);
	if(!GetIsObjectValid(oItem)) return;
	
	if(param2 >= 0)
	{
		ClearScriptParams();
		AddScriptParameterObject(oItem);
		AddScriptParameterInt(command);
		AddScriptParameterInt(param1);
		AddScriptParameterInt(param2);
		int ret = ExecuteScriptEnhanced("ACR_Items", oPC, TRUE);
		if(ret > 0) AssignCommand(oPC, ActionEquipItem(IntToObject(ret), inventorySlot));
		return;
	}
	else
	{
		SetLocalInt(oPC, "ACR_ITEM_INV_SLOT", inventorySlot);
		SetLocalInt(oPC, "ACR_ITEM_COMMAND", command);
		SetLocalInt(oPC, "ACR_ITEM_PARAM_1", param1);
		DisplayGuiScreen(oPC,"SCREEN_COLOR_TLS",TRUE,"elechos_colortls.xml");
	}
}