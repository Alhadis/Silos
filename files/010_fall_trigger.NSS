#include "acr_i"

void RollBalanceCheck(object oBalancer);

void main()
{
	if(GetIsPC(GetEnteringObject()))
		RollBalanceCheck(GetEnteringObject());
}

void RollBalanceCheck(object oBalancer)
{
	// First, see if the person is still in the trigger.
	int bStillInTrigger = 0;
	object oInTrigger = GetFirstInPersistentObject(OBJECT_SELF);
	while(GetIsObjectValid(oInTrigger))
	{
		if(oInTrigger == oBalancer)
			bStillInTrigger = 1;
		
		oInTrigger = GetNextInPersistentObject(OBJECT_SELF);
	}
	if(bStillInTrigger == 0) return;
	
	// Next, skill checks (harder when in combat)
	int CheckDC = 5;
	if(GetIsInCombat(oBalancer))
	{
		CheckDC += 10;
	}
	if(!GetIsSkillSuccessful(oBalancer, SKILL_BALANCE, CheckDC, TRUE))
	{
		object oFallTarget = GetWaypointByTag(GetLocalString(OBJECT_SELF, "FALL_DESTINATION"));
		if(d4(1) == 1 && GetIsObjectValid(oFallTarget))
		{
			AssignCommand(oBalancer, ClearAllActions());
			AssignCommand(oBalancer, ActionJumpToLocation(GetLocation(oFallTarget)));
			FloatingTextStringOnCreature(" ** You fall off of the unstable ground, plummeting into the empty space below. ** ", oBalancer);
		}
		else
		{
			FloatingTextStringOnCreature(" ** The unstable ground is too much for you to keep your footing, putting you heavily on your back. ** ", oBalancer);
		}
		DelayCommand(0.1f, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oBalancer, 6.0f));
	}
}