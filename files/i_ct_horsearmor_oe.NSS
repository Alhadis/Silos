void main()
{
object oPC = OBJECT_SELF;
object oIt = GetItemInSlot(INVENTORY_SLOT_CHEST);
int iChk = GetLocalInt(oPC, "horsearmor");

if(iChk == 0)
	{
		FloatingTextStringOnCreature("You are not a horse. You cannot wear that armor.", oPC);
		AssignCommand(oPC, ActionUnequipItem(oIt));
	}
else if (iChk == 1){}
}