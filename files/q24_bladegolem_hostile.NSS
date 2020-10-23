// put in onenter of trigger

#include "nw_i0_generic"

void main()
{
    object oPC = GetEnteringObject();

    if (!GetIsPC(oPC) || GetIsDMPossessed(oPC))
        return;

    object oTarget = GetNearestObjectByTag("009_cr_con_bladegolem");
    ChangeToStandardFaction(oTarget, STANDARD_FACTION_HOSTILE);
    AssignCommand(oTarget, DetermineCombatRound(oPC));
}