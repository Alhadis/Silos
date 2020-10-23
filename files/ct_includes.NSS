object GetItemInInventory(object oPC, string sTag)
{
object oIt = GetFirstItemInInventory(oPC);
object oMatch;
int iMatch = 0;

while (GetIsObjectValid(oIt) && iMatch == 0)
	{
		if(GetTag(oIt) == sTag)
			{
				oMatch = oIt;
				iMatch = 1;
			}
		oIt = GetNextItemInInventory(oPC);
	}
return oMatch;
}

void AddNPCToParty(object oNPC, object oPC)
{
    AssignCommand(oNPC, SetAssociateListenPatterns());
    SetLocalInt(oNPC,"NW_COM_MODE_COMBAT",ASSOCIATE_COMMAND_ATTACKNEAREST);
    SetLocalInt(oNPC,"NW_COM_MODE_MOVEMENT",ASSOCIATE_COMMAND_FOLLOWMASTER);

	string sTag = GetTag(oNPC);	
    AddRosterMemberByCharacter(sTag, oNPC);
    AddRosterMemberToParty(sTag, oPC);
}

void EmptyInventoryandReturn(object oTar, object oPC)
{
object oIt = GetItemInSlot(INVENTORY_SLOT_ARMS, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetItemInSlot(INVENTORY_SLOT_ARROWS, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetItemInSlot(INVENTORY_SLOT_BELT, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetItemInSlot(INVENTORY_SLOT_BOLTS, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetItemInSlot(INVENTORY_SLOT_BOOTS, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetItemInSlot(INVENTORY_SLOT_BULLETS, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetItemInSlot(INVENTORY_SLOT_CHEST, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetItemInSlot(INVENTORY_SLOT_CLOAK, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetItemInSlot(INVENTORY_SLOT_HEAD, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetItemInSlot(INVENTORY_SLOT_NECK, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oTar);
CopyItem(oIt, oPC, TRUE);
DestroyObject(oIt);
oIt = GetFirstItemInInventory(oTar);

while (GetIsObjectValid(oIt))
	{
		CopyItem(oIt, oPC, TRUE);
		DestroyObject(oIt);
		oIt = GetNextItemInInventory(oTar);
	}
}