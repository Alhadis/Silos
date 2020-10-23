void main()
{
object oPC = GetLastUsedBy();
int iChk = GetLocalInt(OBJECT_SELF, "hashoney");
location lPC = GetLocation(OBJECT_SELF);

if(iChk == 0)
	{
		CreateItemOnObject("ct_honeybottle", oPC, 1);
		CreateObject(OBJECT_TYPE_CREATURE, "ct_beeswarm", lPC);
		SetLocalInt(OBJECT_SELF, "hashoney", 1);
		DelayCommand(600.0, SetLocalInt(OBJECT_SELF, "hashoney", 0));
	}
else
	{
		FloatingTextStringOnCreature("There is no honey in this beehive", oPC, FALSE);
	}
}