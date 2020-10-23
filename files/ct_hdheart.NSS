void main()
{
object oMe = OBJECT_SELF;

if(GetLocalInt(oMe, "doonce") == 0)
	{
		AssignCommand(oMe, ActionCloseDoor(oMe));
		SetLocalInt(oMe, "doonce", 1);
	}
}