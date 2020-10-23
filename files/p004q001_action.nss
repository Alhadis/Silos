#include "nw_i0_plotwizard"
void main()
{
	SetLocalInt(OBJECT_SELF, "p004began", 1);
	PWSetMinLocalIntPartyPCSpeaker("p004state_ThuulRoyalGuard", 1);
	PWSetMinLocalIntPartyPCSpeaker("p004state", 1);
	PWGiveExperienceParty(GetPCSpeaker(), 20);
}
