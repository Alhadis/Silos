#include "nw_i0_plotwizard"
void main()
{
	SetLocalInt(OBJECT_SELF, "p002began", 1);
	PWSetMinLocalIntPartyPCSpeaker("p002state_crier", 1);
	PWSetMinLocalIntPartyPCSpeaker("p002state", 1);
	PWGiveExperienceParty(GetPCSpeaker(), 25);
}
