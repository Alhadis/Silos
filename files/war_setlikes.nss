// NWTACTICS by Jhenne (tallonzek@hotmail.com)
// 07/07/02
// SetLikes file, sets the teams to dislike each other.
// code is taken from the Bioware Contest of Champions
// mod.

#include "sr_admin_inc"
#include "nwk_constants"
#include "nwk_party"
void main()
{
    object oPlayer=GetEnteringObject();

    ExploreAreaForPlayer(GetArea(oPlayer), oPlayer);


    //ignore DM
    if ( ! GetIsDM ( oPlayer ) )
    {
        if ( checkIsRegistered(oPlayer) )
        {
            SetActive ( oPlayer );
        }
    }
    else if ( ! GetIsAdmin  ( oPlayer ) )
    {
        WriteTimestampedLogEntry ( "### NWK Admin: Dungeon Master (" +
                                    GetName ( oPlayer ) + ", " +
                                    GetPCIPAddress ( oPlayer ) + ", " +
                                    GetPCPublicCDKey ( oPlayer ) +
                                    ") without administration rights entered area." );

        AssignCommand(oPlayer, ActionJumpToObject(GetObjectByTag("ENTRY_POINT")));
    }
    else
    {
        SetActive ( oPlayer );
    }
}
