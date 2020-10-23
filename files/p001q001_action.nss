#include "nw_i0_plotwizard"
void main()
{
    SetLocalInt(OBJECT_SELF, "p001began", 1);
    PWSetMinLocalIntPartyPCSpeaker("p001state_Kinggolan", 1);
    PWSetMinLocalIntPartyPCSpeaker("p001state", 1);
    PWGiveExperienceParty(GetPCSpeaker(), 100);
}
