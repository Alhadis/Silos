void main()
	{
	object oPC=GetLastUsedBy();
	object oChair=OBJECT_SELF;
	AssignCommand(oPC,ActionJumpToLocation(GetLocation(oChair)));
	PlayCustomAnimation(oPC,"kneelidle",1);
	PlayCustomAnimation(oPC,"kneelbow",1);
	}