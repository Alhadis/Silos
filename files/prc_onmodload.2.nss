//::///////////////////////////////////////////////
//:: PRC On Module Load event handler
//:: prc_onmodload
//::///////////////////////////////////////////////
/** @file prc_onmodload
    Things we need to happen upon a module being
    loaded. For example, setting up caches and
    switches.

*/
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////

#include "prc_alterations"
#include "prc_inc_leadersh"
#include "inc_switch_setup"
#include "inc_cache_setup"
#include "inc_debug_dac" // @DUG

//////////////////////////////////////////////////
/*             Function prototypes              */
//////////////////////////////////////////////////

void OnLoad_Always(object oModule);
void OnLoad_Save(object oModule);
void OnLoad_Fresh(object oModule);


//////////////////////////////////////////////////
/*             Function definitions             */
//////////////////////////////////////////////////

void CheckDB()
{
    //debugVarObject("CheckDB()", OBJECT_SELF);
    string sDBName = GetBiowareDBName();
    //check PRC version
    if(GetCampaignString(sDBName, "version") != PRC_VERSION)
    {
        DoDebug("Removing old PRC version databases");
        DestroyCampaignDatabase(sDBName);
        DestroyCampaignDatabase(COHORT_DATABASE);
    }
    SetCampaignString(sDBName, "version", PRC_VERSION);

    // 2da cache fingerprint handling
    // This is for detecting a cache updated by someone else upon loading a saved game
    // and avoiding clobbering it.
    string sFingerprint;

    // Generate the fingerprint from module name, current millisecond value and
    // 31-bit random number.
    sFingerprint = GetModuleName() + "_" + IntToString(GetTimeMillisecond()) + "_" + IntToString(Random(0x7fffffff));

    DoDebug("Module 2da cache fingerprint: " + sFingerprint);

    // Store the fingerprint on the module - it will be written to the DB upon cache storage
    SetLocalString(GetModule(), "PRC_2DA_Cache_Fingerprint", sFingerprint);

    // Also store the fingerprint of the DB we will be loading shortly
    SetLocalString(GetModule(), "PRC_2DA_Cache_Fingerprint_LastAccessed", GetCampaignString(sDBName,  "PRC_2DA_Cache_Fingerprint"));

    location lLoc = GetLocation(GetObjectByTag("HEARTOFCHAOS"));
    //only get it if one doesnt already exist (saved games)
    // This never gets run on saved games due to the "prc_mod_load_done" check.
    // However, it is still usefull cleanup in case some unforseen condition does
    // leave a cache object present in a freshly loaded module - Ornedan 20061229
    if(GetIsObjectValid(GetObjectByTag("Bioware2DACache")))
        DestroyObject(GetObjectByTag("Bioware2DACache"));
    DoDebug("Starting to load 2da cache object from " + sDBName);
    object oChest = RetrieveCampaignObject(sDBName, "CacheChest", lLoc);
    if(!GetIsObjectValid(oChest))
        DoDebug("WARNING: Unable to load 2da cache object (CacheChest) from " + sDBName);
    else
        DoDebug("Finished loading 2da cache object from " + sDBName);
}

/**
 * Called when a saved game load is detected. Determines if the
 * 2da cache DB has changed in the meanwhile. If it has, reload the
 * cache creature from the DB.
 */
void CheckDBUpdate()
{
    //debugVarObject("CheckDBUpdate()", OBJECT_SELF);
    // Get last loaded (or saved) and DB fingerprints
    string sDBName = GetBiowareDBName();
    string sModuleFingerprint = GetLocalString(GetModule(), "PRC_2DA_Cache_Fingerprint_LastAccessed");
    string sDBFingerprint     = GetCampaignString(sDBName,  "PRC_2DA_Cache_Fingerprint");

    DoDebug("CheckDBUpdate():\n"
          + " Module last access fingerprint: " + sModuleFingerprint + "\n"
          + " Database fingerprint: " + sDBFingerprint
            );
    // If they differ, the DB has changed in meanwhile and we need to reload the cache chest
    if(sModuleFingerprint != sDBFingerprint)
    {
        DoDebug("Fingerprint mismatch, reloading 2da cache from " + sDBName);
        location lLoc = GetLocation(GetObjectByTag("HEARTOFCHAOS"));
        DestroyObject(GetObjectByTag("Bioware2DACache"));

        DoDebug("Starting to load 2da cache object from " + sDBName);
        object oChest = RetrieveCampaignObject(sDBName, "CacheChest", lLoc);
        if(!GetIsObjectValid(oChest))
            DoDebug("ERROR: Unable to load 2da cache object (CacheChest) from " + sDBName);
        else
            DoDebug("Finished loading 2da cache object from " + sDBName);

        // Updated last access fingerprint
        SetLocalString(GetModule(), "PRC_2DA_Cache_Fingerprint_LastAccessed", sDBFingerprint);
    }
}

void main()
{
    //debugVarObject("prc_onmodload", OBJECT_SELF);
    object oModule = GetModule();

    OnLoad_Always(oModule);

    // Determine if we are loading a saved game or entering a fresh module
    // Some things should only be run in one situation or the other.
    if(GetLocalInt(oModule, "prc_mod_load_done"))
    {
        OnLoad_Save(oModule);
    }
    else
    {
        SetLocalInt(oModule, "prc_mod_load_done", TRUE);
        OnLoad_Fresh(oModule);
    }
    //debugMsg("prc_onmodload complete");
}

/**
 * Things that should always be run on loading a module,
 * irrespective of whether it's a fresh load or a save.
 */
void OnLoad_Always(object oModule)
{
    //debugVarObject("OnLoad_Always()", OBJECT_SELF);
    //this triggers NWNX on Linux
    SetLocalInt(oModule, "NWNX!INIT", 1);
    SetLocalString(oModule, "NWNX!INIT", "1");
}

/**
 * Things that should be run only when a saved game is loaded.
 */
void OnLoad_Save(object oModule)
{
    //debugVarObject("OnLoad_Save()", OBJECT_SELF);
    CheckDBUpdate();
}

/**
 * Things that should only be run when a module is first loaded.
 */
void OnLoad_Fresh(object oModule)
{
    //debugVarObject("OnLoad_Fresh()", OBJECT_SELF);
    // Set PRC presence & version marker. If plugins ever happen, this would be useful.
    SetLocalString(oModule, "PRC_VERSION", PRC_VERSION);

    SetModuleSwitch(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS, TRUE); /// @todo This is somewhat intrusive, make it unnecessary and remove

    //debugMsg("calling hakmarker");
    // Run a script to determine if the PRC Companion is present
    ExecuteScript("hakmarker", OBJECT_SELF);

    //debugMsg("setting custom switches");
    //load any default switch 2da
    object oModule = GetModule();
    int i = 0;
    string sSwitchName, sSwitchType, sSwitchValue;
    // Use Get2DAString() instead of Get2DACache() to avoid caching.
    // People might want to set different switch values when playing in different modules.
    // Or just change the switch values midplay.
    while((sSwitchName = Get2DAString("personal_switch", "SwitchName", i)) != "")
    {
        // Read rest of the line
        sSwitchType  = Get2DAString("personal_switch", "SwitchType",  i);
        sSwitchValue = Get2DAString("personal_switch", "SwitchValue", i);

        // Determine switch type and set the var
        if     (sSwitchType == "float")
            SetLocalFloat(oModule, sSwitchName, StringToFloat(sSwitchValue));
        else if(sSwitchType == "int")
            SetPRCSwitch(sSwitchName, StringToInt(sSwitchValue));
        else if(sSwitchType == "string")
            SetLocalString(oModule, sSwitchName, sSwitchValue);

        // Increment loop counter
        i += 1;
    }

    //debugMsg("CreateSwitchNameArray()");
    //delay this to avoid TMIs
    DelayCommand(0.01, CreateSwitchNameArray());
    //debugMsg("DoEpicSpellDefaults()");
    DelayCommand(0.01, DoEpicSpellDefaults());
    //debugMsg("");
    DelayCommand(0.01, DoSamuraiBanDefaults());
    //debugMsg("DoSamuraiBanDefaults()");
    SetDefaultFileEnds();
    //debugMsg("checking CONVOCC");
    if(GetPRCSwitch(PRC_CONVOCC_ENABLE))
    {
        SetPRCSwitch(PRC_USE_DATABASE, TRUE);
        //SetPRCSwitch(PRC_DB_PRECACHE, TRUE);
        SetPRCSwitch(PRC_USE_LETOSCRIPT, TRUE);
        // set up the convoCC combination switches
        if(GetPRCSwitch(PRC_CONVOCC_ENFORCE_FEATS))
        {
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_BLOOD_OF_THE_WARLORD, TRUE);
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_FEAT_NIMBUSLIGHT, TRUE);
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_FEAT_HOLYRADIANCE, TRUE);
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_FEAT_SERVHEAVEN, TRUE);
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_FEAT_SAC_VOW, TRUE);
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_FEAT_VOW_OBED, TRUE);
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_FEAT_THRALL_TO_DEMON, TRUE);
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_FEAT_DISCIPLE_OF_DARKNESS, TRUE);
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_FEAT_LICHLOVED, TRUE);
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_FEAT_EVIL_BRANDS, TRUE);
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_FEAT_VILE_WILL_DEFORM, TRUE);
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_FEAT_VILE_DEFORM_OBESE, TRUE);
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_FEAT_VILE_DEFORM_GAUNT, TRUE);
            SetPRCSwitch(PRC_CONVOCC_ENFORCE_FEAT_LOLTHS_MEAT, TRUE);
        }
        if(GetPRCSwitch(PRC_CONVOCC_ENFORCE_PNP_RACIAL))
        {
            SetPRCSwitch(PRC_CONVOCC_RAKSHASA_FEMALE_APPEARANCE, TRUE);
            SetPRCSwitch(PRC_CONVOCC_GENASI_ENFORCE_DOMAINS, TRUE);
            SetPRCSwitch(PRC_CONVOCC_DROW_ENFORCE_GENDER, TRUE);
            SetPRCSwitch(PRC_CONVOCC_TIEFLING_TAIL, TRUE);
            SetPRCSwitch(PRC_CONVOCC_FEYRI_TAIL, TRUE);
            SetPRCSwitch(PRC_CONVOCC_FEYRI_WINGS, TRUE);
            SetPRCSwitch(PRC_CONVOCC_AVARIEL_WINGS, TRUE);
        }
    }
    //debugMsg("checking Bioware DB");
    if(GetPRCSwitch(PRC_USE_BIOWARE_DATABASE) == 0)
        SetPRCSwitch(PRC_USE_BIOWARE_DATABASE, 300);//100 HBs = 1800sec = 30min
    if(GetPRCSwitch(PRC_USE_BIOWARE_DATABASE))
        DelayCommand(1.0, CheckDB());

    //debugMsg("checking use database");
    if(GetPRCSwitch(PRC_USE_DATABASE))
    {
        PRC_SQLInit();
        if(GetPRCSwitch(PRC_DB_PRECACHE)) // if mod builder is insane, make the 2da cache the painful way
        { // @DUG
           // @DUG Only try to build tables if they don't exist.
           PRC_SQLExecDirect("SHOW TABLES LIKE 'prc_cached2da_feat';");
           if (PRC_SQLFetch() == PRC_SQL_ERROR ||
              PRC_SQLGetData(1) == "")
           { // @DUG
            PRCMakeTables();
           } // @DUG
        } // @DUG
        if(GetPRCSwitch(PRC_DB_SQLLITE))
            DelayCommand(IntToFloat(GetPRCSwitch(PRC_DB_SQLLITE_INTERVAL)), PRC_SQLCommit());
    }
    //debugMsg("checking db precache");
    if(GetPRCSwitch(PRC_DB_PRECACHE))
        Cache_2da_data();
    //pre-made cohorts
    //DelayCommand(6.0, AddPremadeCohortsToDB());
    //done differently now

    //check for letoscript dir
    /*    if(GetLocalString(oModule, PRC_LETOSCRIPT_NWN_DIR) == "")
    {
        string sDir = Get2DACache("directory", "Dir", 0);
        if(sDir != "")
            SetLocalString(oModule, PRC_LETOSCRIPT_NWN_DIR, sDir);
    } */

    //debugMsg("makelookup");
    //delay the 2da lookup stuff
    DelayCommand(12.0, MakeLookupLoopMaster());

    //debugMsg("mark server loading");
    //mark server as loading
    float fDelay = IntToFloat(GetPRCSwitch(PRC_PW_LOGON_DELAY))*60.0;
    if(fDelay>0.0)
    {
        SetLocalInt(GetModule(), PRC_PW_LOGON_DELAY+"_TIMER", TRUE);
        DelayCommand(fDelay, DeleteLocalInt(GetModule(), PRC_PW_LOGON_DELAY+"_TIMER"));
    }
    //debugMsg("OnLoad_Fresh() complete");
}
