#include "nw_i0_generic"
void main()
{
object oPC = GetPCSpeaker();
SetPlotFlag(OBJECT_SELF, FALSE);
SetLocalInt(OBJECT_SELF, "rep", GetFactionAverageReputation(OBJECT_SELF, oPC));
SetLocalObject(OBJECT_SELF, "target", oPC);
SetListening(OBJECT_SELF, TRUE);
ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
DelayCommand(HoursToSeconds(1), SignalEvent(OBJECT_SELF, EventUserDefined(4000)));
DetermineCombatRound(oPC);
}
