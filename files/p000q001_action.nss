#include "nw_i0_plotwizard"
void main()
{
    SetLocalInt(OBJECT_SELF, "p000began", 1);
    PWSetMinLocalIntPartyPCSpeaker("p000state_Dwarf2", 1);
    PWSetMinLocalIntPartyPCSpeaker("p000state", 1);
    PWGiveExperienceParty(GetPCSpeaker(), 25);
}
