#include "nw_i0_plotwizard"
void main()
{
    SetLocalInt(OBJECT_SELF, "p005began", 1);
    PWSetMinLocalIntPartyPCSpeaker("p005state_bjorg", 2);
    PWSetMinLocalIntPartyPCSpeaker("p005state", 2);
    CreateItemOnObject("KeytotheSewers", GetPCSpeaker());
    PWGiveExperienceParty(GetPCSpeaker(), 50);
}
