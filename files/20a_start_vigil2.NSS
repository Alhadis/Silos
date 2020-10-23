// 20a_start_vigil2

// This is a custom script to be executed upon the death of the Luskan assassins
// in Solace Glade.  Should resurrect Shandra and start a the second vigil conversation.

// EPF 7/12/06
//DS - modified for Bishop's romance

#include "ginc_ipspeaker"

void main()
{
	object oPC = GetOwnedCharacter(GetFactionLeader(GetFirstPC()));
	object oShandra = GetNearestObjectByTag("shandra",oPC);
	object oBishop = GetNearestObjectByTag("bishop",oPC);
	
	if ((GetGender(oPC)==1)&&(GetGlobalInt("P#BishopRomanceInactive")==0))

	{
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(),oBishop);
	CreateIPSpeaker("20_pt_vigil_speak", "20_cs_vigil2", GetLocation(oBishop));
	}
	
	else
	
	{
	ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectResurrection(),oShandra);
	CreateIPSpeaker("20_pt_vigil_speak", "20_cs_vigil2", GetLocation(oShandra));
	}
}