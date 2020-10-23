//::///////////////////////////////////////////////
//:: Death Script
//:: NW_O0_DEATH.NSS
//:: Copyright (c) 2001 Bioware Corp.

//#include "nwk_constants"
#include "nwk_flag"
#include "nwk_ball"
#include "nwk_constants"
#include "nwk_king"
#include "nwk_mvp"
#include "war_inc_stun"
#include "sr_inc_shifter"




/*#"nwk_mvp" is in "nwk_ball" in it too*/


void Raise(object oPlayer)
{
        SetLocalInt (oPlayer, "acgiven", FALSE);
        SetLocalInt (oPlayer, "wpgiven", FALSE);
        DeleteLocalInt ( oPlayer, sStunChecksLeft );
        effect eBad = GetFirstEffect(oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oPlayer)), oPlayer);

        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
                {
                    //Remove effect if it is negative.
                    RemoveEffect(oPlayer, eBad);
                }
            eBad = GetNextEffect(oPlayer);
        }


        //Fire cast spell at event for the specified target
        SignalEvent(oPlayer, EventSpellCastAt(OBJECT_SELF, SPELL_RESTORATION, FALSE));
        // remove UV-BUG
        ExecuteScript ( "sr_dbg_uv_bug", oPlayer );
}








// NWTACTICS Death script Adjustments by Jhenne (tallonzek@hotmail.com)
// 07/07/02
//changed by PENTAGON
// there are no team points for kills , only local points and these points
// are called kill_points.

void main()
{

object oPlayer = GetLastPlayerDied();
object oKiller = GetLastHostileActor(oPlayer);  // get the PC that killed him
object oBroadcast = GetFirstPC(); // Added to spam everyone when a kill is made MD
object oMaster;

// removed by shadow_in_the_dark - 2007-07-31 - difficult to claculate the absolute
// legal maximum including bardsong, buffs, feats - never seen a player booted
// who has cheated.
// check if the killer is a cheater that deals to much damage in 1 hit.
// ExecuteScript("nwk_super_killer",oPlayer);



//if the killer aint a pc , check if he is a summon-familier-henchman
//and give the appropriate honor to the master
//the master(will change to be the killer) and  will get prizes later in the script
if (!GetIsPC(oKiller))
{
    oMaster=GetMaster(oKiller);
    if (oMaster!=OBJECT_INVALID)
    {
        oKiller=oMaster;
        SendMessageToPC(oKiller,"Your creature has killed on your behalf");
    }
}

// Watchmen shall not get skulls nor get MvP Points
if ( GetIsPC (oKiller) )
{
// killed by player or familiar
    string sPlayer = GetName (oPlayer);  // Get player and killers names MD
    string sKiller = GetName (oKiller);  // get the PC's team


    string sTeam = GetLocalString ( oPlayer, "team");   // get the PC's team
    string sKillerTeam = GetLocalString (oKiller, "team");    // get the Killer's team
    int oScore = GetLocalInt(oKiller, "kill_points");  // get the Killer's score



    // if the Killer was on the same team deduct 5 points, else give 1 point.
    //addition : if you killed the same team member , u are out of the game by boot.
    if (sTeam == sKillerTeam)
    {
        //first check if the player killed itself
        if (oKiller == oPlayer)
        {
        }
        else
        {
            SendMessageToPC(oKiller,"Killing your own team members is forbidden.\n"
                                    +"You will be booted in 5 seconds");
            DelayCommand(6.0, BootPC(oKiller));
        }
    }
    else //regular kill. give the killer his prizes
    {
        oScore+=nwk_enemy_kill_bonus();

        // Saves new scores
        SetLocalInt(oKiller, "kill_points", oScore);

        // round statistic
        SetLocalInt ( oKiller, ROUND_KILL_STAT, GetLocalInt ( oKiller, ROUND_KILL_STAT ) + nwk_enemy_kill_bonus() );
        //give reward Skull to killer
        string sSkull = "skull";
        object oSkull = CreateItemOnObject(sSkull, oKiller);

        calcuateMvp(oKiller);



       string message1=   "You have: "+"\nKill Points :  "+IntToString(oScore) ;
        string message2=       "\nTeam Points :  "+IntToString(GetLocalInt(oKiller, "personalscore"));
           SendMessageToPC(oKiller,message1);
        SendMessageToPC(oKiller,message2);

        string message3=  "\n Total Points :  "+   IntToString(oScore+ MVP_TEAM_POINT_VALUE *GetLocalInt(oKiller, "personalscore"))  ;



        FloatingTextStringOnCreature(message3,oKiller,TRUE);

    }
}




//count one dying point to the killed pc
SetLocalInt(oPlayer, "dying_points",GetLocalInt(oPlayer, "dying_points" ));






/** flag and ball issue.
 * when players that has the flag dies , the flag is created on the floor
 * next to him. it can be picked up only by players of his team. If they do
 * not manage to do so in X seconds , the flag disappers and reappear at start
 * point.
 */
// test the PC for flags
int nSilverFlag = GetLocalInt ( oPlayer, "hassilverflag");
int nGoldFlag = GetLocalInt   ( oPlayer, "hasgoldflag");
// if he had the gold the flag, create one on the floor
if (nGoldFlag ==1)
    createFallenFlag(oPlayer);
else if (nSilverFlag == 1)
    createFallenFlag(oPlayer) ;

object LightBall = GetHenchman (oPlayer);
    if (GetTag(LightBall) == "LightBall")
         jumpFallenBall(LightBall) ;




 effect eEffect;
// strip flag visual effects from the PC if he was carrying it.
if ((nGoldFlag ==1)||(nSilverFlag == 1))
{

   eEffect = GetFirstEffect(oPlayer);

   while ( GetIsEffectValid(eEffect) == TRUE )
   {

        if (GetEffectSubType(eEffect)==SUBTYPE_EXTRAORDINARY)
               RemoveEffect(oPlayer,eEffect);

        eEffect = GetNextEffect(oPlayer);
   }
}



// make friendly to Each of the 3 common factions
    AssignCommand(oPlayer, ClearAllActions());
    // ???* Note: waiting for Sophia to make SetStandardFactionReptuation to clear all personal reputation
    if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPlayer) <= 10)
    {   SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_MERCHANT, oPlayer) <= 10)
    {   SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 80, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPlayer) <= 10)
    {   SetLocalInt(oPlayer, "NW_G_Playerhasbeenbad", 10); // * Player bad
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 80, oPlayer);
    }

// Destroy Henchman, Unless LightBall
    object oHenchMan = GetHenchman (oPlayer);
    if (GetTag(oHenchMan) == "LightBall")
    {
    RemoveHenchman(oPlayer, oHenchMan);
    AssignCommand (oHenchMan, ClearAllActions());
    SetStandardFactionReputation (STANDARD_FACTION_COMMONER, 100, oHenchMan);
    object  oBroadcast = GetFirstPC();
    while(GetIsObjectValid(oBroadcast) == TRUE)
    {
        SendMessageToPC(oBroadcast,"The Light Ball is now FREE!.");
        oBroadcast=GetNextPC();
    }





    }
    else
    {
        DestroyObject (oHenchMan);
    }


//if he is the mvp give him back his nice things
    quickMvpCheck(oPlayer);

    // a shifter may reach state dead but has still HP left
    KillUndeadPlayer ( oPlayer );

    DelayCommand (13.0,ExecuteScript("nw_o0_respawn",oPlayer));

}













