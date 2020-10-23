//wield chair
// destroys placeable and puts weapon chair in PC inventory, then makes them weild it

void main()
{
object oPC = GetPCSpeaker();
CreateItemOnObject("chair", oPC);
AssignCommand(oPC, ActionEquipItem(GetObjectByTag("chair"), INVENTORY_SLOT_RIGHTHAND));
object oTarget = OBJECT_SELF;
DestroyObject(oTarget, 0.0);
}

