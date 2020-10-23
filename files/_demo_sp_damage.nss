//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT9
/*
 * Default OnSpawn handler with XP1 revisions.
 * This corresponds to and produces the same results
 * as the default OnSpawn handler in the OC.
 *
 * This can be used to customize creature behavior in three main ways:
 *
 * - Uncomment the existing lines of code to activate certain
 *   common desired behaviors from the moment when the creature
 *   spawns in.
 *
 * - Uncomment the user-defined event signals to cause the
 *   creature to fire events that you can then handle with
 *   a custom OnUserDefined event handler script.
 *
 * - Add new code _at the end_ to alter the initial
 *   behavior in a more customized way.
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/11/2002
//:://////////////////////////////////////////////////
//:: Updated 2003-08-20 Georg Zoeller: Added check for variables to active spawn in conditions without changing the spawnscript


#include "x0_i0_anims"
// #include "x0_i0_walkway" - in x0_i0_anims
#include "x0_i0_treasure"
#include "inc_d20"
#include "x2_inc_switches"
#include "_mdrn_rof"

void main()
{
    // ***** Spawn-In Conditions ***** //

    // * REMOVE COMMENTS (// ) before the "Set..." functions to activate
    // * them. Do NOT touch lines commented out with // *, those are
    // * real comments for information.

    // * This causes the creature to say a one-line greeting in their
    // * conversation file upon perceiving the player. Put [NW_D2_GenCheck]
    // * in the "Text Seen When" field of the greeting in the conversation
    // * file. Don't attach any player responses.
    // *
    // SetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION);

    // * Same as above, but for hostile creatures to make them say
    // * a line before attacking.
    // *
    // SetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION);

    // * This NPC will attack when its allies call for help
    // *
    // SetSpawnInCondition(NW_FLAG_SHOUT_ATTACK_MY_TARGET);

    // * If the NPC has the Hide skill they will go into stealth mode
    // * while doing WalkWayPoints().
    // *
    // SetSpawnInCondition(NW_FLAG_STEALTH);

    //--------------------------------------------------------------------------
    // Enable stealth mode by setting a variable on the creature
    // Great for ambushes
    // See x2_inc_switches for more information about this
    //--------------------------------------------------------------------------
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_STEALTH) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_STEALTH);
    }
    // * Same, but for Search mode
    // *
    // SetSpawnInCondition(NW_FLAG_SEARCH);

    //--------------------------------------------------------------------------
    // Make creature enter search mode after spawning by setting a variable
    // Great for guards, etc
    // See x2_inc_switches for more information about this
    //--------------------------------------------------------------------------
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_SEARCH) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_SEARCH);
    }
    // * This will set the NPC to give a warning to non-enemies
    // * before attacking.
    // * NN -- no clue what this really does yet
    // *
    // SetSpawnInCondition(NW_FLAG_SET_WARNINGS);

    // * Separate the NPC's waypoints into day & night.
    // * See comment on WalkWayPoints() for use.
    // *
    // SetSpawnInCondition(NW_FLAG_DAY_NIGHT_POSTING);

    // * If this is set, the NPC will appear using the "EffectAppear"
    // * animation instead of fading in, *IF* SetListeningPatterns()
    // * is called below.
    // *
    //SetSpawnInCondition(NW_FLAG_APPEAR_SPAWN_IN_ANIMATION);

    // * This will cause an NPC to use common animations it possesses,
    // * and use social ones to any other nearby friendly NPCs.
    // *
    // SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);

    //--------------------------------------------------------------------------
    // Enable immobile ambient animations by setting a variable
    // See x2_inc_switches for more information about this
    //--------------------------------------------------------------------------
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_AMBIENT_IMMOBILE) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    }
    // * Same as above, except NPC will wander randomly around the
    // * area.
    // *
    // SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS);


    //--------------------------------------------------------------------------
    // Enable mobile ambient animations by setting a variable
    // See x2_inc_switches for more information about this
    //--------------------------------------------------------------------------
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_USE_SPAWN_AMBIENT) == TRUE)
    {
        SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS);
    }
    // **** Animation Conditions **** //
    // * These are extra conditions you can put on creatures with ambient
    // * animations.

    // * Civilized creatures interact with placeables in
    // * their area that have the tag "NW_INTERACTIVE"
    // * and "talk" to each other.
    // *
    // * Humanoid races are civilized by default, so only
    // * set this flag for monster races that you want to
    // * behave the same way.
    // SetAnimationCondition(NW_ANIM_FLAG_IS_CIVILIZED);

    // * If this flag is set, this creature will constantly
    // * be acting. Otherwise, creatures will only start
    // * performing their ambient animations when they
    // * first perceive a player, and they will stop when
    // * the player moves away.
    // SetAnimationCondition(NW_ANIM_FLAG_CONSTANT);

    // * Civilized creatures with this flag set will
    // * randomly use a few voicechats. It's a good
    // * idea to avoid putting this on multiple
    // * creatures using the same voiceset.
    // SetAnimationCondition(NW_ANIM_FLAG_CHATTER);

    // * Creatures with _immobile_ ambient animations
    // * can have this flag set to make them mobile in a
    // * close range. They will never leave their immediate
    // * area, but will move around in it, frequently
    // * returning to their starting point.
    // *
    // * Note that creatures spawned inside interior areas
    // * that contain a waypoint with one of the tags
    // * "NW_HOME", "NW_TAVERN", "NW_SHOP" will automatically
    // * have this condition set.
    // SetAnimationCondition(NW_ANIM_FLAG_IS_MOBILE_CLOSE_RANGE);


    // **** Special Combat Tactics *****//
    // * These are special flags that can be set on creatures to
    // * make them follow certain specialized combat tactics.
    // * NOTE: ONLY ONE OF THESE SHOULD BE SET ON A SINGLE CREATURE.

    // * Ranged attacker
    // * Will attempt to stay at ranged distance from their
    // * target.
    SetCombatCondition(X0_COMBAT_FLAG_RANGED);

    // * Defensive attacker
    // * Will use defensive combat feats and parry
    // SetCombatCondition(X0_COMBAT_FLAG_DEFENSIVE);

    // * Ambusher
    // * Will go stealthy/invisible and attack, then
    // * run away and try to go stealthy again before
    // * attacking anew.
    // SetCombatCondition(X0_COMBAT_FLAG_AMBUSHER);

    // * Cowardly
    // * Cowardly creatures will attempt to flee
    // * attackers.
    // SetCombatCondition(X0_COMBAT_FLAG_COWARDLY);


    // **** Escape Commands ***** //
    // * NOTE: ONLY ONE OF THE FOLLOWING SHOULD EVER BE SET AT ONE TIME.
    // * NOTE2: Not clear that these actually work. -- NN

    // * Flee to a way point and return a short time later.
    // *
    // SetSpawnInCondition(NW_FLAG_ESCAPE_RETURN);

    // * Flee to a way point and do not return.
    // *
    // SetSpawnInCondition(NW_FLAG_ESCAPE_LEAVE);

    // * Teleport to safety and do not return.
    // *
    // SetSpawnInCondition(NW_FLAG_TELEPORT_LEAVE);

    // * Teleport to safety and return a short time later.
    // *
    // SetSpawnInCondition(NW_FLAG_TELEPORT_RETURN);



    // ***** CUSTOM USER DEFINED EVENTS ***** /


    /*
      If you uncomment any of these conditions, the creature will fire
      a specific user-defined event number on each event. That will then
      allow you to write custom code in the "OnUserDefinedEvent" handler
      script to go on top of the default NPC behaviors for that event.

      Example: I want to add some custom behavior to my NPC when they
      are damaged. I uncomment the "NW_FLAG_DAMAGED_EVENT", then create
      a new user-defined script that has something like this in it:

      if (GetUserDefinedEventNumber() == 1006) {
          // Custom code for my NPC to execute when it's damaged
      }

      These user-defined events are in the range 1001-1007.
    */

    // * Fire User Defined Event 1001 in the OnHeartbeat
    // *
    // SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);

    // * Fire User Defined Event 1002
    // *
    // SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);

    // * Fire User Defined Event 1005
    // *
    // SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);

    // * Fire User Defined Event 1006
    // *
    // SetSpawnInCondition(NW_FLAG_DAMAGED_EVENT);

    // * Fire User Defined Event 1008
    // *
    // SetSpawnInCondition(NW_FLAG_DISTURBED_EVENT);

    // * Fire User Defined Event 1003
    // *
    SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT);

    // * Fire User Defined Event 1004
    // *
    // SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);



    // ***** DEFAULT GENERIC BEHAVIOR (DO NOT TOUCH) ***** //

    // * Goes through and sets up which shouts the NPC will listen to.
    // *
    SetListeningPatterns();

    // * Walk among a set of waypoints.
    // * 1. Find waypoints with the tag "WP_" + NPC TAG + "_##" and walk
    // *    among them in order.
    // * 2. If the tag of the Way Point is "POST_" + NPC TAG, stay there
    // *    and return to it after combat.
    //
    // * Optional Parameters:
    // * void WalkWayPoints(int nRun = FALSE, float fPause = 1.0)
    //
    // * If "NW_FLAG_DAY_NIGHT_POSTING" is set above, you can also
    // * create waypoints with the tags "WN_" + NPC Tag + "_##"
    // * and those will be walked at night. (The standard waypoints
    // * will be walked during the day.)
    // * The night "posting" waypoint tag is simply "NIGHT_" + NPC tag.
    WalkWayPoints();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(GetCurrentHitPoints()/3), OBJECT_SELF);
    object oPC = OBJECT_SELF;
    // D20 Modern setup
    int nIdx = 0;
int nS1;
int nS2;
while (nIdx < 71)
{
    SetLocalInt(oPC, "n"+IntToString(nIdx), 0);

    nIdx ++;
}

if (GetHasFeat(FEAT_ANIMALAFFINITY, oPC))

   {
        nS1 = 0;
        nS2 = 71;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_SAVANT, oPC))

   {
        nS1 = 65;

        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+GetLevelByClass(CLASS_TYPE_SMART, oPC) );



   }
   if (GetHasFeat(FEAT_NIPUP, oPC))

   {
        nS1 = 3;

        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+4 );



   }
      if (GetHasFeat(FEAT_WINDFALL, oPC))

   {
        nS1 = 69;

        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1 );



   }
   if (GetHasFeat(FEAT_DEFENSIVESTRIKE, oPC))

   {
        nS1 = 10;

        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+4 );



   }

if (GetHasFeat(FEAT_ATHLETIC, oPC))
    {
        nS1 = 27;
        nS2 = 28;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_ATTENTIVE, oPC))

   {
        nS1 = 47;
        nS2 = 66;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
   if (GetHasFeat(FEAT_BUILDER_CHEMICAL, oPC))
    {
        nS1 = 30;
        nS2 = 31;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_BUILDER_MECHANICAL, oPC))

   {
        nS1 = 32;
        nS2 = 34;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_CAUTIOUS, oPC))
    {
        nS1 = 38;
        nS2 = 39;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_CONFIDENT, oPC))

   {
        nS1 = 44;
        nS2 = 24;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_DECEPTIVE, oPC))
    {
        nS1 = 23;
        nS2 = 40;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_EDUCATED, oPC))

   {
        nS1 = 50;
        nS2 = 51;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
        nS1 = 52;
        nS2 = 54;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
        nS1 = 55;
        nS2 = 56;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
        nS1 = 59;
        nS2 = 60;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);
        nS1 = 61;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);


   }
if (GetHasFeat(FEAT_SKILLMASTERY2, oPC))

   {
        nS1 = 29;
        nS2 = 31;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS1 = 38;
        nS2 = 46;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS1 = 56;
        nS2 = 65;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);

   }
   if (GetHasFeat(FEAT_SKILLMASTERY1, oPC))

   {
        nS1 = 27;
        nS2 = 28;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS1 = 39;
        nS2 = 40;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
        nS1 = 21;
        nS2 = 47;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);



   }
   if (GetHasFeat(FEAT_WITHOUTTRACE, oPC))

   {
        nS1 = 5;
        nS2 = 8;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+4);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+4);
        nS1 = 42;
        nS2 = 67;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+4);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+4);



   }
if (GetHasFeat(FEAT_CHARM, oPC))

   {
        int nCBonus = GetLevelByClass(CLASS_TYPE_CHARISMATIC, oPC)/2;
        nS1 = 23;
        nS2 = 12;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+nCBonus);
        nS1 = 11;
        nS2 = 24;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+nCBonus);



   }
   if (GetHasFeat(FEAT_CONCEALMOTIVE, oPC))

   {
        int nCBonus = GetLevelByClass(CLASS_TYPE_NEGOTIATOR, oPC);
        nS1 = 23;
        nS2 = 12;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+nCBonus);

        nS2 = 24;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+nCBonus);



   }
   if (GetHasFeat(FEAT_ACADEMIC, oPC))

   {
         nS1 = 29;
        nS2 = 37;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);

        nS2 = 65;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);



   }
   if (GetHasFeat(FEAT_ADVENTURER, oPC))

   {
         nS1 = 47;
        nS2 = 68;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);

   }
   if (GetHasFeat(FEAT_ATHLETE, oPC))

   {
         nS1 = 21;
        nS2 = 27;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);

        nS2 = 28;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);



   }
   if (GetHasFeat(FEAT_BLUECOLLAR, oPC))

   {
         nS1 = 34;
        nS2 = 41;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);

        nS2 = 64;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);



   }
   if (GetHasFeat(FEAT_CREATIVE, oPC))

   {
         nS1 = 11;
        nS2 = 35;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);

        nS2 = 36;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);



   }
   if (GetHasFeat(FEAT_CELEBRITY, oPC))

   {
        nS1 = 23;
        nS2 = 40;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);

        nS2 = 11;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
   }
   if (GetHasFeat(FEAT_CRIMINAL, oPC))

   {
         nS1 = 43;
        nS2 = 58;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);




   }
   if (GetHasFeat(FEAT_DILETTANTE, oPC))

   {
         nS1 = 44;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);



   }
   if (GetHasFeat(FEAT_DOCTOR, oPC))

   {
         nS1 = 4;
        nS2 = 33;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);



   }
   if (GetHasFeat(FEAT_EMERGENCYSERVICES, oPC))

   {
         nS1 = 4;
        nS2 = 41;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);

   }
   if (GetHasFeat(FEAT_ENTREPRENEUR, oPC))

   {
         nS1 = 23;
        nS2 = 51;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);

   }
   if (GetHasFeat(FEAT_INVESTIGATIVE, oPC))

   {
         nS1 = 45;
        nS2 = 46;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
   }
   if (GetHasFeat(FEAT_LAWENFORCEMENT, oPC))

   {
         nS1 = 24;
        nS2 = 45;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);

   }
   if (GetHasFeat(FEAT_MILITARY, oPC))

   {
        nS1 = 38;
        nS2 = 62;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
   }
   if (GetHasFeat(FEAT_RELIGIOUS, oPC))

   {
        nS1 = 37;
        nS2 = 61;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);

        nS2 = 66;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
   }
   if (GetHasFeat(FEAT_RURAL, oPC))

   {
        nS1 = 68;
        nS2 = 70;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
   }
   if (GetHasFeat(FEAT_STUDENT, oPC))

   {
        nS1 = 29;
        nS2 = 55;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);

        nS2 = 65;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
   }
    if (GetHasFeat(FEAT_TECHNICIAN, oPC))

   {
        nS1 = 29;
        nS2 = 64;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);

        nS2 = 65;
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
   }
    if (GetHasFeat(FEAT_WHITECOLLAR, oPC))

   {
        nS1 = 29;
        nS2 = 52;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+1);
   }
   if (GetHasFeat(FEAT_UNLIMITEDACCESS, oPC))

   {
        int nCBonus = GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC)/2;
        nS1 = 23;
        nS2 = 12;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+nCBonus);



   }
    if (GetHasFeat(FEAT_BONUSCLASSSKILL1, oPC))

   {
        int nCBonus = GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC)/2;
        nS1 = 24;

        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
   }
   if (GetHasFeat(FEAT_BONUSCLASSSKILL2, oPC))

   {
        int nCBonus = GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC)/2;
        nS1 = 45;

        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nCBonus);
   }
   if (GetHasFeat(FEAT_FASTTALK, oPC))

   {
        int nFBonus = GetLevelByClass(CLASS_TYPE_CHARISMATIC, oPC);
        nS1 = 23;
        nS2 = 12;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nFBonus/2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+nFBonus/2);
        nS1 = 44;

        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+nFBonus/2);




   }
if (GetHasFeat(FEAT_FOCUSED, oPC))

   {
        nS1 = 1;
        nS2 = 27;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_GEARHEAD, oPC))
    {
        nS1 = 29;
        nS2 = 64;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_GUIDE, oPC))

   {
        nS1 = 62;
        nS2 = 68;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_MEDICAL_EXPERT, oPC))
    {
        nS1 = 33;
        nS2 = 4;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_AWARE, oPC))
    {
        nS1 = 6;
        nS2 = 17;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+GetWillSavingThrow(oPC) );
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+GetWillSavingThrow(oPC));


   }
if (GetHasFeat(FEAT_HEALINGKNACK , oPC))
    {
        nS1 = 4;

        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);


   }
if (GetHasFeat(FEAT_MEDICALSPECIALIST1, oPC))
    {
        nS1 = 4;

        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+1);


   }
if (GetHasFeat(FEAT_MEDICALSPECIALIST2, oPC))
    {
        nS1 = 4;

        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);


   }
if (GetHasFeat(FEAT_MEDICALSPECIALIST3, oPC))
    {
        nS1 = 4;

        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+3);


   }
if (GetHasFeat(FEAT_MEDICALMASTERY, oPC))
    {
        nS1 = 33;

        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+4);


   }

if (GetHasFeat(FEAT_NIMBLE, oPC))

   {
        nS1 = 42;
        nS2 = 67;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_METICULOUS, oPC))
    {
        nS1 = 43;
        nS2 = 14;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_STUDIOUS, oPC))

   {
        nS1 = 37;
        nS2 = 65;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }
if (GetHasFeat(FEAT_TRUSTWORTHY, oPC))
    {
        nS1 = 12;
        nS2 = 45;
        SetLocalInt(oPC, "n"+IntToString(nS1), GetLocalInt(oPC, "n"+IntToString(nS1))+2);
        SetLocalInt(oPC, "n"+IntToString(nS2), GetLocalInt(oPC, "n"+IntToString(nS2))+2);


   }

effect eRem = GetFirstEffect(oPC);
while (GetIsEffectValid(eRem))
{
    if (GetEffectCreator(eRem)==OBJECT_SELF)
    {
        if (GetEffectType(eRem)==EFFECT_TYPE_SKILL_INCREASE || GetEffectType(eRem)==EFFECT_TYPE_MOVEMENT_SPEED_INCREASE || GetEffectType(eRem)==EFFECT_TYPE_DAMAGE_INCREASE || GetEffectType(eRem)==EFFECT_TYPE_AC_INCREASE || GetEffectType(eRem)==EFFECT_TYPE_SAVING_THROW_INCREASE)
            RemoveEffect(oPC, eRem);
    }
    eRem = GetNextEffect(oPC);

}
nIdx = 0;
while (nIdx < 71)
{
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(nIdx, GetLocalInt(oPC, "n"+IntToString(nIdx))), oPC);


    nIdx ++;
}
if (GetHasFeat(FEAT_DAMAGEREDUCTION1, oPC))
{
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamageReduction(1, DAMAGE_POWER_PLUS_TWENTY), oPC);


}
if (GetHasFeat(FEAT_DAMAGEREDUCTION2, oPC))
{
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamageReduction(2, DAMAGE_POWER_PLUS_TWENTY), oPC);


}
if (GetHasFeat(FEAT_DAMAGEREDUCTION3, oPC))
{
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamageReduction(3, DAMAGE_POWER_PLUS_TWENTY), oPC);


}

if (GetHasFeat(FEAT_SMARTDEFENSE, oPC))
{
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectACIncrease(GetAbilityModifier(ABILITY_INTELLIGENCE, oPC)), oPC);

}
 int nDamB = 0;
if (GetHasFeat(FEAT_LIVINGWEAPON, oPC) && GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))==FALSE  && GetIsObjectValid(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC))==FALSE)
{
    int nLivingLevel = GetLevelByClass(CLASS_TYPE_MARTIAL_ARTIST, oPC);
    nDamB = nDamB + 2;
    if (nLivingLevel > 3)
        nDamB = nDamB + 2;
    if (nLivingLevel > 7)
        nDamB = nDamB + 2;

}

if (GetHasFeat(FEAT_MELEESMASH, oPC))
{
    nDamB = nDamB + 1;

}
if (GetHasFeat(FEAT_IMPROVEDMELEESMASH, oPC))
{
    nDamB = nDamB + 1;

}
if (GetHasFeat(FEAT_ADVANCEDMELEESMASH, oPC))
{
    nDamB = nDamB + 1;

}
if (nDamB > 0)
{
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamageIncrease(nDamB), oPC);
    SetLocalInt(oPC, "nDamB", nDamB);
}
if (GetHasFeat(FEAT_RUN, oPC) || GetHasFeat(FEAT_INCREASEDSPEED, oPC))
{
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectMovementSpeedIncrease(20), oPC);

}
if (GetHasFeat(FEAT_RUN, oPC) && GetHasFeat(FEAT_INCREASEDSPEED, oPC))
{
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectMovementSpeedIncrease(40), oPC);

}





int nWealth = 0;
/*int nAdd = (GetLevelByClass(CLASS_TYPE_STRONG, oPC)-1)/4;

nReputation = nReputation + nAdd;
nAdd = GetLevelByClass(CLASS_TYPE_FAST, oPC)/3;
nReputation = nReputation + nAdd;
nAdd = GetLevelByClass(CLASS_TYPE_TOUGH, oPC)/3;
nReputation = nReputation + nAdd;
if (GetLevelByClass(CLASS_TYPE_SMART, oPC) > 0)
    nAdd = (GetLevelByClass(CLASS_TYPE_SMART, oPC)-1)/3+1;
nReputation = nReputation + nAdd;
if (GetLevelByClass(CLASS_TYPE_DEDICATED, oPC) > 0)
    nAdd = (GetLevelByClass(CLASS_TYPE_SMART, oPC)-1)/3+1;
nReputation = nReputation + nAdd;
if (GetLevelByClass(CLASS_TYPE_CHARISMATIC, oPC) > 0)
    nAdd = (GetLevelByClass(CLASS_TYPE_SMART, oPC)-1)/3+21;
nReputation = nReputation + nAdd;
*/
if (GetHasFeat(FEAT_WINDFALL, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_windfallw")))
{
    nWealth = nWealth + 3;
    CreateItemOnObject("_mdrn_windfallw", oPC);
}
if (GetHasFeat(FEAT_MINORBREAKTHROUGH, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_minw")))
 {
    nWealth = nWealth + 3;
    CreateItemOnObject("_mdrn_ot_minw", oPC);
}
if (GetHasFeat(FEAT_MAJORBREAKTHROUGH, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_majw")))
   {
    nWealth = nWealth + 3;
    CreateItemOnObject("_mdrn_ot_majw", oPC);
}
if (GetHasFeat(FEAT_ROYALTY1, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_royw1")))
    {
    nWealth = nWealth + 4;
    CreateItemOnObject("_mdrn_ot_royw1", oPC);
}
if (GetHasFeat(FEAT_ROYALTY2, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "_mdrn_ot_royw2")))
   {
    nWealth = nWealth + 4;
    CreateItemOnObject("_mdrn_ot_royw2", oPC);
}


int nDefense = 0;
int nAdd = 0;
int nClass = GetLevelByClass(CLASS_TYPE_DEDICATED, oPC);
if (nClass > 0)
nAdd ++;
if (nClass > 1)
nAdd ++;
if (nClass > 3)
nAdd ++;
if (nClass > 6)
nAdd ++;
if (nClass > 8)
nAdd ++;

nClass = GetLevelByClass(CLASS_TYPE_STRONG, oPC);
if (nClass > 0)
nAdd ++;
if (nClass > 1)
nAdd ++;
if (nClass > 3)
nAdd ++;
if (nClass > 6)
nAdd ++;
if (nClass > 8)
nAdd ++;

nClass = GetLevelByClass(CLASS_TYPE_TOUGH, oPC);
if (nClass > 0)
nAdd ++;
if (nClass > 1)
nAdd ++;
if (nClass > 3)
nAdd ++;
if (nClass > 6)
nAdd ++;
if (nClass > 8)
nAdd ++;


if (GetLevelByClass(CLASS_TYPE_FAST, oPC) > 0)
    nAdd = nAdd + GetLevelByClass(CLASS_TYPE_FAST, oPC)/2+3;

if (GetLevelByClass(CLASS_TYPE_SMART, oPC) > 1)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_SMART, oPC)-1)/3;
if (GetLevelByClass(CLASS_TYPE_CHARISMATIC, oPC) > 1)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_CHARISMATIC, oPC)-1)/3;


nClass = GetLevelByClass(CLASS_TYPE_MARTIAL_ARTIST, oPC);
if (nClass > 0)
nAdd ++;
if (nClass > 1)
nAdd ++;
if (nClass > 3)
nAdd ++;
if (nClass > 4)
nAdd ++;
if (nClass > 6)
nAdd ++;
if (nClass > 7)
nAdd ++;
if (nClass > 9)
nAdd ++;



if (GetLevelByClass(CLASS_TYPE_GUNSLINGER, oPC) > 0)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_GUNSLINGER, oPC)-1)/2+1;


nClass = GetLevelByClass(CLASS_TYPE_INFILTRATOR, oPC);
if (nClass > 0)
nAdd ++;
if (nClass > 1)
nAdd ++;
if (nClass > 3)
nAdd ++;
if (nClass > 4)
nAdd ++;
if (nClass > 6)
nAdd ++;
if (nClass > 7)
nAdd ++;
if (nClass > 9)
nAdd ++;


nClass = GetLevelByClass(CLASS_TYPE_DAREDEVIL, oPC);
if (nClass > 0)
nAdd ++;
if (nClass > 1)
nAdd ++;
if (nClass > 3)
nAdd ++;
if (nClass > 4)
nAdd ++;
if (nClass > 6)
nAdd ++;
if (nClass > 7)
nAdd ++;
if (nClass > 9)
nAdd ++;


if (GetLevelByClass(CLASS_TYPE_BODYGUARD, oPC) > 0)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_BODYGUARD, oPC)-1)/2+1;

if (GetLevelByClass(CLASS_TYPE_FIELDSCIENTIST, oPC) > 1)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_FIELDSCIENTIST, oPC)-1)/3;

if (GetLevelByClass(CLASS_TYPE_FIELDMEDIC, oPC) > 0)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_FIELDMEDIC, oPC)-1)/2+1;

if (GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC) > 1)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC)-1)/3;

if (GetLevelByClass(CLASS_TYPE_NEGOTIATOR, oPC) > 1)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_NEGOTIATOR, oPC)-1)/3;

if (GetLevelByClass(CLASS_TYPE_MAGE, oPC) > 0)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_MAGE, oPC)-1)/2+1;

if (GetLevelByClass(CLASS_TYPE_ACOLYTE, oPC) > 0)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_ACOLYTE, oPC)-1)/2+1;

nDefense = nDefense + nAdd;
ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectACIncrease(nDefense), oPC);
SendMessageToPC(oPC, "Defense bonus: "+IntToString(nDefense));

int nReputation = 0;
nAdd = (GetLevelByClass(CLASS_TYPE_STRONG, oPC)-1)/4;

nAdd = nAdd + GetLevelByClass(CLASS_TYPE_FAST, oPC)/3;
nAdd = nAdd + GetLevelByClass(CLASS_TYPE_TOUGH, oPC)/3;
if (GetLevelByClass(CLASS_TYPE_SMART, oPC) > 0)
    nAdd = nAdd +  (GetLevelByClass(CLASS_TYPE_SMART, oPC)-1)/3+1;
if (GetLevelByClass(CLASS_TYPE_DEDICATED, oPC) > 0)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_DEDICATED, oPC)-1)/3+1;
if (GetLevelByClass(CLASS_TYPE_CHARISMATIC, oPC) > 0)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_CHARISMATIC, oPC)-1)/3+1;
if (GetLevelByClass(CLASS_TYPE_SOLDIER, oPC) > 0)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_SOLDIER, oPC)-1)/4;
if (GetLevelByClass(CLASS_TYPE_MARTIAL_ARTIST, oPC) > 0)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_MARTIAL_ARTIST, oPC)-1)/4;
nAdd = nAdd + GetLevelByClass(CLASS_TYPE_GUNSLINGER, oPC)/3;
if (GetLevelByClass(CLASS_TYPE_INFILTRATOR, oPC) > 0)
    nAdd = nAdd +  (GetLevelByClass(CLASS_TYPE_INFILTRATOR, oPC)-1)/3+1;
nAdd = nAdd + GetLevelByClass(CLASS_TYPE_DAREDEVIL, oPC)/3;
nAdd = nAdd + GetLevelByClass(CLASS_TYPE_BODYGUARD, oPC)/3;
nAdd = nAdd + GetLevelByClass(CLASS_TYPE_FIELDSCIENTIST, oPC)/3;
if (GetLevelByClass(CLASS_TYPE_FIELDMEDIC, oPC) > 0)
    nAdd = nAdd +  (GetLevelByClass(CLASS_TYPE_FIELDMEDIC, oPC)-1)/3+1;
if (GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC) > 0)
    nAdd = nAdd +  2*((GetLevelByClass(CLASS_TYPE_PERSONALITY, oPC)-1)/3+1);
if (GetLevelByClass(CLASS_TYPE_NEGOTIATOR, oPC) > 0)
    nAdd = nAdd +  (GetLevelByClass(CLASS_TYPE_NEGOTIATOR, oPC)-1)/3+1;
if (GetLevelByClass(CLASS_TYPE_MAGE, oPC) > 0)
    nAdd = nAdd + (GetLevelByClass(CLASS_TYPE_MAGE, oPC)-1)/3+1;
if (GetLevelByClass(CLASS_TYPE_ACOLYTE, oPC) > 0)
    nAdd = nAdd +  2*((GetLevelByClass(CLASS_TYPE_ACOLYTE, oPC)-1)/3+1);
if (GetHasFeat(FEAT_LOWPROFILE, oPC))
if (GetHasFeat(FEAT_ENTREPRENEUR, oPC))
    nReputation = nReputation +1;
if (GetHasFeat(FEAT_MINORBREAKTHROUGH, oPC))
    nReputation = nReputation + 2;
    nReputation = nReputation - 3;
nReputation = nReputation + nAdd;

if (GetHasFeat(FEAT_RENOWN, oPC))
    nReputation = nReputation + 3;

if (GetHasFeat(FEAT_CELEBRITY, oPC))
    nReputation = nReputation +1;
if (GetHasFeat(FEAT_DILETTANTE, oPC))
    nReputation = nReputation +1;
if (GetHasFeat(FEAT_MAJORBREAKTHROUGH, oPC))
    nReputation = nReputation + 2;

SetLocalInt(oPC, "nReputation", nReputation);
CreateItemOnObject("wealth", oPC, nWealth);



    //* Create a small amount of treasure on the creature
    if ((GetLocalInt(GetModule(), "X2_L_NOTREASURE") == FALSE)  &&
        (GetLocalInt(OBJECT_SELF, "X2_L_NOTREASURE") == FALSE)   )
    {
        CTG_GenerateNPCTreasure(TREASURE_TYPE_MONSTER, OBJECT_SELF);
    }


    // ***** ADD ANY SPECIAL ON-SPAWN CODE HERE ***** //

    // * If Incorporeal, apply changes
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_IS_INCORPOREAL) == TRUE)
    {
        effect eConceal = EffectConcealment(50, MISS_CHANCE_TYPE_NORMAL);
        eConceal = ExtraordinaryEffect(eConceal);
        effect eGhost = EffectCutsceneGhost();
        eGhost = ExtraordinaryEffect(eGhost);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eConceal, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, OBJECT_SELF);

    }
    SendDebugMessage("CreatureEvent-Spawning In:" + GetName(OBJECT_SELF));
    ManageNPCAmmo(OBJECT_SELF);

}
