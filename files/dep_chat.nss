#include "dep_inc_combat"
#include "dep_inc_class"
#include "x3_inc_skin"
#include "d0_const"
#include "dep_inc_function"

//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//

/*int CompareStrings(string sCommand, string sCompareWith)
{
    if(sCommand == sCompareWith)
    return TRUE;

    int iLen = GetStringLength(sCommand);
    int iRet, i;
    string sSingleCmd, sSingleCompare;

    //Debug(GetFirstPC(), "cmd: "+sCommand+", compare: "+sCompareWith+", iLen: "+IntToString(iLen));

    if(sCommand != sCompareWith)
    {
        // Too short
        if(iLen < NEEDED_CHAR_LENGTH)
        return FALSE;

        for(i=0; i < iLen; i++)
        {
            sSingleCmd     = GetSubString(sCommand, i, 1);
            sSingleCompare = GetSubString(sCompareWith, i, 1);

            //Debug(GetFirstPC(), "i: "+IntToString(i)+", Cmd: "+sSingleCmd+", Compare: "+sSingleCompare);

            if(sSingleCmd != sSingleCompare)
            {
                iRet = TRUE;
                break;
            }
        }
    }

    return !iRet;
}        */

int FindSpacer(string sFind, int nStart=0);
int FindSpacer(string sFind, int nStart=0)
{
    string SpacerIndex = D0_INDEX_SPACER;
    string Spacer;
    int iSave = -1;
    int iFind, iCount;

    for(iCount=0; iCount < GetStringLength(SpacerIndex); iCount++)
    {
        Spacer = GetSubString(SpacerIndex, iCount, 1);
        iFind  = FindSubString(sFind, Spacer, nStart);
        //Debug(GetPCChatSpeaker(), "Spacer: '"+Spacer+"', Found: "+IntToString(iFind));

        if(iFind != -1 && (iSave == -1 || iFind < iSave))
        iSave = iFind;
        //Debug(GetPCChatSpeaker(), "iSave: "+IntToString(iSave));
    }

    return iSave;
}

//****************************************************************************//

string GetStringPart(string sString, string CompareWith, int nStart=0);
string GetStringPart(string sString, string CompareWith, int nStart=0)
{
    int iNewWord    = TRUE;
    int iStopperMax = GetStringLength(sString);
    int iStopper, iRet, iRetStart, iFind, iCount, iCompareCount;
    string sTemp, sTempCompare;

    for(iCount=nStart; iCount < GetStringLength(sString); iCount++)
    {
        iStopper++;

        if(!iNewWord)
        {
            if(iRet <= 1)
            {
                iRet = 0;
                iRetStart = 0;
            }
            iCompareCount = 0;

            iFind = FindSpacer(sString, iCount);
            if(iFind != -1)
            {
                iCount = iFind+1;
                iNewWord = TRUE;
            }
        }

        // This is to avoid to much commands
        if(iStopper > iStopperMax)
        break;

        // Stop searching if word is found or part of the word
        if(iFind == -1)
        break;

        sTemp        = GetStringLowerCase(GetSubString(sString, iCount, 1));
        sTempCompare = GetStringLowerCase(GetSubString(CompareWith, iCompareCount, 1));

        if(sTemp != sTempCompare)
        {
            if(iRet > 1)
                break;
            else
                iNewWord = FALSE;
        }
        else if(sTemp == sTempCompare)
        {
            if(!iRetStart)
            iRetStart = iCount;

            iRet++;
            iCompareCount++;
        }
    }

    return GetSubString(sString, iRetStart-1, iRet);
}

//****************************************************************************//

int IsCommand(string Command, string CompareWith);
int IsCommand(string Command, string CompareWith)
{
    int iRet = TRUE;
    if(FindSubString(CompareWith, "||"))
    {
        int iCount, iCSplitCount;
        string CompareSplit = CompareWith;

        while(iCSplitCount != -1)
        {
            iCSplitCount = FindSubString(CompareSplit, "||");
            CompareWith  = GetSubString(CompareSplit, 0, iCSplitCount);
            CompareSplit = GetSubString(CompareSplit, iCSplitCount+2, GetStringLength(CompareSplit)-iCSplitCount+2);

            iRet = CompareStrings(Command, CompareWith);

            if(iRet)
            break;
        }

        return iRet;
    }
    else
    {
        return CompareStrings(Command, CompareWith);
    }
}

//****************************************************************************//

string GetCommand(int iNumber);
string GetCommand(int iNumber)
{
    string ret;
    switch(iNumber)
    {
        case 1:  ret = "info";break;
        case 2:  ret = "hilfe";break;
        case 3:  ret = "emotes";break;
        case 4:  ret = "emoteliste";break;
        case 5:  ret = "einzahlen";break;
        case 6:  ret = "sprache";break;
        case 7:  ret = "dminfo";break;
        case 8:  ret = "deposit";break;
        case 9:  ret = "abheben";break;
        case 10: ret = "withdraw";break;
        case 11: ret = "überweisung";break;
        case 12: ret = "ueberweisung";break;
        case 13: ret = "ignore";break;
        case 14: ret = "ignorieren";break;
        case 15: ret = "save";break;
        case 16: ret = "call";break;
        case 17: ret = "delete";break;
        case 18: ret = "dmaction";break;
        case 19: ret = "follow";break;
        case 20: ret = "sprachen";break;
        case 21: ret = "afk";break;
        case 22: ret = "language";break;
        case 23: ret = "target";break;
        case 24: ret = "dmignore";break;
        case 25: ret = "dmchansupress";break;
        case 26: ret = "dmassociate";break;
        case 27: ret = "dbsave";break;
        case 28: ret = "dbcall";break;
        case 29: ret = "dbdelete";break;
        case 30: ret = "fogamount";break;
        case 31: ret = "fogcolor";break;
        case 32: ret = "transfer";break;
        case 33: ret = "folgen";break;
        case 34: ret = "help";break;
        case 35: ret = "flügel";break;
        case 36: ret = "wing";break;
        case 37: ret = "schwanz";break;
        case 38: ret = "tail";break;
        case 39: ret = "kopieren";break;
        case 40: ret = "copy";break;
        case 41: ret = "foghex";break;
        case 42: ret = "würfel";break;
        case 43: ret = "dice";break;
        case 44: ret = "rasten";break;
        case 45: ret = "rest";break;
        case 46: ret = "kopierenziel";break;
        case 47: ret = "copytarget";break;
        case 48: ret = "reload";break;
        case 49: ret = "neuladen";break;
    }

    return ret;
}

//****************************************************************************//

int GetIsCommandValid(string Command);
int GetIsCommandValid(string Command)
{
    Command = GetStringLowerCase(Command);

    int i = 1;
    int iRet;
    while(GetCommand(i) != "")
    {
        if(IsCommand(Command, GetCommand(i)))
        {
            iRet = TRUE;
            break;
        }

        i++;
    }

    return iRet;
}


string GetChatParameter(string sCommand, int iParam=1);
string GetChatParameter(string sCommand, int iParam=1)
{
    object oPC  = GetPCChatSpeaker();
    int    iLen = GetStringLength(sCommand);
    int    iLeftpart, iRightpart, iNum, i;

    string sPart = GetStringRight(sCommand, iLen - (FindSubString(sCommand, " ") + 1));
    string sParam;

    for(i=1; i <= iParam; i++)
    {
        iLen = GetStringLength(sPart);

        if(GetStringLeft(sPart, 1) == Chr(7))
        {
            iLeftpart  = FindSubString(sPart, Chr(7));
            iRightpart = FindSubString(sPart, Chr(7), iLeftpart+1);
            sParam     = GetSubString(sPart, iLeftpart+1, iRightpart-1);
            sPart      = GetStringRight(sPart, iLen - (iRightpart + 2));
        }
        else
        {
            if(FindSubString(sPart, " ") == -1)
                iNum = iLen;
            else
                iNum = FindSubString(sPart, " ");

            sParam = GetStringLeft(sPart, iNum);
            sPart  = GetStringRight(sPart, iLen - (iNum + 1));
        }
    }

    if(sParam == sCommand)return "";

    return sParam;
}

//****************************************************************************//

int GetChatParameterInt(string sCommand, int iParam=1);
int GetChatParameterInt(string sCommand, int iParam=1)
{
    return StringToInt(GetChatParameter(sCommand, iParam));
}

//****************************************************************************//

string iStr(int iInt)
{
    return IntToString(iInt);
}

void _GetAreaOfEffectObjects(object oCreator=OBJECT_SELF)
{
    object oTarget = GetNearestObject(OBJECT_TYPE_AREA_OF_EFFECT, oCreator);
    int    iNth    = 1;

    while(GetIsObjectValid(oTarget))
    {
        SendMessageToPC(oCreator, "IntTag: "+IntToString(StringToInt(GetTag(oTarget)))+", AOE Creator: "+GetName(GetAreaOfEffectCreator(oTarget))+", AOE Name: "+GetName(oTarget)+", AOE Tag: "+GetTag(oTarget)+", AOE ResRef: "+GetResRef(oTarget));

        iNth++;
        oTarget = GetNearestObject(OBJECT_TYPE_AREA_OF_EFFECT, oCreator, iNth);
    }
}

/*string GetDamageBonusName(int iDPower)
{
    if(iDPower == -1) return "";

    switch(iDPower)
    {
        case IP_CONST_DAMAGEBONUS_1:    return "1"; break;
        case IP_CONST_DAMAGEBONUS_2:    return "2"; break;
        case IP_CONST_DAMAGEBONUS_1d4:  return "1d4"; break;
        case IP_CONST_DAMAGEBONUS_3:    return "3"; break;
        case IP_CONST_DAMAGEBONUS_4:    return "4"; break;
        case IP_CONST_DAMAGEBONUS_1d6:  return "1d6"; break;
        case IP_CONST_DAMAGEBONUS_5:    return "5"; break;
        case IP_CONST_DAMAGEBONUS_1d8:  return "1d8"; break;
        case IP_CONST_DAMAGEBONUS_2d4:  return "2d4"; break;
        case IP_CONST_DAMAGEBONUS_6:    return "6";break;
        case IP_CONST_DAMAGEBONUS_7:    return "7";break;
        case IP_CONST_DAMAGEBONUS_8:    return "8";break;
        case IP_CONST_DAMAGEBONUS_1d10: return "1d10";break;
        case IP_CONST_DAMAGEBONUS_9:    return "9";break;
        case IP_CONST_DAMAGEBONUS_1d12: return "1d12";break;
        case IP_CONST_DAMAGEBONUS_2d6:  return "2d6";break;
        case IP_CONST_DAMAGEBONUS_10:   return "10";break;
        case IP_CONST_DAMAGEBONUS_2d8:  return "2d8";break;
        case IP_CONST_DAMAGEBONUS_2d10: return "2d10";break;
        case IP_CONST_DAMAGEBONUS_2d12: return "2d12";break;
    }

    return "";
} */

int Cmd(string sCommand)
{
    int iLen = GetStringLength(sCommand);
    return FindSubString(GetPCChatMessage(), sCommand) != -1;
}


float ANIMATION_FRAME_MULTI = 1.0/30.0;

int GetAnimationLength(int iAnimation)
{
    if(iAnimation == ANIMATION_LOOPING_CUSTOM10) return 34;

    return 0;
}

void PlaySoundLoop(object oPC, string sSound, float fPlaySoundStart, float fAnimationLength, int iPlayXTimes, int iCounter=1)
{
    if(iCounter <= iPlayXTimes)
    {
        SendMessageToPC(oPC, IntToString(iCounter)+" / "+IntToString(iPlayXTimes)+" - Playing sound");
        DelayCommand(fPlaySoundStart, SendMessageToPC(oPC, "Sound"));
        DelayCommand(fPlaySoundStart, AssignCommand(oPC, PlaySound(sSound)));
        DelayCommand(fAnimationLength, PlaySoundLoop(oPC, sSound, fPlaySoundStart, fAnimationLength, iPlayXTimes, iCounter+1));
    }
}

void PlayAnimationWithSound(object oPC, int iAnimation, float fAnimationLength, string sSound, int iPlayAtFrame)
{
    SendMessageToPC(oPC, "Sound: "+sSound+", Frame: "+IntToString(iPlayAtFrame)+", Animlen: "+FloatToString(fAnimationLength));

    if(sSound == "" || iPlayAtFrame <= 0)
    {
        SendMessageToPC(oPC, "Playing normal animation");
        AssignCommand(oPC, ActionPlayAnimation(iAnimation, 1.0, fAnimationLength));
    }
    else
    {
        float fPlaySound, fFullLen;
        int   iLen = GetAnimationLength(iAnimation);

        if(iLen > 0)
        {
            fPlaySound = ANIMATION_FRAME_MULTI * iPlayAtFrame;
            fFullLen   = ANIMATION_FRAME_MULTI * iLen;

            AssignCommand(oPC, ClearAllActions());

            SendMessageToPC(oPC, "Playing sound animation ("+FloatToString(fPlaySound)+", "+FloatToString(fFullLen));
            PlaySoundLoop(oPC, sSound, fPlaySound, fFullLen, FloatToInt(fAnimationLength / fFullLen));
            AssignCommand(oPC, ActionPlayAnimation(iAnimation, 1.0, fAnimationLength));
        }
    }
}

void main()
{
    object oPC      = GetPCChatSpeaker();
    string sMessage = GetPCChatMessage();
    string sMode    = GetLocalString(oPC, "viseffectmode");
    string cmd;

    SendMessageToPC(oPC, "string left: "+GetStringLeft(sMessage, 3)+", len: "+inStr(GetStringLength(sMessage)));
    if(GetStringLeft(sMessage, 3) == "xps" && GetStringLength(sMessage) > 3)
    {
        int xp = StringToInt(GetSubString(sMessage, 4, GetStringLength(sMessage) - 4));

        SendMessageToPC(oPC, "xps: "+inStr(xp));

        SetXP(oPC, xp);

        return;
    }
    if(sMessage == "desc test")
    {
        object oWP = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
        SetDescription(oWP, "asdnfdgodfmgspyfm,ypdgfjn");
        return;
    }
    if(sMessage == "mythallar")
    {
        ApplyMythallarSplitter(oPC);
        return;
    }
    if(sMessage == "hench")
    {
        SetMaxHenchmen(5);

        int i;
        for(i=1;i<=5;i++)
        {
            object oHench = CreateObject(OBJECT_TYPE_CREATURE, "d0_hench", GetLocation(oPC));
            AddHenchman(oPC, oHench);
            SetName(oHench, "Hench"+IntToString(i));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(50 - i*5, DAMAGE_TYPE_MAGICAL), oHench);
        }
    }
    if(sMessage == "animtest")
    {
        ExecuteScript("animtest2", oPC);
        return;
    }
    if(sMessage == "armor")
    {
        object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
        SendMessageToPC(oPC, "Armor App: "+IntToString(GetItemAppearance(oArmor, ITEM_APPR_TYPE_ARMOR_MODEL, ITEM_APPR_ARMOR_MODEL_TORSO)));
        SendMessageToPC(oPC, "Effective armor: "+IntToString(GetIsEffectiveArmor(oArmor)));
        return;
    }
    if(sMessage == "play")
    {
        AssignCommand(oPC, PlaySound("anvil_hit"));
        return;
    }
    if(sMessage == "play2")
    {
        AssignCommand(oPC, PlaySoundByStrRef(16778271));
        return;
    }
    if(sMessage == "animsound")
    {
        PlayAnimationWithSound(oPC, ANIMATION_LOOPING_CUSTOM10, 10.0, "anvil_hit", 19);
        return;
    }
    if(sMessage == "animsound2")
    {
        ExecuteScript("animsound_script", oPC);
        return;
    }
    if(GetStringLeft(sMessage, 4) == "anim")
    {
        int iAnim = StringToInt(GetSubString(sMessage, 5, GetStringLength(sMessage)-5));
        FloatingTextStringOnCreature("* Animation "+IntToString(iAnim)+" *", oPC, FALSE);

        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, PlayAnimation(20+iAnim, 1.0, 99999.0));
        return;
    }
    if(GetStringLeft(sMessage, 6) == "modeon")
    {
        string sMode = GetSubString(sMessage, 7, GetStringLength(sMessage)-7);
        FloatingTextStringOnCreature("* Visualeffect mode activated: "+sMode+" *", oPC, FALSE);

        SetLocalString(oPC, "viseffectmode", sMode);
        return;
    }
    if(GetStringLeft(sMessage, 4) == "capp")
    {
        int iNum = StringToInt(GetSubString(sMessage, 5, GetStringLength(sMessage)-5));
        SendMessageToPC(oPC, "Current App: "+IntToString(GetAppearanceType(oPC))+", New: "+IntToString(iNum));
        SetCreatureAppearanceType(oPC, iNum);
        return;
    }
    if(sMessage == "modeoff")
    {
        FloatingTextStringOnCreature("* Visualeffect mode deactivated *", oPC, FALSE);
        DeleteLocalString(oPC, "viseffectmode");
        return;
    }
    if(sMessage == "negeffect")
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDisease(DISEASE_MUMMY_ROT), oPC, 30.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSlow(), oPC, 30.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSpellFailure(), oPC, 30.0);

        return;
    }
    if(sMode != "")
    {
        if(sMode == "fxb")
        {
            object oFX = GetNearestObject(OBJECT_TYPE_CREATURE);
            int    iFX = StringToInt(sMessage);
            SendMessageToPC(oPC, "iFX: "+IntToString(iFX)+", oFX: "+GetName(oFX));

            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectBeam(iFX, oFX, BODY_NODE_CHEST), oPC);
            return;
        }
        if(sMode == "fxi")
        {
            int    iFX = StringToInt(sMessage);
            SendMessageToPC(oPC, "iFX: "+IntToString(iFX));

            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(iFX), oPC);
            return;
        }
        if(sMode == "fxtl")
        {
            int    iFX = StringToInt(sMessage);
            SendMessageToPC(oPC, "iFX: "+IntToString(iFX));

            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iFX), GetLocation(oPC), 60.0);
            return;
        }
        if(sMode == "fxt")
        {
            int    iFX = StringToInt(sMessage);
            SendMessageToPC(oPC, "iFX: "+IntToString(iFX));

            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(iFX), oPC, 20.0);
            return;
        }
    }

    if(sMessage == "vbadd")
    {
        object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
        int i;
        for(i=1; i<=10;i++)
        {
            AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyEnhancementBonus(i), oItem);
        }
    }
    if(sMessage == "effcheck")
    {
        effect eEff = GetFirstEffect(oPC);

        while(GetIsEffectValid(eEff))
        {
            SendMessageToPC(oPC, "Effect Type: "+IntToString(GetEffectType(eEff))+", "+IntToString(GetEffectSubType(eEff))+", "+IntToString(GetEffectSpellId(eEff))+", "+IntToString(GetEffectDurationType(eEff)));

            eEff = GetNextEffect(oPC);
        }

        return;
    }
    if(sMessage == "ipcheck")
    {
        object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
        itemproperty ip = GetFirstItemProperty(oItem);

        while(GetIsItemPropertyValid(ip))
        {
            SendMessageToPC(oPC, "IP Type: "+IntToString(GetItemPropertyType(ip))+", sub type: "+IntToString(GetItemPropertySubType(ip))+", cost table: "+IntToString(GetItemPropertyCostTableValue(ip)));
            ip = GetNextItemProperty(oItem);
        }
    }
    if(sMessage == "clear")
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        return;
    }

    if(sMessage == "value")
    {
        object oWpn = GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC);
        SendMessageToPC(oPC, "Bolzen Gold Piece Value: "+IntToString(GetGoldPieceValue(oWpn)));
        return;
    }
    if(sMessage == "weapch")
    {
        object oWpn   = GetWeaponRight(oPC);
        int iWPChoice = GetWeaponOfChoiceFeat(oWpn);
        SendMessageToPC(oPC, "is weapon of choice: "+IntToString(GetIsPCWeaponOfChoice(oWpn)));
        SendMessageToPC(oPC, "weapon of choice feat: "+IntToString(iWPChoice));
        SendMessageToPC(oPC, "Has Feat: "+IntToString(GetHasFeat(iWPChoice, oPC)));
        return;
    }
    if(sMessage == "weapch")
    {
        SendMessageToPC(oPC, "Has weapon of choice equipped: "+IntToString(GetSharpshooterWeaponOfChoiceEquipped(oPC)));
        return;
    }
    if(sMessage == "damagebolts")
    {
        object oWeapon = GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC);
        int    iDam    = GetItemDamageBonus(IP_CONST_DAMAGETYPE_PIERCING, oWeapon, FALSE);

        SendMessageToPC(oPC, "Highest Damage Bonus: "+GetStringByStrRef(GetCached2DAInt("iprp_damagecost", "name", iDam)));
        return;
    }
    if(sMessage == "csize")
    {
        SendMessageToPC(oPC, "CreatureSize: "+IntToString(GetCreatureSize(oPC)));
        return;
    }
    if(sMessage == "attack")
    {
        object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
        int    iAttack = GetItemAttackBonus(oWeapon);

        SendMessageToPC(oPC, "Highest Attack Bonus: "+IntToString(iAttack));
        return;
    }
    if(sMessage == "iprp")
    {
        object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);

        itemproperty IPProp = GetFirstItemProperty(oWeapon);
        while(GetIsItemPropertyValid(IPProp))
        {
            SendMessageToPC(oPC, "Itemproptype: "+IntToString(GetItemPropertyType(IPProp))+", Itemprop table val: "+IntToString(GetItemPropertyCostTableValue(IPProp))+", Itemprop Subtype: "+IntToString(GetItemPropertySubType(IPProp)));

            IPProp = GetNextItemProperty(oWeapon);
        }
        return;
    }
    if(sMessage == "Claw10")
    { //dep_pc_claw
        object oClawL = GetItemInSlot(INVENTORY_SLOT_CWEAPON_L, oPC);
        object oClawR = GetItemInSlot(INVENTORY_SLOT_CWEAPON_R, oPC);
        object oClawB = GetItemInSlot(INVENTORY_SLOT_CWEAPON_B, oPC);

        SendMessageToPC(oPC, "L: "+GetName(oClawL)+", R: "+GetName(oClawR)+" B: "+GetName(oClawB));

        return;
    }

    if(GetStringLeft(sMessage, 4) == "anim")
    {
        int iAnim = StringToInt(GetStringRight(sMessage, 2));
        SendMessageToPC(oPC, "anima: "+IntToString(iAnim));

        AssignCommand(oPC, ActionPlayAnimation(iAnim, 1.0, 3.0));
        return;
    }
    if(sMessage == "skinip")
    {
        object oSkin = SKIN_SupportGetSkin(oPC);
        itemproperty ipSkin = GetFirstItemProperty(oSkin);

        while(GetIsItemPropertyValid(ipSkin))
        {
            int iType = GetItemPropertyType(ipSkin);
            int iCost = GetItemPropertyCostTableValue(ipSkin);
            int iSub = GetItemPropertySubType(ipSkin);

            string sName = GetStringByStrRef(GetCached2DAInt("itempropdef", "Name", iType));
            string sSubType2da = GetCached2DAString("itempropdef", "SubTypeResRef", iType);
            string sSubType = GetStringByStrRef(GetCached2DAInt(sSubType2da, "Name", iSub)) + ": "+IntToString(GetCached2DAInt(sSubType2da, "Value", iSub));
            string sCostTable2da = GetCached2DAString("Name", "iprp_costtable", GetCached2DAInt("itempropdef", "CostTableResRef", iType));
            string sCostTable = GetStringByStrRef(GetCached2DAInt(sCostTable2da, "Name", iCost)) + ": "+IntToString(GetCached2DAInt(sCostTable2da, "Value", iCost));

            SendMessageToPC(oPC, "type: "+inStr(iType)+", sub: "+inStr(iSub)+", cost: "+inStr(iCost));
            SendMessageToPC(oPC, sName+", "+sSubType2da+", "+sSubType+", "+sCostTable2da+", "+sCostTable);
            ipSkin = GetNextItemProperty(oSkin);
        }


        return;
    }
    if(sMessage == "dmtool")
    {
        object oSkin = SKIN_SupportGetSkin(oPC);
        AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyBonusFeat(IP_CONST_FEAT_PLAYER_TOOL_10), oSkin);
        return;
    }
    if(sMessage == "meta")
    {
        SendMessageToPC(oPC, "Metamagic: "+IntToString(GetQuickMetaMagic(oPC)));
        return;
    }
    if(sMessage == "aoe")
    {
        _GetAreaOfEffectObjects(oPC);
        return;
    }
    if(sMessage == "date")
    {
        SendMessageToPC(oPC, "Date: "+iStr(GetCalendarDay())+"."+iStr(GetCalendarMonth())+"."+iStr(GetCalendarYear()));
        return;
    }
    if(sMessage == "time")
    {
        SendMessageToPC(oPC, "Timestamp: "+iStr(GetTimeHour())+"."+iStr(GetTimeMinute())+"."+iStr(GetTimeSecond())+"."+iStr(GetTimeMillisecond()));
        return;
    }

    if(sMessage == "camp")
    {
        if(GetLocalInt(oPC, "dnc_camp"))
            DeleteLocalInt(oPC, "dnc_camp");
        else
            SetLocalInt(oPC, "dnc_camp", TRUE);

        SendMessageToPC(oPC, "Camp: "+IntToString(GetLocalInt(oPC, "dnc_camp")));
        return;
    }
    if(sMessage == "petrify")
    {
        AssignCommand(oPC, ActionCastSpellAtObject(SPELL_FLESH_TO_STONE, oPC, METAMAGIC_ANY, TRUE, 40));
        return;
    }
    if(sMessage == "noxp")
    {
        SetXP(oPC, 0);
        return;
    }

    if(sMessage == "xp")
    {
        SetXP(oPC, 1000000);
        return;
    }

    if(sMessage == "rest")
    {
        ForceRest(oPC);
        return;
    }

    if(sMessage == "trap1")
    {
        CreateItemOnObject("dep_it_trap055", oPC);
        return;
    }
    if(sMessage == "trap2")
    {
        CreateItemOnObject("dep_it_trap056", oPC);
        return;
    }
    if(sMessage == "trap3")
    {
        CreateItemOnObject("dep_it_trap057", oPC);
        return;
    }
    if(sMessage == "trap4")
    {
        CreateItemOnObject("dep_it_trap058", oPC);
        return;
    }
    if(sMessage == "facing")
    {
        SendMessageToPC(oPC, "current Facing: "+FloatToString(GetFacing(oPC)));
        return;
    }
    if(sMessage == "bigby5")
    {
        AssignCommand(oPC, ActionCastSpellAtObject(SPELL_BIGBYS_CRUSHING_HAND, oPC, METAMAGIC_ANY, TRUE, 40));
        return;
    }
    if(sMessage == "jumpahead")
    {
        location lDist = GetLocationAhead(GetPosition(oPC), GetFacing(oPC), 8.0, 0.0, GetArea(oPC));

        AssignCommand(oPC, JumpToLocation(lDist));
        return;
    }
    if(sMessage == "jumpbehind")
    {
        location lDist = GetLocationBehind(GetPosition(oPC), GetFacing(oPC), 8.0, 0.0, GetArea(oPC));

        AssignCommand(oPC, JumpToLocation(lDist));
        return;
    }
    if(sMessage == "location")
    {
        vector vPos = GetPosition(oPC);

        SendMessageToPC(oPC, "x: "+FloatToString(vPos.x)+", y: "+FloatToString(vPos.y)+", z: "+FloatToString(vPos.z));
        return;
    }
    if(GetStringLeft(sMessage, 1) == "/" && GetStringLeft(sMessage, 2) != "//")
    {
        SetPCChatMessage();

        if(FindSubString(sMessage, " ") == -1)
            cmd = GetStringLowerCase(sMessage);
        else
            cmd = GetLowerStringLeft(sMessage, FindSubString(sMessage, " "));

        cmd = GetStringRight(cmd, GetStringLength(cmd)-1);

        if(IsCommand(cmd, "shape"))
        {
            int iShape = GetChatParameterInt(sMessage);
            float fDist = StringToFloat(GetChatParameter(sMessage, 2));
            string Loc = GetChatParameter(sMessage, 3);
            float fAhead = StringToFloat(GetChatParameter(sMessage, 4));
            location lDist = GetLocation(oPC);

            /*
            int    SHAPE_SPELLCYLINDER      = 0;
            int    SHAPE_CONE               = 1;
            int    SHAPE_CUBE               = 2;
            int    SHAPE_SPELLCONE          = 3;
            int    SHAPE_SPHERE             = 4;
            */

            if(Loc == "ahead")
            {
                lDist = GetLocationAhead(GetPosition(oPC), GetFacing(oPC), fAhead, 0.0, GetArea(oPC));
                //object oNew = CreateObject(OBJECT_TYPE_PLACEABLE, "x3_plc_rubble1", lDist);

                SendMessageToPC(oPC, "Location ahead: Facing = "+FloatToString(GetFacingFromLocation(lDist)));
            }

            SendMessageToPC(oPC, "Shape: "+iStr(iShape)+", pc facing: "+FloatToString(GetFacing(oPC))+", dist: "+FloatToString(fDist)+", Loc: "+Loc+", fAhead: "+FloatToString(fAhead));

            object oTarget = GetFirstObjectInShape(iShape, fDist, lDist, TRUE, OBJECT_TYPE_CREATURE, GetPosition(oPC));

            while(GetIsObjectValid(oTarget))
            {
                SendMessageToPC(oPC, "oTarget: "+GetName(oTarget));

                oTarget = GetNextObjectInShape(iShape, fDist, lDist, TRUE, OBJECT_TYPE_CREATURE, GetPosition(oPC));
            }
        }
    }
}
