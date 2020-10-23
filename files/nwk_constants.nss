/** this file include the constants for the NWKnights module. bioware didn`t
 *  release constant support , so we use here functions to get each of the
 *  constants .this way , the cost of calling a function is low (tiny functions)
 *  and it is quite easy to change the constants value.
 */



//
//#include "nwk_flag"
#include "nw_i0_spells"
//#include "nwk_nerf_pc"
#include "nwk_mvp"
#include "nwk_const_teams"

                                         //

////////////  module CONSTANTSs  //////////////////////////
int nwk_enemy_kill_bonus() {return 1;} //bonus for killing an enemy player

const string MARKED_FOR_BOOT = "SR_MARKED_FOR_BOOT";

//Round stats
const string ROUND_KILL_STAT = "SR_ROUND_KILL_STAT";
const string ROUND_TEAM_STAT = "SR_ROUND_TEAM_STAT";

//Variable Name to set a player to active
const string sActivePlayerVar = "SR_ACTIVE_PLAYER";

const int NO_ACTIVE_PLAYER_STATE = 0;
const int ACTIVE_PLAYER = 1;
const int INACTIVE_PLAYER = 2;

// mutex used in knight shop
const string sMutex = "SR_MUTEX";

//Decide if Default or Alternative Respawn Position shall be used
//Name of the char Integer
const string RESPAWN_POS_DIRECTIVE = "SR_RESPAWN_POS_DIRECTIVE";

//Use to estimate current Respawn Directive
//return TRUE is respawn directive is set to Alternative
int GetIsAlternativeRespawn ( object oPlayer );

//Set the Respawn Directive for oPlayer.
//if bAlternative == TRUE the respawn directive is set to Alternative
void SetRespawnDirective ( object oPlayer, int bAlternative );

struct PlayerLocation
{
    location    lDest;
    float       fDirection;
};

const int DEST_POINT_INDICATOR_IN_SANC=89;
const int DEST_POINT_INDICATOR_IN_SANC_LIBRARY=90;
const int DEST_POINT_INDICATOR_MAP_BASE=99;

/** returns one on the  DEST_POINT_INDICATOR_XXX
 *  according to the character type. casters like high
 *  level(cater hAS MOST LVLS) clerics/mages/sorcerers will respwn in
 *  DEST_POINT_INDICATOR_IN_SANC_LIBRARY.
 *  all else in DEST_POINT_INDICATOR_MAP_BASE
 *  to increase performence , use a lazy loaded integer "RESPAWN_DESTINATION"
 */

string VARNAME_RESPAWN_DESTINATION="RESPAWN_DESTINATION";

int getDestPointByCharType(object oPC)
{
    int respawnDest = GetLocalInt(oPC,VARNAME_RESPAWN_DESTINATION);
    if (respawnDest==0)
    {
        int MINIMUM_CASTER_LEVEL=15;
        int casterLevel =   GetLevelByClass(CLASS_TYPE_DRUID,oPC)   +
                            GetLevelByClass(CLASS_TYPE_CLERIC,oPC)  +
                            GetLevelByClass(CLASS_TYPE_SORCERER,oPC)+
                            GetLevelByClass(CLASS_TYPE_WIZARD,oPC)  +
                            GetLevelByClass(CLASS_TYPE_PALEMASTER)  ;
        if (casterLevel >=MINIMUM_CASTER_LEVEL)
        {
            if ( ! GetLocalInt ( oPC, RESPAWN_POS_DIRECTIVE ) )
            {
                DelayCommand(6.0,FloatingTextStringOnCreature("Use the Purple light to Instantantly Cast all Buffers",oPC,FALSE)) ;
            }
            respawnDest= DEST_POINT_INDICATOR_IN_SANC_LIBRARY;
        }
        else
        {
            respawnDest= DEST_POINT_INDICATOR_MAP_BASE;
        }
        //set it for next time
        SetLocalInt(oPC,VARNAME_RESPAWN_DESTINATION ,respawnDest);
    }
    if ( GetIsAlternativeRespawn ( oPC ) )
    {
        switch ( respawnDest )
        {
            case DEST_POINT_INDICATOR_IN_SANC_LIBRARY :
                respawnDest = DEST_POINT_INDICATOR_MAP_BASE;
                break;
            case DEST_POINT_INDICATOR_MAP_BASE :
                respawnDest = DEST_POINT_INDICATOR_IN_SANC_LIBRARY;
                break;
            default:
                respawnDest = DEST_POINT_INDICATOR_IN_SANC;
        }
    }
    return respawnDest;
}



int checkIsRegistered(object oPC)
{
    if (GetLocalInt(oPC,"pc_registered")==1)
        return 1;
    else if (GetIsPC(oPC))
    {
        SendMessageToPC(oPC,"You are redirected to start point");
        AssignCommand(oPC, ActionJumpToObject(GetObjectByTag("ENTRY_POINT")));
        return 0;
    }
    return 2;

}

//////////// module functions //////////////////////////
//void healPc(object Pc,int points);
string mapFullTagName(string tag);
string longTeamName(string team);
void DestroyMultipleObjects(string tag,float delay);
void sendMessageToAllPlayer(string floatingText, string regularMessage);

// check if player is active since last map change
// - must be registered player
// - at least one NewMap event must be passed
int GetIsInactive ( object oPC = OBJECT_SELF );

// set him inactive - at NewMap
// possible problems:
// + NewMap will be called more than one time
// + player may join team short before end of game - NewMap event in Sanctuary
// Therfore:
// He can only be set to inactive, if he is active.
// If he is not active he will be set to active instead.
// By this way he will be set to inactive after next map change event
// and booted at over next event
// Set to Incative will be delayed and is only possible if player is in Sanctuary
void SetInactive ( object oPC = OBJECT_SELF );
// set him active - leaving Sanctuary
void SetActive ( object oPC = OBJECT_SELF );

//The winning team has to be stored to give players trophy in case of shuffle
//This function returns TRUE if the player was in the winning team
//The function call is descrutive which means it will only one time answer with TRUE
int GetBelongsToWinningTeam ( object oPlayer );

//mark player as winner or looser of last game
void SetWinningTeam ( object oPlayer, string sWinningTeam);

//////// the lovely generals  ///////////
object nwk_SilverGeneral() { return (GetObjectByTag (mapFullTagName("SilveryIceGeneral")));}
object nwk_GoldGeneral()   {return  (GetObjectByTag (mapFullTagName("GoldenFlameGeneral")));}
location nwk_SilverGeneralDest() {return  (GetLocation(GetObjectByTag(mapFullTagName("SGENRAL_MAP_NOTE"))));}
location nwk_GoldGeneralDest()   {return  (GetLocation(GetObjectByTag(mapFullTagName("GGENRAL_MAP_NOTE")))); }



int GetIsInactive ( object oPC = OBJECT_SELF)
{
    return GetLocalInt ( oPC, sActivePlayerVar ) == INACTIVE_PLAYER;

}

void SetInactive ( object oPC = OBJECT_SELF )
{
    if ( GetTag ( GetArea ( oPC )) != "Sanctuary" )
    {
        SetLocalInt ( oPC, sActivePlayerVar, ACTIVE_PLAYER );
        // WriteTimestampedLogEntry ( "nwk_constants::SetInactive: Player " + GetName ( oPC) + " is not in Santuary, set to active");
    } else
    {
        if ( GetLocalInt ( oPC, sActivePlayerVar ) == ACTIVE_PLAYER )
        {
            SetLocalInt ( oPC, sActivePlayerVar, INACTIVE_PLAYER );
            // WriteTimestampedLogEntry ( "nwk_constants::SetInactive: Player " + GetName ( oPC) + " set to inactive");
        } else if ( GetLocalInt ( oPC, sActivePlayerVar ) == NO_ACTIVE_PLAYER_STATE )
        {
            SetLocalInt ( oPC, sActivePlayerVar, ACTIVE_PLAYER );
            // WriteTimestampedLogEntry ( "nwk_constants::SetInactive: Player " + GetName ( oPC) + " is not active, set to active, now");
        }
    }
}


void SetActive ( object oPC = OBJECT_SELF)
{
    // WriteTimestampedLogEntry ( "nwk_constants::SetActive: set Player " + GetName ( oPC) + " to active");
    SetLocalInt ( oPC, sActivePlayerVar, ACTIVE_PLAYER );
}


////////////////////////////////////////
/*
void RemoveSpecificEffect(int nEffectTypeID, object oTarget)
{
    //Declare major variables
    //Get the object that is exiting the AOE
    int bValid = FALSE;
    effect eAOE;
    //Search through the valid effects on the target.
    eAOE = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eAOE))
    {
        if (GetEffectType(eAOE) == nEffectTypeID)
        {
            //If the effect was created by the spell then remove it
            bValid = TRUE;
            RemoveEffect(oTarget, eAOE);
        }
        //Get next effect on the target
        eAOE = GetNextEffect(oTarget);
    }
}
*/








string longTeamName(string team)
{
    if (team=="SILVER")
        return "SilveryIce";
    else if (team=="GOLD")
        return "GoldenFlame";
    return "";
}

string longTeamNameByInt(int iTeam)
{
    if (iTeam == TEAM_SILVER)
        return "SilveryIce";
    else if (iTeam == TEAM_GOLD)
        return  "GoldenFlame";
    return "";
}








/** healPc
    this is the way to heal a player character with X points.
    all healing spells/items must be overided and use this spell for doing
    the final heal effect on the Pc.
    The reason for this fucntion is that most of the players do not have MAX
    theoretical hp ((by class+cons) *level) cause they dont reroll bad results.
    there is no way to change the HP in legal chars server , so we use akward
    way : temporary hit-points that completes the real hp to MAX hp.
    when they go down (by dmg) , they will not be generated again in heal
    so every heal spell will now heal regular hp , and if there will be extra
    points of heal (and the pc doesnt have max hp) they will become temporary hp.
*/
/*
void healPc(object Pc,int points)
{
  //if it aint a pc , quickly make regular heal and exit
  if (!GetIsPC(Pc))
  {
     ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(points), Pc);
     return;
  }
  int healing_points=points;
  int current,max,bonus_hp;
  int current_hp=GetCurrentHitPoints(Pc);
  int full_health=GetMaxHitPoints(Pc);
  int max_bonus_hp=GetLocalInt(Pc,"BonusHP");

  int points_to_full_health;
  int points_to_bonus_hp;


    //heal the regular dmg
    int regular_heal;
    regular_heal = full_health - current_hp;
    if (healing_points<=regular_heal)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(healing_points), Pc);
        return;
    }
    else   //we can heal and get extra points
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(regular_heal), Pc);
        healing_points-=regular_heal;

        //check how much temp hp need to be givven.
        //we need to check here somehow how much temporary points a creature
        //already have. we will do it by damaging him real bad and checking how
        //much dmg did the temporary hp took and how much real hp took.
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(regular_heal), Pc);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(full_health-1, DAMAGE_TYPE_DIVINE,DAMAGE_POWER_ENERGY),Pc);
        current_hp=GetCurrentHitPoints(Pc);
        int curr_bonus_hp= current_hp-1;

        //ok , now we will give him the bonus hp , but won`t cross the max bonus hp
        if (curr_bonus_hp + healing_points > max_bonus_hp)
            ApplyEffectToObject(DURATION_TYPE_PERMENANT,EffectTemporaryHitpoints(max_bonus_hp),Pc);
        else
            ApplyEffectToObject(DURATION_TYPE_PERMENANT,EffectTemporaryHitpoints( curr_bonus_hp + healing_points),Pc);
        return;
    }
}
 */


/** destroys all apperance of this tag(multiple objects)
*/
void DestroyMultipleObjects(string tag,float delay)
{
   int i=0;

   object light =GetObjectByTag(tag,0);
   i++;
   while (GetIsObjectValid(light))
   {
        DestroyObject(light,delay);
        light= GetObjectByTag(tag,i);
        i++;
   }
}







void JumpHenchmen(object oJumper, location lJump, int fDelay)
{
    object oAnimal = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oJumper);
    object oSummoned = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oJumper);
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oJumper);
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oJumper);
    object oHenchman  = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oJumper);

   if (GetIsObjectValid(oAnimal) &&  GetLastAssociateCommand(oAnimal) != ASSOCIATE_COMMAND_STANDGROUND)
        DelayCommand(IntToFloat(fDelay), AssignCommand(oAnimal, JumpToLocation(lJump)));
   if (GetIsObjectValid(oSummoned) &&  GetLastAssociateCommand(oSummoned) != ASSOCIATE_COMMAND_STANDGROUND)
        DelayCommand(IntToFloat(fDelay),AssignCommand(oSummoned, JumpToLocation(lJump)));
   if (GetIsObjectValid(oFamiliar) &&  GetLastAssociateCommand(oFamiliar) != ASSOCIATE_COMMAND_STANDGROUND)
        DelayCommand(IntToFloat(fDelay), AssignCommand(oFamiliar, JumpToLocation(lJump)));
   if (GetIsObjectValid(oDominated) &&  GetLastAssociateCommand(oDominated) != ASSOCIATE_COMMAND_STANDGROUND)
          DelayCommand(IntToFloat(fDelay), AssignCommand(oDominated, JumpToLocation(lJump)));
   if (GetIsObjectValid(oHenchman) &&  GetLastAssociateCommand(oHenchman) != ASSOCIATE_COMMAND_STANDGROUND)
          DelayCommand(IntToFloat(fDelay), AssignCommand(oHenchman, JumpToLocation(lJump)));

}







/** return the a location and direction of the PC there  , by the
 *  the place indicator and team color . It checks the current map
 *  if it isn`t the sanctuary point
 */
struct PlayerLocation getPlayerNewLocation(int indicator, int team)
{
   string sLocationName;
   struct PlayerLocation playerLocation;

   if (indicator == DEST_POINT_INDICATOR_IN_SANC)
   {
        if (team == TEAM_GOLD)
        {
            sLocationName="GOLDSTART";
        }
        else
        {
            sLocationName="SILVERSTART";
        }
   }
   else if ( indicator == DEST_POINT_INDICATOR_IN_SANC_LIBRARY)
   {
         if (team == TEAM_GOLD)
        {
            sLocationName="GOLD_LIBRARY";
        }
        else
        {
            sLocationName="SILVER_LIBRARY";
        }
   }
   else if (indicator == DEST_POINT_INDICATOR_MAP_BASE)
   {
        //construct the name . example: SANC_GOLD4.
        //this is a point at map respawn (meaning near door to sanc)
        sLocationName = mapFullTagName ("SANC_" + getTeamNameByInt(team));
   }

   playerLocation.lDest = GetLocation(GetObjectByTag(sLocationName));
   if (team ==TEAM_GOLD)
       playerLocation.fDirection = 90.0;
   else if (team==TEAM_SILVER)
       playerLocation.fDirection = 270.0;

    return playerLocation;

}










/** move player to another map.
1. sets all local varibales to deafult values.
2. remove all effects(including flag effects)
3. boot all player never leaved sanctuary since last map change
*/
 void NewMap(object oPC)
 {
    // WriteTimestampedLogEntry ( "*** DEBUG: NewMap handle player: " + GetName ( oPC ) );
    //set locals to default , team and score remains the same
    SetLocalInt(oPC,"hasgoldflag",0);
    SetLocalInt(oPC,"hassilverflag",0);
    SetLocalInt(oPC,"king_score",0);
    SetLocalInt(oPC,"domination_score",0);

    //strip ALL effects (including flag)BUT NOT INCLUDING MVP
     RemovePcEffects( oPC);
    //heal pc

  /*  SignalEvent(oPC, EventSpellCastAt(OBJECT_SELF, SPELL_HEAL, FALSE));
    int nHeal = GetMaxHitPoints(oPC);
    eEffect = EffectHeal(nHeal);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC);
  */
    //clear it`s action queue , if he was in the middle of killing
    //someone , he will need to stop for now.
    AssignCommand(oPC, ClearAllActions(TRUE));

    //move the player to his team start point at the sanctuary
    // get the waypoints in each base
    object oGoldDest = GetObjectByTag ("GOLDSTART");
    object oSilverDest = GetObjectByTag ("SILVERSTART");

    //check for inactive player
    if ( GetIsInactive ( oPC ) )
    {
    //boot him
        if ( ! GetIsDM ( oPC ) )
        {
            DelayCommand(5.0, sendMessageToAllPlayer("",GetName (oPC) +" is booted due to inactivity during a complete battle"));
            DelayCommand(8.0,BootPC(oPC));
        }

    } else
    {
        // define the destination location variable
        location lDest;

        string sTeam = GetLocalString(oPC, "team");

        if (sTeam == "SILVER")
               lDest = GetLocation(oSilverDest);
        else if (sTeam == "GOLD")
               lDest = GetLocation(oGoldDest);

        //DismissNpcs(oPC);
        AssignCommand( oPC,JumpToLocation(lDest));
        DelayCommand ( 12.0, AssignCommand ( oPC, SetInactive ()));
    }
}







/** nwt_o0_utils   by ScriptMaster
    utils are scripts used many times at diffrent places.
    currently we got:

    emptyThePc - destroys all object and effect from Pc
    setLikes - do the party thing.
    stringToNum

*/


// seperated from emptyPC to have the chance to wait for a
// polyphormed char to shift back to original form
void RemoveAllItems ( object oPC )
{
    if ( ! GetIsDM ( oPC ) )
    {
        // empty the PC's Inventory
        object oEquip = GetFirstItemInInventory(oPC);
        while(GetIsObjectValid(oEquip))
        {
            DestroyObject(oEquip);
            oEquip = GetNextItemInInventory(oPC);
        }
        // Empty the PC's Gear slots
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_ARMS, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_ARROWS, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_BELT, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_BOOTS, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_BULLETS, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_CLOAK, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_HEAD, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_NECK, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_CARMOUR, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oPC));
        DestroyObject(GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oPC));

    }

}

/**   emptyThePc
1.destroys all objects on the pc , including misc. obj
2.destroys all the effects on the player , good OR bad.

@param oPc - the player on which the func will act.
             if oPc isnt valid(or DM) nothing happens.

future change: not destoying the things in the module that don`t
               give any advantage (like instruction books).


*/
void emptyPc(object oPC)
{

    effect eEffect;
    float delay = 0.0;

    if (GetIsPC(oPC) == TRUE && GetIsObjectValid (oPC) == TRUE)
    {


        //destroy all the effects - ensure that polyphorm effect is gone
        effect e = GetFirstEffect ( oPC );
        while ( GetIsEffectValid ( e ) )
        {
            if ( GetEffectType ( e ) == EFFECT_TYPE_POLYMORPH )
            {
                delay = 2.0;
            }
            RemoveEffect(oPC,e);
            e=GetNextEffect(oPC);
        }

        DelayCommand( delay, RemoveAllItems ( oPC ) );

    }  //end of first if

}




 void sendMessageToAllPlayer(string floatingText, string regularMessage)
{
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC))
    {
        if ( floatingText != "" )
        {
            FloatingTextStringOnCreature(floatingText ,oPC);
        }
        if ( regularMessage != "" )
        {
            AssignCommand(oPC,SpeakString(regularMessage,TALKVOLUME_WHISPER));
        }
        oPC = GetNextPC ();
    }
}

const string sWinningTeamVar = "SR_WINNING_TEAM";

int GetBelongsToWinningTeam ( object oPlayer )
{
    int nResult = GetLocalInt ( oPlayer, sWinningTeamVar );
    DeleteLocalInt ( oPlayer, sWinningTeamVar );
    return nResult;

}


void SetWinningTeam ( object oPlayer, string sWinningTeam )
{
    if ( getTeamNameByPC ( oPlayer ) == sWinningTeam )
    {
        SetLocalInt ( oPlayer, sWinningTeamVar, TRUE );
    }
}



//Use to estimate current Respawn Directive
//return TRUE is respawn directive is set to Alternative
int GetIsAlternativeRespawn ( object oPlayer )
{
    return GetLocalInt ( oPlayer, RESPAWN_POS_DIRECTIVE );
}

//Set the Respawn Directive for oPlayer.
//if bAlternative == TRUE the respawn directive is set to Alternative
void SetRespawnDirective ( object oPlayer, int bAlternative )
{
    SetLocalInt ( oPlayer, RESPAWN_POS_DIRECTIVE, bAlternative );
}










