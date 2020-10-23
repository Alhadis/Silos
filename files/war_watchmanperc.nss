//::///////////////////////////////////////////////
//:: Default On Percieve
//:: NW_C2_DEFAULT2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks to see if the perceived target is an
    enemy and if so fires the Determine Combat
    Round function
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 16, 2001
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"
#include "nwk_constants"
#include "nwk_const_teams"

const string VAR_NAME_SAVED_MAP_NUMBER="savedMapNumber";
const string VAR_NAME_TEAM = "team";
const string VAR_NAME_SAVED_JUMP_DEST ="savedJumpDest";

void main()
{


    location lDest;
    string sTag = GetTag (OBJECT_SELF);


    if (sTag== "GoldWatchman")
    {
        SetLocalString (OBJECT_SELF, VAR_NAME_TEAM, "GOLD" );

    }
    else if (sTag== "SilverWatchman")
    {
      SetLocalString (OBJECT_SELF, VAR_NAME_TEAM, "SILVER" );

    }

    object oPC = GetLastPerceived();


// if the percived is not a pc (maybe a summon/henchman) . look at
// the root master (cause some summonms can summon too) and check its
// team.
    object oMaster=oPC;
    if (!GetIsPC(oMaster))
    {
       while (GetIsObjectValid(GetMaster(oMaster)))
       {
        oMaster=GetMaster(oMaster);
       }
     }
    //now do all the checks with oMaster , but attack the oPC(which might be
    //a summon - poor name choice.
/////

    string sTeam = GetLocalString(oMaster, "team");
    string sTeamself = GetLocalString(OBJECT_SELF, VAR_NAME_TEAM);

    //now attack only someone from the oher group.
    //be freidndly with your team , or with neutrals (dont have a "team" var)
    if (!(sTeam==ConstTeams_getOppositeTeamName(sTeamself)))
  //  if ((sTeam == sTeamself)||(!GetIsPC (oPC)))
    {
        SetIsTemporaryFriend(oPC, OBJECT_SELF);
    }
    else
    {
        lDest =  GetLocalLocation(OBJECT_SELF,VAR_NAME_SAVED_JUMP_DEST);
        JumpToLocation(lDest);
        SetIsTemporaryEnemy(oPC, OBJECT_SELF);
        AssignCommand (OBJECT_SELF, ActionAttack (oPC));
        //SpeakString("Testing", TALKVOLUME_TALK);
    }


    //If the last perception event was hearing based or if someone vanished then go to search mode
    if ((GetLastPerceptionVanished()) && GetIsEnemy(GetLastPerceived()))
    {
        object oGone = GetLastPerceived();
        if((GetAttemptedAttackTarget() == GetLastPerceived() ||
           GetAttemptedSpellTarget() == GetLastPerceived() ||
           GetAttackTarget() == GetLastPerceived()) && GetArea(GetLastPerceived()) != GetArea(OBJECT_SELF))
        {
           ClearAllActions();
           DetermineCombatRound();
        }
    }
    //Do not bother checking the last target seen if already fighting
    else if(!GetIsObjectValid(GetAttemptedAttackTarget()) && !GetIsObjectValid(GetAttemptedSpellTarget()))
    {
        //Check if the last percieved creature was actually seen
        if(GetLastPerceptionSeen())
        {
            if(GetIsEnemy(GetLastPerceived()))
            {
                SetFacingPoint(GetPosition(GetLastPerceived()));
                DetermineCombatRound();

            }
        }
    }
}
