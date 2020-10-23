//Put this script OnEnter
void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

object oTarget;
oTarget = GetObjectByTag("celldoor");

AssignCommand(oTarget, ActionOpenDoor(oTarget));

}

