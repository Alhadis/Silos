void main()
{
	object oPC = GetEnteringObject();
	object o1Statue = GetObjectByTag("guardian_first_01_statue");
	object o2Statue = GetObjectByTag("guardian_first_02_statue");
	object o1Way = GetObjectByTag("guardian_first_01_way");
	location o1Loc = GetLocation(o1Way);
	object o2Way = GetObjectByTag("guardian_first_02_way");	
	location o2Loc = GetLocation(o2Way);
	
	object oTrapWay = GetObjectByTag("abacus_trap_wall_way");
	location lTrap = GetLocation(oTrapWay);
	
	object oTrapBackWay = GetObjectByTag("abacus_trap_wall_back_way");
	location lbTrap = GetLocation(oTrapBackWay);

int password = GetGlobalInt("abacus_value");

if(password == 4352)
{
	FloatingTextStringOnCreature("You Passed", oPC, TRUE, 3.0f);
	//SetXP(oPC, GetXP(oPC)+1500);
}
else
{
		FloatingTextStringOnCreature("You Failed", oPC, TRUE, 3.0f);
		DestroyObject(o1Statue);
		DestroyObject(o2Statue);
		CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_cn_fleshgolem", o1Loc, TRUE);
		CreateObject(OBJECT_TYPE_CREATURE, "abr_cr_cn_fleshgolem", o2Loc, TRUE);
		
		//Create the walls
		CreateObject(OBJECT_TYPE_PLACEABLE, "trapwall", lTrap, TRUE);
		CreateObject(OBJECT_TYPE_PLACEABLE, "trapwall", lbTrap, TRUE);
}
	
	DestroyObject(OBJECT_SELF);
}