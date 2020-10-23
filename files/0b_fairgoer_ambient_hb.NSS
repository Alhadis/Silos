//::///////////////////////////////////////////////////////////////////////////
//::
//::	0b_fairgoer_ambient_hb.nss
//::
//::	Just some flava, shooting animations.
//::
//::///////////////////////////////////////////////////////////////////////////
// DBR 3/12/06

void main()
{
	float fDelay,fDuration;
	int nAnimation, nRandom;
	if (Random(10)<3)
		return;
	if (GetLocalInt(GetModule(),"Stop Ambient Life")==0)
	{
		fDelay = IntToFloat(Random(400))/100.0f;
		fDuration = IntToFloat(Random(400)+200)/100.0f;
		nRandom=Random(100);
		if (nRandom<50)
			nAnimation=ANIMATION_LOOPING_TALK_NORMAL;
		else if (nRandom<80)
			nAnimation=ANIMATION_LOOPING_TALK_LAUGHING;
		else if (nRandom<95)
			nAnimation=ANIMATION_FIREFORGET_GREETING;
		else
			nAnimation=ANIMATION_LOOPING_TALK_FORCEFUL;

		DelayCommand(fDelay,PlayAnimation(nAnimation,1.0f,fDuration));

	}
	else
		SetEventHandler(OBJECT_SELF,CREATURE_SCRIPT_ON_HEARTBEAT,"");
}