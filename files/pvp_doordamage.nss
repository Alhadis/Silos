// NWTACTICS by Jhenne (tallonzek@hotmail.com)
// 07/07/02
// Door Damage scripts so the doors will open when hurt instead of falling apart
// implemented because doors cannot be respawned or healed.
// this script is called in the 'OnDamaged' event of the door
// Modified by PDL Northpal - 08/02/2002
// Reworked on 8/22/2002

void main()
{
    // get the door being damaged
    object oDoor = OBJECT_SELF;
    object oDamager = GetLastDamager();
    int nDoorOpened = GetAbilityModifier(ABILITY_STRENGTH, oDamager)/2;
    string sDamage;

    if (nDoorOpened < 1)
        nDoorOpened = 1;
    if (GetLocalInt(oDoor, "open") >= 0)
    {
        nDoorOpened = nDoorOpened + GetLocalInt(oDoor, "open");
        sDamage = IntToString(75-nDoorOpened);
        SendMessageToPC(oDamager, "This door still has " + sDamage + " structural points left!");
        if (nDoorOpened > 74){
            SetLocked(oDoor, FALSE);
            AssignCommand(oDoor, ActionOpenDoor(oDoor));
            DelayCommand(55.0, AssignCommand(oDoor, ActionCloseDoor(oDoor)));
            DelayCommand (55.0, SetLocked(oDoor, TRUE));
            nDoorOpened = -1;
            SetLocalInt(oDoor, "open", nDoorOpened);
            nDoorOpened = 0;
            DelayCommand(30.0, SetLocalInt(oDoor, "open", nDoorOpened));
        }
        else
            SetLocalInt(oDoor, "open", nDoorOpened);
    }
}
