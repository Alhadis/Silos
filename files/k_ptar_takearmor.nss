////////////////////////////////////////////////////////////////////////////////
/*	Fired by tar11_gadon112.dlg in tar_m11aa (Taris Hidden Bek Base).
	
	This script removes the Sith Soldier disguise from the player and adds the
	Sith authorisation papers. The vanilla script only destroys a single Sith
	armour, leaving any extras, so that was change to destroy all instances.
	
	DP 2019-09-24                                                             */
////////////////////////////////////////////////////////////////////////////////

void main() {
	
	object oPC = GetFirstPC();
	object oItem;
	string sTag = "ptar_sitharmor";
	
	oItem = GetFirstItemInInventory(oPC);
	
	while (GetIsObjectValid(oItem))
		{
			if (GetTag(oItem) == sTag)
				{
					DestroyObject(oItem);
				}
			
			oItem = GetNextItemInInventory(oPC);
		}
	
	CreateItemOnObject("ptar_sithpapers", oPC, 1);
}
