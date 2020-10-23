void main()
{
object oMe = OBJECT_SELF;
string sTag = GetLocalString(oMe, "DoorTag");
object oDoor = GetNearestObjectByTag(sTag);
object oPC = GetExitingObject();
int PCs = GetLocalInt(oMe, "pcnum");

if(GetIsPC(oPC))
	{
		SetLocalInt(oPC, "doorsearch", 0);
		SetLocalInt(oMe, "pcnum", PCs - 1);
	}

if(GetLocalInt(oMe, "pcnum") == 0)
	{
		DestroyObject(oDoor);
		AssignCommand(oDoor, ActionCloseDoor(oDoor));
	}
}