// Exodus DM Script 
// By Creslyn
// change faction to hostile

void main()
{
  object oTarget = GetItemActivatedTarget();
  ChangeToStandardFaction(oTarget,STANDARD_FACTION_HOSTILE);
  AssignCommand(oTarget,ClearAllActions());
}
