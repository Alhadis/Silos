#include "nw_i0_plotwizard"
void main()
{
	SetLocalInt(OBJECT_SELF, "p007began", 1);
	PWSetMinLocalIntPartyPCSpeaker("p007state_NW_KOBOLD004", 1);
	PWSetMinLocalIntPartyPCSpeaker("p007state", 1);
	PWGiveExperienceParty(GetPCSpeaker(), 50);
}
