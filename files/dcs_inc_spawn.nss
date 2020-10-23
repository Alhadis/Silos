#include "dcs_inc_main"

string DCS_NPC_ITEM_RESREF          = "NPC_Item_ResRef_0";
string DCS_NPC_ITEM_AMOUNT          = "NPC_Item_Amount_0";
string DCS_NPC_ITEM_CHANCE          = "NPC_Item_Chance_0";

string DCS_SPAWNER_AREA_ACTIVATED   = "dcs_area_spawn_active";
string DCS_SPAWNER_SPAWN_ACTIVATED  = "dcs_spawn_active";
string DCS_SPAWNER_SPAWN_SOURCE     = "dcs_spawn_source";
string DCS_SPAWNER_SPAWN_BASE       = "dcs_spawn_base";

string DCS_SPAWNER_FACING           = "Plc_Facing";
string DCS_SPAWNER_TARGET           = "Plc_Resource_Target";
string DCS_SPAWNER_USES             = "Plc_Resource_Uses";
string DCS_SPAWNER_RESREF           = "Plc_ResRef_";
string DCS_SPAWNER_RESREF_CHANCE    = "Plc_ResRef_Chance_";
string DCS_SPAWNER_RESREF_COUNT     = "Plc_ResRef_Number";
string DCS_SPAWNER_SPAWNCHANCE      = "Plc_Spawn_Chance";
string DCS_SPAWNER_USES_RESET       = "Plc_Uses_Reset";
string DCS_SPAWNER_USES_TICK        = "Plc_Uses_Tick";

string DCS_SPAWNER_IS_FISH_SWARM    = "Spawn_Is_Fish_Swarm";
string DCS_SPAWNER_FISH_SWARM_POINT = "Spawn_Fish_Swarm_Point";
string DCS_SPAWNER_PC_IS_FISHING    = "Spawn_PC_Is_Fishing_";
string DCS_SPAWNER_ORIGINAL_NAME    = "Spawn_Name_Original";
string DCS_SPAWNER_GREAT_NAME       = "Spawn_Name_Great";
string DCS_SPAWNER_SMALL_NAME       = "Spawn_Name_Small";
string DCS_SPAWNER_TOOL_LEFTHAND    = "Spawn_Tool_LHand";
string DCS_SPAWNER_TOOL_RIGHTHAND   = "Spawn_Tool_RHand";
string DCS_SPAWNER_TOOL_EQUIP       = "Spawn_Tool_Equip";
string DCS_SPAWNER_TOOL_MUSTEQUIP   = "Spawn_Tool_Must_Equip";
string DCS_SPAWNER_TOOL_EQUIPTEXT   = "Spawn_Tool_Equip_Text";
string DCS_SPAWNER_ITEM_RESREF      = "Spawn_Resource_Resref";
string DCS_SPAWNER_ITEM_AMOUNT      = "Spawn_Resource_Amount";
string DCS_SPAWNER_RESOURCE_ATTEMPT = "Spawn_Resource_Attempt";
string DCS_SPAWNER_SPECIAL_AMOUNT   = "Spawn_Special_Amount";
string DCS_SPAWNER_SPECIAL_CHANCE   = "Spawn_Special_Chance";
string DCS_SPAWNER_SPECIAL_RESREF   = "Spawn_Special_ResRef";
string DCS_SPAWNER_DC               = "Spawn_Difficulty";
string DCS_SPAWNER_ABILITY_01       = "Spawn_Ability_01";
string DCS_SPAWNER_ABILITY_02       = "Spawn_Ability_02";
string DCS_SPAWNER_NO_USES_TEXT     = "Spawn_No_Uses_Text";
string DCS_SPAWNER_NO_USES_NAME     = "Spawn_No_Uses_Name";
string DCS_SPAWNER_VISUAL_EFFECT    = "Spawn_Visualeffect";

/******************************************************************************/
/******************************************************************************/

 // This returns a direction normalized to the range 0.0 - 360.0
float DCS_GetNormalizedDirection(float fDirection)
{
    float fNewDir = fDirection;
    while (fNewDir >= 360.0) {
        fNewDir -= 360.0;
    }
    return fNewDir;
}

/******************************************************************************/

int DCS_GetIsFishingSwarm(object oSwarm)
{
    return GetLocalInt(oSwarm, DCS_SPAWNER_IS_FISH_SWARM);
}

/******************************************************************************/

float GetSpawnFacing(object oSource)
{
    float fFacing = GetLocalFloat(oSource, DCS_SPAWNER_FACING);

    if(fFacing < 0.0)
    return GetFacing(oSource);

    return DCS_GetNormalizedDirection(fFacing);
}

/******************************************************************************/

void SetSpawnActivated(int iActivated, object oSpawnSource);
void SetSpawnActivated(int iActivated, object oSpawnSource)
{
    SetLocalInt(oSpawnSource, DCS_SPAWNER_SPAWN_ACTIVATED, iActivated);
}

/******************************************************************************/

int GetSpawnActivated(object oSpawnSource);
int GetSpawnActivated(object oSpawnSource)
{
    return GetLocalInt(oSpawnSource, DCS_SPAWNER_SPAWN_ACTIVATED);
}

/******************************************************************************/

int PrepareAccount(object oAccount, float fPrepare, object oTarget=OBJECT_SELF)
{
    if(fPrepare <= 0.0)
    return TRUE;

    string sAccount = GetAccountData(oAccount);
    int    iStatus  = GetAccountSwitch(DCS_ACCOUNT_STATUS, sAccount, oTarget);
    if(iStatus < 2)
    {
        if(iStatus == 0)
        {
            SetAccountSwitch(1, DCS_ACCOUNT_STATUS, sAccount, oTarget);
            DelayCommand(fPrepare, SetAccountSwitch(2, DCS_ACCOUNT_STATUS, sAccount, oTarget));
        }
        return FALSE;
    }

    SetAccountSwitch(0, DCS_ACCOUNT_STATUS, sAccount, oTarget);
    return TRUE;
}

/******************************************************************************/

int DCS_GetAbility(string sAbility)
{
    sAbility = GetStringLowerCase(sAbility);

         if(sAbility == "cha")return ABILITY_CHARISMA;
    else if(sAbility == "con")return ABILITY_CONSTITUTION;
    else if(sAbility == "dex")return ABILITY_DEXTERITY;
    else if(sAbility == "int")return ABILITY_INTELLIGENCE;
    else if(sAbility == "str")return ABILITY_STRENGTH;
    else if(sAbility == "wis")return ABILITY_WISDOM;

    return 0;
}

/******************************************************************************/

int DCS_GetScore(object oPC, string sAbility, float fModifier)
{
    return FloatToInt(GetAbilityScore(oPC, DCS_GetAbility(sAbility)) / fModifier);
}

/******************************************************************************/

string DCS_GetAbilityResult(string sAbility, int iResult)
{
    sAbility = GetStringLowerCase(sAbility);

         if(sAbility == "cha")sAbility = "Charisma";
    else if(sAbility == "con")sAbility = "Konstitution";
    else if(sAbility == "dex")sAbility = "Geschick";
    else if(sAbility == "int")sAbility = "Intelligenz";
    else if(sAbility == "str")sAbility = "Stärke";
    else if(sAbility == "wis")sAbility = "Weisheit";

    return sAbility+": "+inStr(iResult);
}

/******************************************************************************/
/*
string DCS_GetThrowResult(int iDC, int iResult, int iDice)
{
         if(iDice == 20) return "*"+DCS_TEXT_RESULT_AMAZING_SUCCESS+"*";
    else if(iDice == 1)  return "*"+DCS_TEXT_RESULT_ABSOLUTE_FAILURE+"*";
    else if(iResult + iDice >= iDC) return "*"+DCS_TEXT_RESULT_SUCCESS+"*";

    return "*"+DCS_TEXT_RESULT_FAILURE+"*";
}  */

/******************************************************************************/

object DCS_GetValidTool(object oPC, string sTag)
{
    object oRHand = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    object oLHand = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);

    if(GetIsObjectValid(oRHand) && GetTag(oRHand) == sTag)
        return oRHand;
    if(GetIsObjectValid(oLHand) && GetTag(oLHand) == sTag)
        return oLHand;

    return OBJECT_INVALID;
}

/******************************************************************************/

void DCS_DestroyTools(object oPC, string sToolString, int iEquip)
{
    int iTools;
    object oTool;
    // There are multiple tools available
    if(FindSubString(sToolString, ";") != -1)
    {
        iTools = SplitStringSize(sToolString, ";");
        AdvDebug(oPC, "Tool separator found: "+sToolString+", iTools: "+inStr(iTools)+", iEquip: "+inStr(iEquip));

        // Multiple tools available, so we just destroy one of the equipped ones randomly
        if(iTools > 1 && iEquip == 0)
            DestroyObject(GetItemPossessedBy(oPC, SplitStringValue(sToolString, Random(iTools)+1, ";")));
        if(iTools > 1 && iEquip == 1)
            DestroyObject(DCS_GetValidTool(oPC, SplitStringValue(sToolString, Random(iTools)+1, ";")));
        // Multiple Tools available and both of them are equipped, so we just destroy the item in the left or right hand
        else if(iTools > 1)
            DestroyObject(DCS_GetValidTool(oPC, SplitStringValue(sToolString, d2(), ";")));
        else if(iTools == 1)
            DestroyObject(DCS_GetValidTool(oPC, SplitStringValue(sToolString, 1, ";")));
    }
    else
    {
        AdvDebug(oPC, "Destroying Single Tool: "+sToolString);

        DestroyObject(DCS_GetValidTool(oPC, sToolString));
    }
}

/******************************************************************************/

int DCS_GetToolEquipped(object oPC, string sToolString, int iEquip)
{
    int iTools;
    string sTool;
    object oTool;

    AdvDebug(oPC, "Toolstring: "+sToolString);

    if(sToolString == "")
    return TRUE;

    // There are multiple tools available
    if(FindSubString(sToolString, ";") != -1)
    {
        iTools = SplitStringSize(sToolString, ";");

        // Multiple tools available, but only one needs to be equipped or be in oPCs inventory
        if(iTools > 1 && iEquip <= 1)
        {
            AdvDebug(oPC, "Multiple Tools: "+inStr(iTools)+", Equip: "+inStr(iEquip));

            int iCount;
            for(iCount=1; iCount <= iTools; iCount++)
            {
                sTool = SplitStringValue(sToolString, iCount, ";");
                oTool = DCS_GetValidTool(oPC, sTool);

                AdvDebug(oPC, "Tool: "+inStr(iCount)+", sTool: "+sTool+", oTool: "+GetName(oTool));

                if(GetIsObjectValid(GetItemPossessedBy(oPC, sTool)) && (!iEquip || (iEquip && GetIsObjectValid(oTool))))
                return TRUE;
            }
        }
        // Multiple Tools available and both of them need to be equipped
        else if(iTools > 1 && iEquip == 2)
        {
            AdvDebug(oPC, "Multiple Tools: "+inStr(iTools)+", Equip: "+inStr(iEquip));

            int iCount, iToolsEquipped;
            for(iCount=1; iCount <= 2; iCount++)
            {
                AdvDebug(oPC, "Tool: "+inStr(iCount)+", sTool: "+SplitStringValue(sToolString, iCount, ";")+", oTool: "+GetName(DCS_GetValidTool(oPC, SplitStringValue(sToolString, iCount, ";"))));

                if(GetIsObjectValid(DCS_GetValidTool(oPC, SplitStringValue(sToolString, iCount, ";"))))
                iToolsEquipped++;
            }

            if(iToolsEquipped == iTools)
            return TRUE;

        }
    }
    // Just a single tool available
    else
    {
        AdvDebug(oPC, "Single Tool: "+inStr(iTools)+", Equip: "+inStr(iEquip)+", Valid Tool: "+GetName(DCS_GetValidTool(oPC, sToolString))+", Possessed: "+GetName(GetItemPossessedBy(oPC, sToolString)));
        return GetIsObjectValid(GetItemPossessedBy(oPC, sToolString)) && (!iEquip || (iEquip && GetIsObjectValid(DCS_GetValidTool(oPC, sToolString))));
    }

    return FALSE;
}

/******************************************************************************/

void DoSpawnAnimation(object oSpawn=OBJECT_SELF)
{
    int    iVisual   = GetInternSwitch(DCS_SPAWNER_VISUAL_EFFECT);
    string sName     = GetName(oSpawn);
    string sTempName = ReplaceTextPhrase(GetInternString(DCS_SPAWNER_NO_USES_NAME), "<name>", GetInternString(DCS_SPAWNER_ORIGINAL_NAME), FALSE);

    if(sTempName != "")
    {
        SetName(oSpawn, sTempName);
        DelayCommand(DCS_SPAWNER_ANIMATION_TIME, SetName(oSpawn, sName));
    }

    if(iVisual)
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(iVisual), oSpawn);
    AssignCommand(oSpawn, PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));

    DelayCommand(DCS_SPAWNER_ANIMATION_TIME, AssignCommand(oSpawn, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE)));
}

/******************************************************************************/

// *  Searches for the spawn base in oArea
object DCS_GetAreaSpawnBase(object oArea);
object DCS_GetAreaSpawnBase(object oArea)
{
    object oBase = GetLocalObject(oArea, DCS_SPAWNER_SPAWN_BASE);

    if(!GetIsObjectValid(oBase))
    {
        oBase = GetFirstObjectInArea(oArea);

        if(GetTag(oBase) != DCS_SPAWNER_SPAWN_BASE)
        oBase = GetNearestObjectByTag(DCS_SPAWNER_SPAWN_BASE, oBase);

        SetLocalObject(oArea, DCS_SPAWNER_SPAWN_BASE, oBase);
    }

    return oBase;
}

/******************************************************************************/

void DCS_SetFishingPoint(object oSpawn)
{
    object oCheck = CreateObject(OBJECT_TYPE_CREATURE, "dcs_fishpointer", GetLocation(oSpawn));
    SetCommandable(FALSE, oCheck);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectEthereal(), oCheck);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneImmobilize(), oCheck);

    DelayCommand(0.5, SetLocalLocation(oSpawn, DCS_SPAWNER_FISH_SWARM_POINT, GetLocation(oCheck)));
    DelayCommand(0.5, DestroyObject(oCheck));
}

/******************************************************************************/

void DCS_SetSpawnData(object oSpawn, object oSource)
{
    SetLocalObject(oSource, DCS_SPAWNER_TARGET, oSpawn);
    SetLocalObject(oSpawn,  DCS_SPAWNER_TARGET, oSource);
    SetLocalString(oSpawn,  DCS_SPAWNER_ORIGINAL_NAME, GetName(oSpawn));
    SetLocalFloat (oSpawn,  DCS_SPAWNER_USES_RESET, DCS_SQLGetDatabaseSettingFloat(DCS_COL_SETTING_SPAWNER_RESDUR));//GetLocalString(oSource, DCS_SPAWNER_USES_RESET) != "" ? stFloat(GetLocalString(oSource, DCS_SPAWNER_USES_RESET)) : DCS_SPAWNER_DURATION_RESET);
    SetLocalFloat (oSpawn,  DCS_SPAWNER_USES_TICK,  DCS_SQLGetDatabaseSettingFloat(DCS_COL_SETTING_SPAWNER_TICKDUR));//GetLocalString(oSource, DCS_SPAWNER_USES_TICK)  != "" ? stFloat(GetLocalString(oSource, DCS_SPAWNER_USES_TICK))  : DCS_SPAWNER_DURATION_TICK);
    SetLocalInt   (oSpawn,  DCS_SPAWNER_USES,       DCS_GetAmount(GetLocalString(oSource, DCS_SPAWNER_USES) != "" ? GetLocalString(oSource, DCS_SPAWNER_USES) : DCS_SPAWNER_USES_AMOUNT));

    string sOriginal = GetLocalString(oSpawn, DCS_SPAWNER_ORIGINAL_NAME);
    string sGreat    = GetLocalString(oSpawn, DCS_SPAWNER_GREAT_NAME);
    string sSmall    = GetLocalString(oSpawn, DCS_SPAWNER_SMALL_NAME);
    int    iUses     = GetLocalInt(oSpawn, DCS_SPAWNER_USES);

    if(sGreat != "" && iUses >= DCS_GetMaxValue(DCS_SPAWNER_USES_AMOUNT)-1)
        SetName(oSpawn, sGreat+" "+sOriginal);
    else if(sSmall != "" && iUses <= DCS_GetMinValue(DCS_SPAWNER_USES_AMOUNT)+1)
        SetName(oSpawn, sSmall+" "+sOriginal);

    if(DCS_GetIsFishingSwarm(oSpawn))
    DCS_SetFishingPoint(oSpawn);

    AssignCommand(oSpawn, PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
}

/******************************************************************************/

// *  Activates a single source spawn (waypoint) in its area
void DCS_ActivateSpawn(object oSource, location lSpawn);//object oSpawnArea=OBJECT_INVALID, vector vSpawnPos=(0.0,0.0,0.0), float fSpawnFacing=0.0f);
void DCS_ActivateSpawn(object oSource, location lSpawn)//object oSpawnArea=OBJECT_INVALID, vector vSpawnPos=(0.0,0.0,0.0), float fSpawnFacing=0.0f)
{
    if(d100() > GetLocalInt(oSource, DCS_SPAWNER_SPAWNCHANCE))
    return;

    AdvDebug(OBJECT_SELF, "Activating Spawn. Location lSpawn invalid: "+IntToString(lSpawn == DCS_LOCATION_INVALID));

    if(lSpawn == DCS_LOCATION_INVALID)
    lSpawn = Location(GetArea(oSource), GetPosition(oSource), GetSpawnFacing(oSource));

    int iSpawns = GetLocalInt(oSource, DCS_SPAWNER_RESREF_COUNT);
    int iRandom = d100();
    int iCount, iChance, iOffset;
    string sResRef;
    object oSpawn;

    for(iCount=1; iCount <= iSpawns; iCount++)
    {
        sResRef = GetLocalString(oSource, DCS_SPAWNER_RESREF + inStr(iCount));
        iChance = GetLocalInt   (oSource, DCS_SPAWNER_RESREF_CHANCE + inStr(iCount)) + iOffset;

        if(iRandom > iOffset && iRandom <= iChance)
        break;

        iOffset += iChance;
    }

    oSpawn = CreateObject(OBJECT_TYPE_PLACEABLE, sResRef, lSpawn);
    DCS_SetSpawnData(oSpawn, oSource);
}

/******************************************************************************/

// *  Activate all resource spawns in oArea
// *  NOTE: There NEEDS to be a spawn base in this area or the activation will be canceled
void DCS_ActivateAreaSpawns(object oArea);
void DCS_ActivateAreaSpawns(object oArea)
{
    object oBase   = DCS_GetAreaSpawnBase(oArea);
    object oSource = GetNearestObjectByTag(DCS_SPAWNER_SPAWN_SOURCE, oBase);
    float  fDelay  = 0.25;
    int    iCount  = 1;
    int    iActive;

    if(!GetIsObjectValid(oBase))return;

    while(GetIsObjectValid(oSource))
    {
        if(iCount > DCS_SPAWNER_MAXIMUM_MINERALS_IN_AREA && DCS_SPAWNER_MAXIMUM_MINERALS_IN_AREA >= 0)
        break;

        if(!GetSpawnActivated(oSource))
        {
            SetSpawnActivated(TRUE, oSource);
            DelayCommand(fDelay * iActive, DCS_ActivateSpawn(oSource, DCS_LOCATION_INVALID));
            iActive++;
        }

        iCount++;
        oSource = GetNearestObjectByTag(DCS_SPAWNER_SPAWN_SOURCE, oBase, iCount);
    }
}

/******************************************************************************/

// * Make oPC try to attempt a resource sample on oSelf
void DCS_AttemptResourceSample(object oPC, float fPrepare=DCS_SPAWNER_PREPARE_TIME, object oSelf=OBJECT_SELF);
void DCS_AttemptResourceSample(object oPC, float fPrepare=DCS_SPAWNER_PREPARE_TIME, object oSelf=OBJECT_SELF)
{
    if(!GetIsPC(oPC) && !GetIsDM(oPC) && !GetIsDMPossessed(oPC))return;

    if(!SQLGetDatabaseConnection())
    {
        DCS_Display(oPC, ColorText(DCS_TEXT_NO_DATABASE_CONNECTION, nwcRed), TRUE);
        return;
    }

    if(PrepareAccount(oPC, fPrepare))
    {
        string sAccount   = GetAccountData(oPC);
        int    iSpawnUsed = GetAccountSwitch(DCS_ACCOUNT_SPAWN_USED, sAccount);
        int    iUses      = GetInternSwitch (DCS_SPAWNER_USES);
        int    iEquip     = GetInternSwitch (DCS_SPAWNER_TOOL_MUSTEQUIP);
        string sTool      = GetInternString (DCS_SPAWNER_TOOL_EQUIP);
        //object oTool      = DCS_GetValidTool(oPC, sTool);

        AdvDebug(oPC, "Uses: "+inStr(iUses)+", iSpawnused: "+inStr(iSpawnUsed));

        // Possessing Tool(s) / Tool(s) is/are equipped
        if(DCS_GetToolEquipped(oPC, sTool, iEquip))//sTool == "" || (GetIsObjectValid(GetItemPossessedBy(oPC, sTool)) && (!iEquip || (iEquip && GetIsObjectValid(oTool)))))
        {
            // No uses left
            if(iSpawnUsed >= iUses)
            {
                AdvDebug(oPC, "Uses: "+inStr(iUses)+", iSpawnused: "+inStr(iSpawnUsed));
                DCS_Display(oPC, ReplaceTextPhrase(GetInternString(DCS_SPAWNER_NO_USES_TEXT), "<timestamp>", DCS_GetTimeLeft(oPC), FALSE), TRUE);
                return;
            }

            // Account is locked?
            if(!GetAccountLocked(oPC))
            {
                int    iDC       = GetInternSwitch(DCS_SPAWNER_DC);
                string sAttempt  = ReplaceTextPhrase(GetInternString(DCS_SPAWNER_RESOURCE_ATTEMPT), "<self>", GetName(oSelf), FALSE);
                string sAbility1 = GetInternString(DCS_SPAWNER_ABILITY_01);
                string sAbility2 = GetInternString(DCS_SPAWNER_ABILITY_02);
                int    iAbility1 = DCS_GetScore(oPC, sAbility1, 2.5);
                int    iAbility2 = DCS_GetScore(oPC, sAbility2, 2.5);
                int    iAbility  = iAbility1 + iAbility2;
                int    iDice     = d20();
                int    iResult   = iAbility + iDice;
                int    iResultType;
                float  fChance;

                if(iAbility >= iDC)
                    fChance = 95.0;
                else
                    fChance = 100.0 - abs(iAbility - iDC) * 5.0;
                iResultType = DCS_GetResultType(iDice, fChance);

                DCS_Display(oPC, ColorText(ColorText(GetName(oPC), nwcCyan)+" "+sAttempt+": *"+DCS_GetResultTypeString(iResultType)+"* ("+DCS_GetAbilityResult(sAbility1, iAbility1)+" + "+DCS_GetAbilityResult(sAbility2, iAbility2)+" + "+inStr(iDice)+" = "+inStr(iResult)+" ggn. SG "+inStr(iDC)+")", nwcLightBlue));

                if(iResultType >= DCS_RESULT_SUCCESS)
                {
                    string sMessage, sSpecMsg;
                    string sResRef     = GetInternString(DCS_SPAWNER_ITEM_RESREF);
                    string sSpecResRef = GetInternString(DCS_SPAWNER_SPECIAL_RESREF);
                    string sAmount     = GetInternString(DCS_SPAWNER_ITEM_AMOUNT);
                    int    iAmount     = DCS_GetAmount(sAmount != "" ? sAmount : DCS_SPAWNER_RESOURCE_AMOUNT) + (iResultType == DCS_RESULT_AMAZING_SUCCESS);
                    object oResource   = DCS_CreateItemOnObject(sResRef, oPC, iAmount);
                    float  fDuration;

                    // Special item
                    if(sSpecResRef != "" && (iResultType == DCS_RESULT_AMAZING_SUCCESS || d100() <= GetInternSwitch(DCS_SPAWNER_SPECIAL_CHANCE)))
                    {
                        int iSpecAmount = DCS_GetAmount(GetInternString(DCS_SPAWNER_SPECIAL_AMOUNT));

                        oResource = DCS_CreateItemOnObject(sSpecResRef, oPC, iSpecAmount);
                        sSpecMsg  = " und "+inStr(iSpecAmount)+"x "+DCS_GetResourceName(sSpecResRef);
                    }

                    sMessage = "Ihr habt "+inStr(iAmount)+"x "+DCS_GetResourceName(sResRef)+sSpecMsg+" erhalten!";
                    sMessage = iResultType == DCS_RESULT_AMAZING_SUCCESS ? DCS_TEXT_RESULT_AMAZING_SUCCESS+" - " + sMessage : sMessage;

                    DCS_Display(oPC, "* "+sMessage+" *", TRUE);
                    iSpawnUsed++;

                    if(iSpawnUsed >= iUses)
                    {
                        fDuration = GetInternFloat(DCS_SPAWNER_USES_RESET);
                        SetAccountSwitch(0, DCS_ACCOUNT_SPAWN_USED, sAccount);
                        SetAccountLocked(fDuration > 0.0 ? fDuration : DCS_SQLGetDatabaseSettingFloat(DCS_COL_SETTING_SPAWNER_RESDUR), oPC);
                        DoSpawnAnimation();
                    }
                    else
                    {
                        fDuration = GetInternFloat(DCS_SPAWNER_USES_TICK);
                        SetAccountSwitch(iSpawnUsed, DCS_ACCOUNT_SPAWN_USED, sAccount);

                        if(iSpawnUsed % DCS_SPAWNER_TICK_COUNT == 0)
                        SetAccountLocked(fDuration > 0.0 ? fDuration : DCS_SQLGetDatabaseSettingFloat(DCS_COL_SETTING_SPAWNER_TICKDUR), oPC);
                    }
                }
                else if(iResultType == DCS_RESULT_ABSOLUTE_FAILURE && iEquip)
                {
                    int    iDestroy = d6();
                    string sDestroy = iDestroy > 1 ? "* "+DCS_TEXT_RESULT_SUCCESS+" - Werkzeug wurde nicht zerstört *" : "* "+DCS_TEXT_RESULT_FAILURE+" - Werkzeug wurde zerstört *";

                    DCS_Display(oPC, ColorText(ColorText(GetName(oPC), nwcCyan)+" versucht einen Wurf gegen Werkzeugzerstörung: "+sDestroy+" ("+inStr(iDestroy)+" ggn. SG 6)", nwcLightBlue));

                    if(iDestroy == 1)
                    {
                        DCS_Display(oPC, "* "+DCS_TEXT_RESULT_ABSOLUTE_FAILURE+" - Euer Werkzeug wurde zerstört! *", TRUE);
                        DCS_DestroyTools(oPC, sTool, iEquip);
                        AssignCommand(oPC, ClearAllActions(TRUE));
                    }
                }
            }
            else
            {
                DCS_Display(oPC, ReplaceTextPhrase(GetInternString(DCS_SPAWNER_NO_USES_TEXT), "<timestamp>", DCS_GetTimeLeft(oPC), FALSE), TRUE);
            }
        }
        else
        {
            string sEquipText = GetInternString(DCS_SPAWNER_TOOL_EQUIPTEXT);

            if(sEquipText != "")
                DCS_Display(oPC, sEquipText, TRUE);
            else
            {
                sEquipText = iEquip == 1 ? "ausrüsten" : "besitzen";
                DCS_Display(oPC, "* Ihr müsst ein bestimmtes Werkzeug "+sEquipText+", um hier arbeiten zu können! *", TRUE);
            }
        }
    }
}

/******************************************************************************/

void DCS_OnSpawn(object oNPC=OBJECT_SELF)
{
    string sResRef, sAmount;
    int    iChance, iSpawns, iCount;
    for(iCount=1; iCount > 0; iCount++)
    {
        sResRef = GetLocalString(oNPC, DCS_NPC_ITEM_RESREF+inStr(iCount));
        sAmount = GetLocalString(oNPC, DCS_NPC_ITEM_AMOUNT+inStr(iCount));
        iChance = GetLocalInt   (oNPC, DCS_NPC_ITEM_CHANCE+inStr(iCount));

        if(sResRef == "")
        break;

        if(d100() <= iChance)
        DCS_CreateItemOnObject(sResRef, oNPC, DCS_GetAmount(sAmount != "" ? sAmount : "1"));
    }
}

/******************************************************************************/

void DCS_StartFishing(object oPC, object oSwarm)
{
    SetLocalInt(oSwarm, DCS_SPAWNER_PC_IS_FISHING+GetName(oPC), TRUE);
    AssignCommand(oPC, SetFacingPoint(GetPosition(oSwarm)));
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_FISHING, 1.0, 480.0));
}

//void main(){}
