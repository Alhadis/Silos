// i_bb_ww_claw3_ue
// by Brendan Bellina
// Dec 2007

// bb_ww_claw1 OnUnequip handler
// This script is executed automatically when the item is unequipped
// To trigger properly the name of the script MUST be "i_" + itemtag + "_ue"

// This is used with a claw created by the bb_it_ringwolflord item

//#include "bb_inc_destroyitem"

void main()
{
	object oTarget = GetPCItemLastUnequippedBy();
	object oItem = GetPCItemLastUnequipped();
	int nTrans = GetLocalInt(oTarget, "bb_it_ringwolflord");

	if (nTrans)
	{
		AssignCommand(oTarget, ActionEquipItem(oItem, INVENTORY_SLOT_LEFTHAND));
		return;
	} 
/*
	if (nTrans)
	{
		// Destroy all the claws on the wearer and then recreate and reequip
		DestroyItem("bb_ww_claw1", oTarget, 0.0, FALSE);
		DestroyItem("bb_ww_claw2", oTarget, 0.0, FALSE);
		DestroyItem("bb_ww_claw3", oTarget, 0.0, FALSE);		
	}

	if (nTrans == 1) // werewolf should have claw1 and claw2
	{
		// Create and Equip the Werewolf Right Claw
		object oClaw1 = CreateItemOnObject("bb_ww_claw1", oTarget);
		AssignCommand(oTarget, ActionEquipItem(oClaw1, INVENTORY_SLOT_RIGHTHAND));
		// Create and Equip the Werewolf Left Claw
		object oClaw2 = CreateItemOnObject("bb_ww_claw2", oTarget);
		AssignCommand(oTarget, ActionEquipItem(oClaw2, INVENTORY_SLOT_LEFTHAND));
	}
	else if (nTrans == 2) // wolf should have claw1 and claw3
	{
		// Create and Equip the Werewolf Right Claw
		object oClaw1 = CreateItemOnObject("bb_ww_claw1", oTarget);
		AssignCommand(oTarget, ActionEquipItem(oClaw1, INVENTORY_SLOT_RIGHTHAND));
		// Create and Equip the Werewolf Left Claw
		object oClaw3 = CreateItemOnObject("bb_ww_claw3", oTarget);
		AssignCommand(oTarget, ActionEquipItem(oClaw3, INVENTORY_SLOT_LEFTHAND));
	}
*/
}