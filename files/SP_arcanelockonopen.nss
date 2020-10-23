/*void main()
{
   object oPC = GetClickingObject();
   object oTarget = GetTransitionTarget(OBJECT_SELF);
   AssignCommand(oPC, JumpToObject(oTarget));
   DelayCommand(6.0, AssignCommand(OBJECT_SELF, ActionCloseDoor(OBJECT_SELF)));
   SetLocked(OBJECT_SELF, 1);
   
   
   		ActionCloseDoor(oDoor1);
		SetLocalInt(oDoor1, "SC_ARCANELOCK_CASTERPOINTER", ObjectToInt(oCaster));
		SetLocalInt(oDoor1, "SC_ARCANELOCK_CASTERLEVEL", HkGetCasterLevel( oCaster ) );
		SetLocalString(oDoor1, "SC_ARCANELOCK_CASTERTAG", GetName( oCaster ) );
		SetLocalString(oDoor1, "SC_ARCANELOCK_OLDONOPEN",GetEventHandler(oDoor1, SCRIPT_DOOR_ON_OPEN ) );
		SetEventHandler(oDoor1, SCRIPT_DOOR_ON_OPEN, "SP_arcanelockonopen");

}
*/
#include "_HkSpell"
#include "_SCInclude_Doors"

void main()
{
	object 	oDoor = OBJECT_SELF;
	object oPC = GetLastOpenedBy();

	SCOpenArcaneLock( oDoor,  oPC );
}