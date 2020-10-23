// NWTACTICS by Jhenne (tallonzek@hotmail.com)
// 07/07/02
// King of the Hill Script by Mike Donais(mike_donais@yahoo.com)
// Who ever is closest to the object with this script on it gains 2 points every 15 seconds or so.
// Put this scipt on an object on top of a hill or at some similar objective (on_heartbeat)
// For Bigger hills change the Cube size (2 places in code)




#include "nwk_king"
#include "nwk_team_onscore"



void main()
{
    int map_number = GetLocalInt(GetModule(),"map_number");
  //  SpeakString("ME HERE >ME HERE GOOT",TALKVOLUME_SHOUT);
if (!(MAP_TYPE_KING==getMapType(map_number)))
    return;


 object oChair =OBJECT_SELF;
 object oKing=GetSittingCreature(oChair);


/** Pentagon
    To kill an intersting bug which happened on logging of when dead and sitting
    on the chair . (chair stopped counting)
    We have a fail safe mechanism. On used a variable is set on the chair.
    on sit HB detection , we reset it.
    if there are 5 uses , and no sitter , we check that ther aint a sitter now
    and destroy and recreate the thrown.
    We must be very carefull not to destroy a chair while a char is on it , it
    will give the char a permenant saddle posture.

*/
 int usedCounter = GetLocalInt(oChair,VARNAME_USE_COUNTER);
 if ((usedCounter>4)&&(!GetIsObjectValid(oKing)))
 {
      //destroy and recreate
       DestroyMultipleObjects("KingShaftofLightWhite",0.0);
       DestroyMultipleObjects("KingShaftofLightOrange",0.0);
       SetLocalInt(oChair,VARNAME_USE_COUNTER,0);
       SpeakString("Destroying and re-creating Thrown");
       DestroyMultipleObjects( "ThroneGood" + IntToString ( map_number ), 0.0 );
       CreateObject(OBJECT_TYPE_PLACEABLE,
                "thronegood",  //resref- this is only the for throne3
                GetLocation ( GetObjectByTag( mapFullTagName ( "Throne" ) ) ),
                FALSE,
                "ThroneGood" + IntToString ( map_number ));


 }

/* shifted to OnDeathEvent
//destroy all effects (including sitting).  BUG exist here if he is dead and logging
//off
if (GetIsDead(oKing))
{
    ExecuteScript("nw_o0_respawn",oKing);
    DestroyMultipleObjects("KingShaftofLightWhite",0.0);
    DestroyMultipleObjects("KingShaftofLightOrange",0.0);
    return;
}
*/



    if (!GetIsObjectValid(oKing))
    {
       DestroyMultipleObjects("KingShaftofLightWhite",0.0);
       DestroyMultipleObjects("KingShaftofLightOrange",0.0);
       return;
    }



    //someone must sit   , so zero counter
     SetLocalInt(oChair,VARNAME_USE_COUNTER,0);

    ApplyKingNerfs ( oKing );



////////////////////////////////////////////////////////////////////////////////
// give trophy to player on each 10 points. This does not change team points  ///
////////////////////////////////////////////////////////////////////////////////

    int  player_king_score= 1 + GetLocalInt(oKing,"king_score");

    //give him trophy every nwk_king_trophy_points()
    int trophy_points=nwk_king_trophy_points() ;
    if (player_king_score>=trophy_points)
    {
        int oScore = GetLocalInt(oKing, "personalscore");
        player_king_score=0;
        oScore+=nwk_king_player_bonus();
        object oTrophy = CreateItemOnObject ("Trophy", oKing);

        SetLocalInt(oKing, "personalscore", oScore);
        calcuateMvp(oKing);
    }
    else
        SendMessageToPC(oKing,"Team point will be reached in "+IntToString(trophy_points-player_king_score));


    ////////////////////////////////////////////////////////////////////////////////
        executeOnTeamPoint( oKing,
                        nwk_king_win_points() ,
                        nwk_king_team_bonus() ,
                        KING_BROADCAST_EVERY_POINT_AMOUT
                      ) ;

     ////////////////////////////////////////////////////////////////////////////////

    //save king points on player
    SetLocalInt(oKing, "king_score", player_king_score);
}


