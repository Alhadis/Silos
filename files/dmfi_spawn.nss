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

#include "inc_ff"
#include "x0_i0_anims"
// #include "x0_i0_walkway" - in x0_i0_anims
#include "x0_i0_treasure"

#include "x2_inc_switches"

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
    // SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT);

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

    //* Create a small amount of treasure on the creature
    if ((GetLocalInt(GetModule(), "X2_L_NOTREASURE") == FALSE)  &&
        (GetLocalInt(OBJECT_SELF, "X2_L_NOTREASURE") == FALSE)   )
    {
        CTG_GenerateNPCTreasure(TREASURE_TYPE_MONSTER, OBJECT_SELF);
    }


    // ***** ADD ANY SPECIAL ON-SPAWN CODE HERE ***** //
    SetLocalInt(OBJECT_SELF, "nCon", GetAbilityScore(OBJECT_SELF, ABILITY_CONSTITUTION));
    SetListening(OBJECT_SELF, TRUE);
    SetListenPattern(OBJECT_SELF, "**", 20600); //listen to all text
    SetLocalInt(OBJECT_SELF, "hls_Listening", 1); //listen to all text
    // * If Incorporeal, apply changes
    SetIsDestroyable(FALSE, TRUE, TRUE);
    SetLootable(OBJECT_SELF, TRUE);
    // DNA section
    string sDNA = "";
    if (GetAbilityScore(OBJECT_SELF, ABILITY_STRENGTH)>14)
        sDNA = sDNA + "YWYZWWZW";
    if (GetAbilityScore(OBJECT_SELF, ABILITY_STRENGTH)<7)
        sDNA = sDNA + "YWZZWWZW";
    if (GetAC(OBJECT_SELF)>18)
        sDNA = sDNA + "YWYZWXZW";
     if (GetAC(OBJECT_SELF)<12)
        sDNA = sDNA + "YWZZWXZW";
      if (GetSkillRank(SKILL_HIDE,OBJECT_SELF)>6)
        sDNA = sDNA + "YWYZWYZW";
     if (GetSkillRank(SKILL_HIDE,OBJECT_SELF)==0)
        sDNA = sDNA + "YWZZWYZW";
    if (GetSkillRank(SKILL_SPOT,OBJECT_SELF)>6)
        sDNA = sDNA + "YWYZWZZW";
     if (GetSkillRank(SKILL_SPOT,OBJECT_SELF)==0)
        sDNA = sDNA + "YWZZWZZW";
    if (GetSkillRank(SKILL_LISTEN,OBJECT_SELF)>6)
        sDNA = sDNA + "YWYZXXZW";
     if (GetSkillRank(SKILL_LISTEN,OBJECT_SELF)==0)
        sDNA = sDNA + "YWZZXXZW";
    if (GetAbilityScore(OBJECT_SELF, ABILITY_CONSTITUTION)>14)
        sDNA = sDNA + "YWYZXYZW";
    if (GetAbilityScore(OBJECT_SELF, ABILITY_CONSTITUTION)<7)
        sDNA = sDNA + "YWZZXYZW";
    if (GetAbilityScore(OBJECT_SELF, ABILITY_DEXTERITY)>14)
        sDNA = sDNA + "YWYZXZZW";
    if (GetAbilityScore(OBJECT_SELF, ABILITY_DEXTERITY)<7)
        sDNA = sDNA + "YWZZXZZW";
     if (GetFortitudeSavingThrow(OBJECT_SELF)>4)
        sDNA = sDNA + "YWYZYYZW";
     if (GetFortitudeSavingThrow(OBJECT_SELF)==0)
        sDNA = sDNA + "YWZZYYZW";
    SetLocalString(OBJECT_SELF, "sDNA", sDNA);
    string sSamp = GetSubString(sDNA, Random(GetStringLength(sDNA)), d4()+8);
    object oOldDNA;
    CopyObject(oOldDNA = CreateItemOnObject("dnasample"), GetLocation(OBJECT_SELF), OBJECT_SELF, sSamp);
    DestroyObject(oOldDNA);
    if (GetCreatureFlag(OBJECT_SELF, CREATURE_VAR_IS_INCORPOREAL) == TRUE)
    {
        effect eConceal = EffectConcealment(50, MISS_CHANCE_TYPE_NORMAL);
        eConceal = ExtraordinaryEffect(eConceal);
        effect eGhost = EffectCutsceneGhost();
        eGhost = ExtraordinaryEffect(eGhost);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eConceal, OBJECT_SELF);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, OBJECT_SELF);

    }
    // Start Feat additions (need to test)
    object oPC = OBJECT_SELF;
    int nAlliance = 0;
    int nAdmin = 0;
    int nAppraise = 0;
    int nBluff = 0;
    int nBribery = 0;
    int nBroker = 0;
    int nGather = 0;
    int nGambling = 0;
    int nForgery = 0;
    int nNavigation = 0;
    int nPersuade = 0;
    int nPerform = 0;
    int nHide = 0;
    int nElectronics = 0;
    int nMechanical = 0;
    int nMedical = 0;
    int nEngineering = 0;
    int nComputer = 0;
    int nListen = 0;
    int nParry = 0;
    int nDiscipline = 0;
    int nScience = 0;
    int nSpot = 0;
    int nMoveSilently = 0;
    int nSearch = 0;
    int nShipboard = 0;
    int nSurvival = 0;
    int nIntimidate = 0;
    int nSenseMotive = 0;
    int nLeader = 0;
    int nWill = 0;
    int nPilot = 0;
    int nSocialStanding = (GetLevelByClass(CLASS_TYPE_NOBLE, oPC)>0)*(17+GetLevelByClass(CLASS_TYPE_NOBLE, oPC)/4); // This is the social standing of a Noble.
    int nSocialMod = (nSocialStanding - 16)/2 + 3; // Base of +3 for 16 Social, plus 1 per every 2 more than that.
    int nCha = GetAbilityModifier(ABILITY_CHARISMA, oPC);
    int nPsi = 0;
    if (GetHasFeat(FEAT_PSI_TRAINING, oPC))
        nPsi = (GetAbilityScore(oPC, ABILITY_CHARISMA)+GetAbilityScore(oPC, ABILITY_INTELLIGENCE)+GetAbilityScore(oPC, ABILITY_WISDOM))/3-2;
    if (GetHasFeat(FEAT_NATURAL_TALENT, oPC))
        nPsi = nPsi + 2;
    if (GetHasFeat(FEAT_PSI_TRAINING, oPC) || GetHasFeat(FEAT_NATURAL_TALENT, oPC))
    {
        SendMessageToPC(oPC, "PSI Score: "+IntToString(nPsi));
        SetLocalInt(oPC, "nPsi", nPsi);
    }
    if (GetHasFeat(FEAT_BARTER, oPC))

       {
            SendMessageToPC(oPC, "Skill bonuses for Barter applied.");
            nAppraise = nAppraise + 2;
            nBroker = nBroker + 2;
           SetLocalInt(oPC, "nBarter", 1);
       }
    if (GetHasFeat(FEAT_PATRON_OF_SCIENCES, oPC))
        {
            SendMessageToPC(oPC, "Skill bonuses for Patron of the Sciences applied.");
            nScience = nScience + 2;
            nEngineering = nEngineering + 1;
            nMedical = nMedical + 1;
            nShipboard = nShipboard + 1;
            nMechanical = nMechanical + 1;
            nComputer = nComputer + 1;
            nElectronics = nElectronics + 1;
            SetLocalInt(oPC, "nPatronOfSciences", 1);


        }
    if (GetHasFeat(FEAT_JACK_OF_TRADES_I, oPC))

       {
             SendMessageToPC(oPC, "Skill bonuses for JOT-1 applied.");
             nAlliance ++;
             nAdmin ++;
             nAppraise ++;
             //nBluff ++;
             nBribery ++;
             //nBroker ++;
             nGather ++;
             nGambling ++;
             nForgery ++;
             nNavigation ++;
             nPersuade ++;
             nPerform ++;
             //nHide ++;
             nElectronics ++;
             nMechanical ++;
             nMedical ++;
             nEngineering ++;
             nComputer ++;
             //nListen ++;
             //nParry ++;
             //nDiscipline ++;
             nScience ++;
             //nSpot ++;
             //nMoveSilently ++;
             //nSearch ++;
             nShipboard ++;
             //nSurvival ++;
             //nIntimidate ++;
             //nSenseMotive ++;
             nLeader ++;
             nPilot ++;

           SetLocalInt(oPC, "nJOT1", 1);
       }
    if (GetHasFeat(FEAT_JACK_OF_TRADES_II, oPC))

       {
             SendMessageToPC(oPC, "Skill bonuses for JOT-2 applied.");
             nAlliance ++;
             nAdmin ++;
             nAppraise ++;
             nBluff ++;
             nBribery ++;
             nBroker ++;
             nGather ++;
             nGambling ++;
             nForgery ++;
             nNavigation ++;
             nPersuade ++;
             nPerform ++;
             nHide ++;
             nElectronics ++;
             nMechanical ++;
             nMedical ++;
             nEngineering ++;
             nComputer ++;
             nListen ++;
             nParry ++;
             nDiscipline ++;
             nScience ++;
             nSpot ++;
             nMoveSilently ++;
             nSearch ++;
             nShipboard ++;
             nSurvival ++;
             nIntimidate ++;
             nSenseMotive ++;
             nLeader ++;
             nPilot ++;

           SetLocalInt(oPC, "nJOT2", 1);
       }
    if (GetHasFeat(FEAT_JACK_OF_TRADES_III, oPC))

       {
             SendMessageToPC(oPC, "Skill bonuses for JOT-3 applied.");
             nAlliance ++;
             nAdmin ++;
             nAppraise ++;
             nBluff ++;
             nBribery ++;
             nBroker ++;
             nGather ++;
             nGambling ++;
             nForgery ++;
             nNavigation ++;
             nPersuade ++;
             nPerform ++;
             nHide ++;
             nElectronics ++;
             nMechanical ++;
             nMedical ++;
             nEngineering ++;
             nComputer ++;
             nListen ++;
             nParry ++;
             nDiscipline ++;
             nScience ++;
             nSpot ++;
             nMoveSilently ++;
             nSearch ++;
             nShipboard ++;
             nSurvival ++;
             nIntimidate ++;
             nSenseMotive ++;
             nLeader ++;
             nPilot ++;

           SetLocalInt(oPC, "nJOT3", 1);
       }
    if (GetHasFeat(FEAT_JACK_OF_TRADES_IV, oPC))

       {
             SendMessageToPC(oPC, "Skill bonuses for JOT-4 applied.");
             nAlliance ++;
             nAdmin ++;
             nAppraise ++;
             nBluff ++;
             nBribery ++;
             nBroker ++;
             nGather ++;
             nGambling ++;
             nForgery ++;
             nNavigation ++;
             nPersuade ++;
             nPerform ++;
             nHide ++;
             nElectronics ++;
             nMechanical ++;
             nMedical ++;
             nEngineering ++;
             nComputer ++;
             nListen ++;
             nParry ++;
             nDiscipline ++;
             nScience ++;
             nSpot ++;
             nMoveSilently ++;
             nSearch ++;
             nShipboard ++;
             nSurvival ++;
             nIntimidate ++;
             nSenseMotive ++;
             nLeader ++;
             nPilot ++;

           SetLocalInt(oPC, "nJOT4", 1);
       }
    if (GetHasFeat(FEAT_JACK_OF_TRADES_V, oPC))

       {
             SendMessageToPC(oPC, "Skill bonuses for JOT-5 applied.");
             nAlliance ++;
             nAdmin ++;
             nAppraise ++;
             nBluff ++;
             nBribery ++;
             nBroker ++;
             nGather ++;
             nGambling ++;
             nForgery ++;
             nNavigation ++;
             nPersuade ++;
             nPerform ++;
             nHide ++;
             nElectronics ++;
             nMechanical ++;
             nMedical ++;
             nEngineering ++;
             nComputer ++;
             nListen ++;
             nParry ++;
             nDiscipline ++;
             nScience ++;
             nSpot ++;
             nMoveSilently ++;
             nSearch ++;
             nShipboard ++;
             nSurvival ++;
             nIntimidate ++;
             nSenseMotive ++;
             nLeader ++;
             nPilot ++;

           SetLocalInt(oPC, "nJOT5", 1);
       }
    if (GetHasFeat(FEAT_ALLIANCE_LECTURE, oPC))

       {
           SendMessageToPC(oPC, "Skill bonuses for Alliance Lecture applied.");
           nAlliance = nAlliance + 2;
            nBluff = nBluff + 2;
           SetLocalInt(oPC, "nAllianceLecture", 1);
       }
    if (GetHasFeat(FEAT_SMUGGLING, oPC))

       {
           SendMessageToPC(oPC, "Skill bonuses for Smuggling applied.");
           nHide = nHide + 2;
            nAdmin = nAdmin + 2;
           SetLocalInt(oPC, "nSmuggling", 1);
       }
    if (GetHasFeat(FEAT_3D_SPATIAL_AWARENESS, oPC))

       {
           SendMessageToPC(oPC, "Skill bonuses for 3D Spatial Awareness applied.");
           nPilot = nPilot + 1;

           SetLocalInt(oPC, "n3DAware", 1);
       }
    if (GetHasFeat(FEAT_COMMAND_PRESENCE, oPC))
    {
        SendMessageToPC(oPC, "Skill bonuses for Command Presence applied.");
        nLeader = nLeader + 3;
        SetLocalInt(oPC, "nCommandPresence", 1);


    }
    if (GetHasFeat(FEAT_NATURAL_LEADER, oPC))
        {
            SendMessageToPC(oPC, "Skill bonuses for Natural Born Leader applied.");
            nLeader = nLeader + 2;
            nPersuade = nPersuade + 2;
            SetLocalInt(oPC, "nNaturalLeader", 1);


        }
    if (GetHasFeat(FEAT_JUNKYARD_DOG, oPC))
        {
            SendMessageToPC(oPC, "Skill bonuses for Junkyard Dog applied.");
            nAppraise = nAppraise + 2;

            SetLocalInt(oPC, "nJunkyardDog", 1);


        }
    if (GetHasFeat(FEAT_SIXTH_SENSE, oPC))
        {
            SendMessageToPC(oPC, "Skill bonuses for Sixth Sense applied.");
            nSearch = nSearch + 2;

            SetLocalInt(oPC, "nSixthSense", 1);


        }
    if (GetHasFeat(FEAT_IMPROVED_SEARCH, oPC))
        {
            SendMessageToPC(oPC, "Skill bonuses for Improved Search applied.");
            nSearch = nSearch + 2;

            SetLocalInt(oPC, "nImprovedSearch", 1);


        }
    if (GetHasFeat(FEAT_TACTICS_I, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "tacticsitool")))
       CreateItemOnObject("tacticsitool", oPC);
    if (GetHasFeat(FEAT_TACTICS_II, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "tacticsiitool")))
       CreateItemOnObject("tacticsiitool", oPC);
    if (nCha < nSocialMod)
        {
            if (GetHasFeat(FEAT_NOBLE_PRESENCE, oPC))
            {

                SendMessageToPC(oPC, "Skill bonuses for Noble Presence applied; Social Standing: "+IntToString(nSocialStanding));
                nLeader = nLeader + (nSocialMod-nCha);
                nPersuade = nPersuade + (nSocialMod-nCha);
                SetLocalInt(oPC, "nNoblePresence", 1);
            }
            if (GetHasFeat(FEAT_NOBLE_INDIGNANCE, oPC))
            {
                SendMessageToPC(oPC, "Skill bonuses for Noble Indignance applied; Social Standing: "+IntToString(nSocialStanding));
                nIntimidate = nIntimidate + (nSocialMod-nCha);
                nBluff = nBluff + (nSocialMod-nCha);
                nBribery = nBribery + (nSocialMod - nCha);
                SetLocalInt(oPC, "nNobleIndignance", 1);

            }

       }


    if (GetHasFeat(FEAT_SCIENCE_LECTURE, oPC))

       {
            SendMessageToPC(oPC, "Skill bonuses for Science Lecture applied.");
            nScience = nScience + 2;
            nBluff = nBluff + 2;
           SetLocalInt(oPC, "nScienceLecture", 1);
       }
    if (GetHasFeat(FEAT_INTERROGATION, oPC))

       {
            SendMessageToPC(oPC, "Skill bonuses for Interrogation applied.");
            nIntimidate = nIntimidate + 2;
            nSenseMotive = nSenseMotive + 2;
           SetLocalInt(oPC, "nInterrogation", 1);
       }

    if (GetHasFeat(FEAT_PROF_SPECIALITY, oPC))

       {
            SendMessageToPC(oPC, "Skill bonuses for Professional Speciality applied.");
            nEngineering = nEngineering + 1;
            nMedical = nMedical + 1;
            nShipboard = nShipboard + 1;
            nMechanical = nMechanical + 1;
            nComputer = nComputer + 1;
            nElectronics = nElectronics + 1;
            SetLocalInt(oPC, "nProfessionalSpeciality", 1);
       }
    if (GetHasFeat(FEAT_HIGH_MORALE, oPC))

       {
            SendMessageToPC(oPC, "Skill bonuses for High Morale applied.");
            nWill = nWill + 2;

           SetLocalInt(oPC, "nHighMorale", 1);
       }
    if (GetHasFeat(FEAT_GEOLOGICAL_SURVEY, oPC))

       {
            SendMessageToPC(oPC, "Skill bonuses for Geological Survey applied.");
            nScience = nScience + 2;
            nShipboard = nShipboard + 2;
           SetLocalInt(oPC, "nGeologicalSurvey", 1);
       }
    if (GetHasFeat(FEAT_FAST_TALK, oPC))

       {
            SendMessageToPC(oPC, "Skill bonuses for Fast Talk applied.");
            nBluff = nBluff + 2;
            nPersuade = nPersuade + 2;
           SetLocalInt(oPC, "nFastTalk", 1);
       }
    if (GetHasFeat(FEAT_PSEUDO_EIDETIC, oPC))

       {
            SendMessageToPC(oPC, "Skill bonuses for Pseudo-Eidetic Memory applied.");
            nScience = nScience + 1;
            nAlliance = nAlliance + 1;
           SetLocalInt(oPC, "nPseudoEidetic", 1);
       }
    if (GetHasFeat(FEAT_ADVANCED_RESEARCH, oPC))

        {
            SendMessageToPC(oPC, "Skill bonuses for Advanced Research applied.");
            nAlliance = nAlliance + 1;
            nScience = nScience + 1;
            nGather = nGather + 2;
            SetLocalInt(oPC, "nAdvancedResearch", 1);

        }
    if (GetHasFeat(FEAT_CAROUSING, oPC))

        {
            SendMessageToPC(oPC, "Skill bonuses for Carousing applied.");
            nPersuade = nPersuade + 2;
            nGather = nGather + 2;
            SetLocalInt(oPC, "nCarousing", 1);
        }

    if (GetHasFeat(FEAT_CONNECTIONS, oPC))

        {
            SendMessageToPC(oPC, "Skill bonuses for Connections applied.");
            nGather = nGather + 2;
            nBroker = nBroker + 2;
            SetLocalInt(oPC, "nConnections", 1);
        }


    if (GetHasFeat(FEAT_GEARHEAD, oPC))

        {
            SendMessageToPC(oPC, "Skill bonuses for Gearhead applied.");
            nElectronics = nElectronics + 2;
            nMechanical = nMechanical + 2;
            SetLocalInt(oPC, "nGearhead", 1);

        }
    if (GetHasFeat(FEAT_HACKER, oPC))

        {
            SendMessageToPC(oPC, "Skill bonuses for Hacker applied.");
            nComputer = nComputer + 2;
            nElectronics = nElectronics + 2;
            SetLocalInt(oPC, "nHacker", 1);

        }
    if (GetHasFeat(FEAT_RESEARCH, oPC))

        {
            SendMessageToPC(oPC, "Skill bonuses for Research applied.");
            nComputer = nComputer + 2;
            nGather = nGather + 2;
            SetLocalInt(oPC, "nResearch", 1);

        }
    if (GetHasFeat(FEAT_TRUSTWORTHY, oPC))

        {
            SendMessageToPC(oPC, "Skill bonuses for Trustworthy applied.");
            nPersuade = nPersuade + 2;
            nGather = nGather + 2;
            SetLocalInt(oPC, "nTrustworthy", 1);

        }
    if (GetHasFeat(FEAT_CALC_EYE, oPC))

        {

            SendMessageToPC(oPC, "Skill bonuses for Calculating Eye applied.");
            nAppraise = nAppraise + 2;
            SetLocalInt(oPC, "nCalcEye", 1);

        }
    if (GetHasFeat(FEAT_EW_SPEC, oPC))

        {
            SendMessageToPC(oPC, "Skill bonuses for EW Specialist applied.");
            nComputer = nComputer + 2;
            nShipboard = nShipboard + 2;
            SetLocalInt(oPC, "nEWSpec", 1);

        }
    if (GetHasFeat(FEAT_DUMB_LUCK, oPC))
         {
            SendMessageToPC(oPC, "Skill bonuses for Dumb Luck applied.");
            nGambling = nGambling + 1;
            SetLocalInt(oPC, "nGambling", 1);

        }
    if (GetHasFeat(FEAT_LEGAL_EAGLE, oPC))

        {
            SendMessageToPC(oPC, "Skill bonuses for Legal Eagle applied.");
            nAlliance = nAlliance + 2;
            nAdmin = nAdmin + 2;
            SetLocalInt(oPC, "nEagle", 1);

        }
    if (GetHasFeat(FEAT_OVR_SHIP_SEC, oPC))

        {
            SendMessageToPC(oPC, "Skill bonuses for Override Ship Security applied.");
            nComputer = nComputer + 2;
            nEngineering = nEngineering + 2;
            SetLocalInt(oPC, "nShipSec", 1);

        }
    if (GetHasFeat(FEAT_MEDICAL_SPECIALIZATION, oPC))

        {
            SendMessageToPC(oPC, "Skill bonuses for Medical Specialization applied.");
            nMedical = nMedical + 2;
            nScience = nScience + 2;
            SetLocalInt(oPC, "nMedicalSpecialization", 1);

        }
    if (GetHasFeat(FEAT_LIFE_DETECTION, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "lifedetection")))
       {
            CreateItemOnObject("lifedetection", oPC);
            CreateItemOnObject("longrangelifedet", oPC);
        }
    if (GetHasFeat(FEAT_TELEMPATHY, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "telempathy")))
       {
            CreateItemOnObject("telempathy", oPC);
            CreateItemOnObject("longrangetelemp", oPC);
        }
    if (GetHasFeat(FEAT_READ_SURFACE_THOUGHTS, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "readsurface")))
       CreateItemOnObject("readsurface", oPC);
    if (GetHasFeat(FEAT_SEND_THOUGHTS, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "sendthoughts")))
       CreateItemOnObject("sendthoughts", oPC);
    if (GetHasFeat(FEAT_PROBE, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "probe")))
       CreateItemOnObject("probe", oPC);
    if (GetHasFeat(FEAT_ASSAULT, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "assault")))
       CreateItemOnObject("assault", oPC);
    if (GetHasFeat(FEAT_SENSE, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "sense")))
       CreateItemOnObject("sense", oPC);
    if (GetHasFeat(FEAT_CLAIRAUDIENCE, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "clairaudience")))
       CreateItemOnObject("clairaudience", oPC);
    if (GetHasFeat(FEAT_COMBINED_CLAIR, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "combinedclair")))
       CreateItemOnObject("combinedclair", oPC);
    if (GetHasFeat(FEAT_SUSPENDED_ANIMATION, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "suspend")))
       CreateItemOnObject("suspend", oPC);
    if (GetHasFeat(FEAT_PSI_ENHANCED_STR, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "psistr")))
       CreateItemOnObject("psistr", oPC);
    if (GetHasFeat(FEAT_PSI_ENHANCED_CON, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "psicon")))
       CreateItemOnObject("psicon", oPC);
    if (GetHasFeat(FEAT_PSI_ENHANCED_DEX, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "psidex")))
       CreateItemOnObject("psidex", oPC);
    if (GetHasFeat(FEAT_REGENERATION, oPC) && !GetIsObjectValid(GetItemPossessedBy(oPC, "psiregen")))
       CreateItemOnObject("regeneration", oPC);


    effect eRem = GetFirstEffect(oPC);
    while (GetIsEffectValid(eRem))
    {
        if (GetEffectCreator(eRem)==OBJECT_SELF)
        {
            if (GetEffectType(eRem)==EFFECT_TYPE_SKILL_INCREASE || GetEffectType(eRem)==EFFECT_TYPE_SAVING_THROW_INCREASE)
                RemoveEffect(oPC, eRem);
        }
        eRem = GetNextEffect(oPC);

    }

    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_ALLIANCE, nAlliance), oPC);
    //SetLocalInt(oPC, "nAlliance", nAlliance);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_ADMIN, nAdmin), oPC);
    //SetLocalInt(oPC, "nAdmin", nAdmin);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_APPRAISE, nAppraise), oPC);
    //SetLocalInt(oPC, "nAppraise", nAppraise);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_HIDE, nHide), oPC);
    //SetLocalInt(oPC, "nHide", nHide);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_BLUFF, nBluff), oPC);
    //SetLocalInt(oPC, "nBluff", nBluff);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_BRIBERY, nBribery), oPC);
    //SetLocalInt(oPC, "nBribery", nBribery);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_GAMBLING, nGambling), oPC);
    //SetLocalInt(oPC, "nGambling", nGambling);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_LISTEN, nListen), oPC);
    //SetLocalInt(oPC, "nListen", nListen);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_SURVIVAL, nSurvival), oPC);
    //SetLocalInt(oPC, "nSurvival", nSurvival);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_PARRY, nParry), oPC);
    //SetLocalInt(oPC, "nParry", nParry);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_SPOT, nSpot), oPC);
    //SetLocalInt(oPC, "nSpot", nSpot);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_FORGERY, nForgery), oPC);
    //SetLocalInt(oPC, "nForgery", nForgery);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_NAVIGATION, nNavigation), oPC);
    //SetLocalInt(oPC, "nNavigation", nNavigation);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_PERFORM, nPerform), oPC);
    //SetLocalInt(oPC, "nPerform", nPerform);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_DISCIPLINE, nDiscipline), oPC);
    //SetLocalInt(oPC, "nDiscipline", nDiscipline);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_MOVE_SILENTLY, nMoveSilently), oPC);
    //SetLocalInt(oPC, "nMoveSilently", nMoveSilently);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_DRIVING, nPilot), oPC);
    //SetLocalInt(oPC, "nPilot", nPilot);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSavingThrowIncrease(SAVING_THROW_WILL, nWill), oPC);
    //SetLocalInt(oPC, "nWill", nWill);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_BROKER, nBroker), oPC);
    //SetLocalInt(oPC, "nBroker", nBroker);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_GATHER_INFO, nGather), oPC);
    //SetLocalInt(oPC, "nGather", nGather);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_INTIMIDATE, nIntimidate), oPC);
    //SetLocalInt(oPC, "nIntimidate", nIntimidate);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_LEADER, nLeader), oPC);
    //SetLocalInt(oPC, "nLeader", nLeader);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_SEARCH, nSearch), oPC);
    //SetLocalInt(oPC, "nSearch", nSearch);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_PERSUADE, nPersuade), oPC);
    //SetLocalInt(oPC, "nPersuade", nPersuade);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_ELECTRONICS, nElectronics), oPC);
    //SetLocalInt(oPC, "nElectronics", nElectronics);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_MECHANICAL, nMechanical), oPC);
    //SetLocalInt(oPC, "nMechanical", nMechanical);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_ENGINEERING, nEngineering), oPC);
    //SetLocalInt(oPC, "nEngineering", nEngineering);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_COMPUTER, nComputer), oPC);
    //SetLocalInt(oPC, "nComputer", nComputer);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_MEDICAL, nMedical), oPC);
    //SetLocalInt(oPC, "nMedical", nMedical);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_SCIENCE, nScience), oPC);
    //SetLocalInt(oPC, "nScience", nScience);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_SENSE_MOTIVE, nSenseMotive), oPC);
    //SetLocalInt(oPC, "nSenseMotive", nSenseMotive);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(SKILL_SHIPBOARD, nShipboard), oPC);
    //SetLocalInt(oPC, "nShipboard", nShipboard);

}
