
//0b_audience_hb

//quick and cheap way to get guys to play animations indefinitely: Clapping and laughing.

// DBR 5/31/06

//#include "ginc_math"

void PlayCustomAnimationWrapper(object oAnimator, string sAnim, int bLoop) //return void rules of DelayCommand
{
	PlayCustomAnimation(oAnimator,sAnim, bLoop);
}

void main()
{
	if (GetLocalInt(GetModule(),"Stop Ambient Life"))
	{
		PlayCustomAnimation(OBJECT_SELF,"%",0);
		SetFacingPoint(GetPosition(GetObjectByTag("wp_georg_5")));
		SetEventHandler(OBJECT_SELF,CREATURE_SCRIPT_ON_HEARTBEAT,"");
		return;
	}

	SetFacingPoint(GetPosition(GetObjectByTag("0_ip_bards")));
	int nRandom=Random(7);
	if (nRandom<=1)
	{
		DelayCommand(IntToFloat(Random(3)),PlayCustomAnimationWrapper(OBJECT_SELF,"clapping", 1));
		SoundObjectPlay(GetObjectByTag("0_snd_clap_bard"));
	}
	else if (nRandom==2)
	{
		DelayCommand(IntToFloat(Random(3)),PlayCustomAnimationWrapper(OBJECT_SELF,"laugh", 1));
	}
	else
		PlayCustomAnimation(OBJECT_SELF,"idle", 1);
}