// _inc_pw.nss
// Persistent world handling routines. 

// NWNX, NDBE, SKIN Funcs
#include "_inc_data"
#include "00_debug"
#include "_inc_util"


// looks at whether any special feats are missing - [FILE: _inc_pw]
void PCLoginFeatCheck();
// prep starting equipment - [FILE: _inc_pw]
void PCLoginEquipment();

// First time PCs initialized for play - [FILE: _inc_pw]
// initialization only happens once for the life of the character
void PCInitializedFirstTimeOnEntry();
// All PCs prepared for entering Hills Edge - [FILE: _inc_pw]
void PCPreparesForEnteringHillsEdge();

// Check if PC is allowed to enter the module. Returns FALSE if PC should be booted
int pw_doEntryCheck(object oPC);

// Remove effects and illegal body parts. Also strips.
void pwScrubNewPC(object oPC); 
// IMPLEMENTATION --------------------------------------------------------------
void pwDebugMessage(string sMsg, object oPC = OBJECT_INVALID) {

        string sPC = "";
        if (GetIsPCSafe(oPC)) {
                sPC = GetName(oPC) + " (" + GetLocalString(oPC, "player_name") + ","
                        + GetLocalString(oPC, "player_ip") + ", " + GetLocalString(oPC, "player_cdkey") + "):";
        } else if (GetIsPC(oPC)) {
                 sPC = GetName(oPC) + " (" + GetPCPlayerName(oPC) + ","
                        + GetPCIPAddress(oPC) + ", " + GetPCPublicCDKey(oPC) + "):";
        }
        dblvl(DEBUGLEVEL_PW, sPC + sMsg);
        //SendMessageToAllDMs(sPC + sMsg);
}

void pwErrorMessage(string sMsg, object oPC = OBJECT_INVALID) {

        string sPC = "";
        if (GetIsPCSafe(oPC)) {
                sPC = GetName(oPC) + " (" + GetLocalString(oPC, "player_name") + ","
                        + GetLocalString(oPC, "player_ip") + ", " + GetLocalString(oPC, "player_cdkey") + "):";
        }
        WriteTimestampedLogEntry(sPC + sMsg);
        SendMessageToAllDMs(sPC + sMsg);
}

void PCLoginFeatCheck() {
        int is_cleric   = GetLevelByClass(CLASS_TYPE_CLERIC);
        int is_monk     = GetLevelByClass(CLASS_TYPE_MONK);
        int is_paladin  = GetLevelByClass(CLASS_TYPE_PALADIN);
        int is_druid    = GetLevelByClass(CLASS_TYPE_DRUID);
        int is_ranger   = GetLevelByClass(CLASS_TYPE_RANGER);
        int is_wizard   = GetLevelByClass(CLASS_TYPE_WIZARD);
        int is_sorcerer = GetLevelByClass(CLASS_TYPE_SORCERER);
        int is_bard     = GetLevelByClass(CLASS_TYPE_BARD);
        int is_barbarian= GetLevelByClass(CLASS_TYPE_BARBARIAN);
        int is_fighter  = GetLevelByClass(CLASS_TYPE_FIGHTER);
        int is_rogue    = GetLevelByClass(CLASS_TYPE_ROGUE);

        // everyone
	NWNX_AddKnownFeat(OBJECT_SELF, FEAT_TOOLS1);
	NWNX_AddKnownFeat(OBJECT_SELF, FEAT_TOOLS2);
        //SendMessageToPC(OBJECT_SELF, "Adding PRAY feat");
	NWNX_RemoveKnownFeat(OBJECT_SELF, 1995);
	NWNX_AddKnownFeat(OBJECT_SELF, 1995);  //PRAY

        // dwarfs
        if(GetRacialType(OBJECT_SELF)==RACIAL_TYPE_DWARF) {
		NWNX_AddKnownFeat(OBJECT_SELF, FEAT_DWARF_WEAPONS);
        }

        // relgious classes
        if(is_cleric || is_monk || is_paladin || is_druid) {
		NWNX_AddKnownFeat(OBJECT_SELF, FEAT_CONVERT);
        }

        // spell caster classes
        if(is_cleric || is_druid || is_wizard || is_sorcerer || is_bard) {
		NWNX_AddKnownFeat(OBJECT_SELF, FEAT_SPELL_TARGET);
        }

        // rangers
        if(is_ranger) {
                NWNX_AddKnownFeat(OBJECT_SELF, FEAT_TRACK);
        }
}

// Run as the PC
void PCInitializedFirstTimeOnEntry() {

        // this is for people that do not have NWNCX
        // check the pc's feats.. and ensure they have what they should
        // Moved to PCPreparesForEntering so it happens all the time.
        //DelayCommand(1.0, PCLoginFeatCheck());

        // see _trg_lobby for other first time entry actions such as equipment

        // record initialization
        NWNX_SetPCInitialized(OBJECT_SELF);
}

// This is run as the PC
void PCPreparesForEnteringHillsEdge()
{
	object oPC = OBJECT_SELF;

    // restore the VFX for this player
	DeleteLocalInt(oPC, "vfx_tmp_op"); // Op 0 , being paranoid
	ExecuteScript("_vfx_do_op", oPC);

    // set which HB to save the PC.
	object oMod = GetModule();
	int nSaveTick   = GetLocalInt(oMod, "SAVE_THE_PC_ON_THIS_HB_TICK")+1;
	if(nSaveTick > GetLocalInt(oMod, "MOD_HB_TICK_MODULO"))
		nSaveTick = 1;
	SetLocalInt(oMod, "SAVE_THE_PC_ON_THIS_HB_TICK", nSaveTick);
	SetLocalInt(oPC, "SAVE_THE_PC_ON_THIS_HB_TICK", nSaveTick);
	
    // check the PC for corpses, and if corpse "owner" is no longer dead, destroy the corpse
	ExecuteScript("_corpse_do_op", oPC);

	// establish XP Modifiers and store on PC for use during play
	ExecuteScript("_xp_do_op", oPC);
	
	// languages (a one time thing... but can't hurt to put here)
	SetLocalInt(oPC, "dmfi_tmp_op", 1);
	ExecuteScript("dmfi_do_op", oPC);

        DelayCommand(0.1, PCLoginFeatCheck());
}

// NWNee version of this using CDkey as primary unique identifier. 
int VerifyPlayernameAgainstCDKey(object oPlayer) {
        int nVerified   = TRUE;
        int bRecordCD   = FALSE;
        string sCDKey   = GetPCPublicCDKey(oPlayer);

        // First get PCID by CDKey - or banned by CDKEY
        string sPlayerID   = NWNX_GetPlayerID(oPlayer);

        if(sPlayerID=="BANNED") {
                WriteTimestampedLogEntry("BOOT PC: banned CDKey("+sCDKey+")" );
                SetLocalString(oPlayer, "pw_boot_reason", "Your CDkey is been banned from this server.");
                return FALSE; // player is banned
        }

        /* this is not needed but could be a check just on the name? 
        // first check whether the player is using a banned CDKey
        NWNX_SqlExecPrepared("SELECT banned FROM player_cdkeys WHERE cdkey_public=?; ", sCDKey);
        while(NWNX_SQL_ReadyToReadNextRow()) {
                NWNX_SQL_ReadNextRow();
                if(NWNX_SQL_ReadDataInActiveRow(0) =="1") {
                    SetLocalString(oPlayer,"PLAYER_ID","BANNED");
                    WriteTimestampedLogEntry("BOOT PC: banned cdkey("+sCDKey+") name("+GetPCPlayerName(oPlayer)+")" );
            return FALSE; // cd key is banned
        }
        }
        */
        string sPlayerName = GetPCPlayerName(oPlayer);

        // grab player name used by this pc id  There should only be one here
        NWNX_SqlExecPrepared("SELECT name,banned FROM players WHERE player_id=?;", sPlayerID);
        if(NWNX_SQL_ReadyToReadNextRow()) {
                nVerified   = FALSE;
                NWNX_SQL_ReadNextRow(); 
                if(NWNX_SQL_ReadDataInActiveRow(0)==sPlayerName) {
                        if (NWNX_SQL_ReadDataInActiveRow(1) == "1") {
                                // Player banned by player name - should just use key now.
                                WriteTimestampedLogEntry("BOOT PC: banned Playername/ID("+sPlayerName+"," + sPlayerID + ")" );
                                SetLocalString(oPlayer, "pw_boot_reason", sPlayerName + " has been banned from this server.");
                                return FALSE;
                        } // else we're okay and done. 
                        nVerified   = TRUE;       
                } else {
                        // Player using a different name for this CD key. 
                        WriteTimestampedLogEntry("BOOT PC: playername cdkey mismatch ("+sPlayerName+"," + sPlayerID + "," + sCDKey + ")" );
                        SetLocalString(oPlayer, "pw_boot_reason", "Please use your original player name: " +sPlayerName);
                        return FALSE;
                }
        } else {
                //bRecordCD   = TRUE;
                // player id was not found in players table. 
                // need to check if playername is already in use
                NWNX_SqlExecPrepared("SELECT player_id,banned FROM players WHERE name=?;", sPlayerName);
                if(NWNX_SQL_ReadyToReadNextRow()) {
                        WriteTimestampedLogEntry("BOOT PC: playername in use ("+sPlayerName+ ")" );
                        SetLocalString(oPlayer, "pw_boot_reason", "Please use your original player name: " +sPlayerName);
                        return FALSE; 

                }
                
                // not found so we can add it. 
                NWNX_SqlExecPrepared("INSERT INTO players (player_id, name) VALUES(?,?);", sPlayerID, sPlayerName);
                nVerified   = TRUE;    
        } 
        return nVerified;
}

// Securing Your Server Without Master Server Authentication by FunkySwerve
int VerifyPlayernameAgainstCDKey0(object oPlayer)
{
    int nVerified   = TRUE;
    int bRecordCD   = FALSE;
    string sCDKey   = GetPCPublicCDKey(oPlayer);

    // first check whether the player is using a banned CDKey
    NWNX_SqlExecPrepared("SELECT banned FROM player_cdkeys WHERE cdkey_public=?; ", sCDKey);
    while(NWNX_SQL_ReadyToReadNextRow())
    {
        NWNX_SQL_ReadNextRow();
        if(NWNX_SQL_ReadDataInActiveRow(0) =="1") {
            SetLocalString(oPlayer,"PLAYER_ID","BANNED");
            WriteTimestampedLogEntry("BOOT PC: banned cdkey("+sCDKey+") name("+GetPCPlayerName(oPlayer)+")" );
            return FALSE; // cd key is banned
        }
    }

    string sPlayerID   = NWNX_GetPlayerID(oPlayer);

    if(sPlayerID=="BANNED")
    {
        WriteTimestampedLogEntry("BOOT PC: banned name("+GetPCPlayerName(oPlayer)+")" );
        return FALSE; // player is banned
    }

    // first determine if player signaled adding a CD key -- see void DoCDKey(object oPC); in file v2_mod_onchat
    NWNX_SqlExecPrepared("SELECT value FROM player_misc WHERE player_id=? AND label='CDKEY_ADD';", sPlayerID);
    if(NWNX_SQL_ReadyToReadNextRow()) {

        // remove the add CD KEY flag
	    NWNX_SqlExecPrepared( "DELETE FROM player_misc WHERE player_id=? AND label='CDKEY_ADD';", sPlayerID );
	    bRecordCD   = TRUE;
    } else {
        // grab all CD Keys held by this player
	    NWNX_SqlExecPrepared("SELECT cdkey_public FROM player_cdkeys WHERE player_id=?;", sPlayerID);
        // does this player have any CD Keys stored?
        if(NWNX_SQL_ReadyToReadNextRow()) {
            nVerified   = FALSE;
            do {
                NWNX_SQL_ReadNextRow(); 
                if(NWNX_SQL_ReadDataInActiveRow(0)==sCDKey) {
                     nVerified   = TRUE;
                     break;
                }
            } while(NWNX_SQL_ReadyToReadNextRow());
        }
        else
            bRecordCD   = TRUE;

        if(!nVerified) {
		WriteTimestampedLogEntry("BOOT PC: incorrect cdkey("+sCDKey+") for name("+GetPCPlayerName(oPlayer)+")" );
        }
    }

    // Add the current CDKey for this player
    if(bRecordCD) {
        // add cdkey to DB
	    NWNX_SqlExecPrepared("INSERT INTO player_cdkeys (player_id,cdkey_public) VALUES (?,?); ", sPlayerID, sCDKey);
    }
    
    return nVerified;
}

void NWNX_BanPlayer(object oPC, string sReason = "") {

        if (!GetIsPC(oPC)) return;

        if (!MODULE_NWNX_MODE) return;

        string sPlayerName = GetPCPlayerName(oPC);
        pwErrorMessage("Banning player " + sPlayerName + ": " + sReason, oPC);
	// sPlayerName  = EncodeSpecialChars(sPlayerName);
        NWNX_SqlExecPrepared("UPDATE players SET banned='1' WHERE name=?;", sPlayerName);
}


int pw_doEntryCheck(object oPC) {

        // Save these for use in client exit
        SetLocalString(oPC, "player_name", GetPCPlayerName(oPC));
        SetLocalString(oPC, "player_ip", GetPCIPAddress(oPC));
        SetLocalString(oPC, "player_cdkey", GetPCPublicCDKey(oPC));


  // SECURITY ----------------------------------------------------------------
	if(MODULE_NWNX_MODE) {
		// verify CD keys to stop hackers (adapted from Funky Swerve's
		if(GetIsObjectValid(oPC) &&  VerifyPlayernameAgainstCDKey(oPC)) {
			// initialize Character ID
			string sCharID  = GetPCID(oPC);
		} else {
			SetLocalInt(oPC, "BOOTED", TRUE);
                        SetLocalString(oPC, "BOOTED_REASON", "Your CDkey does not match registered CDkeys for this player name.");
			return FALSE;
		}		
	} else {	
// in a dev environment - so ignore these DB hooks
		SetLocalString(oPC,"PLAYER_ID","NONE");
		SetLocalString(oPC,"CHARACTER_ID","NONE");
	}
	
	// Other checks
        ExecuteScript("pw_elc_pc_check", oPC);
        if (GetLocalInt(oPC, "BOOTED")) {
                SetLocalString(oPC, "BOOTED_REASON", "Your character is invalid."); 
                return FALSE;
        }


	return TRUE;

}

void pwScrubNewPC(object oPC) {
////////////////////////////////////////////////////////////////////////////////
// internal stuff to fix exploits
////////////////////////////////////////////////////////////////////////////////
        effect eExploit = GetFirstEffect(oPC);
        while(GetIsEffectValid(eExploit)) {
                RemoveEffect(oPC,eExploit);
                eExploit = GetNextEffect(oPC);
        }
        object oContainer,oExploit;
        int nSlot;
        for(;nSlot < NUM_INVENTORY_SLOTS;nSlot++) {
                oExploit = GetItemInSlot(nSlot,oPC);
                if(oExploit != OBJECT_INVALID) {
                        DestroyObject(oExploit);
                }
        }
        oExploit = GetFirstItemInInventory(oPC);
        while(oExploit != OBJECT_INVALID) {
                if(GetHasInventory(oExploit)) {
                        oContainer = GetFirstItemInInventory(oExploit);
                        while(oContainer != OBJECT_INVALID) {
                                DestroyObject(oContainer);
                                oContainer = GetNextItemInInventory(oExploit);
                        }
                }
                DestroyObject(oExploit);
                oExploit = GetNextItemInInventory(oPC);
        }
        ////////////////////////////////////////////////////////////////////////////////
        //               removing character appearance exploits                       //
        ////////////////////////////////////////////////////////////////////////////////
        if(GetCreatureWingType(oPC) != CREATURE_WING_TYPE_NONE) {
                SetCreatureWingType(CREATURE_WING_TYPE_NONE,oPC);
        }
        if(GetCreatureTailType(oPC) != CREATURE_TAIL_TYPE_NONE) {
                SetCreatureTailType(CREATURE_TAIL_TYPE_NONE,oPC);
        }
        if(GetPhenoType(oPC) > 2) {
                SetPhenoType(PHENOTYPE_NORMAL,oPC);
        }
        int nRacialType = GetRacialType(oPC);
        if(GetAppearanceType(oPC) != nRacialType) {
                SetCreatureAppearanceType(oPC,nRacialType);
        }
        int nPart;
        for(;nPart < 21;nPart++) {

                if (nPart == CREATURE_PART_BELT || nPart == CREATURE_PART_RIGHT_SHOULDER
                        || nPart == CREATURE_PART_LEFT_SHOULDER)
                continue;

                if(GetCreatureBodyPart(nPart,oPC) == 0) {
                        SetCreatureBodyPart(nPart,1,oPC);
                }
        }
}


void pwForceSave (object oPC, int bDelayed=FALSE) {
        if (!GetIsPC(oPC) || GetIsDM(oPC))
                return;

        if (bDelayed) {
                int nUptime = GetLocalInt(GetModule(), "MOD_HEARTBEAT_COUNT");
                int nDelayedSave = GetLocalInt(oPC, "DelayedSave");

                if (nDelayedSave == nUptime)
                        SetLocalInt(oPC, "DelayedSave", nUptime + 1);
        }

        if (GetLocalInt(oPC, "DebugForceSave")) {
                int nUptime = GetLocalInt(GetModule(), "MOD_HEARTBEAT_COUNT");

                SendMessageToPC(oPC, "<cþþþ>FORCE SAVE " + IntToString(nUptime) + "</c>");
        }
        Data_SavePC(oPC, TRUE);
      
}


//From Funkyswerve - This is used on unacquire and acquire to
// keep from doing too many character saves.
// Relies on module HB doing uptime.
void pwForceDelayedSave (object oPC, float fDelay=2.0) {
        if (!GetIsPC(oPC) || GetIsDM(oPC))
                return;

        int nUptime = GetLocalInt(GetModule(), "MOD_HEARTBEAT_COUNT");
        int nDelayedSave = GetLocalInt(oPC, "DelayedSave");

        if (nDelayedSave < nUptime) {
                SetLocalInt(oPC, "DelayedSave", nUptime);
                DelayCommand(fDelay, pwForceSave(oPC, TRUE));
        } else if (nDelayedSave == nUptime + 1) {
                SetLocalInt(oPC, "DelayedSave", nUptime + 2);
                DelayCommand(10.0, pwForceSave(oPC));
        }
}

