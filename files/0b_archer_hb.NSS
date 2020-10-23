
//0b_archer_hb

//quick and cheap way to get guys to play animations indefinitely: Attacking the archery targets

// DBR 5/31/06

void AttackTargetForever(object oTarget)
{
	if (GetNumActions(OBJECT_SELF)>0)
		return;
	if (!IsInConversation(OBJECT_SELF))
	{
		ActionForceMoveToLocation(GetLocalLocation(OBJECT_SELF,"HomeBase"));
		ActionAttack(oTarget);
		//DelayCommand(6.0f, ClearAllActions(TRUE));
	}
}


void main()
{
	if (GetLocalInt(OBJECT_SELF,"Initialized")==0)
	{
		SetLocalLocation(OBJECT_SELF,"HomeBase",GetLocation(OBJECT_SELF));
		if (GetTag(OBJECT_SELF)=="0_archer_1")
			SetLocalObject(OBJECT_SELF,"Target",GetObjectByTag("0_archer_target_1"));
		else
			SetLocalObject(OBJECT_SELF,"Target",GetObjectByTag("0_archer_target_2"));
		SetLocalInt(OBJECT_SELF,"Initialized",1);			
	}
	AttackTargetForever(GetLocalObject(OBJECT_SELF,"Target"));
}