//rs_init
//Initialize spawn system and configuration, let's not use heartbeats

#include "rs_include"
void main()
{
    int iWPID = 1;
    int x = 0;
    object oWP = GetObjectByTag("RS_WAYPOINT_VAULT");  //vault for storing global variables
    object oCWP = GetObjectByTag(RS_CREATURE_WAYPOINT,x);
    object oPWP = GetObjectByTag(RS_PLACEABLE_WAYPOINT, x);
    object oTWP = GetObjectByTag(RS_TRAP_WAYPOINT, x);
    object oIWP = GetObjectByTag(RS_ITEM_WAYPOINT, x);

    while(GetIsObjectValid(oCWP)
            || GetIsObjectValid(oPWP)
            || GetIsObjectValid(oTWP)
            || GetIsObjectValid(oIWP)
            )//set up spawns ID's
    {
        if(GetIsObjectValid(oCWP))
        {
            SetLocalInt(oCWP, "WPID", iWPID);
            SetLocalInt(oCWP, "SpawnTime", 1);
            iWPID++;
        }
        if(GetIsObjectValid(oPWP))
        {
            SetLocalInt(oPWP, "WPID", iWPID);
            SetLocalInt(oPWP, "SpawnTime", 1);
            iWPID++;
        }
        if(GetIsObjectValid(oTWP))
        {
            SetLocalInt(oTWP, "WPID", iWPID);
            SetLocalInt(oTWP, "SpawnTime", 1);
            iWPID++;
        }
        if(GetIsObjectValid(oIWP))
        {
            SetLocalInt(oIWP, "WPID", iWPID);
            SetLocalInt(oIWP, "SpawnTime", 1);
            iWPID++;
        }

        x++;
        oCWP = GetObjectByTag(RS_CREATURE_WAYPOINT,x);
        oPWP = GetObjectByTag(RS_PLACEABLE_WAYPOINT,x);
        oTWP = GetObjectByTag(RS_TRAP_WAYPOINT,x);
        oIWP = GetObjectByTag(RS_ITEM_WAYPOINT, x);
    }
    SetLocalInt(oWP, "NumOfInitialWPIDs", iWPID);
    iWPID++;

    SetLocalInt(oWP, "NextAvailID", iWPID);
}
