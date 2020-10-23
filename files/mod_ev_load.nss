//Main module loading event script

//Note by MadRabbit on April 16, 2009 : Horses have been disabled in the other
//modules, but I have left the settings in this one in case they are ever added again.
//Uneeded horse code is commented out. Look for my comments to find starting and
//ending points



#include "gs_inc_time"
#include "x2_inc_switches"
#include "nwnx_weapon"

void main()
{
//Set standard module switches
    SetModuleSwitch (MODULE_VAR_AI_STOP_EXPERTISE_ABUSE, TRUE);
    SetModuleSwitch (MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS, TRUE);
    SetLocalInt(GetModule(),"X2_L_NOTREASURE",TRUE);
//    SetModuleSwitch (MODULE_SWITCH_DISABLE_ITEM_CREATION_FEATS, TRUE);

//Load the spellhook
    SetModuleOverrideSpellscript("mr_spellhook");


//////////////////////////////////////////////
//Colour Tag custom Tokens for journal/Convos
    SetCustomToken(7100, "</c>"); // CLOSE tag
    SetCustomToken(7101, "<c?  >"); // red
    SetCustomToken(7102, "<c ? >"); // green
    SetCustomToken(7103, "<c  ?>"); // blue
    SetCustomToken(7104, "<c ??>"); // cyan
    SetCustomToken(7105, "<c? ?>"); // magenta
    SetCustomToken(7106, "<c?? >"); // yellow
    SetCustomToken(7107, "<c   >"); // black
    SetCustomToken(7108, "<c?  >"); // dark red
    SetCustomToken(7109, "<c ? >"); // dark green
    SetCustomToken(7110, "<c  ?>"); // dark blue
    SetCustomToken(7111, "<c ??>"); // dark cyan
    SetCustomToken(7112, "<c? ?>"); // dark magenta
    SetCustomToken(7113, "<c?? >"); // dark yellow
    SetCustomToken(7114, "<c???>"); // grey
    SetCustomToken(7117, "<c???>"); // dark grey
    SetCustomToken(7115, "<c?? >"); // orange
    SetCustomToken(7116, "<c?? >"); // dark orange
    SetCustomToken(7117, "<c?#>"); // brown
    SetCustomToken(7118, "<c? >"); // dark brown

/////////////////////////////////////////////////

//Set the initial location of the resources
    SetLocalString(GetModule(), "TensFireStone", "Tens Resource House");
    SetLocalString(GetModule(), "AnamcharaFireStone", "Anamchara Resource House");
    SetLocalString(GetModule(), "ElzigardFireStone", "Elzigard Resource House");

    object oAnamSpawnPoint=GetWaypointByTag("anamresourcept");
    object oTensSpawnPoint=GetWaypointByTag("tensresourcept");
    object oElziSpawnPoint=GetWaypointByTag("elziresourcept");

    location lSpawnAnam=GetLocation(oAnamSpawnPoint);
    location lSpawnElzi=GetLocation(oElziSpawnPoint);
    location lSpawnTens=GetLocation(oTensSpawnPoint);

//Spawn the resources
    CreateObject(OBJECT_TYPE_PLACEABLE, "zep_crystal006", lSpawnAnam);
    CreateObject(OBJECT_TYPE_PLACEABLE, "elzigardfireston", lSpawnElzi);
    CreateObject(OBJECT_TYPE_PLACEABLE, "tens", lSpawnTens);

//Set up the portal ownership (note: this should be deleted at some point if we want to make capturing
//forts work across server crashes and resets)
    string sCampaign = "Isleofstyss";
//1 = Anam owns the portal  2 = Elzigard owns the portal  3 = Tens owns the portal
    SetCampaignInt (sCampaign,"iAnamPortals",1);
    SetCampaignInt (sCampaign,"iElzPortals",2);
    SetCampaignInt (sCampaign,"iTensPortals",3);

//More color token generation. Need to look at this sometime to find the unrecognized tokens in the
//login messages
    CollorModLoad("Collorgeneration");

//Initialize game time (needed for the banking system)
    SetLocalInt(OBJECT_SELF, "GS_YEAR", GetCalendarYear());
    int nTimestamp = GetCampaignInt("GS_SYSTEM", "TIMESTAMP");
    if (nTimestamp) gsTISetTime(nTimestamp);

    // Dev Crit change.
    WriteTimestampedLogEntry("Configuring devestating critical.");
    NWNX_Weapon_SetDevastatingCriticalEventScript("ft_devcrit");

////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////         Horse Settings        //////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

//MR Code Modification Begins

//Prevent graphics glitch when mounting on a steep hill
//    SetLocalInt(GetModule(),"bX3_MOUNT_NO_ZAXIS",TRUE);

//Limit henchmen/horses
//    SetMaxHenchmen(1);

//No lootable horse corpses
//    SetLocalInt(GetModule(),"X3_HORSE_NO_CORPSES",TRUE);

//Enable/Disable mount database (currently disabled for performance reasons)
//    SetLocalInt(GetModule(),"X3_ENABLE_MOUNT_DB",FALSE);

//No Resting on Horse
//    SetLocalInt(GetModule(),"X3_MOUNT_NO_REST_DISMOUNT",FALSE);

//No Horse AC Boost (exploit fix as well)
//    SetLocalInt(GetModule(),"X3_HORSE_ENABLE_ACBOOST",FALSE);

//Horse HP Boost
//    SetLocalInt(GetModule(),"X3_HORSE_ENABLE_HPBOOST",TRUE);

/*List of Areas we're excluding horses from - easier than setting the area variables by hand
Global Settings:

    * Mounts are allowed in exterior areas only.*/
//    SetLocalInt(GetModule(),"X3_MOUNTS_EXTERNAL_ONLY",TRUE);
    // * No horses are allowed underground.
//    SetLocalInt(GetModule(),"X3_MOUNTS_NO_UNDERGROUND",TRUE);
/*
Specific Maps (use area tag):
Notes: We're excluding horses from indoor and underground areas globally, so those don't need to be here.
       The only areas listed are areas marked as 'outdoors' we don't want horses in.
       This mostly covers the warzone, the 'special' inn rooms, Blackwaters Rock, and the other cities.*/

//    SetLocalInt(GetObjectByTag("Anamchara"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("AnamcharaHousing"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("Elzigard"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("ElzigardHousing"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("TensCity"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("NewTensHousing"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("NewOOCarea"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("TheMercenaryCamp"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("TheMercenaryCampSouth"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("TheMercenaryCampWest"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("TheJaggedCrossroadsInnWesternLak"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("MephsPark"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("pirateship"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("trb_garden_paradice"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("SandyOasis"), "X3_NO_HORSES", TRUE);
 //   SetLocalInt(GetObjectByTag("ArcaneTower"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("OPH_Room03"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("PeelMeaFig"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("Desafinado"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("OPH_Room07"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("DayattheBeach"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("DesertDesires"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("NaughtyNymph"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("PolarOpposites"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("RomanticRuins"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("Frozenanam"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("Crossroads"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("ElzigardFortress"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("Eid_StyssNorthHill"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("Eid_StyssPondShores"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("Eid_StyssSouthHill"), "X3_NO_HORSES", TRUE);
//    SetLocalInt(GetObjectByTag("TensFortress"), "X3_NO_HORSES", TRUE);

/* This is a list of areas that we -allow- horses in, even if the area is marked as underground or indoors.
   Mostly here to show how to do this if we add a stable or something, (using the DM room as an example.)*/

//    SetLocalInt(GetObjectByTag("OOC"), "X3_MOUNT_OK_EXCEPTION", TRUE);

// MR Code Modfication Ends

//Unused settings, for reference/possible changes:

    // * This tells how long you have left in seconds before you will be force-mounted
    // * if you got stuck while moving to horse in mounting procedure, unless you
    // * are using X3_HORSE_ACT_VS_DELAY method, where you can interrupt your movement
    // * before reaching the mounting spot.
    //SetLocalFloat(GetModule(),"fX3_TIMEOUT_TO_MOUNT",12.0f);

    // * Once per fX3_FREQUENCY (default = 1.0s) seconds character will retry to
    // * get on the right path when moving to horse in case he gets stuck or
    // * something makes him temporarily stuck, if he doesnt get to horse in
    // * fX3_TIMEOUT_TO_MOUNT seconds, he is forced to mount.
    //SetLocalFloat(GetModule(),"fX3_FREQUENCY",2.0);

    // * Use this if you want characters to be able to interrupt the mounting
    // * procedure before they get to the horse (ie. by clicking on the ground).
    //SetLocalInt(GetModule(),"X3_HORSE_ACT_VS_DELAY",TRUE);

    // * Use horse's inventory as a storage for saddlebag content.
    //SetLocalInt(GetModule(),"X3_HORSE_ENABLE_SADDLEBAGS",TRUE);

    // * Dont forget to place the storage waypoint for this to work!
    //SetLocalString(GetModule(),"X3_SADDLEBAG_DATABASE","NAME");

    // * Doesnt apply speed bonus when mounted.
    //SetLocalInt(GetModule(),"X3_HORSE_DISABLE_SPEED",TRUE);

    // * Possible trouble-shoot for situation when players would be left in an
    // * uncommandable state (it should never happen however)
    //SetLocalInt(GetModule(),"X3_NO_MOUNT_COMMANDABLE",TRUE);
}

