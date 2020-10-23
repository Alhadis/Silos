// i_bb_it_ringwolflord_ac
// by Brendan Bellina
// Dec 2007

// bb_it_ringwolflord OnActivate handler
// This script is executed automatically when the item is activated
// To trigger properly the name of the script MUST be "i_" + itemtag + "_ac"
// Also to make the item usable set Item Property to Cast Spell: Unique Power Self Only

// This script changes the users appearance and equips claws.
// However, appearance changes do not alter inventory, equipped items, attacks, or defenses.
// Polymorph does change those things but also prevents access to inventory while polymorphed.

// Adding ability bonuses to the wearer did not work properly because the wearer may be wearing other
// items that have a bonus.  So altering the bonuses on the item itself made more sense.  However,
// I could not get the RemoveItemProperty function to remove ability bonuses unless I removed all properties.
// But when all properties are removed the item quits being activatable. Attempting to remove just the
// ability bonuses were not successful.

// The next attempt was to leave the item alone and instead use invisible daggers that have bonuses when
// equipped. These daggers are created and equipped, and then destroyed when no longer needed. They
// must be unequippable so that they cannot be removed while the PC is transformed. This also solves the
// problem that the PC really shouldn't be holding items when transformed.

// Daggers were used instead of claws since creature claws are too limited in selectable properties.

#include "ginc_debug"
#include "ginc_item_script"
/*
void RemoveAllItemProperties( object oItem ) // This works, but also prevents activation
{
	itemproperty itemprop = GetFirstItemProperty(oItem);
	while (GetIsItemPropertyValid(itemprop))
	{
		RemoveItemProperty(oItem, itemprop);
		itemprop = GetNextItemProperty(oItem);
	}	
}

void RemoveAllItemAbilityBonuses( object oItem ) // This doesn't work at all
{
	itemproperty itemprop = GetFirstItemProperty(oItem);
	while (GetIsItemPropertyValid(itemprop))
	{
		int ipst = GetItemPropertySubType(itemprop);
		if (ipst > 130 && ipst < 137)
			RemoveItemProperty(oItem, itemprop);
		itemprop = GetNextItemProperty(oItem);
	}	
}
*/
void main()
{
	//PrettyDebug("i_bb_it_ringwolflord_ac: change appearance to werewolf");
	
	object oTarget = GetItemActivator();
	object oItem = GetItemActivated();
	string sItemTag = GetTag(oItem);
	int nTrans = GetLocalInt(oTarget, sItemTag);
	int nOriginalAppearance = GetLocalInt(oTarget, sItemTag + "_oa");
	if (nTrans == 0) // if not transformed then change appearance to werewolf
	{		
//	This method - applying effects to the wearer did not work well.		
//		effect eEffect = EffectAbilityIncrease( ABILITY_STRENGTH, 3);
//		ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);		
//		eEffect = EffectAbilityIncrease( ABILITY_DEXTERITY, 3);
//		ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);		
//		eEffect = EffectAbilityIncrease( ABILITY_CONSTITUTION, 3);
//		ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);

//	This method - applying properties to the item did not work because they could not be removed
//		itemproperty itemprop = ItemPropertyAbilityBonus(ABILITY_STRENGTH, 3);
//		AddItemProperty(DURATION_TYPE_PERMANENT, itemprop, oItem);
//		itemprop = ItemPropertyAbilityBonus(ABILITY_DEXTERITY, 3);
//		AddItemProperty(DURATION_TYPE_PERMANENT, itemprop, oItem);
//		itemprop = ItemPropertyAbilityBonus(ABILITY_CONSTITUTION, 3);
//		AddItemProperty(DURATION_TYPE_PERMANENT, itemprop, oItem);

		// Unequip anything currently being held
		object oHeldItem = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oTarget);
		if (oHeldItem != OBJECT_INVALID)
			AssignCommand(oTarget, ActionUnequipItem(oHeldItem));
		oHeldItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget);
		if (oHeldItem != OBJECT_INVALID)
			AssignCommand(oTarget, ActionUnequipItem(oHeldItem));

		SetLocalInt(oTarget, sItemTag + "_oa", GetAppearanceType(oTarget));
		effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
		ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
		SetCreatureAppearanceType(oTarget, APPEARANCE_TYPE_WEREWOLF);

		// Create and Equip the Werewolf Right Claw
		object oClaw1 = CreateItemOnObject("bb_ww_claw1", oTarget);
		AssignCommand(oTarget, ActionEquipItem(oClaw1, INVENTORY_SLOT_RIGHTHAND));
		// Create and Equip the Werewolf Left Claw
		object oClaw2 = CreateItemOnObject("bb_ww_claw2", oTarget);
		AssignCommand(oTarget, ActionEquipItem(oClaw2, INVENTORY_SLOT_LEFTHAND));

		SetLocalInt(oTarget, sItemTag, 1);
	}
	else if (nTrans == 1) // if werewolf then change appearance to wolf
	{
		effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
		ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
		SetCreatureAppearanceType(oTarget, APPEARANCE_TYPE_DOG_WOLF);
		
//	This method didn't work
//		effect eEffect = EffectAbilityDecrease( ABILITY_STRENGTH, 3);
//		ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);		
//		eEffect = EffectAbilityIncrease( ABILITY_DEXTERITY, 5);
//		ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);		

//	This method didn't work because RemoveItemProperty didn't work
//		itemproperty itemprop = ItemPropertyAbilityBonus(ABILITY_STRENGTH, 3);
//		RemoveItemProperty(oItem, itemprop);
//		itemprop = ItemPropertyAbilityBonus(ABILITY_DEXTERITY, 3);
//		RemoveItemProperty(oItem, itemprop);
//		itemprop = ItemPropertyAbilityBonus(ABILITY_DEXTERITY, 5);
//		AddItemProperty(DURATION_TYPE_PERMANENT, itemprop, oItem);

//		RemoveAllItemProperties(oItem); // This didn't work because it prevented activation

//		RemoveAllItemAbilityBonuses(oItem); // This didn't work at all
//		itemproperty itemprop = ItemPropertyAbilityBonus(ABILITY_STRENGTH, 0);
//		AddItemProperty(DURATION_TYPE_PERMANENT, itemprop, oItem);
//		itemprop = ItemPropertyAbilityBonus(ABILITY_DEXTERITY, 5);
//		AddItemProperty(DURATION_TYPE_PERMANENT, itemprop, oItem);
//		itemprop = ItemPropertyAbilityBonus(ABILITY_CONSTITUTION, 3);
//		AddItemProperty(DURATION_TYPE_PERMANENT, itemprop, oItem);

		// Destroy the Werewolf Left Claw
		DestroyObject(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oTarget), 0.0, FALSE);
		// Create and Equip the Werewolf Left Claw
		object oClaw3 = CreateItemOnObject("bb_ww_claw3", oTarget);
		AssignCommand(oTarget, ActionEquipItem(oClaw3, INVENTORY_SLOT_LEFTHAND));

		SetLocalInt(oTarget, sItemTag, 2);
	}
	else if (nTrans == 2) // if wolf then change back to normal
	{
		effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
		ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
		SetCreatureAppearanceType(oTarget, nOriginalAppearance);
//		effect eEffect = EffectAbilityDecrease( ABILITY_DEXTERITY, 5);
//		ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);		
//		eEffect = EffectAbilityDecrease( ABILITY_CONSTITUTION, 3);
//		ApplyEffectToObject(DURATION_TYPE_PERMANENT, eEffect, oTarget);		

//		itemproperty itemprop = ItemPropertyAbilityBonus(ABILITY_DEXTERITY, 5);
//		RemoveItemProperty(oItem, itemprop);
//		itemprop = ItemPropertyAbilityBonus(ABILITY_CONSTITUTION, 3);
//		RemoveItemProperty(oItem, itemprop);

//		RemoveAllItemAbilityBonuses(oItem);

//		itemproperty itemprop = ItemPropertyAbilityBonus(ABILITY_DEXTERITY, 0);
//		AddItemProperty(DURATION_TYPE_PERMANENT, itemprop, oItem);
//		itemprop = ItemPropertyAbilityBonus(ABILITY_CONSTITUTION, 0);
//		AddItemProperty(DURATION_TYPE_PERMANENT, itemprop, oItem);

		SetLocalInt(oTarget, sItemTag, 0);

		// Destroy both claws
		DestroyObject(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oTarget), 0.0, FALSE);
		DestroyObject(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget), 0.0, FALSE);
	}
}