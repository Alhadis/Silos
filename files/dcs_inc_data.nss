#include "dcs_inc_objects"
#include "dcs_inc_text"
#include "x3_inc_skin"

const string DCS_INFO_VERSIONNUMBER = "2.4.2162";
const int    DCS_PRE_COMPILED       = 1805;

location     DCS_LOCATION_INVALID;
/******************************************************************************/
/*                          Predefined settings                               */
/******************************************************************************/

// Database connection settings
// True  = MySQL
// False = SQLite
const int    SQL_CONNECTION_MYSQL                         = TRUE;

// The maximum entries a local array may have
const int    DCS_SETTING_ARRAY_MAXIMUM                    = 255;

// Station settings
const int    DCS_SETTING_INSTANT_DIALOG_ON_CLOSE          = TRUE;
const int    DCS_SETTING_CHECK_FOR_RESOURCES_IN_MENU      = TRUE;
const int    DCS_SETTING_USE_FEAT_FOR_DIALOG              = TRUE;

// Recipe database settings
const float  DCS_SETTING_RECIPE_DB_DELAY_STORE            = 20.0;
const float  DCS_SETTING_RECIPE_DB_DELAY_COPY             = 120.0;

// General Quality settings
const int    DCS_SETTING_QUALITY_INCLUCE_RECIPE           = FALSE;
const int    DCS_SETTING_QUALITY_IGNORE_ZERO              = TRUE;
const int    DCS_SETTING_QUALITY_IGNORE_NO_QUALITY        = TRUE;
const int    DCS_SETTING_QUALITY_ROUND_NUMBER             = 8;
const int    DCS_SETTING_QUALITY_QUALITY_BEGINNING        = 5;
const float  DCS_SETTING_QUALITY_COMPONENT_MULTI          = 0.55;
const float  DCS_SETTING_QUALITY_STARTING_QUALITY_MULTI   = 2.7;
const int    DCS_MIN_ITEM_QUALITY = 2; //ruined

// Multiple Item crafting settings
const int    DCS_SETTING_ENABLE_MULTIPLE_CRAFTING         = TRUE;
const int    DCS_SETTING_MAXIMUM_CRAFTABLE_ITEMS          = 5;

// Experimentation settings
const int    DCS_SETTING_EXPERIMENTATION_ENABLED          = TRUE;
const float  DCS_SETTING_EXPERIMENTATION_FACTOR_QUALITY   = 2.75;
const float  DCS_SETTING_EXPERIMENTATION_FACTOR_RANK      = 3.0;
const float  DCS_SETTING_EXPERIMENTATION_SPELL_DIVIDOR    = 5.545555555555556;

// Skillpoint settings
const float  DCS_SETTING_EXPERIMENTATION_POINTS_PER_SKILL = 0.5;
const float  DCS_SETTING_EXPERIMENTATION_CHANCE_PER_SKILL = 1.0;
const float  DCS_SETTING_SUCCESS_CHANCE_PER_SKILL         = 0.5;
const float  DCS_SETTING_MORE_ITEM_CHANCE_PER_SKILL       = 1.0;

const string DCS_SETTING_MORE_ITEM_AMOUNT                 = "1.15-1.5";

// Determines if the script uses the orignal Item name or the given name in dcs_inc_objects
const int    DCS_SETTING_USE_SCRIPTED_ITEM_NAMES          = TRUE;

// The default crafting system queue
const string DCS_SETTING_CRAFTING_SYSTEM_QUEUE            = "DCS_EntryQueue";

// Decides whether an item is tagged after enchanting or not (prevents multiple enchanting)
const int    DCS_SETTING_TAG_ENCHANTED_ITEMS              = TRUE;

// Decides whether the existing crafting statistic will be reset on a startup
const int    DCS_SETTING_RESET_STATISTIC_ON_STARTUP       = FALSE;

const int    DCS_SETTING_ANIMATIONS_ENABLED               = TRUE;
const int    DCS_SETTING_ANIMATIONS_CUTSCENE              = FALSE;

const float  DCS_SETTING_DISENCHANT_MAX_XP                = 0.25;
const int    DCS_SETTING_DISENCHANT_LOCK_DURATION         = 21600;

const int    DCS_SETTING_VERSION_UPDATE                   = FALSE;

/******************************************************************************/
/*                             Spawner Settings                               */
/******************************************************************************/

// The maximum minerals per area, -1 for infinite
const int    DCS_SPAWNER_MAXIMUM_MINERALS_IN_AREA        = -1;

// Use the complete account data of a pc (account) or just the account|character name
const int    DCS_SPAWNER_COMPLETE_ACC_DATA               = TRUE;

// How often a pc can use a spawner until the tick-counter starts
const int    DCS_SPAWNER_TICK_COUNT                      = 3;

// The time a player has to wait after the first use of a spawner to gain resources
const float  DCS_SPAWNER_PREPARE_TIME                    = 4.0;

// Duration of the "no-uses-"-animation of a spawner
const float  DCS_SPAWNER_ANIMATION_TIME                  = 30.0;

// The spawner tick and reset durations
const float  DCS_SPAWNER_DURATION_TICK                   = 21600.0;
const float  DCS_SPAWNER_DURATION_RESET                  = 21600.0;

const string DCS_SPAWNER_USES_AMOUNT                     = "2-9";
const string DCS_SPAWNER_RESOURCE_AMOUNT                 = "1-3";

/******************************************************************************/
/*                             In-Game settings                               */
/******************************************************************************/

const string DCS_OPTION_SHOW_LIMITED_RECIPES      = "DCS_Show_Limited_Recipes";
const string DCS_OPTION_ALLOW_RECIPE_CHECK        = "DCS_Allow_Recipe_Check";
const string DCS_OPTION_ALWAYS_CRAFT_ALL_ITEMS    = "DCS_Always_Craft_All_Items";
const string DCS_OPTION_INFORMATION_MODE          = "DCS_Information_Mode";
const string DCS_OPTION_INTEGRATE_QUALITY_IN_NAME = "DCS_Intregrate_Quality";

/******************************************************************************/
/*                                  Misc                                      */
/******************************************************************************/

const int   ANIMATION_LOOPING_FISHING     = 38;
const int   ANIMATION_LOOPING_ALCHEMISTRY = 39;
const int   ANIMATION_LOOPING_SMITHING    = 40;

const int   DCS_EVENT_DISABLE_STATION     = 1001;
const int   DCS_EVENT_DEACTIVATE_FORGE    = 1002;
const int   DCS_EVENT_START_BALLISTA      = 1003;

const float DCS_STORING_DELAY             = 0.125;
const float DCS_COPYING_DELAY             = 0.25;

const int   DCS_ITEM_PROPERTY_RANDOM      = -2;
const int   DCS_ITEM_PROPERTY_SPELLGRADE  = -3;

const int   DCS_SPELLCLASS_PALADIN        = 0;
const int   DCS_SPELLCLASS_SORCWIZ        = 1;
const int   DCS_SPELLCLASS_DRUID          = 2;
const int   DCS_SPELLCLASS_CLERIC         = 3;
const int   DCS_SPELLCLASS_BARD           = 4;
const int   DCS_SPELLCLASS_RANGER         = 5;

const int   DCS_ITEM_TAG_TYPE_CREATE      = 1;
const int   DCS_ITEM_TAG_TYPE_ENCHANT     = 2;
const int   DCS_ITEM_TAG_TYPE_KEEN        = 3;
const int   DCS_ITEM_TAG_TYPE_GEMBIND     = 4;
const int   DCS_ITEM_TAG_TYPE_GEM         = 5;

const int   ITEM_PROPERTY_RANGEDAMMO      = 200;
const int   ITEM_PROPERTY_KARAT           = 201;
const int   ITEM_PROPERTY_SOCKET          = 202;
const int   ITEM_PROPERTY_BIG_SOCKET      = 203;
const int   ITEM_PROPERTY_SOCKET_TYPE     = 204;
const int   ITEM_PROPERTY_GEM_STATUS      = 205;
const int   ITEM_PROPERTY_HORN            = 206;
const int   ITEM_PROPERTY_RANGE           = 206;

const int   DCS_RESULT_ABSOLUTE_FAILURE   = 1;
const int   DCS_RESULT_FAILURE            = 2;
const int   DCS_RESULT_SUCCESS            = 3;
const int   DCS_RESULT_AMAZING_SUCCESS    = 4;

const int   VFX_FNF_ANVIL_HIT             = 7173;
const int   VFX_SND_LEVEL_UP              = 7224;

/******************************************************************************/
/*                                 Level & XP                                 */
/******************************************************************************/

// The maximum level, that a player can acquire
const int   DCS_SETTING_MAXIMUM_LEVEL = 20;

// Multiplicators
const float DCS_SETTING_LEVEL_MULTIPLICATOR = 0.05;
const float DCS_SETTING_XP_GAIN_BASE = 15.0;

// XP constants
const int   DCS_SETTING_XP_BASE = 900;
const int   DCS_SETTING_XP_MAXIMUM = 650;

// How much of the XP the player will gain from a failure (in percent)
const float DCS_SETTING_EXPERIENCE_GAIN_FROM_FAILURE = 0.3333;

// The xp cap above a levelup
const int   DCS_SETTING_XP_ABOVE_LEVELUP = 1500;

/******************************************************************************/
/*                             Profession related                             */
/******************************************************************************/

// The maximum level, that a player can acquire
const int DCS_SETTING_MAXIMUM_RANKS  = 5;

// Profession rank IDs
const int DCS_RANK_NOVICE            = 1;
const int DCS_RANK_APPRENTICE        = 2;
const int DCS_RANK_EXPERT            = 3;
const int DCS_RANK_MASTER            = 4;
const int DCS_RANK_GRANDMASTER       = 5;

// The needed levels for all ranks
const int DCS_RANK_LEVEL_NOVICE      = 1;
const int DCS_RANK_LEVEL_APPRENTICE  = 5;
const int DCS_RANK_LEVEL_EXPERT      = 9;
const int DCS_RANK_LEVEL_MASTER      = 14;
const int DCS_RANK_LEVEL_GRANDMASTER = 17; //max 18

// Profession Specialisations
//const int DCS_SPECIAL_ELIXIER        = 21;
//const int DCS_SPECIAL_POTION         = 22;

const int DCS_SPECIAL_WEAPONSMITH    = 81;
const int DCS_SPECIAL_ARMORSMITH     = 82;

// Profession IDs
const int DCS_PROFESSION_COOK        = 1;
const int DCS_PROFESSION_ALCHEMIST   = 2;
const int DCS_PROFESSION_ENCHANTER   = 3;
const int DCS_PROFESSION_TANNER      = 4;
const int DCS_PROFESSION_CARPENTER   = 5;
const int DCS_PROFESSION_GOLDSMITH   = 6;
const int DCS_PROFESSION_SMELTER     = 7;
const int DCS_PROFESSION_SMITH       = 8;
const int DCS_PROFESSION_TAILOR      = 9;
const int DCS_PROFESSION_SCRIBER     = 10;
const int DCS_PROFESSION_ENGINEER    = 11;

const int DCS_PROFESSION_FIRST       = 1;
const int DCS_PROFESSION_SECOND      = 2;

const int DCS_PROFESSION_RADIAL_BASE = 961; // Base for the profession feats. Always use Base + Profession
const int DCS_PROFESSION_CRAFT_BASE  = 909; // Base for the start crafting spell
const int DCS_PROFESSION_MENU_BASE   = 920; // Base for the start menu spell

const int DCS_PROFESSIONS_COUNT      = 11;

const int SKILL_SUCCESS_CHANCE       = 1;
const int SKILL_EXPERIMENT_CHANCE    = 2;
const int SKILL_EXPERIMENT_POINTS    = 3;
const int SKILL_MORE_ITEM_CHANCE     = 4;
const int SKILL_NUM_SKILLS           = 5;

/******************************************************************************/
/*                             Dialog & Tokens                                */
/******************************************************************************/

const int DCS_TOKEN_COLOR_1                   = 10000;
const int DCS_TOKEN_COLOR_2                   = 10001;
const int DCS_TOKEN_COLOR_3                   = 10002;
const int DCS_TOKEN_COLOR_END                 = 11000;

const int DCS_TOKEN_TRAINER_BASE              = 78000;
const int DCS_TOKEN_TRAINER_LEVEL             = 78100;
const int DCS_TOKEN_TRAINER_TEACH             = 78200;

const int DCS_TOKEN_PROFESSION                = 79000;
const int DCS_TOKEN_PROFESSION_LEVEL          = 79100;
const int DCS_TOKEN_PROFESSION_SKILLPOINTS    = 79200;

const int DCS_TOKEN_INFO_VERSION              = 80000;
const int DCS_TOKEN_INFO_PROFESSION           = 80500;

const int DCS_TOKEN_MAINMENU_BASE             = 81000;
const int DCS_TOKEN_MAINMENU_LEAVE            = 81100;
const int DCS_TOKEN_MENU_SOURCE               = 82000;

const int DCS_TOKEN_CRAFTING_DISPLAY          = 83000;
const int DCS_TOKEN_CRAFTING_CREATE           = 83010;
const int DCS_TOKEN_CRAFTING_NOCREATE         = 83020;
const int DCS_TOKEN_CRAFTING_SUCCESS          = 83100;
const int DCS_TOKEN_CRAFTING_FAILURE          = 83200;

const int DCS_TOKEN_EXPERIMENT_DISPLAY        = 85000;
const int DCS_TOKEN_EXPERIMENT_BASE           = 85100;
const int DCS_TOKEN_EXPERIMENT_DISPLAY_SINGLE = 85200;
const int DCS_TOKEN_EXPERIMENT_DISPLAY_RESULT = 85300;

const int DCS_TOKEN_EXPERIENCE_GAINED         = 86000;

const int DCS_TOKEN_SKILL_DISPLAY             = 87000;
const int DCS_TOKEN_SKILL_DISPLAY_SINGLE      = 87100;

const int DCS_TOKEN_EXPERIMENT_OBJECT         = 88000;

const int DCS_TOKEN_SPAWNER_TOOL_CATEGORIES   = 20000;
const int DCS_TOKEN_SPAWNER_TOOL_SPAWNER      = 21000;

const int DCS_TOKEN_CRAFTING_SKILLS           = 40000;

const int DCS_TOKEN_PER_PAGE_EXPERIMENT       = 12;
const int DCS_TOKEN_PER_PAGE_MAINMENU         = 6;
const int DCS_TOKEN_PER_PAGE_MENU             = 8;

// Menu pages and parts
const int DCS_TOKENTYPE_MAINPAGE              = -1;
const int DCS_TOKENTYPE_GETTITLE              = -10;

const int DCS_MENUPART_1                      = 1;
const int DCS_MENUPART_2                      = 2;
const int DCS_MENUPART_3                      = 3;

// Menu entry types
const int DCS_ENTRY_TYPE_DEFAULT              = 1;
const int DCS_ENTRY_TYPE_MAINMENU             = 2;
const int DCS_ENTRY_TYPE_TITLE                = 3;
const int DCS_ENTRY_TYPE_COLORTAG             = 4;

// Choose item modes
const int DCS_MODE_CHOOSE_ITEM                = 1;
const int DCS_MODE_CHOOSE_GEM                 = 2;
const int DCS_MODE_REMOVE_GEM                 = 3;

/******************************************************************************/
/*                               Conditions                                   */
/******************************************************************************/

const int DCS_CONDITION_SMITH_FORGE           = 1;

const int DCS_CONDITION_GOLDSMITH_TABLE       = 2;
const int DCS_CONDITION_GOLDSMITH_BASIN       = 4;
const int DCS_CONDITION_GOLDSMITH_FORGE       = 8;

const int DCS_CONDITION_CARPENTER_SAWHORSE    = 16;
const int DCS_CONDITION_CARPENTER_TABLE       = 32;

/******************************************************************************/
/*                           Database structures                              */
/******************************************************************************/

// PC-data
struct DCS_PCData
{
    int First;
    int Second;
    int Level;
    int XP;
    int Rank;
    string Name;
};

/******************************************************************************/
/******************************************************************************/

// *  Displays sMsg to oPC
// *  iFloat: If this is TRUE, the message will be floated
void DCS_Display(object oPC, string sMsg, int iFloat=FALSE);
void DCS_Display(object oPC, string sMsg, int iFloat=FALSE)
{
    if(iFloat)
        FloatingTextStringOnCreature(sMsg, oPC, FALSE);
    else
        SendMessageToPC(oPC, sMsg);
}

/******************************************************************************/

void DCS_DebugToPlayers(string sMessage)
{
    object oPC = GetFirstPC();

    while(GetIsObjectValid(oPC))
    {
        SendMessageToPC(oPC, sMessage);
        oPC = GetNextPC();
    }
}

/******************************************************************************/

// * Maths operation: y root of fValue
// * Returns zero if fValue <0  or fY == 0
float yroot(float fValue, float fY);
float yroot(float fValue, float fY)
{
    if(fValue < 0.0 || fY == 0.0)
    return 0.0;

    return pow(fValue, 1.0 / fY);
}

/******************************************************************************/

// *  Caching function for Get2DAString() function. This function stores the 2da string as
// *  a local string to the module and returns this string instead of searching for the 2da entry over and over
// *  NOTE: This will only store entries with content. (e.g "****"). Empty strings won't be stored at all
string GetCached2DAString(string s2DA, string sColumn, int nRow);
string GetCached2DAString(string s2DA, string sColumn, int nRow)
{
    string sCache = GetLocalString(GetModule(), s2DA+"_"+sColumn+"_"+IntToString(nRow));

    if(sCache == "")
    {
        sCache = Get2DAString(s2DA, sColumn, nRow);

        if(sCache != "")
        SetLocalString(GetModule(), s2DA+"_"+sColumn+"_"+IntToString(nRow), sCache);
    }

    return sCache;
}

/******************************************************************************/

// *  Same function as GetCached 2DAString but this will return the string converted to an integer
int GetCached2DAInt(string s2DA, string sColumn, int nRow);
int GetCached2DAInt(string s2DA, string sColumn, int nRow)
{
    return StringToInt(GetCached2DAString(s2DA, sColumn, nRow));
}

/******************************************************************************/

// *  Set the system loading status to iStatus
void DCS_SetSystemLoaded(int iStatus);
void DCS_SetSystemLoaded(int iStatus)
{
    SetLocalInt(GetModule(), "DCS_SystemLoaded", iStatus);
}

/******************************************************************************/

// *  Returns current system loading status
int DCS_GetSystemLoaded();
int DCS_GetSystemLoaded()
{
    return GetLocalInt(GetModule(), "DCS_SystemLoaded");
}

/******************************************************************************/

// *  Set main integer to iNumber
void DCS_SetMainInt(int iNumber, object oTarget=OBJECT_SELF);
void DCS_SetMainInt(int iNumber, object oTarget=OBJECT_SELF)
{
    SetLocalInt(oTarget, "DCS_MainInt", iNumber);
}

/******************************************************************************/

// *  Returns current main integer
int DCS_GetMainInt(object oTarget=OBJECT_SELF);
int DCS_GetMainInt(object oTarget=OBJECT_SELF)
{
    return GetLocalInt(oTarget, "DCS_MainInt");
}

/******************************************************************************/

// *  Set minor integer to iNumber
void DCS_SetMinorInt(int iNumber, object oTarget=OBJECT_SELF);
void DCS_SetMinorInt(int iNumber, object oTarget=OBJECT_SELF)
{
    SetLocalInt(oTarget, "DCS_MinorInt", iNumber);
}

/******************************************************************************/

// *  Returns current minor integer
int DCS_GetMinorInt(object oTarget=OBJECT_SELF);
int DCS_GetMinorInt(object oTarget=OBJECT_SELF)
{
    return GetLocalInt(oTarget, "DCS_MinorInt");
}

/******************************************************************************/

// *  Returns the player that is currently using the crafting station
object DCS_GetCraftingPlayer(object oStation=OBJECT_SELF);
object DCS_GetCraftingPlayer(object oStation=OBJECT_SELF)
{
    return GetLocalObject(oStation, DCS_VAR_CRAFTING_PLAYER);
}

/******************************************************************************/

// *  Marks oPlayer as current crafting player for oStation
void DCS_SetCraftingPlayer(object oPlayer, object oStation=OBJECT_SELF);
void DCS_SetCraftingPlayer(object oPlayer, object oStation=OBJECT_SELF)
{
    SetLocalObject(oStation, DCS_VAR_CRAFTING_PLAYER, oPlayer);
}

/******************************************************************************/

// *  Deletes marked crafting player from crafting station
void DCS_DeleteCraftingPlayer();
void DCS_DeleteCraftingPlayer()
{
    DeleteLocalObject(OBJECT_SELF, DCS_VAR_CRAFTING_PLAYER);
}

/******************************************************************************/

// *  Changes the status of sOption to iStatus for oPlayer
// *  NOTE: if oPlayer = OBJECT_INVALID, the function uses GetPCSpeaker() instead
void DCS_SetOption(string sOption, int iStatus, object oPlayer=OBJECT_INVALID);
void DCS_SetOption(string sOption, int iStatus, object oPlayer=OBJECT_INVALID)
{
    if(!GetIsObjectValid(oPlayer))oPlayer=GetPCSpeaker();
    SetLocalInt(oPlayer, sOption, iStatus);
}

/******************************************************************************/

// *  Returns the status of sOption from oPlayer
// *  NOTE: if oPlayer = OBJECT_INVALID, the function uses GetPCSpeaker() instead
int DCS_GetOption(string sOption, object oPlayer=OBJECT_INVALID);
int DCS_GetOption(string sOption, object oPlayer=OBJECT_INVALID)
{
    if(!GetIsObjectValid(oPlayer))oPlayer=GetPCSpeaker();
    return GetLocalInt(oPlayer, sOption);
}

/******************************************************************************/

int DCS_GetInformationMode(object oPlayer=OBJECT_INVALID);
int DCS_GetInformationMode(object oPlayer=OBJECT_INVALID)
{
    if(!GetIsObjectValid(oPlayer))oPlayer = GetPCSpeaker();
    return DCS_GetOption(DCS_OPTION_INFORMATION_MODE, oPlayer);
}

/******************************************************************************/

// *  Get name of iProfession
// *  - Use DCS_PROFESSION_* values here
// *  - On error return: "-"
string DCS_GetProfessionName(int iProfession);
string DCS_GetProfessionName(int iProfession)
{
    switch(iProfession)
    {
        case DCS_PROFESSION_ALCHEMIST: return "Alchemist";break;
        case DCS_PROFESSION_CARPENTER: return "Schreiner";break;
        case DCS_PROFESSION_COOK:      return "Koch";break;
        case DCS_PROFESSION_ENCHANTER: return "Verzauberer";break;
        case DCS_PROFESSION_ENGINEER:  return "Ingenieur";break;
        case DCS_PROFESSION_GOLDSMITH: return "Goldschmied";break;
        case DCS_PROFESSION_SCRIBER:   return "Schreiber";break;
        case DCS_PROFESSION_SMELTER:   return "Schmelzer";break;
        case DCS_PROFESSION_SMITH:     return "Schmied"; break;
        case DCS_PROFESSION_TAILOR:    return "Schneider";break;
        case DCS_PROFESSION_TANNER:    return "Gerber";break;
    }

    return "-";
}

/******************************************************************************/

// *  Converts sProfName into the matching profession number (DCS_PROFESSION_*)
int DCS_GetProfessionID(string sProfName);
int DCS_GetProfessionID(string sProfName)
{
         if(sProfName == "Alchemist")   return DCS_PROFESSION_ALCHEMIST;
    else if(sProfName == "Gerber")      return DCS_PROFESSION_TANNER;
    else if(sProfName == "Ingenieur")   return DCS_PROFESSION_ENGINEER;
    else if(sProfName == "Goldschmied") return DCS_PROFESSION_GOLDSMITH;
    else if(sProfName == "Koch")        return DCS_PROFESSION_COOK;
    else if(sProfName == "Schmelzer")   return DCS_PROFESSION_SMELTER;
    else if(sProfName == "Schmied")     return DCS_PROFESSION_SMITH;
    else if(sProfName == "Schneider")   return DCS_PROFESSION_TAILOR;
    else if(sProfName == "Schreiber")   return DCS_PROFESSION_SCRIBER;
    else if(sProfName == "Schreiner")   return DCS_PROFESSION_CARPENTER;
    else if(sProfName == "Verzauberer") return DCS_PROFESSION_ENCHANTER;

    return 0;
}

/******************************************************************************/

// *  Returns the matching profession for sMainID (DCS_MAINID_*)
int DCS_GetProfessionFromMainID(string sMainID);
int DCS_GetProfessionFromMainID(string sMainID)
{
         if(sMainID == DCS_MAINID_ALCHEMY)     return DCS_PROFESSION_ALCHEMIST;
    else if(sMainID == DCS_MAINID_TANNING)     return DCS_PROFESSION_TANNER;
    else if(sMainID == DCS_MAINID_ENGINEERING) return DCS_PROFESSION_ENGINEER;
    else if(sMainID == DCS_MAINID_GOLDSMITH)   return DCS_PROFESSION_GOLDSMITH;
    else if(sMainID == DCS_MAINID_COOKING)     return DCS_PROFESSION_COOK;
    else if(sMainID == DCS_MAINID_SMELTING)    return DCS_PROFESSION_SMELTER;
    else if(sMainID == DCS_MAINID_SMITHING)    return DCS_PROFESSION_SMITH;
    else if(sMainID == DCS_MAINID_TAILORING)   return DCS_PROFESSION_TAILOR;
    else if(sMainID == DCS_MAINID_SCRIBING)    return DCS_PROFESSION_SCRIBER;
    else if(sMainID == DCS_MAINID_CARPENTING)  return DCS_PROFESSION_CARPENTER;
    else if(sMainID == DCS_MAINID_ENCHANTING)  return DCS_PROFESSION_ENCHANTER;

    return 0;
}
/******************************************************************************/

// *  Converts Rank name into the matching rank id
int DCS_GetRankID(string Rank);
int DCS_GetRankID(string Rank)
{
         if(Rank == "Lehrling")    return DCS_RANK_NOVICE;
    else if(Rank == "Geselle")     return DCS_RANK_APPRENTICE;
    else if(Rank == "Experte")     return DCS_RANK_EXPERT;
    else if(Rank == "Meister")     return DCS_RANK_MASTER;
    else if(Rank == "Großmeister") return DCS_RANK_GRANDMASTER;

    return 0;
}

/******************************************************************************/

// *  Converts constant Rank (DCS_RANK_*) into the rank name
string DCS_GetRankName(int Rank);
string DCS_GetRankName(int Rank)
{
    switch(Rank)
    {
        case DCS_RANK_NOVICE:      return "Lehrling"; break;
        case DCS_RANK_APPRENTICE:  return "Geselle";break;
        case DCS_RANK_EXPERT:      return "Experte";break;
        case DCS_RANK_MASTER:      return "Meister";break;
        case DCS_RANK_GRANDMASTER: return "Großmeister";break;
    }

    return "-";
}

/******************************************************************************/

// *  Returns the proper name for iSpecial
string DCS_GetSpecialisationName(int iSpecial);
string DCS_GetSpecialisationName(int iSpecial)
{
    switch(iSpecial)
    {
        //case DCS_SPECIAL_ELIXIER:     return "Spezialist für Elixiere";break;
        //case DCS_SPECIAL_POTION:      return "Spezialist für Tränke";break;
        case DCS_SPECIAL_WEAPONSMITH: return "Spezialist für Waffen";break; //"Waffenschmied"
        case DCS_SPECIAL_ARMORSMITH:  return "Spezialist für Rüstungen";break; //"Rüstungsschmied"
        default: return DCS_GetProfessionName(iSpecial);break;
    }

    return "";
}

/******************************************************************************/

// *  Returns the proper profession specialisation for iSpecial. If iSpecial is not a valid specialisation, this function will return 0.
int DCS_GetSpecialisationFromProfession(int iProfession, int iSpecial=1);
int DCS_GetSpecialisationFromProfession(int iProfession, int iSpecial=1)
{
    iSpecial = iProfession * 10 + iSpecial;

    if(DCS_GetSpecialisationName(iSpecial) != DCS_GetProfessionName(iProfession) && DCS_GetSpecialisationName(iSpecial) != "-")
    return iSpecial;

    return 0;
}

/******************************************************************************/

// *  Returns the database column of iSkill, use SKILL_* values here
string DCS_GetSkillColumn(int iSkill);
string DCS_GetSkillColumn(int iSkill)
{
    string sRet;
    switch(iSkill)
    {
        case SKILL_SUCCESS_CHANCE:    return DCS_COL_DB_SUCCESS_CHANCE;break;
        case SKILL_EXPERIMENT_CHANCE: return DCS_COL_DB_EXPM_CHANCE;break;
        case SKILL_EXPERIMENT_POINTS: return DCS_COL_DB_EXPM_POINTS;break;
        case SKILL_MORE_ITEM_CHANCE:  return DCS_COL_DB_MORE_ITEM_CHANCE;break;
    }

    return sRet;
}

/******************************************************************************/

// *  Returns the local profession tag of iSkill, use SKILL_* values here
string DCS_GetSkillTag(int iSkill);
string DCS_GetSkillTag(int iSkill)
{
    string sRet;
    switch(iSkill)
    {
        case SKILL_SUCCESS_CHANCE:    return DCS_COL_PROF_SUCCESSCHANCE;break;
        case SKILL_EXPERIMENT_CHANCE: return DCS_COL_PROF_EXPMCHANCE;break;
        case SKILL_EXPERIMENT_POINTS: return DCS_COL_PROF_EXPMPOINTS;break;
        case SKILL_MORE_ITEM_CHANCE:  return DCS_COL_PROF_MOREITEMCHANCE;break;
    }

    return sRet;
}

/******************************************************************************/

// *  Returns the name of iSkill, use DCS_SKILL_* values here
string DCS_GetSkillName(int iSkill);
string DCS_GetSkillName(int iSkill)
{
    string sRet;
    switch(iSkill)
    {
        case SKILL_SUCCESS_CHANCE:    sRet = "Erfolgschance";break;
        case SKILL_EXPERIMENT_CHANCE: sRet = "Experimentationschance";break;
        case SKILL_EXPERIMENT_POINTS: sRet = "Experimentationspunkte";break;
        case SKILL_MORE_ITEM_CHANCE:  sRet = "Chance auf erhöhte Gegenstandsanzahl";break;
    }

    return sRet;
}

/******************************************************************************/

// *  Cuts the space from a float converted to a string (e.g. "           0.12345")
// *  - iNumbersBehindComma: The total amount of numbers that should be left behind the point
// *                         (-1 to get all numbers)
string DCS_RearrangeFloat(float fValue, int iNumbersBehindComma=4);
string DCS_RearrangeFloat(float fValue, int iNumbersBehindComma=4)
{
    string sValue = FloatToString(fValue);
    int    iDot   = FindSubString(sValue, ".");
    int    iLen   = GetStringLength(sValue);
    int    iCount;

    while(GetSubString(sValue, iDot-(iCount+1), 1) != " ")
    {
        iCount++;
    }

    if(iNumbersBehindComma == -1)
    iNumbersBehindComma = iLen - (iDot+1);

    return GetSubString(sValue, iDot - iCount, iNumbersBehindComma+iCount+1);
}

/******************************************************************************/

string StrCat(string sSource, string sConcatenate, int iRepeat=1);
string StrCat(string sSource, string sConcatenate, int iRepeat=1)
{
    int iCount;
    for(iCount = 1; iCount <= iRepeat; iCount++)
    {
        sSource += sConcatenate;
    }

    return sSource;
}

/******************************************************************************/

// *  Returns the current choose-item-mode status
int DCS_GetChooseItemMode(object oStation=OBJECT_SELF);
int DCS_GetChooseItemMode(object oStation=OBJECT_SELF)
{
    return GetLocalInt(oStation, DCS_VAR_SET_CHOOSE_ITEM);
}

/******************************************************************************/

int DCS_GetIsCraftingStation(object oStation);
int DCS_GetIsCraftingStation(object oStation)
{
    string sTag = GetTag(oStation);

    return sTag == DCS_STATION_ALCH_TABLE         ||
           sTag == DCS_STATION_CARP_BANK          ||
           sTag == DCS_STATION_CARP_SAW           ||
           sTag == DCS_STATION_COOK_KETTLE        ||
           sTag == DCS_STATION_ENCH_ALTAR         ||
           sTag == DCS_STATION_GOLDSMITH_BASIN    ||
           sTag == DCS_STATION_GOLDSMITH_TABLE    ||
           sTag == DCS_STATION_GOLDSMITH_FORGE    ||
           sTag == DCS_STATION_SMELT_OVEN         ||
           sTag == DCS_STATION_SMITH_ANVIL        ||
           sTag == DCS_STATION_SMITH_FORGE        ||
           sTag == DCS_STATION_TAIL_LOOM          ||
           sTag == DCS_STATION_TAIL_TABLE         ||
           sTag == DCS_STATION_TANN_BANK          ||
           sTag == DCS_STATION_TANN_TABLE         ||
           sTag == DCS_STATION_WRIT_TABLE;
}

object DCS_GetCustomIPStorage()
{
    return GetObjectByTag("dcs_custom_ips");
}

/******************************************************************************/

void SetItemName(string sConst, string sName, string sColor="");
void SetItemName(string sConst, string sName, string sColor="")
{
    if(sColor != "")
    sName = sColor+sName+"</c>";

    SetInternString(sConst, sName, GetModule());
}

/******************************************************************************/

// *  Stores all constant names on local variables
void DCS_SetResourceNames(int i = 1);
void DCS_SetResourceNames(int i = 1)
{
    string ResRef = GetCached2DAString("dcs_objects","ResRef", i);

    if(ResRef != "" && ResRef != "****")
    {
        string Name = GetCached2DAString("dcs_objects", "Name", i);
        string Color = GetCached2DAString("dcs_objects", "Color", i);

        if(Name != "" && Name != "****")
        SetItemName(ResRef, Name, (Color != "" && Color != "****" ? Color : ""));

        DelayCommand(0.15, DCS_SetResourceNames(i+1));
    }
}

/******************************************************************************/

// *  Splits Entry with value of Column divided by sSpacer
string SplitEntryColumn(string Entry, int Column);
string SplitEntryColumn(string Entry, int Column)
{
    int iSub, i;
    string PString;

    for(i = 1; i <= Column; i++)
    {
        iSub    = FindSubString(Entry, "/");
        PString = GetStringLeft(Entry, iSub);
        Entry   = GetStringRight(Entry, GetStringLength(Entry)-(iSub+1));
    }

    return PString;
}

/******************************************************************************/

// *  Splits sValue with sSpacer between each value and returns how many values it can find
// *  - nLookBehindSpacer: If there is still a string behind the last spacer, the function will return the count + 1
// *  On error return: 0
int SplitStringSize(string sValue, string sSpacer=dcsSpace, int nMinRequiredSpacers=0, int nLookBehindSpacer=TRUE);
int SplitStringSize(string sValue, string sSpacer=dcsSpace, int nMinRequiredSpacers=0, int nLookBehindSpacer=TRUE)
{
/*    int iSubString = FindSubString(sValue, sSpacer);
    int iSpaceLen  = GetStringLength(sSpacer);
    int i;

    if(iSubString == -1) return 0;

    for(i=0; sValue != ""; i++)
    {
        sValue     = GetStringRight(sValue, GetStringLength(sValue)-(iSubString+iSpaceLen));
        iSubString = FindSubString(sValue, sSpacer);
    }
*/
    int iSearch = -1;
    int iStart = 0;
    int i = 0;

    if(FindSubString(sValue, sSpacer) == -1 && nMinRequiredSpacers != 0)
    return 0;

    while((iSearch = FindSubString(sValue, sSpacer, iStart)) != -1)
    {
        iStart = iSearch + 1;
        i++;
    }

    if(iStart < GetStringLength(sValue) && nLookBehindSpacer)
    i++;

    return i;
}

/******************************************************************************/

// *  Splits sValue with sSpacers between each value and returns the nNth.
// *  When there's no spacer but a string part left, this function returns the part behind the last spacer
// *  On error return: ""
string SplitStringValue(string sValue, int nNth=1, string sSpacer=dcsSpace);
string SplitStringValue(string sValue, int nNth=1, string sSpacer=dcsSpace)
{
/*    int iSubString = FindSubString(sValue, sSpacer);
    int iSpaceLen  = GetStringLength(sSpacer);
    int i;
    string sSavedString;

    if(iSubString == -1)return "";

    for(i=1; i <= nNth; i++)
    {
        sSavedString = GetStringLeft(sValue, iSubString+iSpaceLen);
        sValue       = GetStringRight(sValue, GetStringLength(sValue)-(iSubString+iSpaceLen));
        iSubString   = FindSubString(sValue, sSpacer);
    }

    return GetStringLeft(sSavedString, GetStringLength(sSavedString)-iSpaceLen);
*/
    int iSearch = -1;
    int iStart = 0;
    int i;

    for(i = 1; i <= nNth; i++)
    {
        iStart = iSearch + 1;

        if((iSearch = FindSubString(sValue, sSpacer, iStart)) == -1)
        {
            if(iStart < GetStringLength(sValue))
                return GetSubString(sValue, iStart, iStart - GetStringLength(sValue));

            return "";
        }
    }

    return GetSubString(sValue, iStart, iSearch - iStart);
}

/******************************************************************************/

// *  Same function as SplitStringValue() but returns an integer instead of a string
int SplitStringValueInt(string sValue, int nNth=1, string sSpacer=dcsSpace);
int SplitStringValueInt(string sValue, int nNth=1, string sSpacer=dcsSpace)
{
/*    int iSubString = FindSubString(sValue, sSpacer);
    int iSpaceLen  = GetStringLength(sSpacer);
    int i;

    string sSavedString;

    if(iSubString == -1)return 0;

    for(i=1; i <= nNth; i++)
    {
        sSavedString = GetStringLeft(sValue, iSubString+iSpaceLen);
        sValue       = GetStringRight(sValue, GetStringLength(sValue)-(iSubString+iSpaceLen));
        iSubString   = FindSubString(sValue, sSpacer);
    }

    return StringToInt(GetStringLeft(sSavedString, GetStringLength(sSavedString)-iSpaceLen));
*/
    return StringToInt(SplitStringValue(sValue, nNth, sSpacer));
}

/******************************************************************************/

// *  Splits the assigned text Column in Text
string SplitRecipeText(string Text, string Column);
string SplitRecipeText(string Text, string Column)
{
    string sReturn;
    int iLen    = GetStringLength(Text);
    int iColLen = GetStringLength(Column+dcsLocalMid);
    int iColPos = FindSubString(Text, Column+dcsLocalMid);
    int iTextPos;

    Text     = GetStringRight(Text, iLen-(iColPos+iColLen));
    iTextPos = FindSubString(Text, dcsLocalEnd);
    sReturn  = GetStringLeft(Text, iTextPos);

    return sReturn;
}

// *  Caches a 2da column to local variables
void Cache2DAColumn(string s2DA, string sColumn, string sLabel="Label", int iRow=0);
void Cache2DAColumn(string s2DA, string sColumn, string sLabel="Label", int iRow=0)
{
    // Checking for validity of the 2da row
    if(GetCached2DAString(s2DA, sLabel, iRow) != "")
    {
        string sCache = GetCached2DAString(s2DA, sColumn, iRow);
        DelayCommand(DCS_COPYING_DELAY, Cache2DAColumn(s2DA, sColumn, sLabel, iRow+1));
    }
}

/******************************************************************************/

//void main(){}
