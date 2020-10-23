//
// Stub function for possible later use.
//
#include "prc_alterations"
#include "prc_inc_leadersh"

void CheckDB()
{
     string sDBName = GetBiowareDBName();
    //check PRC version
    if(GetCampaignString(sDBName, "version") != PRC_VERSION)
    {
        DoDebug("Removing old databases");
        DestroyCampaignDatabase(sDBName);
        DestroyCampaignDatabase(COHORT_DATABASE);
    }
    SetCampaignString(sDBName, "version", PRC_VERSION);

    location lLoc = GetLocation(GetObjectByTag("HEARTOFCHAOS"));
    //only get it if one doesnt already exist (saved games)
    if(GetIsObjectValid(GetObjectByTag("Bioware2DACache")))
        DestroyObject(GetObjectByTag("Bioware2DACache"));
    object oChest = RetrieveCampaignObject(sDBName, "CacheChest", lLoc);
    if(!GetIsObjectValid(oChest))
        DoDebug("Unable to retieve CacheChest from "+sDBName);
}

void main()
{
    object oModule = GetModule();

    //this triggers NWNX on Linux
    SetLocalInt(oModule, "NWNX!INIT", 1);
    SetLocalString(oModule, "NWNX!INIT", "1");

    // Loading a saved game runs the module load event, but since the point of the stuff
    // we do here is to set local variables and those don't get cleared over saved games,
    // there is no point in wasting (a massive load of) CPU on doing it all over again.
    if(GetLocalInt(oModule, "prc_mod_load_done"))
        return;
    else
        SetLocalInt(oModule, "prc_mod_load_done", TRUE);


    // Set PRC presence & version marker. If plugins ever happen, this would be useful.
    SetLocalString(oModule, "PRC_VERSION", PRC_VERSION);

    SetModuleSwitch(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS, TRUE); /// @todo This is somewhat intrusive, make it unnecessary and remove

    // Run a script to determine if the PRC Companion is present
    ExecuteScript("hakmarker", OBJECT_SELF);
    
    //load any default switch 2da
    if(!GetPRCSwitch(PRC_DISABLE_SWITCH_CHANGING_CONVO))
    {
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
            if(sSwitchType == "float")
                SetLocalFloat(oModule, sSwitchName, StringToFloat(sSwitchValue));
            else if(sSwitchType == "int")
                SetPRCSwitch(sSwitchName, StringToInt(sSwitchValue));
            else if(sSwitchType == "string")
                SetLocalString(oModule, sSwitchName, sSwitchValue);

            // Increment loop counter
            i += 1;
        }
    }

    //delay this to avoid TMIs
    DelayCommand(0.01, CreateSwitchNameArray());
    DelayCommand(0.01, DoEpicSpellDefaults());
    DelayCommand(0.01, DoSamuraiBanDefaults());
    SetDefaultFileEnds();
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
            SetPRCSwitch(PRC_CONVOCC_DRIDER_FEMALE_APPEARANCE, TRUE);
            SetPRCSwitch(PRC_CONVOCC_RAKSHASHA_FEMALE_APPEARANCE, TRUE);
            SetPRCSwitch(PRC_CONVOCC_GENASI_ENFORCE_DOMAINS, TRUE);
            SetPRCSwitch(PRC_CONVOCC_DROW_ENFORCE_GENDER, TRUE);
            SetPRCSwitch(PRC_CONVOCC_FEYRI_TAIL, TRUE);
            SetPRCSwitch(PRC_CONVOCC_FEYRI_WINGS, TRUE);
            SetPRCSwitch(PRC_CONVOCC_AVARIEL_WINGS, TRUE);
        }
    }
    if(GetPRCSwitch(PRC_USE_BIOWARE_DATABASE) == 0)
        SetPRCSwitch(PRC_USE_BIOWARE_DATABASE, 300);//100 HBs = 1800sec = 30min
    if(GetPRCSwitch(PRC_USE_BIOWARE_DATABASE))
        DelayCommand(1.0, CheckDB());

    if(GetPRCSwitch(PRC_USE_DATABASE))
    {
        PRC_SQLInit();
        PRCMakeTables();
        if(GetPRCSwitch(PRC_DB_SQLLITE))
            DelayCommand(IntToFloat(GetPRCSwitch(PRC_DB_SQLLITE_INTERVAL)), PRC_SQLCommit());
    }
    if(GetPRCSwitch(PRC_DB_PRECACHE))
        Cache_2da_data();
    //pre-made cohorts
    //DelayCommand(6.0, AddPremadeCohortsToDB());
    //done differently now

    //check for letoscript dir
    if(GetLocalString(oModule, PRC_LETOSCRIPT_NWN_DIR) == "")
    {
        string sDir = Get2DACache("directory", "Dir", 0);
        if(sDir != "")
            SetLocalString(oModule, PRC_LETOSCRIPT_NWN_DIR, sDir);
    }

    //delay the 2da lookup stuff
    //DelayCommand(10.0, ExecuteScript("look2daint", OBJECT_SELF));//helps avoid TMI errors
    DelayCommand(12.0, MakeLookupLoopMaster());
    
    //mark server as loading
    float fDelay = IntToFloat(GetPRCSwitch(PRC_PW_LOGON_DELAY))*60.0;
    if(fDelay>0.0)
    {
        SetLocalInt(GetModule(), PRC_PW_LOGON_DELAY+"_TIMER", TRUE);
        DelayCommand(fDelay, DeleteLocalInt(GetModule(), PRC_PW_LOGON_DELAY+"_TIMER"));
    }   
}
