// Modified On Spawn Script template.  Create a unique copy of this script
// for each NPC that will have custom chat text.

int SetKeyword(object oNPC,
               string sPattern,
               string sResponse,
               int iPreAnim = 0,
               int iPostAnim = 0,
               string sScript = "",
               string sMoveTo = "",
               string sMisc = "",
               int iMisc = 0)

{

  int iPattern=GetLocalInt(oNPC, "KCS_PATTERNCOUNT");

  if (iPattern==0)
  {
    iPattern=5000;
  }
  else
  {
    iPattern++;
  }

  string sPatNum = IntToString(iPattern);

  SetListenPattern(oNPC, sPattern, iPattern);

  SetLocalString(oNPC, "KCS_RESP" + sPatNum, sResponse);

  if (iPreAnim)
  {
    SetLocalInt(oNPC, "KCS_PREA" + sPatNum, iPreAnim);
  }

  if (iPostAnim)
  {
    SetLocalInt(oNPC, "KCS_POSTA" + sPatNum, iPostAnim);
  }

  if (!(sScript==""))
  {
    SetLocalString(oNPC, "KCS_SCRIPT" + sPatNum, sScript);
  }

  if (!(sMoveTo==""))
  {
    SetLocalString(oNPC, "KCS_MOVETO" + sPatNum, sMoveTo);
  }

  if (!(sMisc==""))
  {
    SetLocalString(oNPC, "KCS_SMISC" + sPatNum, sMisc);
  }

  if (iMisc)
  {
    SetLocalInt(oNPC, "KCS_IMISC" + sPatNum, iMisc);
  }

  SetLocalInt(oNPC, "KCS_PATTERNCOUNT", iPattern);

  return iPattern;
}


//::///////////////////////////////////////////////
//:: Default: On Spawn In
//:: NW_C2_DEFAULT9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Determines the course of action to be taken
    after having just been spawned in
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Oct 25, 2001
//:://////////////////////////////////////////////
#include "NW_O2_CONINCLUDE"
#include "NW_I0_GENERIC"

void main()
{
// OPTIONAL BEHAVIORS (Comment In or Out to Activate ) ****************************************************************************
     //SetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION);
     //SetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION);
                // This causes the creature to say a special greeting in their conversation file
                // upon Perceiving the player. Attach the [NW_D2_GenCheck.nss] script to the desired
                // greeting in order to designate it. As the creature is actually saying this to
                // himself, don't attach any player responses to the greeting.

     //SetSpawnInCondition(NW_FLAG_SHOUT_ATTACK_MY_TARGET);
                // This will set the listening pattern on the NPC to attack when allies call
     //SetSpawnInCondition(NW_FLAG_STEALTH);
                // If the NPC has stealth and they are a rogue go into stealth mode
     //SetSpawnInCondition(NW_FLAG_SEARCH);
                // If the NPC has Search go into Search Mode
     //SetSpawnInCondition(NW_FLAG_SET_WARNINGS);
                // This will set the NPC to give a warning to non-enemies before attacking

     //SetSpawnInCondition(NW_FLAG_SLEEP);
                //Creatures that spawn in during the night will be asleep.
     //SetSpawnInCondition(NW_FLAG_DAY_NIGHT_POSTING);
     //SetSpawnInCondition(NW_FLAG_APPEAR_SPAWN_IN_ANIMATION);
     //SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
     //SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS);
                //This will play Ambient Animations until the NPC sees an enemy or is cleared.
                //NOTE that these animations will play automatically for Encounter Creatures.

    // NOTE: ONLY ONE OF THE FOLOOWING ESCAPE COMMANDS SHOULD EVER BE ACTIVATED AT ANY ONE TIME.
    //SetSpawnInCondition(NW_FLAG_ESCAPE_RETURN);    // OPTIONAL BEHAVIOR (Flee to a way point and return a short time later.)
    //SetSpawnInCondition(NW_FLAG_ESCAPE_LEAVE);     // OPTIONAL BEHAVIOR (Flee to a way point and do not return.)
    //SetSpawnInCondition(NW_FLAG_TELEPORT_LEAVE);   // OPTIONAL BEHAVIOR (Teleport to safety and do not return.)
    //SetSpawnInCondition(NW_FLAG_TELEPORT_RETURN);  // OPTIONAL BEHAVIOR (Teleport to safety and return a short time later.)

// CUSTOM USER DEFINED EVENTS
/*
    The following settings will allow the user to fire one of the blank user defined events in the NW_D2_DefaultD.  Like the
    On Spawn In script this script is meant to be customized by the end user to allow for unique behaviors.  The user defined
    events user 1000 - 1010
*/
    //SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);        //OPTIONAL BEHAVIOR - Fire User Defined Event 1001
    //SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);         //OPTIONAL BEHAVIOR - Fire User Defined Event 1002
    //SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);           //OPTIONAL BEHAVIOR - Fire User Defined Event 1005
    //SetSpawnInCondition(NW_FLAG_DAMAGED_EVENT);          //OPTIONAL BEHAVIOR - Fire User Defined Event 1006
    //SetSpawnInCondition(NW_FLAG_DISTURBED_EVENT);        //OPTIONAL BEHAVIOR - Fire User Defined Event 1008
    //SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT); //OPTIONAL BEHAVIOR - Fire User Defined Event 1003
    SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);      //OPTIONAL BEHAVIOR - Fire User Defined Event 1004
    //SetSpawnInCondition(NW_FLAG_DEATH_EVENT);            //OPTIONAL BEHAVIOR - Fire User Defined Event 1007

// DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH) *****************************************************************************************
    SetListeningPatterns();    // Goes through and sets up which shouts the NPC will listen to.
    WalkWayPoints();           // Optional Parameter: void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
                               // 1. Looks to see if any Way Points in the module have the tag "WP_" + NPC TAG + "_0X", if so walk them
                               // 2. If the tag of the Way Point is "POST_" + NPC TAG the creature will return this way point after
                               //    combat.
    GenerateNPCTreasure();     //* Use this to create a small amount of treasure on the creature

    // Use SetKeyword statements here to enter dialogue text.
    //SetKeyword(OBJECT_SELF, "(hail|hello|greetings|howdy|hiya|well met)**", "Hello, &N.  Welcome to the [Blackroot Inn].  Can I get you a [drink]?");
    SetKeyword(OBJECT_SELF, "**(river|water|stream|creek)**", "Rogahn my love, you have answered correctly.  Your equipment awaits.", 0, 0, "np_destroy_trap");
    SetKeyword(OBJECT_SELF, "**(what|don't|know|help|air|lion|go)**", "You are not Rogahn.  You are &N and you will feel my wrath.", 0, 0, "np_create_destro");
    //SetKeyword(OBJECT_SELF, "**ale**", "Here you are...", 0, ANIMATION_LOOPING_GET_MID, "kcs__give_item", "", "nw_it_mpotion021", 1);
    //SetKeyword(OBJECT_SELF, "**spirits**", "Here you...", 0, ANIMATION_LOOPING_GET_MID, "kcs__give_item", "", "nw_it_mpotion022", 1);
    //SetKeyword(OBJECT_SELF, "**wine**", "Here you are...", 0, ANIMATION_LOOPING_GET_MID, "kcs__give_item", "", "nw_it_mpotion023", 1);
    //SetKeyword(OBJECT_SELF, "**glen*wheaven**", "It's a small town, but a nice place to live.  Except for the [trouble] that's been going on recently.");
    //SetKeyword(OBJECT_SELF, "**trouble**", "I probably shouldn't [say anything] about that...");
    //SetKeyword(OBJECT_SELF, "**say*wanything**", "Well...  folks have been hearing strange noises at night.  Some even say they have [seen things] on the streets.", ANIMATION_FIREFORGET_HEAD_TURN_LEFT);
    //SetKeyword(OBJECT_SELF, "**seen*wthings**", "They say the [dead] walk the streets at night.");
    //SetKeyword(OBJECT_SELF, "**dead**", "That's all I know.  You might ask around though...");
    //SetKeyword(OBJECT_SELF, "**telir**thirsty**", "Ah, ok.  I'll go talk to him.", 0, 0, "", "wpSample");
    SetListening(OBJECT_SELF, TRUE);
}


