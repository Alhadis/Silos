void main()
{
	object oBarrel = OBJECT_SELF;
	
	object oPC = GetLastUsedBy();

	int iBlastDice = GetLocalInt(oBarrel, "BARREL_BLAST_DICE");
	int iBlastRadius = GetLocalInt(oBarrel, "BARREL_BLAST_RADIUS");
	
	if (iBlastDice == 0) iBlastDice = 1;
	if (iBlastRadius == 0) iBlastRadius = 1;	
	
	// Determine size of Barrel Item
	string sBarrelResRef = "it_blast_barrel_med1";
	if (iBlastDice + iBlastRadius > 11) sBarrelResRef = "it_blast_barrel_lg1";
	if (iBlastDice + iBlastRadius < 5) sBarrelResRef = "it_blast_barrel_sm1";
	
	// Create Barrel on PC
	object oItem = CreateItemOnObject(sBarrelResRef, oPC);
	
	// Set Parameters on Barrel Item
	SetLocalInt(oItem, "BLAST_DICE", iBlastDice);
	SetLocalInt(oItem, "BLAST_RADIUS", iBlastRadius);
	
	// Get Rid of the Placed Barrel
	DestroyObject(oBarrel);
}