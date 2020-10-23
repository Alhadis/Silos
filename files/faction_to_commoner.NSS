// Exodus DM Script 
// By Creslyn
// Change faction to commoner

void main()
{
  object oTarget = GetItemActivatedTarget();
  ChangeToStandardFaction(oTarget,STANDARD_FACTION_COMMONER);
  AssignCommand(oTarget,ClearAllActions());
}