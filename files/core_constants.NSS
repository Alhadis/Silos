/******************************************************************
 * Name: core_constants
 * Type: Constants Include File
 * ---
 * Author: Modal
 * Date: 09/22/02
 * ---
 * Contains CORE constants.
 * IMPORTANT: THIS FILE IS A CORE SCRIPT AND MUST NOT BE
 * MODIFIED EXCEPT THROUGH OFFICIAL CORE PATCHES!
 ******************************************************************/


/* Safety Net Level */
const int CORE_SAFETY_NET_LEVEL         = 1;

/* Variables Names */
const string CORE_NUM_PLAYER_DEATHS     = "CORE_NUM_PLAYER_DEATHS";

/* Misc. Constants */
const string LOGINMESSAGE               = "Welcome to Legends Of Greyhawk - Using LoG Core Scripts v1.8.5";
const float  CORE_AREA_CLEANUP_DELAY    = 300.0; // 5 minutes
const int    CORE_PC_BACKUP_INTERVAL    = 100;   // measured in rounds, 100 = 10 minutes, 0 to disable
const int    CORE_CLOCK_BACKUP_INTERVAL = 10;    // measured in rounds, 0 to disable
const int    CORE_CLOCK_TRAUMA_INTERVAL = 10;    // measured in rounds, 0 to disable
const string CORE_LOCAL_DB_NAME         = "CoreData";

/* Animal Companion Environment types */
const int AC_ENVIRO_NONE                = 0;
const int AC_ENVIRO_UNDERDARK           = 1;
const int AC_ENVIRO_FOREST              = 2;
const int AC_ENVIRO_ARCTIC              = 3;
const int AC_ENVIRO_DESERT              = 4;
const int AC_ENVIRO_PLAINS              = 5;
const int AC_ENVIRO_JUNGLE              = 6;
const int AC_ENVIRO_MOUNTAINS           = 7;
const int AC_ENVIRO_AQUATIC             = 8;
const int AC_ENVIRO_SWAMP               = 9;

// HC Items
const string CORE_OBJ_MEDBAG            = "core_medbag";
const string CORE_OBJ_HEALKIT           = "core_healkit";
const string CORE_OBJ_BANDAGES          = "core_bandages";
const string CORE_OBJ_LANTERN           = "hc_lantern";
const string CORE_OBJ_ACIDFLASK         = "hc_acidflask";
const string CORE_OBJ_ALCHFIRE          = "hc_alchfire";
const string CORE_OBJ_HOLYWATER         = "hc_holywater";
const string CORE_OBJ_TANGLE            = "hc_tangle";
const string CORE_OBJ_THUNDER           = "hc_thunder";
const string CORE_OBJ_OILFLASK          = "hc_oilflask";
const string CORE_OBJ_CLW_POTION        = "PotionOfCLW";
const string CORE_OBJ_CMW_POTION        = "PotionOfCMW";
const string CORE_OBJ_CSW_POTION        = "PotionOfCSW";
const string CORE_OBJ_CCW_POTION        = "PotionOfCCW";

// Other Core Items (from csm_include)
const string CORE_OBJ_XP_WAND_TAG       = "core_xpwand";
const string CORE_OBJ_SAP               = "core_sap";
const string CORE_OBJ_LODESTONE         = "core_lodestone";
const string CORE_OBJ_LOOT_TOKEN        = "core_loot_token";
const string CORE_OBJ_POCKETWATCH       = "core_pocketwatch";
const string CORE_OBJ_BACKPACK          = "core_backpack";
const string CORE_OBJ_TELEPORTER        = "core_teleporter";
const string CORE_OBJ_BEDROLL           = "core_bedroll";
const string CORE_OBJ_DOORSPIKES        = "core_doorspikes";

/* From the DM Wand Package */
const string DMW_OBJ_DM_WAND_TAG        = "dmw_dmwand";

/* From the Emote Ball Package */
const string EM_OBJ_EMOTE_ITEM_TAG      = "em_emoteball";

/* From the NESS Package */
const string CORE_OBJ_SPAWN_BANNER_ROD  = "spawn_ban_rod";

/* From the OJS Package */
const string CORE_OBJ_JUSTICE_ROD       = "ojs_rod";
