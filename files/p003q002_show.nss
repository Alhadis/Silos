#include "nw_i0_plotwizard"
int StartingConditional()
{
	int nShow = !GetLocalInt(OBJECT_SELF, "p003began");
	if (nShow)
	{
		SetLocalInt(OBJECT_SELF, "p003began", 2);
		PWSetMinLocalIntPartyPCSpeaker("p003state_Ronally", 2);
		ChangeToStandardFaction(OBJECT_SELF, STANDARD_FACTION_HOSTILE);
		ActionAttack(GetPCSpeaker());
	}
	return nShow;
}
