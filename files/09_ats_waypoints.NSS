//-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//
//  Adam's Improved Waypoint Walker
//  July 2, 2002
//
//  USAGE:
//
//       ATS_WalkWayPoints( int nRun, float fPause, int nWalkType );
//
//  PARAMETERS:
//
//      nRun      -  Use TRUE or FALSE for running or walking.  Defaults to FALSE;
//      fPause    -  A floating point number for the length of pause at each stop.  Defaults to 1.0f
//      nWalkType -  Type of walking to do:
//                      1 - Default.  Back and forth pattern.  (Waypoints 1, 2, 3, 4, 3, 2, 1, 2...)
//                      2 - Circular  (Waypoints 1, 2, 3, 4, 1, 2...)
//                      3 or more - Random.  Give the number of waypoints possible (say, 7), and
//                                  the character will choose one at random.
//
//  EXAMPLES:
//
//
//    In your NPC's OnSpawn script, make sure that at the top you have the
//    following two lines:
//
//    #include "NW_I0_GENERIC"    // this line will already be there
//    #include "ats_waypoints"    // add this line after the previous one
//
//    Then, instead of using the default WalkWayPoints(), replace it with something like:
//
//    ATS_WalkWayPoints();   //  Use all the defaults.  Walk, 1 second pause, back-and-forth.
//    ATS_WalkWayPoints(FALSE, 1.0f, 2);   //  Walk, 1 second pause, circular path
//    ATS_WalkWayPoints(TRUE, 5.0f, 8);    //  Run around the 8 waypoints randomly, with a 5 second pause
//                                            //  at each.
//
//
//    Note that this script will give an error if you try to compile it.
//    That's fine.  Just save it, and #include it in other scripts to use it.
//
//  ADDITIONAL NOTES:
//
//   If you create a script with the same name as one of the waypoints, that
//   script will be executed by the NPC when they walk to that waypoint.
//
//   For example, if your waypoints are tagged WP_GUARD_01, WP_GUARD_02, etc...
//   and at WP_GUARD_05 you want him to bow and say "Hello m'lord!", then
//   create a script called "wp_guard_05" (in lower case).
//   That script should look like this:
//
//    void main()
//    {
//        ActionPlayAnimation(ANIMATION_FIREFORGET_BOW);
//        ActionDoCommand(SpeakString("Hello m'lord!")));
//    }
//
//
//   Please note that the script for the waypoints should contain ONLY
//   actions.  Luckily, you can do any arbitrary command (I think)
//   as an action by wrapping it in a ActionDoCommand(...) function call
//   (like the SpeakString above).
//
//
//   As with the default WalkWayPoints(), it is easily interrupted if you
//   start a conversation with the NPC, or otherwise call ClearAllActions();
//   To restart the NPC, issue another call to ATS_WalkWayPoints() as necessary
//   after a conversation or whatever.
//
//   Please give me your comments!
//   Please use this in your mods!
//   Please give me credit and/or thanks if you like it!
//
//   Adam Spragg
//   aspragg@yahoo.com
//
//   DISCLAIMER!
//   This script has been tested on my setup, and works very well.
//   That does not mean, however, that it won't completely screw your own
//   stuff up.  Use at your own risk.



//void ATS_WalkWayPoints(int nRun = FALSE, float fPause = 1.0, int nWalkType = 1);

//
//  Edited Bioware functions
void RunCircuit2(int nTens, int nNum, int nRun = FALSE, float fPause = 1.0, int nWalkType = 1);
void WalkWayPoints2(int nRun = FALSE, float fPause = 1.0, int nWalkType = 1);
void RunNextCircuit2(int nRun = FALSE, float fPause = 1.0, int nWalkType = 1);


//************************************************************************************************************************************
//************************************************************************************************************************************
//
//WAY POINT WALK FUNCTIONS
//
//************************************************************************************************************************************
//************************************************************************************************************************************


void ATS_WalkWayPoints( int nRun = FALSE, float fPause = 1.0, int nWalkType = 1)
{

  WalkWayPoints2(nRun, fPause, nWalkType);

}


 //::///////////////////////////////////////////////
//:: Walk Way Point Path
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Allows specified person walk a waypoint path
*/
//:://////////////////////////////////////////////
//:: Created By: Aidan Scanlan
//:: Created On: July 10, 2001
//:://////////////////////////////////////////////

void WalkWayPoints2(int nRun = FALSE, float fPause = 1.0, int nWalkType = 1)  //Run first circuit
{
    ClearAllActions();
    string DayWayString;
    string NightWayString;
    string DayPostString;
    string NightPostString;
    string sWay;
    string sPost;

    //The block of code below deals with night and day cycle for postings and walkway points.
    if (GetSpawnInCondition(NW_FLAG_DAY_NIGHT_POSTING))
    {
        DayWayString = "WP_";
       NightWayString = "WN_";
        DayPostString = "POST_";
        NightPostString = "NIGHT_";
    }
    else
    {
        DayWayString = "WP_";
        NightWayString = "WP_";
        DayPostString = "POST_";
        NightPostString = "POST_";
    }

    if(GetIsDay() || GetIsDawn())
    {
        SetLocalString(OBJECT_SELF, "NW_GENERIC_WALKWAYS_PREFIX", DayWayString);
        SetLocalString(OBJECT_SELF, "NW_GENERIC_POSTING_PREFIX", DayPostString);
    }
    else
    {
        SetLocalString(OBJECT_SELF, "NW_GENERIC_WALKWAYS_PREFIX", NightWayString);
        SetLocalString(OBJECT_SELF, "NW_GENERIC_POSTING_PREFIX", NightPostString);
    }


    sWay = GetLocalString(OBJECT_SELF, "NW_GENERIC_WALKWAYS_PREFIX");
    sPost = GetLocalString(OBJECT_SELF, "NW_GENERIC_POSTING_PREFIX");

    //I have now determined what the prefixs for the current walkways and postings are and will use them instead
    // of POST_ and WP_

    if(GetSpawnInCondition(NW_FLAG_STEALTH))
    {
        //MyPrintString("GENERIC SCRIPT DEBUG STRING ********** " + "Attempting to Activate Stealth");
        ActionUseSkill(SKILL_HIDE, OBJECT_SELF);
    }
    if(GetSpawnInCondition(NW_FLAG_SEARCH))
    {
        //MyPrintString("GENERIC SCRIPT DEBUG STRING ********** " + "Attempting to Activate Search");
        ActionUseSkill(SKILL_SEARCH, OBJECT_SELF);
    }

    //Test if OBJECT_SELF has waypoints to walk
    string sWayTag = GetTag( OBJECT_SELF );
    sWayTag = sWay + sWayTag + "_01";
    object oWay1 = GetNearestObjectByTag(sWayTag);
    if(!GetIsObjectValid(oWay1))
    {
        oWay1 = GetObjectByTag(sWayTag);
    }
    if(GetIsObjectValid(oWay1) && GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS))
    {
        //turn off the ambient animations if the creature should walk way points.
        SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS, FALSE);
        SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS, FALSE);
    }

    if(GetIsObjectValid(oWay1))
    {
        int nNth = 1;
        int nTens;
        int nNum;
        object oNearest = GetNearestObject(OBJECT_TYPE_WAYPOINT, OBJECT_SELF, nNth);
        while (GetIsObjectValid(oNearest))
        {
           string sNearestTag = GetTag(oNearest);
           //removes the first 3 and last three characters from the waypoint's tag
           //and checks it against his own tag.  Waypoint tag format is WP_MyTag_XX.
           if( GetSubString( sNearestTag, 3, GetStringLength( sNearestTag ) - 6 ) == GetTag( OBJECT_SELF ) )
           {
                string sTens = GetStringRight(GetTag(oNearest),2);
                nTens = StringToInt(sTens)/10;
                nNum= StringToInt(GetStringRight(GetTag(oNearest),1));
                oNearest = OBJECT_INVALID;
           }
           else
           {
               nNth++;
               oNearest = GetNearestObject(OBJECT_TYPE_WAYPOINT,OBJECT_SELF,nNth);
           }
        }
        RunCircuit2(nTens, nNum, nRun, fPause, nWalkType); //***************************************
        ActionWait(fPause);
        ActionDoCommand(RunNextCircuit2(nRun, fPause, nWalkType));
        //ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(2)));
    }
    else
    {
        sWayTag = GetTag( OBJECT_SELF );
        sWayTag = sPost + sWayTag;
        oWay1 = GetNearestObjectByTag(sWayTag);
        if(!GetIsObjectValid(oWay1))
        {
            oWay1 = GetObjectByTag(sWayTag);
        }

        if(GetIsObjectValid(oWay1))
        {
            ActionForceMoveToObject(oWay1, nRun, 1.0, 60.0);
            float fFacing = GetFacing(oWay1);
            ActionDoCommand(SetFacing(fFacing));
        }
    }
    if(GetIsObjectValid(oWay1) && GetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS))
    {
        SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS, FALSE);
        SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS, FALSE);
    }
}

void RunNextCircuit2(int nRun = FALSE, float fPause = 1.0, int nWalkType = 1)
{

    RunCircuit2(0,1, nRun, fPause, nWalkType);  //***************************************
    ActionWait(fPause);
    ActionDoCommand(RunNextCircuit2(nRun, fPause, nWalkType));
    //ActionDoCommand(SignalEvent(OBJECT_SELF,EventUserDefined(2)));
}

//::///////////////////////////////////////////////
//:: Run Circuit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Calculates the proper path to follow along a
    predetermined set of way points
*/
//:://////////////////////////////////////////////
//:: Created By: Aidan Scanlan
//:: Created On: July 10, 2001
//:://////////////////////////////////////////////

void RunCircuit2(int nTens, int nNum, int nRun = FALSE, float fPause = 1.0, int nWalkType = 1)
{
    // starting at a given way point, move sequentialy through incrementally
    // increasing points until there are no more valid ones.
    string sWay = GetLocalString(OBJECT_SELF, "NW_GENERIC_WALKWAYS_PREFIX");

    object oTargetPoint;

    if ( nWalkType >= 3 )
    {
       int nRand = Random(nWalkType) + 1;
       nTens = nRand/10;
       nNum= nRand - (nTens * 10);

       oTargetPoint = GetWaypointByTag(sWay + GetTag(OBJECT_SELF) + "_" + IntToString(nTens) +IntToString(nNum));
       ActionMoveToObject(oTargetPoint, nRun);
       ActionWait(fPause);
       ExecuteScript(GetStringLowerCase(GetTag(oTargetPoint)), OBJECT_SELF);
       return;
    }

    oTargetPoint = GetWaypointByTag(sWay + GetTag(OBJECT_SELF) + "_" + IntToString(nTens) +IntToString(nNum));

    while(GetIsObjectValid(oTargetPoint))
    {
        ActionMoveToObject(oTargetPoint, nRun);
        ActionWait(fPause);
        ExecuteScript(GetStringLowerCase(GetTag(oTargetPoint)), OBJECT_SELF);
        nNum++;
        if (nNum > 9)
        {
            nTens++;
            nNum = 0;
        }
        oTargetPoint = GetWaypointByTag(sWay + GetTag(OBJECT_SELF) + "_" + IntToString(nTens) +IntToString(nNum));

    }

    // ATS
    // If walktype is 2 (Circlular), then return at this point...
    if ( nWalkType == 2 )
        return;

    // once there are no more waypoints available, decriment back to the last
    // valid point.
    nNum--;
    if (nNum < 0)
    {
        nTens--;
        nNum = 9;
    }

    // start the cycle again going back to point 01
    oTargetPoint = GetWaypointByTag(sWay + GetTag(OBJECT_SELF) + "_" + IntToString(nTens) +IntToString(nNum));
    while(GetIsObjectValid(oTargetPoint))
    {
        ActionMoveToObject(oTargetPoint, nRun);
        ActionWait(fPause);
        ExecuteScript(GetStringLowerCase(GetTag(oTargetPoint)), OBJECT_SELF);
        nNum--;
        if (nNum < 0)
        {
            nTens--;
           nNum = 9;
        }
        oTargetPoint = GetWaypointByTag(sWay + GetTag(OBJECT_SELF) + "_" + IntToString(nTens) +IntToString(nNum));
    }
}