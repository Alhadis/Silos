/* Do Once Area Auto-Save
Script Designed by Doc Halloween on July 08, 2003
with help from Jassper (who made Bioware Forums' Newbe F.A.Q
Place in Area Properties then Events then OnEnter */

void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

int DoOnce = GetLocalInt(oPC, GetTag(OBJECT_SELF));

if (DoOnce==TRUE) return;

SetLocalInt(oPC, GetTag(OBJECT_SELF), TRUE);

DoSinglePlayerAutoSave();

}
