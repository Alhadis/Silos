//////////////////////////////////////////////////////////////////////////////////
/*	Fired by tar02_sithguard.dlg in tar_m02ab (Taris Upper City North).
	
	One of two starting conditionals in the Lower City elevator guard's DLG that
	checks if the party is disguised. The original only checked for a single
	disguise, but this has been changed to check the entire party (which in
	reality can only be the player and Carth at this point).
	
	See also k_ptar_disguard.
	
	Based in part on JC's Sand People disguise fix code for K1CP:
	https://github.com/KOTORCommunityPatches/K1_Community_Patch/blob/master/Source/cp_inc_tat.nss
	
	Updated 2019-11-28 to switch to the correct script name. Thanks to A Future
	Pilot for pointing out the issue.
	
	DP 2019-09-24																*/
//////////////////////////////////////////////////////////////////////////////////

#include "k_inc_utility"

int PartyWearingSithArmor() {
	
	object oPM0 = GetPartyMemberByIndex(0);
	object oPM1 = GetPartyMemberByIndex(1);
	object oPM2 = GetPartyMemberByIndex(2);
	string sDisguise = "ptar_sitharmor";
	int nCheck0 = FALSE;
	int nCheck1 = FALSE;
	int nCheck2 = FALSE;
	
	if (GetTag(oPM0) == "T3M4" || GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM0)) == sDisguise)
		{
			nCheck0 = TRUE;
		}
	
	if (!GetIsObjectValid(oPM1) || GetTag(oPM1) == "T3M4" || GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM1)) == sDisguise)
		{
			nCheck1 = TRUE;
		}
	
	if (!GetIsObjectValid(oPM2) || GetTag(oPM2) == "T3M4" || GetTag(GetItemInSlot(INVENTORY_SLOT_BODY, oPM2)) == sDisguise)
		{
			nCheck2 = TRUE;
		}
	
	if (nCheck0 == TRUE && nCheck1 == TRUE && nCheck2 == TRUE)
		{
			return(TRUE);
		}
		else
			{
				return(FALSE);
			}
}

int StartingConditional() {
	return (PartyWearingSithArmor());
}
