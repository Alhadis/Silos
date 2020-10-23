#include "nw_i0_plotwizard"
int StartingConditional()
{
	int nShow = !GetLocalInt(OBJECT_SELF, "p006began");
	if (nShow)
	{
		SetLocalInt(OBJECT_SELF, "p006began", 1);
		PWSetMinLocalIntPartyPCSpeaker("p006state_Dwarf3", 1);
		PWSetMinLocalIntPartyPCSpeaker("p006state", 1);
	}
	return nShow;
}
