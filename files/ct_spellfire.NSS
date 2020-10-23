/****************************************************
This script originally crafted by Corin Tack
****************************************************/

#include "ct_spellfirefunctions"

void main()
{
object oItem = GetItemActivated();
object oPC = GetItemActivator();
object oTarget = GetItemActivatedTarget();
object oMe = GetItemPossessedBy(oPC, "ct_spellfire");
SetLocalObject(oMe, "spftarget", oTarget);

if(GetLocalInt(oMe, "spflvl") > GetAbilityScore(oPC, ABILITY_CONSTITUTION))
	SetLocalInt(oMe, "spflvl", GetAbilityScore(oPC, ABILITY_CONSTITUTION));

if(oTarget == oPC)
	{
		if(GetLocalInt(oMe, "spflvl") < GetAbilityScore(oPC, ABILITY_CONSTITUTION))
			spfabsorb(oTarget);
		else
			SendMessageToPC(oPC, "You cannot store any more spell energy.");
	}
else if (GetIsEnemy(oTarget, oPC) == FALSE && oTarget != oPC && GetName(oTarget) != "")
	spfheal(oPC, oTarget);
else if (GetIsEnemy(oTarget, oPC) == TRUE)
	spellflame(oPC, oTarget);
else
	AssignCommand(oPC, ActionStartConversation(oPC, "ct_spfire1", TRUE, FALSE));	
}		