//::///////////////////////////////////////////////////////////////////////////
//::
//::	20a_cs_vigil2.nss
//::
//::	Insert comment about this file here.
//::
//::///////////////////////////////////////////////////////////////////////////
//::
//::	Created by: Brian Fox
//::	Created on: 9/25/05
//::
//::///////////////////////////////////////////////////////////////////////////
//DS: Edited to switch Shandra to Bishop
///////////////////////////////////////////////////////////////////////////////

#include "ginc_param_const"
#include "20_inc"
//::///////////////////////////////////////////////////////////////////////////

const string SPONSOR_SP_TAG = "wp_spawn_knight";
	
void MyPlayAnim(object oCreature, string sAnim, int bLoop)
{
	PlayCustomAnimation(oCreature,sAnim,bLoop);
}

void main( int nChoice )
{
	object oPC = GetPCSpeaker();
	object oBishop = GetTarget("bishop");
	string sSponsorTag = GetGlobalInt("gbWatch") ? GRAYSON_TAG : EDMUND_TAG;
	object oThug;

	switch( nChoice )
	{
		case 10:
			AssignCommand(GetNearestObjectByTag(sSponsorTag,oPC),JumpToObject(GetTarget(SPONSOR_SP_TAG)));
			ShowSponsor(oPC);
			break;
		case 20:	//shandra goes and picks up the ring
			oThug = GetNearestObjectByTag("20_luskviglead");			
			if(GetIsObjectValid(oThug))
			{
				//if we think shandra will make it to the body in a timely fashion, have
				//her do a "picking up" animation to get the ring.
				if(GetDistanceBetween(oBishop,oThug) < 4.f)
				{
					PlayCustomAnimation(oBishop,"getground",FALSE);				
				}
				else
				{		
					AssignCommand(oBishop, ActionMoveToObject(oThug,FALSE,0.f));
				}
			}
			break;
		case 30:	//shandra dusts off after the fight
			PlayCustomAnimation(oBishop, "dustoff",FALSE);
			break;
		case 40:	//unhide and then despawn shandra
			SetScriptHidden(oBishop,FALSE);
			DespawnRosterMember("bishop");
			break;
		case 50:
			RemoveRosterMemberFromParty("bishop",oPC,FALSE);
			break;
	}
}