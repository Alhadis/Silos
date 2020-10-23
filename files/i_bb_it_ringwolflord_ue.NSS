// i_bb_it_ringwolflord_ue
// by Brendan Bellina
// Dec 2007

// bb_it_ringwolflord OnUnequip handler
// This script is executed automatically when the item is unequipped
// To trigger properly the name of the script MUST be "i_" + itemtag + "_ue"

void main()
{
	object oTarget = GetPCItemLastUnequippedBy();
	object oItem = GetPCItemLastUnequipped();
	string sItemTag = GetTag(oItem);
	int nTrans = GetLocalInt(oTarget, sItemTag);
	int nOriginalAppearance = GetLocalInt(oTarget, sItemTag + "_oa");
	if (nTrans) // change back to normal from werewolf or wolf
	{
		effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
		ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
		SetCreatureAppearanceType(oTarget, nOriginalAppearance);

		SetLocalInt(oTarget, sItemTag, 0);
		
		// Destroy both claws
		DestroyObject(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oTarget), 0.0, FALSE);
		DestroyObject(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTarget), 0.0, FALSE);		
	}
}