//
// Spawn Camp
//
//
// CampNumP
// CampNumC
// CampRadius
// CampTrigger
// CampTriggerScript
//
// RW       : Random Walk
// SF       : Spawn Facing Camp
// SG       : Spawn Group
// LT00     : Loot Table
// CD000|T0 : Corpse Decay
// PL0|T00  : Placeable Trap Disabled
// DT000    : Death Script
// RH000    : Return Home
//
//
object GetChildByTag(object oSpawn, string sChildTag);
object GetChildByNumber(object oSpawn, int nChildNum);
object GetSpawnByID(int nSpawnID);
void DeactivateSpawn(object oSpawn);
void DeactivateSpawnsByTag(string sSpawnTag);
void DeactivateAllSpawns();
void DespawnChildren(object oSpawn);
void DespawnChildrenByTag(object oSpawn, string sSpawnTag);

// - [File: spawn_cfg_camp]
void SetCampSpawn(object oCamp, string sCamp, location lCamp);
void SetCampSpawn(object oCamp, string sCamp, location lCamp)
{

//
// Place Custom Camps Here
// -------------------------------------------



    // Spawn Spores
    if (sCamp == "sporecamp")
    {

        // Set Number of Placeables
        SetLocalInt(oCamp, "CampNumP", 20);
        // Set Number of Creatures
        SetLocalInt(oCamp, "CampNumC", 0);
        // Set Radius of Camp
        SetLocalFloat(oCamp, "CampRadius", 25.0);

        // Set Creature 0 to be Trigger
        // Script 00 : Kill him and the Camp Despawns
        SetLocalString(oCamp, "CampTrigger", "C0");
        SetLocalInt(oCamp, "CampTriggerScript", 10);

        // Set Placeable 0 to be Camp Center
        SetLocalString(oCamp, "CampCenter", "P0");

        // Set Placeable 0 and Spawn Flags
        // First Placeable always Spawns at Center of Camp
        // If CampCenter Is Not Set

        SetLocalString(oCamp, "CampC0", "nw_skelmage");
        SetLocalString(oCamp, "CampC0_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP0", "sporecloud");
        SetLocalString(oCamp, "CampP0_Flags", "SP_SG_PL");

        // Set Placeable 1 and Spawn Flags
        SetLocalString(oCamp, "CampP1", "sporecloud");
        SetLocalString(oCamp, "CampP1_Flags", "SP_SG_PL");

        // Set Creature 0 and Spawn Flags
        SetLocalString(oCamp, "CampP2", "sporecloud");
        SetLocalString(oCamp, "CampP2_Flags", "SP_SG_PL");

        // Set Creature 1 and Spawn Flags
        SetLocalString(oCamp, "CampP3", "sporecloud");
        SetLocalString(oCamp, "CampP3_Flags", "SP_SG_PL");

        // Set Creature 2 and Spawn Flags
        SetLocalString(oCamp, "CampP4", "sporecloud");
        SetLocalString(oCamp, "CampP4_Flags", "SP_SG_PL");

        // Set Creature 3 and Spawn Flags
        SetLocalString(oCamp, "CampP5", "sporecloud");
        SetLocalString(oCamp, "CampP5_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP6", "sporecloud");
        SetLocalString(oCamp, "CampP6_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP7", "sporecloud");
        SetLocalString(oCamp, "CampP7_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP8", "sporecloud");
        SetLocalString(oCamp, "CampP8_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP9", "sporecloud");
        SetLocalString(oCamp, "CampP9_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP10", "sporecloud");
        SetLocalString(oCamp, "CampP10_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP11", "sporecloud");
        SetLocalString(oCamp, "CampP11_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP12", "sporecloud");
        SetLocalString(oCamp, "CampP12_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP13", "sporecloud");
        SetLocalString(oCamp, "CampP13_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP14", "sporecloud");
        SetLocalString(oCamp, "CampP14_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP15", "sporecloud");
        SetLocalString(oCamp, "CampP15_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP16", "sporecloud");
        SetLocalString(oCamp, "CampP16_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP17", "sporecloud");
        SetLocalString(oCamp, "CampP17_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP18", "sporecloud");
        SetLocalString(oCamp, "CampP18_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP19", "sporecloud");
        SetLocalString(oCamp, "CampP19_Flags", "SP_SG_PL");



    }
    else if (sCamp == "sporecamp2")
    {

        // Set Number of Placeables
        SetLocalInt(oCamp, "CampNumP", 20);
        // Set Number of Creatures
        SetLocalInt(oCamp, "CampNumC", 0);
        // Set Radius of Camp
        SetLocalFloat(oCamp, "CampRadius", 25.0);

        // Set Creature 0 to be Trigger
        // Script 00 : Kill him and the Camp Despawns
        SetLocalString(oCamp, "CampTrigger", "C0");
        SetLocalInt(oCamp, "CampTriggerScript", 10);

        // Set Placeable 0 to be Camp Center
        SetLocalString(oCamp, "CampCenter", "P0");

        // Set Placeable 0 and Spawn Flags
        // First Placeable always Spawns at Center of Camp
        // If CampCenter Is Not Set

        SetLocalString(oCamp, "CampC0", "nw_skelmage");
        SetLocalString(oCamp, "CampC0_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP0", "sporecloud2");
        SetLocalString(oCamp, "CampP0_Flags", "SP_SG_PL");

        // Set Placeable 1 and Spawn Flags
        SetLocalString(oCamp, "CampP1", "sporecloud2");
        SetLocalString(oCamp, "CampP1_Flags", "SP_SG_PL");

        // Set Creature 0 and Spawn Flags
        SetLocalString(oCamp, "CampP2", "sporecloud2");
        SetLocalString(oCamp, "CampP2_Flags", "SP_SG_PL");

        // Set Creature 1 and Spawn Flags
        SetLocalString(oCamp, "CampP3", "sporecloud2");
        SetLocalString(oCamp, "CampP3_Flags", "SP_SG_PL");

        // Set Creature 2 and Spawn Flags
        SetLocalString(oCamp, "CampP4", "sporecloud2");
        SetLocalString(oCamp, "CampP4_Flags", "SP_SG_PL");

        // Set Creature 3 and Spawn Flags
        SetLocalString(oCamp, "CampP5", "sporecloud2");
        SetLocalString(oCamp, "CampP5_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP6", "sporecloud2");
        SetLocalString(oCamp, "CampP6_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP7", "sporecloud2");
        SetLocalString(oCamp, "CampP7_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP8", "sporecloud2");
        SetLocalString(oCamp, "CampP8_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP9", "sporecloud2");
        SetLocalString(oCamp, "CampP9_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP10", "sporecloud2");
        SetLocalString(oCamp, "CampP10_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP11", "sporecloud2");
        SetLocalString(oCamp, "CampP11_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP12", "sporecloud2");
        SetLocalString(oCamp, "CampP12_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP13", "sporecloud2");
        SetLocalString(oCamp, "CampP13_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP14", "sporecloud2");
        SetLocalString(oCamp, "CampP14_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP15", "sporecloud2");
        SetLocalString(oCamp, "CampP15_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP16", "sporecloud2");
        SetLocalString(oCamp, "CampP16_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP17", "sporecloud2");
        SetLocalString(oCamp, "CampP17_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP18", "sporecloud2");
        SetLocalString(oCamp, "CampP18_Flags", "SP_SG_PL");

        SetLocalString(oCamp, "CampP19", "sporecloud2");
        SetLocalString(oCamp, "CampP19_Flags", "SP_SG_PL");
    }


    else if (sCamp == "streetmurder")
        {

        switch (d2(1))
        {
        case 1:

            SetLocalInt(oCamp, "CampNumP", 1);

            SetLocalInt(oCamp, "CampNumC", 2);

            SetLocalFloat(oCamp, "CampRadius", 10.0);

            SetLocalString(oCamp, "CampTrigger", "C0");
            SetLocalInt(oCamp, "CampTriggerScript", 0);

            SetLocalString(oCamp, "CampCenter", "P0");


            SetLocalString(oCamp, "CampC0", "murderer");
            SetLocalString(oCamp, "CampC0_Flags", "SP_SG");

            SetLocalString(oCamp, "CampC1", "murderer");
            SetLocalString(oCamp, "CampC1_Flags", "SP_SG");

            SetLocalString(oCamp, "CampP0", "corpse");
            SetLocalString(oCamp, "CampP0_Flags", "SP_SG_PL");
            break;

         case 2:

            SetLocalInt(oCamp, "CampNumP", 1);

            SetLocalInt(oCamp, "CampNumC", 3);

            SetLocalFloat(oCamp, "CampRadius", 10.0);

            SetLocalString(oCamp, "CampTrigger", "C0");
            SetLocalInt(oCamp, "CampTriggerScript", 0);

            SetLocalString(oCamp, "CampCenter", "P0");


            SetLocalString(oCamp, "CampC0", "murderer");
            SetLocalString(oCamp, "CampC0_Flags", "SP_SG");

            SetLocalString(oCamp, "CampC1", "murderer");
            SetLocalString(oCamp, "CampC1_Flags", "SP_SG");

            SetLocalString(oCamp, "CampC1", "murderer");
            SetLocalString(oCamp, "CampC1_Flags", "SP_SG");

            SetLocalString(oCamp, "CampP0", "corpse");
            SetLocalString(oCamp, "CampP0_Flags", "SP_SG_PL");
            break;
        }
        }
    else if (sCamp == "c_foxes")
        {


            SetLocalInt(oCamp, "CampNumP", 0);

            SetLocalInt(oCamp, "CampNumC", 3);

            SetLocalFloat(oCamp, "CampRadius", 2.0);

            SetLocalString(oCamp, "CampTrigger", "C0");
            SetLocalInt(oCamp, "CampTriggerScript", 0);

            SetLocalString(oCamp, "CampCenter", "P0");


            SetLocalString(oCamp, "CampC0", "tt_lkbandit_1001");
            SetLocalString(oCamp, "CampC0_Flags", "SP_SF");

            SetLocalString(oCamp, "CampC1", "kh_foxs_mira");
            SetLocalString(oCamp, "CampC1_Flags", "SP_SF");

            SetLocalString(oCamp, "CampC2", "kh_foxs_iron");
            SetLocalString(oCamp, "CampC2_Flags", "SP_SF");



    }


 }














    //


// -------------------------------------------
//

