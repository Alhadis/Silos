//::///////////////////////////////////////////////
//:: Craft Functions
//:: pt_xcr_inc_funcs.nss
//:: Copyright (c) 2018 PaiNt.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: PaiNt
//:: Created On: 2018
//:://////////////////////////////////////////////

#include "aps_include"
#include "aps_include_co"
#include "x3_inc_string"
#include "pt_xcr_inc_const"
#include "pt_xcr_inc_bfunc"

//---START REFRESH ITEM SETTINGS

// SQL base if used - can keep override settings of craft-items
// this function refresh values from base to craft-item in module
void ptSQLRefreshCraftVars(object oItem);

void ptSQLRefreshCraftVars(object oItem) {
    if (GetObjectType(oItem) != OBJECT_TYPE_ITEM) return;

    struct stItemSettings stSettings = ptItemSettings(oItem);

    SQLExecDirect("SELECT * FROM `" + PT_XCR_SQL_TABLES_VARIMPORT + "` WHERE ID = '" + SQLEncodeSpecialChars(GetTag(oItem)) + "' ; ");
    if (SQLFetch() == SQL_SUCCESS) {
        stSettings.sTools = SQLGetData(2);

        stSettings.sSkills = SQLGetData(3);
        stSettings.sSkillsVal = SQLGetData(4);
        stSettings.sRaws = SQLGetData(5);
        stSettings.sRawsCost = SQLGetData(6);

        stSettings.fWeary = StringToFloat(SQLGetData(7));
        stSettings.fTime = StringToFloat(SQLGetData(8));

        stSettings.iChanceToCreate = StringToInt(SQLGetData(9));
        stSettings.iMinQuant = StringToInt(SQLGetData(10));
        stSettings.iMaxQuant = StringToInt(SQLGetData(11));

        stSettings.sScript = SQLGetData(12);

        ptItemSettings_set(oItem, stSettings);
    };
}

//---END REFRESH ITEM SETTINGS

//---START PROGRESSBAR

// Init progress-bar widget oPlaceable - can be Item
void ptInitProgressBar(object oPlaceable, int iMax = 100);

void ptInitProgressBar(object oPlaceable, int iMax = 100) {
    int iOType = GetObjectType(oPlaceable);
    if (iOType != OBJECT_TYPE_PLACEABLE && iOType != OBJECT_TYPE_ITEM) return;

    string sCraftMess = "\n" + PT_XCR_LANGWORD_DESCRIPTION_1 + "\n" + StringToRGBString("[==========]", "000");

    if (iOType == OBJECT_TYPE_PLACEABLE) {
        AssignCommand(oPlaceable, SpeakString(sCraftMess, TALKVOLUME_TALK));
    } else {
        FloatingTextStringOnCreature(sCraftMess, GetItemPossessor(oPlaceable));
    };

    SetLocalInt(oPlaceable, PT_XCR_PROGRESSBAR_SETTINGS_MAX, iMax);
    SetLocalInt(oPlaceable, PT_XCR_PROGRESSBAR_SETTINGS_CUR, 0);
}

// Set state of progress-bar
void ptSetProgressBar(object oPlaceable, int iCur = 0);

void ptSetProgressBar(object oPlaceable, int iCur = 0) {
    int iOType = GetObjectType(oPlaceable);
    if (iOType != OBJECT_TYPE_PLACEABLE && iOType != OBJECT_TYPE_ITEM) return;

    int iMax = GetLocalInt(oPlaceable, PT_XCR_PROGRESSBAR_SETTINGS_MAX);
    int iDiffPoints = iMax / 10;

    int iPoints = (iDiffPoints == 0) ? 10 : (iCur / iDiffPoints);
    int iBlankPoints = 10 - iPoints;
    string sPoints = "", sBlankPoints = "";

    int i;
    if (iPoints > 0) {
        for (i = 1; i <= iPoints; i++) {
            sPoints += "=";
        };
    };
    if (iBlankPoints > 0) {
        for (i = 1; i <= iBlankPoints; i++) {
            sBlankPoints += "=";
        };
    };

    sPoints = StringToRGBString(sPoints, "070");
    sBlankPoints = StringToRGBString(sBlankPoints, "000");

    string sCraftMess = "\n" + PT_XCR_LANGWORD_DESCRIPTION_1 + "\n" + StringToRGBString("[", "070") + sPoints + sBlankPoints + StringToRGBString("]", "070");

    if (iOType == OBJECT_TYPE_PLACEABLE) {
        AssignCommand(oPlaceable, SpeakString(sCraftMess, TALKVOLUME_TALK));
    } else {
        FloatingTextStringOnCreature(sCraftMess, GetItemPossessor(oPlaceable));
    };

    SetLocalInt(oPlaceable, PT_XCR_PROGRESSBAR_SETTINGS_CUR, iCur);
}

// Clear vars of progress-bar
void ptClearProgressBar(object oPlaceable);

void ptClearProgressBar(object oPlaceable) {
    int iOType = GetObjectType(oPlaceable);
    if (iOType != OBJECT_TYPE_PLACEABLE && iOType != OBJECT_TYPE_ITEM) return;

    string sName = GetName(oPlaceable);
    string sOrigName = GetName(oPlaceable, TRUE);

    DeleteLocalInt(oPlaceable, PT_XCR_PROGRESSBAR_SETTINGS_MAX);
    DeleteLocalInt(oPlaceable, PT_XCR_PROGRESSBAR_SETTINGS_CUR);
}

//---END PROGRESSBAR

//---START ACTIVATION

void ptClearDialogTokensVars(object oActivator) {
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + "Length", 0);
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + IntToString(pt_CUSTTOK_NODE_ONE) + ".Index", -1);
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + IntToString(pt_CUSTTOK_NODE_TWO) + ".Index", -1);
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + IntToString(pt_CUSTTOK_NODE_THREE) + ".Index", -1);
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + IntToString(pt_CUSTTOK_NODE_FOUR) + ".Index", -1);
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + IntToString(pt_CUSTTOK_NODE_FIVE) + ".Index", -1);
    SetCustomToken(pt_CUSTTOK_NODE_ONE, "");
    SetCustomToken(pt_CUSTTOK_NODE_TWO, "");
    SetCustomToken(pt_CUSTTOK_NODE_THREE, "");
    SetCustomToken(pt_CUSTTOK_NODE_FOUR, "");
    SetCustomToken(pt_CUSTTOK_NODE_FIVE, "");
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + "MinI", 0);
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + "MaxI", 0);
}

void ptClearServiceVars(object oActivator) {
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + "ToolIsBook", FALSE);
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + "ToolIsSkillStick", FALSE);
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + "ToolIsToolTool", FALSE);
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + "ToolIsRawCreateSp", FALSE);
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + "ToolIsRawSeeRawSp", FALSE);
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + "ToolIsRawSeeToolSp", FALSE);
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + "ToolIsRawSeeSkillSp", FALSE);
    SetLocalInt(oActivator, PT_XCR_NAMESPACE_DIALOGUE + "ToolIsRawCreateSkillSt", FALSE);
}

//---END ACTIVATION

//---START DICT FUNCS

// Module dict - add word
void ptTagDictAddWord(string sTagKey, string sWord);

void ptTagDictAddWord(string sTagKey, string sWord) {
    object oModule = GetModule();

    SetLocalString(oModule, PT_XCR_NAMESPACE_DICT + sTagKey, sWord);
}

// Module dict - get word
string ptTagDictGetWord(string sTagKey);

string ptTagDictGetWord(string sTagKey) {
    object oModule = GetModule();

    string sWord = GetLocalString(oModule, PT_XCR_NAMESPACE_DICT + sTagKey);

    if (sWord == "") return sTagKey;

    return sWord;
}

//---END DICT FUNCS

//---START DUMP FUNCS

void ptCreateModuleVarNameDump(int iBeginItem = 0) {
    object oModule = GetModule();

    //Weary value always dumped
    if (ptObjArrayString(pt_DBDUMP_MOD_ARRAY_NAME, oModule, "user_vars", 0) != PT_XCR_PCWEARY) {
        ptObjArrayString_set(pt_DBDUMP_MOD_ARRAY_NAME, oModule, "user_vars", PT_XCR_PCWEARY, 0);
        ptObjArrayInt_set(pt_DBDUMP_MOD_ARRAY_NAME, oModule, "user_vars", PT_XCR_DBDUMP_TYPE_FLOAT, 0, "type");
    };

    int i;
    int iMaxItem = ptObjArrayLen(PT_XCR_NAMESPACE_ITEMS, oModule, "CraftItemBoxArray");
    for (i = iBeginItem; i < iMaxItem; i++) {
        string sI = IntToString(i);
        object oCrftItem = ptObjArrayObject(PT_XCR_NAMESPACE_ITEMS, oModule, "CraftItemBoxArray", i);
        if (!GetIsObjectValid(oCrftItem)) continue;

        struct stItemSettings stItem = ptItemSettings(oCrftItem);

        int k;
        for (k = 0; k < stItem._iSkillsLen; k++) {
            string sSkillID = ptArray(stItem.sSkills, k);

            int iArrayLen = ptObjArrayLen(pt_DBDUMP_MOD_ARRAY_NAME, oModule, "user_vars");
            int z, bHasThatSkill;
            bHasThatSkill = FALSE;
            for (z = 0; z <= iArrayLen; z++) {
                if (ptObjArrayString(pt_DBDUMP_MOD_ARRAY_NAME, oModule, "user_vars", z) == PT_XCR_PCSKILL_BASE_PREFIX + sSkillID + PT_XCR_PCSKILL_SUFFIX_VALUE) {
                    bHasThatSkill = TRUE;
                    break;
                };
            };
            if (!bHasThatSkill) {
                sArrayLen = IntToString(iArrayLen);

                //Идентификатор навыка
                ptObjArrayString_set(pt_DBDUMP_MOD_ARRAY_NAME, oModule, "user_vars", PT_XCR_PCSKILL_BASE_PREFIX + sSkillID + PT_XCR_PCSKILL_SUFFIX_VALUE);
                ptObjArrayFloat_set(pt_DBDUMP_MOD_ARRAY_NAME, oModule, "user_vars", PT_XCR_DBDUMP_TYPE_FLOAT, "type");

                //Дм пенальти
                ptObjArrayString_set(pt_DBDUMP_MOD_ARRAY_NAME, oModule, "user_vars", PT_XCR_PCSKILL_BASE_PREFIX + sSkillID + PT_XCR_PCSKILL_SUFFIX_DMBONPEN);
                ptObjArrayFloat_set(pt_DBDUMP_MOD_ARRAY_NAME, oModule, "user_vars", PT_XCR_DBDUMP_TYPE_FLOAT, "type");

                //Дм запрет навыка
                ptObjArrayString_set(pt_DBDUMP_MOD_ARRAY_NAME, oModule, "user_vars", PT_XCR_PCSKILL_BASE_PREFIX + sSkillID + PT_XCR_PCSKILL_SUFFIX_DMBLOCK);
                ptObjArrayInt_set(pt_DBDUMP_MOD_ARRAY_NAME, oModule, "user_vars", PT_XCR_DBDUMP_TYPE_INT, "type");

            };
        };
    };
}

//---END DUMP FUNCS

//---START DEFAULT PROCESS FUNCS

void ptClearVarsWithNumuses(object oActivator) {

    DeleteLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_Mode");
    DeleteLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_ScriptMode");
    DeleteLocalLocation(oActivator, PT_XCR_NAMESPACE_PROC + "PClocation");
    DeleteLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "scanRawInTool");
    DeleteLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "PCInventory_Length");
    DeleteLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "ToolInventory_Length");

    object oCurTool = GetLocalObject(oActivator, PT_XCR_NAMESPACE_PROC + "ActTool");
    DeleteLocalObject(oActivator, PT_XCR_NAMESPACE_PROC + "ActTool");
    if (GetLocalInt(oCurTool, PT_XCR_TOOL_SETTINGS_NUMUSE) != 0 && GetLocalInt(oCurTool, PT_XCR_NAMESPACE_PROC + "curCraftProcess_uses") >= GetLocalInt(oCurTool, PT_XCR_TOOL_SETTINGS_NUMUSE)) {
        SetLocalObject(oActivator, PT_XCR_NAMESPACE_PROC + "ActTool", oCurTool);
        DelayCommand(0.3, ExecuteScript(PT_XCR_SCRIPT_EXECUTE_ACTIVATE, oActivator));
    };
}

int ptHasAllCraftConditions(object oActivator, object oItem) {
    if (!GetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_Mode")) return FALSE;

    struct stItemSettings stSettings = ptItemSettings(oItem);

    int k;

    //Tools checks
    if (sTools != "") {

        int bNotHasAllTool = FALSE;
        for (k = 0; k < stSettings._iToolsLen; k++) {
            int bHasTool = FALSE;

            string sToolTag = ptArray(stSettings.sTools, k);

            object oPlaTool = GetNearestObjectByTag(sToolTag, oActivator); //Nearest placeable tool

            if (GetIsObjectValid(oPlaTool) && GetObjectType(oPlaTool) != OBJECT_TYPE_ITEM && GetDistanceBetween(oPlaTool, oActivator) <= 10.0) {
                bHasTool = TRUE;
            };
            if (!bHasTool) {
                int iCurItemSlot = 0;
                object oActItem = GetItemInSlot(iCurItemSlot, oActivator);
                while (!bHasTool && iCurItemSlot <= 17) //Equipped tool
                {
                    if (GetTag(oActItem) == sToolTag) {
                        bHasTool = TRUE;
                        break;
                    };

                    iCurItemSlot++;
                    oActItem = GetItemInSlot(iCurItemSlot, oActivator);
                };
                if (!bHasTool) {
                    oActItem = GetFirstItemInInventory(oActivator);
                    while (!bHasTool && GetIsObjectValid(oActItem)) //Inventory tool
                    {
                        if (GetTag(oActItem) == sToolTag) {
                            bHasTool = TRUE;
                            break;
                        };

                        oActItem = GetNextItemInInventory(oActivator);
                    };
                };
            };

            if (!bHasTool) {
                bNotHasAllTool = TRUE;
                return FALSE;
            };
        };
    };

    //Distance check
    if (GetDistanceBetweenLocations(GetLocation(oActivator), GetLocalLocation(oActivator, PT_XCR_NAMESPACE_PROC + "PClocation")) <= 5.0) {
        return TRUE;
    };

    return FALSE;
}

int ptHasRaw(object oActivator, object oItem) {
    if (!GetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_Mode")) return FALSE;

    struct stItemSettings stSettings = ptItemSettings(oItem);

    int k;

    //Check raw names
    int bIsVendor = FALSE;
    object oTool = GetLocalObject(oActivator, PT_XCR_NAMESPACE_PROC + "ActTool");

    int bScanRawInToolInventory = GetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "scanRawInTool");

    if (stSettings.sRaws == "NW_IT_GOLD001") bIsVendor = TRUE;

    if (stSettings.sRaws != "") //If raws in craft-item is empty - all raw checks is success
    {
        string sProcActivatorRawValue = "0";

        int bNotHasAllRaw = FALSE;
        for (k = 0; k < stSettings._iRawsLen; k++) {
            string sRawTag = ptArray(stSettings.sRaws, k);

            int bHasRaw = FALSE;
            if (bScanRawInToolInventory) //Scan raw-resources in tool inventory
            {
                int iToolItemArrayNum;
                string sToolItemArrayNum;
                int iToolItemArrayLenn = GetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "ToolInventory_Length");
                for (iToolItemArrayNum = 0; iToolItemArrayNum < iToolItemArrayLenn; iToolItemArrayNum++) {
                    sToolItemArrayNum = IntToString(iToolItemArrayNum);

                    object oToolItem = GetLocalObject(oActivator, PT_XCR_NAMESPACE_PROC + "ToolInventory_" + sToolItemArrayNum + "_Object");
                    if (GetIsObjectValid(oToolItem)) {
                        if (GetTag(oToolItem) == sRawTag && GetItemPossessor(oToolItem) == oTool) {
                            int iToolItemRawVal = StringToInt(ptArray(sProcActivatorRawValue, k));
                            iToolItemRawVal += GetItemStackSize(oToolItem);
                            sProcActivatorRawValue = ptArray(sProcActivatorRawValue, k, IntToString(iToolItemRawVal));
                            bHasRaw = TRUE;
                        };
                    };
                };
            } else //Scan raw-resources in PC inventory
            {
                int iArrayNum;
                string sArrayNum;
                int iArrayLenn = GetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "PCInventory_Length");
                for (iArrayNum = 0; iArrayNum < iArrayLenn; iArrayNum++) {
                    sArrayNum = IntToString(iArrayNum);

                    object oActItem = GetLocalObject(oActivator, PT_XCR_NAMESPACE_PROC + "PCInventory_" + sArrayNum + "_Object");
                    if (GetIsObjectValid(oActItem)) {
                        if (GetTag(oActItem) == sRawTag && GetItemPossessor(oActItem) == oActivator) {
                            int iActRawVal = StringToInt(ptArray(sProcActivatorRawValue, k));
                            iActRawVal += GetItemStackSize(oActItem);
                            sProcActivatorRawValue = ptArray(sProcActivatorRawValue, k, IntToString(iActRawVal));
                            bHasRaw = TRUE;
                        };
                    };
                };
            };
            if (!bHasRaw) {
                bNotHasAllRaw = TRUE;
                break;
            };
        };
        if (bNotHasAllRaw) return FALSE;

        //Scan raw-resources quantities in PC inventory
        int bNotHasAllRawQuant = FALSE;
        for (k = 0; k < stSettings._iRawsLen; k++) {
            int iCostK = (k <= (stSettings._iRawCostLen - 1) ? k : stSettings._iRawCostLen - 1);

            int iCurRawCost = StringToInt(ptArray(stSettings.sRawsCost, iCostK));
            int iCurRawHave = StringToInt(ptArray(sProcActivatorRawValue, iCostK));

            if (iCurRawCost < 0) iCurRawCost = 1;

            if (iCurRawHave < iCurRawCost) {
                bNotHasAllRawQuant = TRUE;
                break;
            };
        };
        if (bNotHasAllRawQuant) return FALSE;
    };

    return TRUE;
}

void ptTakeRawFromPC(object oActivator, object oItem, float fK = 1.0) {
    if (!GetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_Mode")) return;

    struct stItemSettings stSettings = ptItemSettings(oItem);

    object oTool = GetLocalObject(oActivator, PT_XCR_NAMESPACE_PROC + "ActTool");
    int bScanRawInToolInventory = GetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "scanRawInTool");

    if (stSettings.sRaws == "") //for ores, plants, trees etc.
    {
        //clear
        DelayCommand(1.0, ptClearVarsWithNumuses(oActivator));
        return;
    };

    int i;

    //take raw from crafter/tool inventory
    for (i = 0; i < stSettings._iRawsLen; i++) {
        int iCostI = (i <= (stSettings._iRawCostLen - 1) ? i : stSettings._iRawCostLen - 1);
        int iCurQuant = StringToInt(ptArray(stSettings.sRawsCost, iCostI));
        iCurQuant = FloatToInt(IntToFloat(iCurQuant) * fK);

        string sCurRawTag = ptArray(stSettings.sRaws, i);

        object iBox = oActivator;

        //if tool has inventory
        if (bScanRawInToolInventory) iBox = oTool;

        object oActItem = GetFirstItemInInventory(iBox);
        while (GetIsObjectValid(oActItem)) {
            if (GetTag(oActItem) == sCurRawTag) {
                if (iCurQuant > 0) {
                    int iItemStack = GetItemStackSize(oActItem);

                    if (iItemStack > iCurQuant) {
                        SetItemStackSize(oActItem, iItemStack - iCurQuant);
                    } else {
                        DestroyObject(oActItem);
                    };

                    int iDecr = (iItemStack > iCurQuant ? iCurQuant : iItemStack);
                    iCurQuant -= iDecr;
                };
            };
            oActItem = GetNextItemInInventory(iBox);
        };
    };

    //clear
    DelayCommand(1.0, ptClearVarsWithNumuses(oActivator));
}

void ptCreateItem(object oActivator, object oItem) {

    if (!GetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_Mode")) return;
    if (!ptHasAllCraftConditions(oActivator, oItem)) return;
    if (!ptHasRaw(oActivator, oItem)) return;

    struct stItemSettings stSettings = ptItemSettings(oItem);

    float fK = 1.0;

    //Counting increase skills and their increase
    int i;
    int iMaxItem = ptObjArrayLen(PT_XCR_NAMESPACE_ITEMS, oModule, "CraftItemBoxArray");

    object oSkin = SKIN_SupportGetSkin(oActivator);

    float fActivatorWeary = GetLocalFloat(oSkin, PT_XCR_PCWEARY);

    for (i = 0; i < stSettings._iSkillsLen; i++) {
        int iValI = (i <= (stSettings._iSkillsValLen - 1) ? i : stSettings._iSkillsValLen - 1);

        string sSkillID = ptArray(stSettings.sSkills, i);

        sSkillID = GetStringLeft(sSkillID, 35);
        if (sSkillID == "") continue;

        int iActivatorLevel = GetLevelByPosition(1, oActivator) + GetLevelByPosition(2, oActivator) + GetLevelByPosition(3, oActivator);
        float fActivatorLevel = IntToFloat(iActivatorLevel);
        int iCraftItemCost = GetGoldPieceValue(oItem);
        float fCraftItemCost = IntToFloat(iCraftItemCost);

        ///////////////////////////XP
        float fXPforCraft = (((1000.0 * (fActivatorLevel + 0.5) - 500.0) * 0.05) / (pow(fActivatorLevel, 1.5)) + 1.0) * ((fCraftItemCost / 10000.0 < 1.0 ? 1.0 : fCraftItemCost / 10000) - (fCraftItemCost / 10000.0 > 10.0 ? fCraftItemCost / 10000.0 - 10.0 : 1.0) + 1.0) / 2.0;
        /////////////////////////////

        string sItSkillVal = ptArray(stSettings.sSkillsVal, iValI);
        float fItSkillVal = StringToFloat(sItSkillVal);

        float fBonPen = GetLocalFloat(oSkin, PT_XCR_PCSKILL_BASE_PREFIX + sSkillID + PT_XCR_PCSKILL_SUFFIX_DMBONPEN);
        float fActivatorSkill = GetLocalFloat(oSkin, PT_XCR_PCSKILL_BASE_PREFIX + sSkillID + PT_XCR_PCSKILL_SUFFIX_VALUE) + fBonPen;

        fK *= (fActivatorSkill / (fItSkillVal + 0.01));

        /////////////////////////////Skill
        // Increase skill, the general idea is from one process (as applied to the maximum limit of 100.0)
        // which requires 15.0 skill values, you can develop the skill somewhere to ~ 19.0
        // The total complexity of the crafting system on the shard is also taken into account, but the value of the increase cannot be greater than 0.25
        float fSkillInc = fabs(100.0 - (fActivatorSkill - fBonPen)) / (IntToFloat(iMaxItem) + 0.01) + 0.01;
        fSkillInc = fSkillInc > 0.25 ? 0.25 : fSkillInc;
        float fBackupInc = fSkillInc;
        //////////////////////////////////

        // Skill cannot grow from one process forever
        if ((fActivatorSkill - fBonPen) + fSkillInc > ((fItSkillVal < 12.0) ? 12.0 : fItSkillVal) + ((fItSkillVal < 12.0) ? 12.0 : fItSkillVal) / 4.0) {
            fSkillInc = fSkillInc - (((fActivatorSkill - fBonPen) + fSkillInc) - (((fItSkillVal < 12.0) ? 12.0 : fItSkillVal) + ((fItSkillVal < 12.0) ? 12.0 : fItSkillVal) / 4.0));
            fSkillInc = fSkillInc < 0.005 ? 0.005 : fSkillInc; // minimum value - 5 thousandths
        };

        // Report it
        if (fSkillInc <= 0.0) {
            fSkillInc = 0.0;
            fXPforCraft = 0.0;
            FloatingTextStringOnCreature(PT_XCR_LANGWORD_DESCRIPTION_2, oActivator, FALSE);
        } else if (fSkillInc <= fBackupInc / 4.0) {
            FloatingTextStringOnCreature(StringToRGBString(PT_XCR_LANGWORD_DESCRIPTION_3, "700"), oActivator, FALSE);
            fXPforCraft *= 0.5;
        } else if (fSkillInc <= fBackupInc / 2.0) {
            FloatingTextStringOnCreature(StringToRGBString(PT_XCR_LANGWORD_DESCRIPTION_4, "700"), oActivator, FALSE);
            fXPforCraft *= 0.75;
        } else {
            FloatingTextStringOnCreature(StringToRGBString(PT_XCR_LANGWORD_DESCRIPTION_5 + " '" + sSkillID + "' " + PT_XCR_LANGWORD_DESCRIPTION_6 + " " + FloatToString((fActivatorSkill - fBonPen) + fSkillInc, 2, 2), "070"), oActivator, FALSE);
        };

        FloatingTextStringOnCreature(StringToRGBString(PT_XCR_LANGWORD_DESCRIPTION_7 + " " + FloatToString(fActivatorWeary, 2, 2), (fActivatorWeary <= 25.00 ? "700" : "070")), oActivator, FALSE);

        SetLocalFloat(oSkin, PT_XCR_PCSKILL_BASE_PREFIX + sSkillID + PT_XCR_PCSKILL_SUFFIX_VALUE, (fActivatorSkill - fBonPen) + fSkillInc);

        GiveXPToCreature(oActivator, FloatToInt(fXPforCraft));
    };

    // Process Outcomes
    if (ptResponse(FloatToInt(IntToFloat(iChanceToCreate) * fK))) {

        int iQuant = stSettings.iMinQuant + Random(1 + stSettings.iMaxQuant - stSettings.iMinQuant);
        iQuant = (iQuant < 1) ? 1 : iQuant;

        int iQ;
        for (iQ = 1; iQ <= iQuant; iQ++) {
            CopyItem(oItem, oActivator, TRUE);
        };
    } else {
        FloatingTextStringOnCreature(StringToRGBString(PT_XCR_LANGWORD_DESCRIPTION_8, "700"), oActivator, FALSE);
    };

    // pick up raw materials
    ptTakeRawFromPC(oActivator, oItem);
}

void ptMainDefaultPROC(int iIteraNum = 1) {
    object oModule = GetModule();
    object oActivator = OBJECT_SELF;
    object oSkin = SKIN_SupportGetSkin(oActivator);

    int iMode = GetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_Mode");
    object oItem = GetLocalObject(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_Object");

    struct stItemSettings stSettings = ptItemSettings(oItem);

    stSettings.fTime = (stSettings.fTime < 5.0 ? 5.0 : stSettings.fTime);

    // If iterations are more than acceptable possible
    if (iIteraNum > FloatToInt(fTime / PT_XCR_REFRATE) + 5) {
        ptClearVarsWithNumuses(oActivator);
        return;
    };

    if (iMode) // process mode
    {
        int iScriptMode = GetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_ScriptMode");

        ////////////////////
        if (!iScriptMode) // Start mode
        {
            DeleteLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_ScriptIsFake");

            SetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_ScriptMode", 1);

            SetLocalLocation(oActivator, PT_XCR_NAMESPACE_PROC + "PClocation", GetLocation(oActivator));

            DeleteLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_HalfTimeLeft");

            DelayCommand(fTime / 2, SetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_HalfTimeLeft", 1));
            DelayCommand(fTime + 0.05, ptClearVarsWithNumuses(oActivator));

            // The process based on individual characteristics can always be fake, regardless of skills
            if (ptResponse(iChance)) {
                DelayCommand(fTime, ptCreateItem(oActivator, oItem));
            } else {
                SetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_ScriptIsFake", 1);
                DelayCommand(fTime, SetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_ScriptIsFake", 2));
            };
            // Update function
            DelayCommand(PT_XCR_REFRATE, ptMainDefaultPROC(iIteraNum + 1));
            return;
        }
        ///////////////////////////
        else if (iScriptMode == 1) // Update Mode
        {
            // If the time of the fake process has passed, then we interrupt it and report a failure.
            if (GetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_ScriptIsFake") == 2) {
                FloatingTextStringOnCreature(StringToRGBString(PT_XCR_LANGWORD_DESCRIPTION_9, "700"), oActivator, FALSE);
                // Take the raw materials
                ptTakeRawFromPC(oActivator, oItem);
                //
                DeleteLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_ScriptIsFake");
                DeleteLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_HalfTimeLeft");
                //
                //Cleaning service variables and locations
                // in the selection of raw materials ptClearVarsWithNumuses(oActivator);
                return;
            };

            // Calculation of fatigue per unit update time
            float fWearyPerRef = fWeary / (fTime / PT_XCR_REFRATE);

            float fActivatorWeary = GetLocalFloat(oSkin, PT_XCR_PCWEARY);

            fActivatorWeary -= fWearyPerRef;
            SetLocalFloat(oSkin, PT_XCR_PCWEARY, fActivatorWeary);

            // Check fatigue and other conditions and interrupt or continue the process based on this
            if (!ptHasAllCraftConditions(oActivator, oItem) || fActivatorWeary < 0.0) {
                if (fActivatorWeary > 0.0) {
                    FloatingTextStringOnCreature(StringToRGBString(PT_XCR_LANGWORD_DESCRIPTION_10, "700"), oActivator, FALSE);
                } else {
                    FloatingTextStringOnCreature(StringToRGBString(PT_XCR_LANGWORD_DESCRIPTION_11, "700"), oActivator, FALSE);
                };

                if (GetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_HalfTimeLeft")) {
                    // If fake process - report
                    if (GetLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_ScriptIsFake")) {
                        FloatingTextStringOnCreature(StringToRGBString(PT_XCR_LANGWORD_DESCRIPTION_10, "700"), oActivator, FALSE);
                        DeleteLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_ScriptIsFake");
                    };
                    // Removal of raw materials
                    ptTakeRawFromPC(oActivator, oItem);
                    // variable half time
                    DeleteLocalInt(oActivator, PT_XCR_NAMESPACE_PROC + "curCraftProcess_HalfTimeLeft");
                };

                // Cleaning service variables and locations
                ptClearVarsWithNumuses(oActivator);
                return;
            } else {
                // Update
                DelayCommand(PT_XCR_REFRATE, ptMainDefaultPROC(iIteraNum + 1));
                return;
            };
        };
    };
}

//---END DEFAULT PROCESS FUNCS








//---START MODULE-EVENTS FUNCS


void ptSQLDestroyCreateBarrel(object oDestroy, string sResRef, int iStoreNum, int iStoreIBC, location lLoc, int iType)
{
    object oDuplBox;
    oDuplBox=SQLRCOExec("SELECT OBJ FROM `" + PT_XCR_SQL_TABLES_BARRELS + "` WHERE ResRef = '"+SQLEncodeSpecialChars( sResRef )+"' AND Number = "+(IntToString(iStoreNum))+"; ", lLoc, iType);
    DestroyObject(oDestroy);
}



void ptCraftEventsModuleLoad_main() {
    int i, k, m;
    object oModule = GetModule();

    //Флаг того что запущен первый раз при старте модуля
    int bIsModFirstRuned = !GetLocalInt(oModule, PT_XCR_NAMESPACE_OTHERS + "CraftBoxModFirstRuned");

    //////////////////////////////////////////////////////////////////////////////////////////
    //Кеш предметов из бочки в локальные переменные, а также установка бочек записанных в базе
    //Квантование скрипта
    i = GetLocalInt(oModule, PT_XCR_NAMESPACE_ITEMS + "CraftItemBoxArray_curi"); //На каком итеме закончился анализ при квантовании скрипта
    int iBeginItemForDump = i;
    i = (i == 0) ? -1 : i;
    int iBoxNum = GetLocalInt(oModule, PT_XCR_NAMESPACE_ITEMS + "CraftItemBoxArray_curiBoxNum"); //На каком номере закончился анализ контейнера при квантовании скрипта
    int iBoxFirstStart = GetLocalInt(oModule, PT_XCR_NAMESPACE_OTHERS + "CraftBoxModFirstBoxes"); //На каком номере закончились конетейнеры

    ///Отобразим состояние кеширования
    if (i == (-1) && !GetLocalInt(oModule, PT_XCR_NAMESPACE_ITEMS + "CraftItemBoxArray_display")) SendMessageToAllDMs(PT_XCR_LANGWORD_DESCRIPTION_12);
    if (GetLocalInt(oModule, PT_XCR_NAMESPACE_ITEMS + "CraftItemBoxArray_display")) SendMessageToAllDMs(PT_XCR_LANGWORD_DESCRIPTION_13 + IntToString(iBoxNum) + PT_XCR_LANGWORD_DESCRIPTION_14 + IntToString(i + 1) + PT_XCR_LANGWORD_DESCRIPTION_15);
    ///

    ////////////////////////////////////////////////
    //Инициализируем НВНХ, при первом кванте скрипта
    if (PT_XCR_USE_NWNX && iBoxNum == 0) {
        SetLocalString(oModule, "NWNX!INIT", "1");
        GetLocalObject(oModule, "NWNX!INIT");

        SQLInit();

        SQLExecDirect("CREATE TABLE IF NOT EXISTS `" + PT_XCR_SQL_TABLES_PC_VARS + "` (ID CHAR(30), sVar CHAR(60), fValue FLOAT, iType INT(1) default " + IntToString(pt_DBDUMP_TYPE_FLOAT) + ") COLLATE='latin1_general_ci' ;");

        SQLExecDirect("CREATE TABLE IF NOT EXISTS `" + PT_XCR_SQL_TABLES_BARRELS + "` (OBJ MEDIUMBLOB NOT NULL, ResRef VARCHAR(18) NOT NULL DEFAULT '', Number SMALLINT NULL DEFAULT '0', ItemsCount INT NOT NULL DEFAULT '0');");

        SQLExecDirect("CREATE TABLE IF NOT EXISTS `" + PT_XCR_SQL_TABLES_VARIMPORT + "` (ID VARCHAR(100), sTools VARCHAR(100), sSkills VARCHAR(150),  sSkillsVal VARCHAR(100), sRaws VARCHAR(150),  sRawsCost VARCHAR(100), fWeary FLOAT, fTime FLOAT, iChanceToCreate INT NOT NULL DEFAULT '0', iMinQuant INT NOT NULL DEFAULT '0',  iMaxQuant INT NOT NULL DEFAULT '0',   sScript VARCHAR(100) );");
    }

    ///////////////////////////
    //Первый контейнер в кванте
    int bHasNew = FALSE;
    object oTargetBox = GetObjectByTag(PT_XCR_NAMESPACE_OTHERS + "CraftBox", iBoxNum);
    if (!GetIsObjectValid(oTargetBox)) return;

    ///////////////////////////////////////////////////
    // Пробежка по бочкам
    int bStopped = FALSE, bAllBoxes = FALSE;
    while (GetIsObjectValid(oTargetBox)) {
        //Переменные Прайм-контейнеров, которые не были созданы после запуска модуля
        if (bIsModFirstRuned) {
            SetLocalInt(oTargetBox, PT_XCR_NAMESPACE_OTHERS + "CraftBox_prime", TRUE);
            SetLocalInt(oTargetBox, PT_XCR_NAMESPACE_OTHERS + "CraftBox_number", iBoxNum + 1);
            iBoxFirstStart++;
            SetLocalInt(oModule, PT_XCR_NAMESPACE_OTHERS + "CraftBoxModFirstBoxes", iBoxFirstStart);
        };

        //Инвентарь контейнера
        object oTempItem = GetFirstItemInInventory(oTargetBox);
        int iBC = 1, ico = 0; //чтото типа хеша, точно изменится если изменится название какого-нибуть итема и количество
        while (GetIsObjectValid(oTempItem)) {
            //Внесем имя итема в словарик модуля
            ptTagDictAddWord(GetTag(oTempItem), GetName(oTempItem));

            i++;
            ico++; //увеличим общий номер закешированных на текущий момент итемов и итемов в бочке соответсвенно
            SetLocalInt(oModule, PT_XCR_NAMESPACE_ITEMS + "CraftItemBoxArray_curi", i);

            //Обновим данные об итеме из базы если для него не заданны переменные
            if (PT_XCR_USE_NWNX && bIsModFirstRuned) ptSQLRefreshCraftVars(oTempItem);

            //Переменные итемов которые будут соствалять _типахеш_
            string sSkills = GetLocalString(oTempItem, PT_XCR_ITEM_SETTINGS_SKILLS);
            string sSkillsVal = GetLocalString(oTempItem, PT_XCR_ITEM_SETTINGS_SKILLSVAL);
            string sRaws = GetLocalString(oTempItem, PT_XCR_ITEM_SETTINGS_RAWS);
            string sRawsCost = GetLocalString(oTempItem, PT_XCR_ITEM_SETTINGS_RAWSCOST);
            string sTools = GetLocalString(oTempItem, PT_XCR_ITEM_SETTINGS_TOOLS);

            //Предохранитель от того чтобы пустые итемы не "производились" "карманным инструментом"
            if (
                sSkills == "" &&
                sSkillsVal == "" &&
                sRaws == "" &&
                sRawsCost == "" &&
                sTools == "") {
                sTools = "%NO_SETTINGS%";
                SetLocalString(oTempItem, PT_XCR_ITEM_SETTINGS_TOOLS, "%NO_SETTINGS%");
            };

            // _типахеш_
            iBC = iBC + ico + (
                GetStringLength(GetName(oTempItem)) +
                StringToInt(pArray(sSkillsVal, 0)) +
                StringToInt(pArray(sRawsCost, 0)) +
                GetStringLength(sRaws + sTools) -
                GetStringLength(sSkills)
            ) / 3;
            ptObjArrayObject_set(PT_XCR_NAMESPACE_ITEMS, oModule, "CraftItemBoxArray", oTempItem, i); //Кеш итема для системы

            //К следующему итему бочки
            oTempItem = GetNextItemInInventory(oTargetBox);
        };
        //Значения типахеша на бочку записывается в переменную
        SetLocalInt(oTargetBox, PT_XCR_NAMESPACE_OTHERS + "CraftBox_ibc", iBC);

        //////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //Для квантования, если бочка по количеству проанализированных в этом скрипте не вписывается - то прервем цикл
        iBoxNum++;
        SetLocalInt(oModule, PT_XCR_NAMESPACE_ITEMS + "CraftItemBoxArray_curiBoxNum", iBoxNum);
        oTargetBox = GetObjectByTag(PT_XCR_BARREL_TAG, iBoxNum);
        if (!GetIsObjectValid(oTargetBox)) bAllBoxes = TRUE;
        //Обрабатываем по несколько контейнеров за раз скрипта обычно 1 чтобы скрипт не бился
        if (!bAllBoxes && iBoxNum - GetLocalInt(oModule, PT_XCR_NAMESPACE_ITEMS + "CraftItemBoxArray_stopiBoxNum") >= PT_XCR_PERFOMANCE_MODULE_MAXBOX_IN_SCRIPT) {
            bStopped = TRUE;
            SetLocalInt(oModule, PT_XCR_NAMESPACE_ITEMS + "CraftItemBoxArray_stopiBoxNum", iBoxNum);
            oTargetBox = OBJECT_INVALID;
            continue;
        };
    };
    //Дамп _имен_ переменных (исходя из того что в бочках) PC нуждающихся в отправке в базу
    // т.к. дамп-функция смотрит текущую длинну кэша итемов то в аргументы задается начальный номер (который мы используем при квантовании скрипта)
    // тоесть с какого итема в кеше начинать анализирование. В итоге получается что дамп скрипт тоже "квантуется" и анализирует пачки данных за раз
    ptCreateModuleVarNameDump(iBeginItemForDump);

    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Для квантования, если еще не проанализированны все бочки, и скрипт не был остановлен (когда количество бочек не вошло
    //в PT_XCR_PERFOMANCE_MODULE_MAXBOX_IN_SCRIPT, то рекурсивно запустим скрипт  с задержкой (разквантуем на несколько частей)
    if (!bAllBoxes && (bStopped)) {
        DelayCommand(PT_XCR_PERFOMANCE_MODULE_MAXTIME_OF_SCRIPT, ExecuteScript(PT_XCR_SCRIPT_MODULE_LOAD, oModule));
        return;
    };
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //Нижеследующий блок выполняется только когда все части (кванты) скрипта исполнены, и проанализированны все бочки
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    //Чтобы обозначить сработанные при первом старте модуля скрипт
    SetLocalInt(oModule, PT_XCR_NAMESPACE_OTHERS + "CraftBoxModFirstRuned", TRUE);
    SetLocalInt(oModule, PT_XCR_NAMESPACE_ITEMS + "CraftItemBoxArray_curiBoxNum", 0);
    SetLocalInt(oModule, PT_XCR_NAMESPACE_ITEMS + "CraftItemBoxArray_stopiBoxNum", 0);
    SetLocalInt(oModule, PT_XCR_NAMESPACE_ITEMS + "CraftItemBoxArray_curi", 0);

    /////////////////////////////////////////////////////////////////////
    //Создание контейнеров которых нету в мастер модуле(при первом старте)
    int bHasNewBox = FALSE;
    if (PT_XCR_USE_NWNX && bIsModFirstRuned && PT_XCR_SAVE_BARRELS) {
        //Создание контейнеров которых нету в мастер модуле (ну или если скрипт запущен после персистент системы - то до этого момента)
        //Вначале выясняем сколько будет объектов
        int iFuckenModuleArrayIndex = -1;
        SQLExecDirect("SELECT Number FROM `" + PT_XCR_SQL_TABLES_BARRELS + "` WHERE Number < 0; ");
        while (SQLFetch() == SQL_SUCCESS) {
            iFuckenModuleArrayIndex++;
            int iNotPrimeNumb = StringToInt(SQLGetData(1));

            SetLocalInt(oModule, PT_XCR_NAMESPACE_OTHERS + "CraftBoxModFuckenArray." + IntToString(iFuckenModuleArrayIndex), iNotPrimeNumb);
        };
        //Долбанное создание нескольких объектов
        if (iFuckenModuleArrayIndex > -1) {
            int k;
            for (k = 0; k <= iFuckenModuleArrayIndex; k++) {
                object oNewBox = SQLRCOExec("SELECT OBJ FROM `" + PT_XCR_SQL_TABLES_BARRELS + "` WHERE Number = " + (IntToString(GetLocalInt(oModule, PT_XCR_NAMESPACE_OTHERS + "CraftBoxModFuckenArray." + IntToString(k)))) + "; ", ptGetRandomLocation(GetObjectByTag(PT_XCR_BARREL_TAG), 2.0, TRUE), OBJECT_TYPE_PLACEABLE);

                //Локация хранится на бочке, я пока не придумал рациональное решение -
                // или добалять еще колонку в базу с локацией или оставить так :(
                string sLoc = GetLocalString(oNewBox, PT_XCR_NAMESPACE_OTHERS + "CraftBox_location");
                location lLoc = ptGetLocationFromString(sLoc);

                //Увеличим общее количество бочек - для того чтобы новые номера присваивались корректно и не пересекались
                iBoxFirstStart++;
                SetLocalInt(oModule, PT_XCR_NAMESPACE_OTHERS + "CraftBoxModFirstBoxes", iBoxFirstStart);
                bHasNewBox = TRUE; //Флаг что есть новые созданные бочки итемы в которых не закешированы
            };
        };
    };

    ///////////////////////////////////////////////////////////////////////
    //Сохранение или установка(измененных в модуле) бочек записанных в базе
    int bHasRefreshBox = FALSE;
    if (PT_XCR_USE_NWNX && PT_XCR_SAVE_BARRELS) {
        ///////////////////////////////////////////////////
        // Пробежка по бочкам чтобы пересоздать объекты
        int iBoxNum = 0; //тут просто анализируем все бочки созданные на текущий момент в модуле
        object oTargetBox = GetObjectByTag(PT_XCR_BARREL_TAG, iBoxNum);
        if (!GetIsObjectValid(oTargetBox)) return;
        while (GetIsObjectValid(oTargetBox)) {
            //Получаем _типахеш_ чтобы сравнить его с тем, который в базе
            //и узнать изменился ли боченок с момента последнего запуска этого скрипта
            int iBC = GetLocalInt(oTargetBox, "pt_craft_box_ibc");
            //Это номер-идентификатор под которым хранятся боченки в базе.
            // Примечательно что в базе хранение начинается с "0" - но в переменной pt_craft_box_number
            // которая на итеме изза значения по умолчанию у aeyrwbb GetLocalInt = 0 - приходится хранить значение на 1 больше
            int iStoreNum = GetLocalInt(oTargetBox, "pt_craft_box_number") - 1;

            //Контейнеры в системе имеют два термина определяющие их категорию
            // 1. Прайм-контейнер - создан в тулсете - есть при старте модуля
            // 2. Не прайм-контейнер - создан после старта модуля.

            //////////////////
            //Прайм-контейнеры
            if (GetLocalInt(oTargetBox, "pt_craft_box_prime")) {
                if (iStoreNum == -1) //Если переменная не установлена(значение 0 - 1 = -1) - берем iBoxNum
                {
                    iStoreNum = iBoxNum;
                    SetLocalInt(oTargetBox, "pt_craft_box_number", iBoxNum + 1);
                };
                SQLExecDirect("SELECT ItemsCount FROM `pt_axcrf_boxes` WHERE ResRef = '" + SQLEncodeSpecialChars(GetResRef(oTargetBox)) + "' AND Number = " + (IntToString(iStoreNum)) + "; ");

                /////////////////////////////////////////////////////////////
                //Если в базе есть записаный под этим номером прайм-контейнер
                if (SQLFetch() == SQL_SUCCESS) {
                    int iSQLBC = StringToInt(SQLGetData(1));
                    //debug
                    //SendMessageToAllDMs("Контейнер " + IntToString(iStoreNum) + " iBC=" + IntToString(iBC) + " iSQLBC=" +IntToString(iSQLBC));

                    //Если скрипт запущен первый раз и SQL-типахеш не равен нулю (по дефолту в базе у этой колонки значения нет)
                    //это означет что запись этого контейнера в базу уже производилась
                    if (bIsModFirstRuned && iSQLBC != 0) {
                        bHasRefreshBox = TRUE; //Флаг что есть контейнеры для обновления(вернее пересоздания)
                        DelayCommand(2.5, pDestroyCreate(oTargetBox, GetResRef(oTargetBox), iStoreNum, iSQLBC, GetLocation(oTargetBox), GetObjectType(oTargetBox)));
                    }
                    //Если типахеш прайма не равен базному
                    //обновляем значения в базе из модуля
                    else if (iBC != iSQLBC) {
                        SetLocalInt(oTargetBox, "pt_craft_box_number", iStoreNum + 1);
                        SetLocalInt(oTargetBox, "pt_craft_box_ibc", iBC);

                        SQLSCOExec("UPDATE `pt_axcrf_boxes` SET `ItemsCount` = " + (IntToString(iBC)) + ", `OBJ` = %s  WHERE  ResRef = '" + SQLEncodeSpecialChars(GetResRef(oTargetBox)) + "' AND Number = " + (IntToString(iStoreNum)) + " LIMIT 1;", oTargetBox);
                    };
                }

                ///////////////////////////////////////////////////////////////////////////////////
                //Если в базе нету прайм-контейнера с данным номером - сохраним(вставим) его в ней
                else {
                    SetLocalInt(oTargetBox, "pt_craft_box_number", iStoreNum + 1);
                    SetLocalInt(oTargetBox, "pt_craft_box_ibc", iBC);

                    SQLSCOExec("INSERT into `pt_axcrf_boxes` (OBJ, ResRef, Number, ItemsCount) values (%s, '" + SQLEncodeSpecialChars(GetResRef(oTargetBox)) + "', " + (IntToString(iStoreNum)) + ", " + (IntToString(iBC)) + ") ; ", oTargetBox);
                };
            }
            /////////////////////
            //Не прайм контейнеры
            else {
                //Запрос типахеша контейнера из базы
                int iSQLBC = 0;
                SQLExecDirect("SELECT ItemsCount FROM `pt_axcrf_boxes` WHERE ResRef = '" + SQLEncodeSpecialChars(GetResRef(oTargetBox)) + "' AND Number = " + (IntToString(GetLocalInt(oTargetBox, "pt_craft_box_number") + 1)) + "; ");
                if (SQLFetch() == SQL_SUCCESS) iSQLBC = StringToInt(SQLGetData(1));

                //Если на контейнере вообще нету никаких отметок о его номере - значит
                //его создали после кеширования и нужно добавить его в базу.
                //Не прайм контейнеры имеют свой номер-идентификатор - отрицательный, для удобства
                //он по умолчанию продолжает порядок обычных контейнеров, например есть контейнеры
                // 0, 1, .. 20, 21, *и продолжает ряд контейнеров модуле* -22, -23 и т.д. эти два последних контейнеров (не прайм)
                // были созданы после старта модуля и сохранены в базе.
                if (!GetLocalInt(oTargetBox, "pt_craft_box_number")) {
                    bHasNew = TRUE; //Флаг что есть новые созданные не прайм контейнеры
                    SetLocalInt(oTargetBox, "pt_craft_box_number", 0 - (iBoxFirstStart + 1));
                    SetLocalInt(oTargetBox, "pt_craft_box_ibc", iBC);
                    SetLocalString(oTargetBox, "pt_craft_box_location", pGetStringFromLocation(GetLocation(oTargetBox)));

                    SQLSCOExec("INSERT into `pt_axcrf_boxes` (OBJ, ResRef, Number, ItemsCount) values (%s, '" + SQLEncodeSpecialChars(GetResRef(oTargetBox)) + "', " + (IntToString(0 - (iBoxFirstStart))) + ", " + (IntToString(iBC)) + ") ; ", oTargetBox);
                    iBoxFirstStart++;
                    SetLocalInt(oModule, "pt_craft_box_mfirstboxes", iBoxFirstStart);
                }
                //Если типахеш из базы не прайма не равен значению на переменной
                //обновляем значения в базе
                else if (iBC != iSQLBC) {
                    SetLocalInt(oTargetBox, "pt_craft_box_ibc", iBC);

                    SQLSCOExec("UPDATE `pt_axcrf_boxes` SET `ItemsCount` = " + (IntToString(iBC)) + ", `OBJ` = %s  WHERE  ResRef = '" + SQLEncodeSpecialChars(GetResRef(oTargetBox)) + "' AND Number = " + (IntToString(GetLocalInt(oTargetBox, "pt_craft_box_number") + 1)) + " LIMIT 1;", oTargetBox);
                };
            };

            iBoxNum++;
            oTargetBox = GetObjectByTag(PT_XCR_BARREL_TAG, iBoxNum);
        };
    };

    //Если есть пересозданные контейнеры, не праймы которые нуждаются в перекэшировании и т.д. -
    //- запустим кеширование заново (но скрипт уже не будет иметь флаг bIsModFirstRuned)
    if (bHasRefreshBox || bHasNewBox) {
        SetLocalInt(oModule, "pt_CraftItemBoxArray_display", TRUE);
        DelayCommand(4.5, ExecuteScript("pt_axcrf_modlod", oModule));
        return;
    };
    SetLocalInt(oModule, "pt_CraftItemBoxArray_display", FALSE);
    DelayCommand(10.0, SendMessageToAllDMs("!!!\nПерекеширование крафт-объектов закончено. Приятной игры.."));
}


//---END MODULE-EVENTS FUNCS
