void main ()
{
  object oPC = GetEnteringObject();
  if (GetIsPC(oPC))
  {
    object oTrapDoor = GetObjectByTag("STUCKDOOR");
    AssignCommand(oTrapDoor, ActionCloseDoor(oTrapDoor));
    SetLocalInt(oTrapDoor,"TrapTrigger", TRUE);
  }
}

