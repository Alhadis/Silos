/*
  author: shadow_in_the_dark / nwknight2
  name:   nwk_team_onscore

  1. provides functionality to handle game points
     - scoring
     - win descision
     - initiate map change
  2. provides history of last 2 scores to initiate team shuffle
     - if one team scores a configurable number of times in row and
     - each score difference is higher than a configurable value in %
     - than shuffle teams randomly


*/
#include "nwk_constants"
#include "nwk_colors"
#include "nwk_maps"
#include "nwk_math"
#include "nwk_party"

// number of entries in the team win history
const int WINING_TEAM_HISTORY_ENTRIES = 2;
// score difference necessary to count
const int nMinScoreDiff = 50;

const string VARNAME_TEAM_SCORE_SILVER = "silverscore";
const string VARNAME_TEAM_SCORE_GOLD = "goldscore";

// Set history value for last winning team
// Params:
// - sTeam     : Team name constant
// - nScoreDiff: score difference in percent
void SetWinningTeamHistory ( string sTeam, int nScoreDiff );

//clear the winning team history
void ClearWinningTeamHistory ( );

// check if requirements for team shuffle are fullfilled
int GetIsShuffleAdmitted ();

string getVarNameTeamScore(int team)
{
    if (team==TEAM_SILVER)
        return VARNAME_TEAM_SCORE_SILVER;
    else if (team==TEAM_GOLD)
        return VARNAME_TEAM_SCORE_GOLD;
    else
    {
        SpeakString("nwk_team_onscore.getVarnameTeamScore() parametr error."
                    +" got:" + IntToString(team)
                    ,TALKVOLUME_SHOUT);
        return "";
    }
}


void playWinRegularSound()  //used in war_sound_win script
{
   PlaySound("vs_naribetf_vict"); //Bleesed light , this is a fine thing
   PlaySound("as_pl_prisinmob1"); //(crowd)hail  ,horeey (not too clear)
}

void playLooseRegularSound()   //used in war_sound_loose script
{
   PlaySound("as_pl_tauntingf1"); //Get some sense , take a look at yourself
   PlaySound("as_pl_comtntgrp1"); //not so hail (crowd)
}

void playLooseNearEndSound()    //used in war_sound_end
{
   PlaySound("as_pl_evanglstm2"); //it is all over, the end comes swiftly
}

const string SCRIPT_NAME_SOUND_WIN_REGULAR = "war_sound_win";
const string SCRIPT_NAME_SOUND_LOOSE_REGULAR =  "war_sound_loose";
const string SCRIPT_NAME_SOUND_LOOSE_NEAR_END = "war_sound_end" ;




/**
 * 1. advance the team score
 * 2. loop over all PCs . For each one :
 * 2.1 message about the score
 * 2.2 play sound win/loose/loose-close-to-end
 * 3.if ther is a win , change maps
 */
void executeOnTeamPoint( object scorerPC,
                         int winPointThreshold ,    //onking  = 100
                         int teamPointsBonusPerScore, //inking = 1
                         int broadcastEveryPointAmount
                       )
{
    string scorerTeam = GetLocalString(scorerPC , "team");

    // update team points by teamPointsBonusPerScore
    string scorerTeamVarName = getVarNameTeamScore(getIntbyTeamName(scorerTeam)) ;
    int scorerTeamPoints = GetLocalInt(GetModule(), scorerTeamVarName);
    scorerTeamPoints +=teamPointsBonusPerScore;
    SetLocalInt(GetModule(), scorerTeamVarName, scorerTeamPoints);
    // round statistic
    SetLocalInt ( scorerPC, ROUND_TEAM_STAT, GetLocalInt ( scorerPC, ROUND_TEAM_STAT ) + teamPointsBonusPerScore );

    //preapre the name of the sound scripts , one for winner , one for looser
    //the losser can be regular or close-to-end  sounds
    string scriptNameForSoundOfWinner = SCRIPT_NAME_SOUND_WIN_REGULAR;
    string scriptNameForSoundofLooser;
    string prefixBattleState ;
    //check if we are close to the battle end
    if (scorerTeamPoints >=  winPointThreshold*4/5 )
    {
        scriptNameForSoundofLooser = SCRIPT_NAME_SOUND_LOOSE_NEAR_END;
        prefixBattleState= "The end of battle is close! \n";
        SetWeather(GetModule(),WEATHER_SNOW);   //by the way , some visual effects
    }
    else
    {
         scriptNameForSoundofLooser = SCRIPT_NAME_SOUND_LOOSE_REGULAR;
         prefixBattleState="";
    }


    //broadcast only if we should . only in every broadcastEveryPointAmount
    int reminder=mod(scorerTeamPoints,broadcastEveryPointAmount);
    if (reminder==0)
    {
        string fullMessage;


        int nSilverScore =  GetLocalInt(GetModule(), VARNAME_TEAM_SCORE_SILVER);
        int nGoldScore =    GetLocalInt(GetModule(), VARNAME_TEAM_SCORE_GOLD);


        fullMessage=prefixBattleState + GetName(scorerPC) +" scores for " + longTeamName(scorerTeam)
                   +"\nSilveryIce  : "+IntToString(nSilverScore)+" points"
                   +"\nGoldenFlame : "+IntToString(nGoldScore)  +" points" ;



        object oPC = GetFirstPC();
        while (GetIsObjectValid(oPC))
        {
            //send message , in blue
            AssignCommand(oPC,SpeakString(ColorString(fullMessage,COLOR_BLUE),TALKVOLUME_WHISPER));

            //send sound
            if (GetLocalString(oPC , "team")==scorerTeam)
            {
               AssignCommand(oPC,ExecuteScript(scriptNameForSoundOfWinner,oPC));
            }
            else
            {
               AssignCommand(oPC,ExecuteScript(scriptNameForSoundofLooser,oPC));
            }

            oPC = GetNextPC ();
        }
   }   //end of:    if (reminder==0)






    // if the score is equal or above the winning points restart the game.
    if (scorerTeamPoints >= winPointThreshold)
    {
        int looserTeamPoints;
        if ( scorerTeam == TEAM_NAME_SILVER ) looserTeamPoints = GetLocalInt ( GetModule (), VARNAME_TEAM_SCORE_GOLD );
        if ( scorerTeam == TEAM_NAME_GOLD ) looserTeamPoints = GetLocalInt ( GetModule (), VARNAME_TEAM_SCORE_SILVER );
        //initialise global module variables back to default
        SetLocalInt(GetModule(),VARNAME_TEAM_SCORE_SILVER  ,0);
        SetLocalInt(GetModule(),VARNAME_TEAM_SCORE_GOLD  ,0);
        //initialise global module variables back to default (for flag)
        SetLocalInt(GetModule(),"silverflagtaken",0);
        SetLocalInt(GetModule(),"goldflagtaken"  ,0);
        // set the value for the history
        SetWinningTeamHistory ( scorerTeam,  FloatToInt ( IntToFloat ( scorerTeamPoints - looserTeamPoints ) / IntToFloat ( winPointThreshold ) * 100.0 )  );
        // shuffle team if admitted
        object oAllPc = GetFirstPC ();
        while ( GetIsObjectValid ( oAllPc ) )
        {
            SetWinningTeam ( oAllPc, scorerTeam );
            oAllPc = GetNextPC ();
        }
        if ( GetIsShuffleAdmitted () )
        {
            ClearWinningTeamHistory ();
            ShuffleTeams ();
        }
        // change map
        DelayCommand ( 5.0, AssignCommand ( GetModule (), changeMaps(scorerTeam)));


    }



}

// used to provide a history of last winning teams
// used for team name (string) and score difference in percent
// only prefix part, extended by entry position
const string WINNING_TEAM_HISTORY = "sr_win_team_hist_";



int GetWinningTeamScore ( int nPos )
{

    if ( nPos < 1 || nPos > WINING_TEAM_HISTORY_ENTRIES )
    {
        WriteTimestampedLogEntry ( "** ERROR nwk_team_onscore | GetWinningTeamScore : invalid history position" );
        return 0;
    }
    return GetLocalInt ( GetModule (),
                         WINNING_TEAM_HISTORY + IntToString ( nPos ) );
}

string GetWinningTeamName ( int nPos )
{
    if ( nPos < 1 || nPos > WINING_TEAM_HISTORY_ENTRIES )
    {
        WriteTimestampedLogEntry ( "** ERROR nwk_team_onscore | GetWinningTeamName : invalid history position" );
        return TEAM_NAME_NONE;
    }
    return GetLocalString ( GetModule (),
                            WINNING_TEAM_HISTORY + IntToString ( nPos ) );
}

void SetWinningTeamScore ( int nPos, int nScoreDiff )
{
    if ( nPos < 1 || nPos > WINING_TEAM_HISTORY_ENTRIES )
    {
        WriteTimestampedLogEntry ( "** ERROR nwk_team_onscore | SetWinningTeamScore : invalid history position" );
    }
        SetLocalInt ( GetModule (),
                      WINNING_TEAM_HISTORY + IntToString ( nPos ),
                      nScoreDiff );

}

void SetWinningTeamName ( int nPos, string sTeam )
{
    if ( nPos < 1 || nPos > WINING_TEAM_HISTORY_ENTRIES )
    {
        WriteTimestampedLogEntry ( "** ERROR nwk_team_onscore | SetWinningTeamName : invalid history position" );
    }
        SetLocalString ( GetModule (),
                         WINNING_TEAM_HISTORY + IntToString ( nPos ),
                         sTeam );

}

//move old values one position down in the history
//supports WINING_TEAM_HISTORY_ENTRIES history entries
void SetWinningTeamHistory ( string sTeam, int nScoreDiff )
{
    // move history
    int Iterator;
    for ( Iterator = WINING_TEAM_HISTORY_ENTRIES; Iterator > 1; Iterator-- )
    {
        SetWinningTeamName ( Iterator, GetWinningTeamName ( Iterator - 1 ) );
        SetWinningTeamScore ( Iterator, GetWinningTeamScore ( Iterator - 1 ));
        WriteTimestampedLogEntry ( "** DEBUG: WinningTeamHistory ( " +
                                    IntToString ( Iterator ) + " ) " +
                                    " = " +
                                    GetWinningTeamName ( Iterator ) +
                                    " / " +
                                    IntToString ( GetWinningTeamScore ( Iterator ) ) );
    }
    // set new values on top
    SetWinningTeamName ( 1, sTeam );
    SetWinningTeamScore ( 1, nScoreDiff );
    WriteTimestampedLogEntry ( "** DEBUG: WinningTeamHistory ( " +
                                IntToString ( 1 ) + " ) " +
                                " = " +
                                GetWinningTeamName ( Iterator ) +
                                " / " +
                                IntToString ( GetWinningTeamScore ( 1 ) ) );

}


void ClearWinningTeamHistory ( )
{
    int Iterator;
    for ( Iterator = 1; Iterator <= WINING_TEAM_HISTORY_ENTRIES; Iterator++ )
    {
        SetWinningTeamName ( Iterator, TEAM_NAME_NONE );
        SetWinningTeamScore ( Iterator, 0 );
    }

}

int GetIsShuffleAdmitted ()
{

    int bResult = TRUE;
    // if bResult becomes FALSE there is no way to return TRUE any longer
    string sTeam = GetWinningTeamName ( 1 );
    bResult = ( GetWinningTeamScore ( 1 ) >= nMinScoreDiff );
    int Iterator;
    for ( Iterator = 1; Iterator <= WINING_TEAM_HISTORY_ENTRIES; Iterator++ )
    {
        bResult = ( GetWinningTeamName ( Iterator ) == sTeam ) && bResult;
        bResult = ( GetWinningTeamScore ( Iterator )  >= nMinScoreDiff ) && bResult;
    }


    return bResult;

}
//void main (){}
