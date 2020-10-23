/** nwk_flag
    file that includes general flag related functions and constants
*/

///////////////// constants  //////////////////////
#include "nwk_constants"
#include "nwk_colors"

//please do not change the variables names cause some of the methods still
//use the hard-coded values!!!
//module variables
//keys
const string VARNAME_FLAG_TAKEN_SILVER = "silverflagtaken";
const string VARNAME_FLAG_TAKEN_GOLD = "goldflagtaken";
//values
const int FLAG_ON_THE_GROUND_AT_BASE = 0;
const int FLAG_ON_THE_GROUND_AT_BATTLE = 2;
const int FLAG_ON_PLAYER = 1;

//keys . values are the character name
const string VARNAME_FLAG_CARRIER_NAME_SILVER = "flagCarrierNameSilver";
const string VARNAME_FLAG_CARRIER_NAME_GOLD = "flagCarrierNameGold";




// player variables
//keys , values are TRUE=1 and FALSE=0
string VARNAME_FLAG_PC_CARRIES_SILVER= "hassilverflag" ;
string VARNAME_FLAG_PC_CARRIES_GOLD = "hasgoldflag";


int GetHasFlag ( object oPC )
{

    return GetLocalInt ( oPC, VARNAME_FLAG_PC_CARRIES_SILVER ) ||
           GetLocalInt ( oPC, VARNAME_FLAG_PC_CARRIES_GOLD );
}


string getVarNameOfModuleFlagCarrierName(int iTeamIndicator)
{
    if (iTeamIndicator == TEAM_SILVER)
        return VARNAME_FLAG_CARRIER_NAME_SILVER;
    else if (iTeamIndicator == TEAM_GOLD)
        return VARNAME_FLAG_CARRIER_NAME_GOLD;
    else
    {
        SpeakString("ERROR DETECTED: nwk_flag:getVarNameOfModuleFlagCarrierName() got an"
                + " invalid parameter : iTeamIndicator = "
                + IntToString(iTeamIndicator)
                );
        return "";
    }


}




string getVarNameOfModuleFlagTaken(int iTeamIndicator)
{
    if (iTeamIndicator == TEAM_SILVER)
        return VARNAME_FLAG_TAKEN_SILVER;
    else if (iTeamIndicator == TEAM_GOLD)
        return VARNAME_FLAG_TAKEN_GOLD;
    else
    {
        SpeakString("ERROR DETECTED: nwk_flag:getVarNameOfModuleFlagTaken() got an"
                + " invalid parameter : iTeamIndicator = "
                + IntToString(iTeamIndicator)
                );
        return "";
    }
}






int nwk_flag_team_bonus()   {return 1;}
int nwk_flag_player_bonus() {return 2;}
int nwk_flag_win_points()   {return 5;}
int nwk_flag_close_to_end() {return 4;}


string nwk_silver_flag_tag()        { return "GoldenFlameFlag";}   //the silver team steals the golden one.
string nwk_gold_flag_tag()          { return "SilveryIceFlag";}

string nwk_silver_base_flag_location_tag()  { return mapFullTagName ("WP_FLAG_SILVER");}
string nwk_gold_base_flag_location_tag()    { return mapFullTagName ("WP_FLAG_GOLD");}

string nwk_silver_flag_resref()              {  return "flag_gold";}
string nwk_gold_flag_resref()               {  return "silverflag";}

int nwk_stopper_upper_limit()           {return 30;}





string getFlagResRefByTeam(int iTeamIndicator)
{
    if (iTeamIndicator == TEAM_GOLD)
    {
       return nwk_gold_flag_resref();
    }
    else if ( iTeamIndicator == TEAM_SILVER)
    {
       return nwk_silver_flag_resref();
    }
    else   //should never never happen
    {
        SpeakString("ERROR DETECTED: nwk_flag:getFlagResRefByTeam() got an"
                + " invalid parameter : iTeamIndicator = "
                + IntToString(iTeamIndicator)
                );
        return "";
    }
}







/**
 * when players that has the flag leaves/dies , the flag is created on the floor
 * next to him. it can be picked up only by players of his team. If they do
 * not manage to do so in X seconds , the flag disappers and reappear at start
 * point.
 */
void createFallenFlag(object oPlayer)
{
string silver_flag_tag=nwk_silver_flag_tag();
string gold_flag_tag=nwk_gold_flag_tag();

string silver_flag_resref=nwk_silver_flag_resref();
string gold_flag_resref=nwk_gold_flag_resref();

int stopper_upper_limit=nwk_stopper_upper_limit();

// test the PC for flags
int nSilverFlag = GetLocalInt ( oPlayer, "hassilverflag");
int nGoldFlag = GetLocalInt   ( oPlayer, "hasgoldflag");

object oFlag;
location lPlayer = GetLocation (oPlayer);
effect eEffect;


string messageSuffix = " : Flag Dropped.\n Flag Carrier : " + GetName(oPlayer) + "";
string fullMessage;
// if he had the gold the flag, create one on the floor
if (nGoldFlag ==1)
{
  DeleteLocalInt(oPlayer, "hasgoldflag"); //he doesn`t have it anymore
  CreateObject (OBJECT_TYPE_PLACEABLE, gold_flag_resref, lPlayer, FALSE);
  SetLocalInt(GetModule(), "goldflagtaken", FLAG_ON_THE_GROUND_AT_BATTLE);
  SetLocalInt(GetModule(), "gold_flag_stopper",stopper_upper_limit);
  ExecuteScript("flag_heartonflag",GetObjectByTag(gold_flag_tag));
  fullMessage= longTeamName(TEAM_NAME_GOLD)+ messageSuffix;
}
else if (nSilverFlag == 1)
{
    DeleteLocalInt(oPlayer, "hassilverflag"); //he doesn`t have it anymore
    CreateObject (OBJECT_TYPE_PLACEABLE, silver_flag_resref, lPlayer, FALSE);
    SetLocalInt(GetModule(), "silverflagtaken", FLAG_ON_THE_GROUND_AT_BATTLE);
    SetLocalInt(GetModule(), "silver_flag_stopper",stopper_upper_limit);
    ExecuteScript("flag_heartonflag",GetObjectByTag(silver_flag_tag));
    fullMessage= longTeamName(TEAM_NAME_SILVER)+ messageSuffix ;
}

   sendMessageToAllPlayer("",ColorString(fullMessage,COLOR_BLUE));



}


/**
 * creates the flag on the floor at the wanted location. also inits the module
 * variable of flag taken
 */
void createFlagOnFloor(int iTeamIndicator , location lDest)
{
        CreateObject(OBJECT_TYPE_PLACEABLE,
                     getFlagResRefByTeam(iTeamIndicator),
                     lDest,
                     FALSE);
        //change status back to zero (flag in base)
        SetLocalInt(GetModule(),
                    getVarNameOfModuleFlagTaken(iTeamIndicator),
                    FLAG_ON_THE_GROUND_AT_BASE
                    );
        DeleteLocalString (GetModule(), getVarNameOfModuleFlagTaken(iTeamIndicator) );
}




void removeFlagEffectFromPC(object oPC)
{
   effect eEffect = GetFirstEffect(oPC);
   int type;

   while ( GetIsEffectValid(eEffect) == TRUE )
    {

      if ((GetEffectSubType(eEffect)==SUBTYPE_EXTRAORDINARY)&&
            (GetEffectType(eEffect)!=EFFECT_TYPE_ULTRAVISION)) //for MVP effect
                                                                //linked with Ultra
               RemoveEffect(oPC,eEffect);

        eEffect = GetNextEffect(oPC);
    }
}








/**
 * deletes the variables and the flag effects from all players.
 * for each PC , 1. init local var. 2. delete effect
 * will be used on end of flag map.
 * ATTENTION: IT DOES NOT SAY WHO HAD THE FLAG. THIS INFO WILL BE LOST.
 */
void deleteFlagFromAllPlayers()
{
    object oPC = GetFirstPC();
    int currentPlayerHadFlag;
    while (GetIsObjectValid(oPC))
    {
        currentPlayerHadFlag= FALSE;
        if (GetLocalInt(oPC,VARNAME_FLAG_PC_CARRIES_SILVER))
        {
            currentPlayerHadFlag= TRUE;
            SetLocalInt(oPC,VARNAME_FLAG_PC_CARRIES_SILVER,FALSE);
        }
        if (GetLocalInt(oPC,VARNAME_FLAG_PC_CARRIES_GOLD))
        {
            SetLocalInt(oPC,VARNAME_FLAG_PC_CARRIES_GOLD,FALSE);
            currentPlayerHadFlag= TRUE;
        }

        if (currentPlayerHadFlag)
        {
            //delete flag effects
            removeFlagEffectFromPC(oPC);

        }

        //goto next pc
        oPC= GetNextPC();
    }
}


void takeFlagByPC(object oPC,int iTeamIndicator)
{
    string playerName = GetName(oPC);
    string varNameCarrier = getVarNameOfModuleFlagCarrierName( iTeamIndicator);

    SetLocalString(GetModule(),varNameCarrier,playerName);
    sendMessageToAllPlayer("",ColorString(""+longTeamNameByInt(iTeamIndicator)
                + " : Flag Captured.\n Flag Carrier: " + playerName,COLOR_BLUE));
}


 string getFlagsStatusReportByTeam(int iTeamIndicator)
{
    string message=""+longTeamNameByInt(iTeamIndicator)+ " Flag ";
    object module = GetModule();
    int flagTakenStatus =  GetLocalInt(module, getVarNameOfModuleFlagTaken(iTeamIndicator));

    if ( flagTakenStatus == FLAG_ON_THE_GROUND_AT_BASE)
    {
        message += "is now at start position.";
    }
    else if  ( flagTakenStatus == FLAG_ON_THE_GROUND_AT_BATTLE)
    {
        message += "has fallen in the battlefield , counting down.";
    }
    else if (flagTakenStatus == FLAG_ON_PLAYER)
    {
        message += "is carried by:"
                + GetLocalString(module, getVarNameOfModuleFlagCarrierName(iTeamIndicator))
                +" .";
    }
    return message;
}

 string getFlagsStatusReport()
 {
    string message = " Flag Battle Status: \n";
    message+= getFlagsStatusReportByTeam(TEAM_SILVER);
    message+= "\n" +getFlagsStatusReportByTeam(TEAM_GOLD);
    return message;
 }

void sendVictoryMessagesToAllPlayers(int iTeamIndicator,object oPlayer)
{
    string message = ""+longTeamNameByInt(iTeamIndicator) +
        " : Flag Delivered.\n Flag Carrier: "+GetName(oPlayer);
    sendMessageToAllPlayer("",ColorString(message,COLOR_BLUE));

}


// if flag is carried apply hide and move silent malus again
void ApplySDMalus ( object oPC )
{
    if ( GetHasFlag ( oPC ) )
    {
        //change silent/hide to minus great + remove invisibility and sanctuary
        int skill=GetSkillRank ( SKILL_MOVE_SILENTLY, oPC );
        effect silent_decrease = EffectSkillDecrease ( SKILL_MOVE_SILENTLY, skill );
        silent_decrease=ExtraordinaryEffect(silent_decrease);
        ApplyEffectToObject ( DURATION_TYPE_PERMANENT, silent_decrease, oPC );

        int nSkillHide = GetSkillRank ( SKILL_HIDE , oPC );
        if ( nSkillHide > 50 )
        {
            RemoveEffectsFromSpell ( oPC, SPELL_MASS_CAMOFLAGE );
            RemoveEffectsFromSpell ( oPC, SPELL_CAMOFLAGE );
            RemoveEffectsFromSpell ( oPC, SPELL_ONE_WITH_THE_LAND );
        }
        effect hide_decrease=   EffectSkillDecrease ( SKILL_HIDE, nSkillHide );
        hide_decrease = ExtraordinaryEffect ( hide_decrease );
        ApplyEffectToObject ( DURATION_TYPE_PERMANENT,hide_decrease, oPC );
    }
}
