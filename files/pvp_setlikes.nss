// NWTACTICS by Jhenne (tallonzek@hotmail.com)
// 07/07/02
// SetLikes file, sets the teams to dislike each other.
// code is taken from the Bioware Contest of Champions
// mod.

#include "nwk_constants"
void main()
{
/** on ver 1.5 - not needed . done on join/newGroupLeader (nwk_party)
    object oPlayer=GetEnteringObject();
    object oPC=GetFirstPC();
    object Map;
    string sTeam;
    string sSelfTeam = GetLocalString(oPlayer, "team");

    // set the PC's to like their team and dislike the other team.
    while ( GetIsObjectValid(oPC) == TRUE )
    {
        sTeam=GetLocalString(oPC, "team");
        if ( sTeam == sSelfTeam )
        {
            SetPCLike(oPlayer,oPC);
            SetPCLike(oPC,oPlayer);
        }
        else
        {
            SetPCDislike(oPlayer,oPC);
            SetPCDislike(oPC,oPlayer);
        }
        oPC = GetNextPC();
    }

     */
    object oPlayer=GetEnteringObject();

    ExploreAreaForPlayer(GetArea(oPlayer), oPlayer);

    checkIsRegistered(oPlayer);
}
