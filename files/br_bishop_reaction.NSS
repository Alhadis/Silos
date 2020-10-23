#include "ginc_param_const"
#include "ginc_group"
#include "ginc_transition"

void ShandraReaction(object oBishop, string sAnim, int bLooping = FALSE, float fDelay = 2.2f, int bScream = FALSE)
{

	if(bScream)
	{
		int nSound = GetLocalInt(OBJECT_SELF, "nShandraReaction");
		SetLocalInt(OBJECT_SELF, "nShandraReaction",++nSound);
		
		object oSound = GetNearestObjectByTag("26_sfx_shandra_scream" + IntToString(nSound));
		DelayCommand(1.0,SoundObjectPlay(oSound));
	}
	
	PlayCustomAnimation(oBishop,"idleinj",1,1.0);
}

void ShandraCollapses(object oBishop)
{
	PlayCustomAnimation(oBishop, "%", FALSE);
	ShandraReaction(oBishop, "collapseb", FALSE, 0.2f);
	ShandraReaction(oBishop, "proneb", TRUE, 0.8f);
	SetLocalInt(oBishop,"bProne",TRUE);
	
	object oSound = GetNearestObjectByTag("26_sfx_shandra_knee_hit");
	DelayCommand(1.f, SoundObjectPlay(oSound));
	oSound = GetNearestObjectByTag("26_sfx_shandra_collapse");
	DelayCommand(1.8, SoundObjectPlay(oSound));
}

void main( int nChoice )
{
	object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
	object oBishop = GetObjectByTag("bishop");

	switch( nChoice )
	{
		case 1:	//make shandra look injured and sad
			PlayCustomAnimation(oBishop,"idleinj",TRUE);
			break;


			break;
		case 51:	//shandra tries to get to her feet
//			ShandraReaction(oBishop, "kneelup",FALSE,0.f);
			ShandraReaction(oBishop, "%",FALSE,0.f);
			ShandraReaction(oBishop, "idleinj",TRUE,0.3f);
			
			break;		
			case 80:	//shandra collapses
			AssignCutsceneActionToObject(oPC, ShandraCollapses(oBishop));
			break;
					
	}
}
