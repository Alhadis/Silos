// 11_a_rmv_bevil
//
// Remove Bevil from the party and the roster.  Player won't be able to use him anymore.
// BMA-OEI 11/17/05
	
void main()
{
	object oPC = GetPCSpeaker();
	
	RemoveRosterMemberFromParty("bevil", oPC);
	RemoveRosterMember("bevil");
}