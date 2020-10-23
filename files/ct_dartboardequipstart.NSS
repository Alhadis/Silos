void main(string sResRef)
{
object oPC = GetPCSpeaker();
object equipee = CreateItemOnObject(sResRef, oPC, 5);

AssignCommand(GetPCSpeaker(), ActionEquipItem(equipee, INVENTORY_SLOT_RIGHTHAND));
SetLocalObject(oPC, "dartequip", equipee);
SetLocalInt(oPC, "dartscore", 0);
DelayCommand(0.1, ExecuteScript("ct_dartplay", OBJECT_SELF));
}