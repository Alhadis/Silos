#include "nwk_constants"
#include "war_inc_stun"

void main()
{

/** was on sperate file :Pvpsetlikes , now its joined in.
1. setlikes for party thing.[ver1.5 ommited]
2. heal the player completly.

*/


    object oPlayer=GetEnteringObject();
    //setLikes(oPlayer);     //set the party likes/dislikes ver1.5 ommited
    //make all map visible for player
    ExploreAreaForPlayer(GetArea(oPlayer), oPlayer);
    // in case of map change remove the stun check indication
    DeleteLocalInt ( oPlayer, sStunChecksLeft );
    // remove blocking mutex - set in nwk_enter_team
    DeleteLocalInt ( oPlayer, sMutex );
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(GetMaxHitPoints(oPlayer)), oPlayer);

    if ( ! GetIsDM ( oPlayer ) )
    {
        checkIsRegistered(oPlayer);
    }

}



