/** onClinetEnter event to the module
*/

#include "war_inc_stun"
#include "sr_admin_inc"
#include "nwk_constants"
#include "nwk_flag"
#include "nwk_dom_inc"
#include "nwk_const_teams"
#include "sr_mny_trade_inc"
#include "sr_charid_inc"

void main()
{
object oPC=GetEnteringObject();

    WriteTimestampedLogEntry ( "NWK OnClientEnter : playername " + GetPCPlayerName (oPC ) +
                               ", IP-Adress: " + GetPCIPAddress (oPC) );
// server can be crashed by using a very long player name -
string sPlayer = GetName(oPC);
int nLength = GetStringLength ( sPlayer );
if ( nLength > 70 )
{
    // boot him
    WriteTimestampedLogEntry ( "NWK DEBUG : playername has " + IntToString ( nLength ) +
                               " chars." );
    BootPC(oPC);
    return;

}



int nGold = GetGold(oPC);


///////////////////////////////////////////////////
SendMessageToPC(oPC,"Welcome to NWKnights");

int xp_limit=190000;

//moved to OnEnter Event of StartArea to avoid a reported lag baug, which
//results in moved talents from items to chars.
//emptyPc(oPC);

SetXP(oPC, xp_limit);


// check for use of different build with same name (possible shifter bug missues)
if ( ! GetIsSameChar ( oPC ) )
{
    string sLogEntry = "NWK CHEATER: use of same char name for different builds: " +
                "(Key/Name " + GetPCPlayerName(oPC) + "/" + GetName ( oPC ) +
                " - IP " + GetPCIPAddress(oPC) + ")";
    WriteTimestampedLogEntry(sLogEntry);
    SendMessageToPC(oPC,"*** Illegal Character : It is not allowed to play different builds with the same name! Your character will be booted in few seconds!");
    ExecuteScript ( "sr_dump_char", oPC );
    DelayCommand(32.0, BootPC(oPC));
}

//ensure he is not longer stunned, if he is relogging
if ( GetArea ( oPC ) != GetArea ( GetObjectByTag("ENTRY_POINT") ) )
{
    RemoveStunnEffect ( oPC );
}
AssignCommand(oPC, TakeGoldFromCreature ( nGold, oPC, TRUE));
SetPlotFlag ( oPC, FALSE);

DeleteLocalInt(oPC, sAllowedGold);
SetLocalInt(oPC, "kills", FALSE);
SetLocalInt(oPC, "dyingss", FALSE);
SetLocalInt(oPC, "personalscore", FALSE);
SetLocalInt(oPC, "HasGoal", FALSE);
SetLocalInt(oPC, "BonusHP", 0);
SetLocalInt(oPC, ROUND_KILL_STAT, 0);
SetLocalInt(oPC, ROUND_TEAM_STAT, 0);
SetLocalString(oPC, "team", TEAM_NAME_NONE);

//empty throwings weapons
SetLocalInt(oPC,"darts",0);
SetLocalInt(oPC,"throwing_axes",0);
SetLocalInt(oPC,"shurikens",0);
//empty ranged ammo
SetLocalInt(oPC,"arrows",0);
SetLocalInt(oPC,"bolts",0);
SetLocalInt(oPC,"bullets",0);

SetLocalInt(oPC,"king_score",0);
SetLocalInt(oPC,"domination_score",0);

SetLocalInt(oPC,"pc_registered",0);

SetLocalInt(oPC,VARNAME_FLAG_CARRIER_NAME_SILVER,FALSE);
SetLocalInt(oPC,VARNAME_FLAG_CARRIER_NAME_GOLD  ,FALSE);
SetLocalInt(oPC,VARNAME_FLAG_PC_CARRIES_SILVER, FALSE);
SetLocalInt(oPC,VARNAME_FLAG_PC_CARRIES_GOLD, FALSE);
SetLocalInt(oPC, sActivePlayerVar, NO_ACTIVE_PLAYER_STATE);

DeleteLocalInt ( oPC, MARKED_FOR_BOOT );
DeleteLocalInt ( oPC, DOM_DOMINATOR );
DeleteLocalInt ( oPC, sMutex );

//send to entry
AssignCommand(oPC,ActionJumpToObject(GetObjectByTag("ENTRY_POINT")));

//update the going-in flag , so player will not automaticly go to map
SetLocalInt(oPC,"pc_area",0);


if ( GetIsDM ( oPC ) && GetIsAdmin ( oPC ) )
{
    CreateItemOnObject ( "dbg_item", oPC );
}

}

