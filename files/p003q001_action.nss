#include "nw_i0_plotwizard"
void main()
{
	SetLocalInt(OBJECT_SELF, "p003began", 1);
	PWSetMinLocalIntPartyPCSpeaker("p003state_Dwarf1", 1);
	PWSetMinLocalIntPartyPCSpeaker("p003state", 1);
	PWGiveExperienceParty(GetPCSpeaker(), 100);
}
