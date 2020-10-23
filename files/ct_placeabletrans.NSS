void main()
{
object oPC = GetLastUsedBy();
string sGoTo = GetLocalString(OBJECT_SELF, "WP");
location lGoTo = GetLocation(GetWaypointByTag(sGoTo));

AssignCommand(oPC, ActionJumpToLocation(lGoTo));
}