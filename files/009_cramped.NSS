int GetIsCrampedWeapon(int weaponType)
{
	if(weaponType == BASE_ITEM_DAGGER ||
	   weaponType == BASE_ITEM_DART ||
	   weaponType == BASE_ITEM_HANDAXE ||
	   weaponType == BASE_ITEM_HEAVYCROSSBOW ||
	   weaponType == BASE_ITEM_KAMA ||
	   weaponType == BASE_ITEM_KUKRI ||
	   weaponType == BASE_ITEM_LIGHTCROSSBOW ||
	   weaponType == BASE_ITEM_LIGHTHAMMER ||
	   weaponType == BASE_ITEM_LIGHTMACE ||
	   weaponType == BASE_ITEM_MACE ||
	   weaponType == BASE_ITEM_SCIMITAR ||
	   weaponType == BASE_ITEM_SHORTSWORD ||
	   weaponType == BASE_ITEM_SHURIKEN ||
	   weaponType == BASE_ITEM_SLING ||
	   weaponType == BASE_ITEM_THROWINGAXE)
	{
		return TRUE;
	}
	return FALSE;
}
void CrampedHeartbeat(object oPC)
{
	object oCritter = GetFirstInPersistentObject(OBJECT_SELF);
	while(GetIsObjectValid(oCritter))
	{
		if(oCritter == oPC)
		{
			object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
			if(GetIsObjectValid(oWeapon))
			{
				if(!GetIsCrampedWeapon(GetBaseItemType(oWeapon)))
				{
					ApplyEffectToObject(DURATION_TYPE_TEMPORARY, ExtraordinaryEffect(EffectAttackDecrease(4)), oPC, 6.0f);
				}
			}
			DelayCommand(6.0f, CrampedHeartbeat(oPC));
		}
		oCritter = GetNextInPersistentObject(OBJECT_SELF);
	}
}

void main()
{
	CrampedHeartbeat(GetEnteringObject());
}