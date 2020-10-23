//::///////////////////////////////////////////////
//:: Associate: On Spawn In
//:: NW_CH_AC9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 19, 2001
//:://////////////////////////////////////////////

#include "X0_INC_HENAI"
#include "x0_i0_anims"
// #include "x0_i0_walkway" - in x0_i0_anims
#include "x0_i0_treasure"
#include "inc_d20"
#include "x2_inc_switches"
#include "_mdrn_rof"

void main()
{
    SetAssociateListenPatterns();//Sets up the special henchmen listening patterns

    bkSetListeningPatterns();      // Goes through and sets up which shouts the NPC will listen to.

    SetAssociateState(NW_ASC_POWER_CASTING);
    SetAssociateState(NW_ASC_HEAL_AT_50);
    SetAssociateState(NW_ASC_RETRY_OPEN_LOCKS);
    SetAssociateState(NW_ASC_DISARM_TRAPS);
    SetAssociateState(NW_ASC_MODE_DEFEND_MASTER, FALSE);
    SetAssociateState(NW_ASC_USE_RANGED_WEAPON, FALSE); //User ranged weapons by default if true.
    SetAssociateState(NW_ASC_DISTANCE_2_METERS);

    // April 2002: Summoned monsters, associates and familiars need to stay
    // further back due to their size.
    int nType = GetAssociateType(OBJECT_SELF);
    switch (nType)
    {
        case ASSOCIATE_TYPE_ANIMALCOMPANION:
        case ASSOCIATE_TYPE_DOMINATED:
        case ASSOCIATE_TYPE_FAMILIAR:
        case ASSOCIATE_TYPE_SUMMONED:
            SetAssociateState(NW_ASC_DISTANCE_4_METERS);
            break;

    }

/*    if (GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, GetMaster()) == OBJECT_SELF  ||
        GetAssociate(ASSOCIATE_TYPE_DOMINATED, GetMaster()) == OBJECT_SELF  ||
        GetAssociate(ASSOCIATE_TYPE_FAMILIAR, GetMaster()) == OBJECT_SELF  ||
        GetAssociate(ASSOCIATE_TYPE_SUMMONED, GetMaster()) == OBJECT_SELF)
    {
            SetAssociateState(NW_ASC_DISTANCE_4_METERS);
    }
*/
    // * Feb 2003: Set official campaign henchmen to have no inventory
    SetLocalInt(OBJECT_SELF, "X0_L_NOTALLOWEDTOHAVEINVENTORY", 10) ;

    //SetAssociateState(NW_ASC_MODE_DEFEND_MASTER);
    SetAssociateStartLocation();
    // SPECIAL CONVERSATION SETTTINGS
    //SetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION);
    //SetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION);
            // This causes the creature to say a special greeting in their conversation file
            // upon Perceiving the player. Attach the [NW_D2_GenCheck.nss] script to the desired
            // greeting in order to designate it. As the creature is actually saying this to
            // himself, don't attach any player responses to the greeting.


// CUSTOM USER DEFINED EVENTS
/*
    The following settings will allow the user to fire one of the blank user defined events in the NW_D2_DefaultD.  Like the
    On Spawn In script this script is meant to be customized by the end user to allow for unique behaviors.  The user defined
    events user 1000 - 1010
*/
    //SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);         //OPTIONAL BEHAVIOR - Fire User Defined Event 1002
    //SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);           //OPTIONAL BEHAVIOR - Fire User Defined Event 1005
    //SetSpawnInCondition(NW_FLAG_DAMAGED_EVENT);          //OPTIONAL BEHAVIOR - Fire User Defined Event 1006
    //SetSpawnInCondition(NW_FLAG_DISTURBED_EVENT);        //OPTIONAL BEHAVIOR - Fire User Defined Event 1008
    //SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT); //OPTIONAL BEHAVIOR - Fire User Defined Event 1003
    //SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);      //OPTIONAL BEHAVIOR - Fire User Defined Event 1004
    //SetSpawnInCondition(NW_FLAG_DEATH_EVENT);            //OPTIONAL BEHAVIOR - Fire User Defined Event 1007
     SetIsDestroyable(FALSE, TRUE, TRUE);
    DelayCommand(1.0, SetLootable(OBJECT_SELF, TRUE));

    WalkWayPoints();
     SetListening(OBJECT_SELF, TRUE);
    SetListenPattern(OBJECT_SELF, "**", 20600); //listen to all text
    SetLocalInt(OBJECT_SELF, "hls_Listening", 1); //listen to all text
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
    if (GetLocalInt(oPC, "n"+IntToString(nIdx))>0)
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

if (GetHasFeat(FEAT_MELEESMASH, oPC) && GetWeaponRanged(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))==FALSE)
{
    nDamB = nDamB + 1;

}
if (GetHasFeat(FEAT_IMPROVEDMELEESMASH, oPC) && GetWeaponRanged(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))==FALSE)
{
    nDamB = nDamB + 1;

}
if (GetHasFeat(FEAT_ADVANCEDMELEESMASH, oPC) && GetWeaponRanged(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC))==FALSE)
{
    nDamB = nDamB + 1;

}
if (nDamB > 0)
{
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDamageIncrease(nDamB, DAMAGE_TYPE_BLUDGEONING), oPC);
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
int nNewAP = GetHitDice(oPC)*(6+GetHitDice(oPC)/2);
DelayCommand(3.0, SetDroppableFlag(CreateItemOnObject("actionpoint", oPC, nNewAP), FALSE));
int nNewWealth = d4(2)+(GetSkillRank(SKILL_PROFESSION, oPC)>0);
DelayCommand(3.0, SetDroppableFlag(CreateItemOnObject("wealth", oPC, nNewWealth), FALSE));




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
// Superheroes section
object oEnhance = GetFirstItemInInventory(oPC);
while (GetIsObjectValid(oEnhance))
{
     if (GetTag(oEnhance)=="_super_power")
     {
          SetItemStackSize(oEnhance, 3+GetHitDice(oPC));

          ExecuteScript("_super_enhance", oEnhance);
     }


    oEnhance = GetNextItemInInventory(oPC);
}
// End superheroes section

    //* Create a small amount of treasure on the creature
    if ((GetLocalInt(GetModule(), "X2_L_NOTREASURE") == FALSE)  &&
        (GetLocalInt(OBJECT_SELF, "X2_L_NOTREASURE") == FALSE)   )
    {
        CTG_GenerateNPCTreasure(TREASURE_TYPE_MONSTER, OBJECT_SELF);
    }


    // ***** ADD ANY SPECIAL ON-SPAWN CODE HERE ***** //
    object oGun = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, OBJECT_SELF);
    if (GetBaseItemType(oGun)==BASE_ITEM_SLING && GetBaseItemType(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, OBJECT_SELF))==213)
    {
         SetLocalInt(OBJECT_SELF, "nDualMode", 1);
        SetLocalObject(oGun, "oPC", OBJECT_SELF);
        ExecuteScript("_mdrn_exe_offhan", oGun);

    }

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


