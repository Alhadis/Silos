#include "x2_inc_itemprop"
#include "dcs_inc_database"
#include "nwnx_funcs"

const int DCS_IPEX_STATUS_EXISTS  = 0;
const int DCS_IPEX_STATUS_DELETED = 1;

const int IP_CONST_DAMAGERESIST_1   = 25;
const int IP_CONST_DAMAGERESIST_2   = 26;
const int IP_CONST_DAMAGERESIST_3   = 27;
const int IP_CONST_DAMAGERESIST_4   = 28;
const int IP_CONST_DAMAGERESIST_5a  = 29;
const int IP_CONST_DAMAGERESIST_6   = 30;
const int IP_CONST_DAMAGERESIST_7   = 31;
const int IP_CONST_DAMAGERESIST_8   = 32;
const int IP_CONST_DAMAGERESIST_9   = 33;
const int IP_CONST_DAMAGERESIST_10a = 34;
const int IP_CONST_DAMAGERESIST_11  = 35;
const int IP_CONST_DAMAGERESIST_12  = 36;
const int IP_CONST_DAMAGERESIST_13  = 37;
const int IP_CONST_DAMAGERESIST_14  = 38;
const int IP_CONST_DAMAGERESIST_15a = 39;

const int IP_CONST_SOCKET_TYPE_SMALL = 1;
const int IP_CONST_SOCKET_TYPE_BIG   = 2;

const int IP_CONST_GEM_STATUS_RAW = 1;
const int IP_CONST_GEM_STATUS_ARRANGED = 2;
const int IP_CONST_GEM_STATUS_CUT_POLISHED = 3;

const int IP_CONST_HORN_TYPE_MEPHIT  = 1;
const int IP_CONST_HORN_TYPE_OX      = 2;
const int IP_CONST_HORN_TYPE_ROTHE   = 3;
const int IP_CONST_HORN_TYPE_BALOR   = 4;
const int IP_CONST_HORN_TYPE_ANTLERS = 5;
const int IP_CONST_HORN_TYPE_DRAGON  = 6;
const int IP_CONST_HORN_TYPE_RAM     = 7;

// *  Applies a random itemproperty to oItem, determining by its base type
void DCS_IPApplyRandomItemProperty(object oItem);

// *  Changes all itempropty stats by iPoints of oItem
// *  - ipExNumber: This is the stored itemproperty number, used for experimentation
void DCS_IPChangeItemPropertyStats(object oItem, itemproperty ipProp, int iPoints, int ipExNumber=-1, int iNegative=FALSE);

// *  Debugs all itemproperties of oItem to oDebugger
void DCS_IPDebugItemProperties(object oDebugger, object oItem);

// *  Degrades itemproperty value of ipProp by nDegradeBy
// *   - nChangeIntoNegative: If this is TRUE, the itemproperty will be changed into the opposite
// *     Example: ItemPropertyEnhancementBonus(1) - 2 = ItemPropertyEnhancementPenalty(1)
// *  bDestroyOnZero: If this is FALSE, the function won't delete the itemproperty on a value of 0 but decrease it by 1
void DCS_IPDegradeItemPropertyValue(object oItem, itemproperty ipProp, int nDegradeBy, int bChangeIntoNegative=TRUE, int bDestroyOnZero=TRUE);

// *  Compoares all current item properties on oItem with the stored ones and removes the non existent
void DCS_IPEXCheckItemProperties(object oItem);

// *  Decreases the item quality on oItem by iDecrease
// *  NOTE: Does not decrease the item quality below DCS_MIN_ITEM_QUALITY
void DCS_IPEXDecreaseItemQuality(object oItem, int iDecrease);

// *  Deletes all stored item property entries
void DCS_IPEXDeleteEntries(object oItem);

// *  Deletes the nth item property entry
void DCS_IPEXDeleteEntry(int iNth, object oItem);

// *  Deletes the nth item property
void DCS_IPEXDeleteItemProperty(int iNth, object oItem);

// *  Deletes all stored item properties and the temporary (consumed) experimentation points with them
void DCS_IPEXDeleteStoredItemProperties(object oItem);

// *  Replaces the nth item property with iIPTypeReplace (IP Type) and iIPSubTypeReplace (IP Subtype)
void DCS_IPEXReplaceItemProperty(int iNth, int iIPTypeReplace, int iIPSubTypeReplace, object oItem);

// *  Sets the consumed (already used) ip-points for the nth item property to iAmount
void DCS_IPEXSetConsumedItemPropertyPoints(int iNth, int iAmount, object oItem);

// *  Sets the amount of entries stored to iAmount
void DCS_IPEXSetEntriesStored(int iAmoun, object oItem);

// *  Sets the nth entry to sEntry and connects to item property iEntryIP to it
void DCS_IPEXSetEntry(int iNth, string sEntry, int iEntryIP, object oItem);

// *  Sets the amount of item properties stored to iAmount
void DCS_IPEXSetItemPropertiesStored(int iAmount, object oItem);

// *  Sets the status of the item property iNth to iStatus (DCS_IPEX_STATUS_*)
void DCS_IPEXSetItemPropertyStatus(int iNth, int iStatus, object oItem);

// *  Sets the temporary consumed (not used, but currently marked) for the nth item property to iAmount
void DCS_IPEXSetTemporaryConsumedItemPropertyPoints(int iNth, int iAmount, object oItem);

// *  Sets the amount of all temporary consumed points (all marked ip points) to iAmount
void DCS_IPEXSetTemporaryPointsConsumed(int iAmount, object oItem);

// *  Sets the amount of all consumed points (already used ones) from all item properties
// *  and all experimentation attempts to iAmount
void DCS_IPEXSetPointsConsumed(int iAmount, object oItem);

// *  Stores all item properties from oItem
void DCS_IPEXStoreItemProperties(object oItem);

// *  Stores a single item property to iNth with IPType and IPSubType
void DCS_IPEXStoreItemProperty(int iNth, int IPType, int IPSubType, object oItem);

// *  Copies all item properties from oSource to oDestination,
// *  except for some describing properties
// *  - bItemPropertyIncrease: if this is TRUE, the function won't just copy, but increase existing itemproperties
void DCS_IPCopyItemProperties(object oSource, object oDestination, int bItemPropertyIncrease=FALSE);

// *  Transfers all item properties from oContainer to oAmmo
// *  NOTE: if oDestinations base item-type differs from oSources, not all item properties may be copied
void DCS_IPTransferItemProperties(object oSource, object oDestination);

// *  Upgrades itemproperty value of ipProp by nUpgradeBy
// *  bDestroyOnZero: If this is FALSE, the function won't delete the itemproperty on a value of 0 but increase it by 1
void DCS_IPUpgradeItemPropertyValue(object oItem, itemproperty ipProp, int nUpgradeBy, int bDestroyOnZero=FALSE);

// *  Upgrades by n Upgrade or adds an itemproperty to oItem with the given values
void DCS_IPUpgradeOrAddItemProperty(object oItem, int nUpgrade, int ipFindType, int ipFindCostTableValue=-1, int ipFindSubType=-1, int nDefaultCostTable=-1, int nDefaultSubType=-1, int ipDurationType=DURATION_TYPE_PERMANENT);

// *  Returns item property: big socket. You must specify the amount of sockets.
// *  nSocketNum: The amount of sockets in the item property. Use values from 1-10
itemproperty ItemPropertyBigSocket(int nSocketNum);

// *  Returns an item property: gem status
// *  nGemStatus: The socket type. Use IP_CONST_GEM_STATUS_* values here
itemproperty ItemPropertyGemStatus(int nGemStatus);

// *  Returns item property: socket. You must specify the amount of sockets.
// *  nSocketNum: The amount of sockets in the item property. Use values from 1-10
itemproperty ItemPropertySocket(int nSocketNum);

// *  Returns item property: horn type. You must specify the horn type.
// *  nHornType: The horn type you want to apply. Use values IP_CONST_HORN_TYPE_* values here.
itemproperty ItemPropertyHorn(int nHornType);

// *  Returns an item property: socket type
// *  nSocketType: The socket type. Use IP_CONST_SOCKET_TYPE_* values here
itemproperty ItemPropertySocketType(int nSocketType);

// *  Creates an itemproperty with ipType, ipCostTable (Value) and ipSubType
itemproperty DCS_IPCreateItemProperty(int ipType, int ipCostTable, int ipSubType);

// *  Creates a new itemproperty with ipType, ipSubType, ipCostTable and iNewValue
// *   - iNewValue: represents the new value for itemproperty (i.e iNewValue = 3, new Enhancementbonus = 3)
itemproperty DCS_IPCreateNewItemProperty(int ipType, int ipCostTable, int ipSubType, int iNewValue=-1);

// *  Degrades itemproperty value of ipProp by nDegradeBy and returns the new created itemproperty (if available)
// *   - nChangeIntoNegative: If this is TRUE, the itemproperty will be changed into the opposite
// *     Example: ItemPropertyEnhancementBonus(1) - 2 = ItemPropertyEnhancementPenalty(1)
// *   - Note: This function is the same as DCS_IPDegradeItemPropertyValue() with return function
// *  bDestroyOnZero: If this is FALSE, the function won't delete the itemproperty on a value of 0 but decrease it by 1
itemproperty DCS_IPDegradeItemPropertyValueAndReturn(object oItem, itemproperty ipProp, int nDegradeBy, int bChangeIntoNegative=TRUE, int bDestroyOnZero=TRUE);

// *  Find the first item property on oItem with the specific parameters (ITEM_PROPERTY_*)
itemproperty DCS_IPFindItemProperty(object oItem, int ipType=-1, int ipCostTableValue=-1, int ipSubType=-1, int ipDurationType=DURATION_TYPE_PERMANENT);

// *  Find the first item property on oItem with the specific data of itemproperty ipSearch
// *  - bIgnoreItemPropertyValue: If this is TRUE, the function won't compare the itemproperties value (via DCS_IPGetItemPropertyValue())
itemproperty DCS_IPFindItemPropertyByIP(object oItem, itemproperty ipSearch, int bIgnoreItemPropertyValue=TRUE);

// *  Upgrades itemproperty value of ipProp by nUpgradeBy and returns the new created itemproperty
// *   - Note: This function is the same as DCS_IPUpgradeItemPropertyValue() with return function
// *  bDestroyOnZero: If this is FALSE, the function won't delete the itemproperty on a value of 0 but increase it by 1
itemproperty DCS_IPUpgradeItemPropertyValueAndReturn(object oItem, itemproperty ipProp, int nUpgradeBy, int bDestroyOnZero=TRUE);

// *  Returns all consumed (already used) item property points from the nth item property
int DCS_IPEXGetConsumedItemPropertyPoints(int iNth, object oItem);

// *  Returns the amount of item property entries stored
int DCS_IPEXGetEntriesStored(object oItem);

// *  Returns the item property number for the nth stored item property entry
int DCS_IPEXGetEntryIPNumber(int iNth, object oItem);

// *  Returns TRUE, if the item property with IPType and IPSubType is already stored
int DCS_IPEXGetIsItemPropertyStored(int IPType, int IPSubType, object oItem);

// *  Returns the amount of item properties stored
int DCS_IPEXGetItemPropertiesStored(object oItem);

// *  Returns the entry number for the item property with IPType and IPSubType
int DCS_IPEXGetItemPropertyNumber(int IPType, int IPSubType, object oItem);

// *  Returns the status of the nth stored item property
int DCS_IPEXGetItemPropertyStatus(int iNth, object oItem);

// *  Returns the subtype of the nth stored item property
int DCS_IPEXGetNthItemPropertySubType(int iNth, object oItem);

// *  Returns the type of the nth stored item property
int DCS_IPEXGetNthItemPropertyType(int iNth, object oItem);

// *  Returns ALL used points (temporary consumed + consumed) that were used in all current experimentation attempts
int DCS_IPEXGetOverallPointsUsed(object oItem);

// *  Returns all consumed points (already used) for all item properties in all current experimentation attempts
int DCS_IPEXGetPointsConsumed(object oItem);

// *  Returns the temporary consumed (currently marked points) points from the nth stored item property
int DCS_IPEXGetTemporaryConsumedItemPropertyPoints(int iNth, object oItem);

// *  Returns all temporary consumed (currently marked points) item property points
int DCS_IPEXGetTemporaryPointsConsumed(object oItem);

// *  Returns the useable item property points from the nth item property with the factor fFactor
int DCS_IPEXGetUseableItemPropertyPoints(int iNthIP, float fFactor, object oItem);

// *  Get the maximum update value of ipSpell
// *   - Example:
// *     * ipSpell: IP_CONST_CASTSPELL_BARKSKIN_3
// *     * return:  IP_CONST_CASTSPELL_BARKSKIN_12
int DCS_IPGetCastspellMaxUpdateValue(int ipSpell);

// *  Get the the maximum update value of ipSpell
// *  - Example:
// *    * ipSpell: IP_CONST_CASTSPELL_BARKSKIN_3
// *    * return:  2 updates
int DCS_IPGetCastspellUpdates(int ipSpell);

// *  Returns TRUE, if oItem is an armor
// *  - iIncludeShields: if TRUE, this functions returns TRUE, if oItem is a shield
int DCS_IPGetIsArmor(object oItem, int iIncludeShields=TRUE);

// *  Returns TRUE, if oWeapon is a cleric weapon
int DCS_IPGetIsClericWeapon(object oWeapon);

// *  Returns TRUE, if oItem is a container object
int DCS_IPGetIsContainer(object oItem);

// *  Returns TRUE, if oItem is a gem
int DCS_IPGetIsGem(object oItem);

// *  Returns TRUE, if oItem is a misc, equipable item
int DCS_IPGetIsMiscEquipableItem(object oItem);

// *  Returns TRUE, if oWeapon is a long weapon
int DCS_IPGetIsLongWeapon(object oWeapon);

// *  Returns TRUE, if oWeapon is a thief weapon
int DCS_IPGetIsThiefWeapon(object oWeapon);

// *  Returns the limit for ipType and ipSubType
// *   - iNegativeLimit: if this is TRUE, it will return the negative limit (i.e: Enhancementbonus limit is 0)
int DCS_IPGetItemPropertyLimit(int ipType, int ipSubType, int iNegativeLimit=FALSE);

// *  The the current value of itemproperty type (i.e: ITEM_PROPERTY_ENHANCEMENT value)
int DCS_IPGetItemPropertyTypeValue(object oItem, int IPType);

// *  The the current value of ipProp (i.e: Enhancementbonus value)
int DCS_IPGetItemPropertyValue(itemproperty ipProp);

// *  Returns the opposed iemproperty type, if available
int DCS_IPGetOpposedItemPropertyType(int ipType);

// *  Get the original spell number of ipSpell
// *  - Example:
// *    * ipSpell: IP_CONST_CASTSPELL_BARKSKIN_12
// *    * return:  IP_CONST_CASTSPELL_BARKSKIN_3
int DCS_IPGetOriginalSpell(int ipSpell);

// *  Returns itemproperty quality value of oItem
int DCS_IPGetQuality(object oItem);

// *  Returns a random spell from iSpellGrade and iSpellClass
int DCS_IPGetRandomSpellFromGrade(int iSpellGrade=1, int iSpellClass=DCS_SPELLCLASS_SORCWIZ);

// *  Returns TRUE; if oItem is ammunation (arrows, bolts, bullets, shuriken, throwing axes)
int IPGetIsAmmunation(object oItem);

float DCS_IPEXGetItemPropertyFactorProps(int IPType, int IPSubType, int iGetMax=FALSE);

// *  Round fValue by determining the first needed value (default 5)
// *  - examples for iIncreaseMinimum = 9
// *    3.75 would be rounded to 3.80
// *    3.85 would be rounded to 3.9 and to 4.0
// *  NOTE: iIncreaseMinimum only affects the first number behind the dot
float DCS_IPRoundValue(float fValue, int iIncreaseMinimum=5);

// *  Returns the iNth stored item property entry (text string!)
string DCS_IPEXGetEntry(int iNth, object oItem);

// *  Returns the item property name (via DCS_IPGetItemPropertyName())
// *  of the iNthIP local stored item property
string DCS_IPEXGetItemPropertyName(int iNthIP, object oItem);

// *  Returns name of iSpell
string DCS_IPGetSpellName(int iSpell);

// *  Returns itemproperty type (eventually subtype) name
string DCS_IPGetItemPropertyName(int IPType, int iSubType);

/******************************************************************************/
//*                         IMPLEMENTATION                                   *\\
/******************************************************************************/

void DCS_IPDebugItemProperties(object oDebugger, object oItem)
{
    itemproperty IPItemProp = GetFirstItemProperty(oItem);
    int IPType, IPCost, IPSub, IPP1Val, IPDur, IPCounter;

    while(GetIsItemPropertyValid(IPItemProp))
    {
        IPCounter++;
        IPType  = GetItemPropertyType(IPItemProp);
        IPCost  = GetItemPropertyCostTableValue(IPItemProp);
        IPSub   = GetItemPropertySubType(IPItemProp);
        IPP1Val = GetItemPropertyParam1Value(IPItemProp);
        IPDur   = GetItemPropertyDurationType(IPItemProp);

        SendMessageToPC(oDebugger,
        "Itemproperty: "+IntToString(IPCounter)+"\n"+
        "Complete: "+GetItemPropertyTypeName(IPItemProp)+"\n"+
        "IPType: "+IntToString(IPType)+"\n"+
        "IPCost: "+IntToString(IPCost)+"\n"+
        "IPSub: "+IntToString(IPSub)+"\n"+
        "IPParam1: "+IntToString(IPP1Val)+"\n"+
        "IPDuration: "+IntToString(IPDur));

        IPItemProp = GetNextItemProperty(oItem);
    }
}

/******************************************************************************/

float DCS_IPRoundValue(float fValue, int iIncreaseMinimum=5)
{
    string sValue  = DCS_RearrangeFloat(fValue);
    int iPoint     = FindSubString(sValue, ".");
    int iFirstNum  = StringToInt(GetSubString(sValue, 0, iPoint));
    int iSecNum    = StringToInt(GetSubString(sValue, iPoint+1, 1));
    int iThirdNum  = StringToInt(GetSubString(sValue, iPoint+2, 1));
    int iFourthNum = StringToInt(GetSubString(sValue, iPoint+3, 1));

    if(iFourthNum >= 5)
    {
        iFourthNum = 0;
        iThirdNum++;
    }

    if(iThirdNum >= 5)
    {
        iThirdNum = 0;
        iSecNum++;
    }

    if(iSecNum >= iIncreaseMinimum)
    {
        iSecNum = 0;
        iFirstNum++;
    }

    sValue = IntToString(iFirstNum)+"."+IntToString(iSecNum)+IntToString(iThirdNum)+IntToString(iFourthNum);

    return StringToFloat(sValue);
}


int DCS_IPGetIsClericWeapon(object oWeapon)
{
    if(GetBaseItemType(oWeapon) == BASE_ITEM_CLUB ||
       GetBaseItemType(oWeapon) == BASE_ITEM_LIGHTMACE ||
       GetBaseItemType(oWeapon) == BASE_ITEM_MORNINGSTAR ||
       GetBaseItemType(oWeapon) == BASE_ITEM_QUARTERSTAFF ||
       GetBaseItemType(oWeapon) == BASE_ITEM_SICKLE)
    {
        return TRUE;
    }

    return FALSE;
}

/******************************************************************************/

int DCS_IPGetIsBladeWeapon(object oWeapon)
{
    if(GetBaseItemType(oWeapon) == BASE_ITEM_BASTARDSWORD ||
       GetBaseItemType(oWeapon) == BASE_ITEM_GREATSWORD ||
       GetBaseItemType(oWeapon) == BASE_ITEM_HALBERD ||
       GetBaseItemType(oWeapon) == BASE_ITEM_KATANA ||
       GetBaseItemType(oWeapon) == BASE_ITEM_LONGSWORD ||
       GetBaseItemType(oWeapon) == BASE_ITEM_SCYTHE ||
       GetBaseItemType(oWeapon) == BASE_ITEM_SHORTSPEAR ||
       GetBaseItemType(oWeapon) == BASE_ITEM_TRIDENT ||
       GetBaseItemType(oWeapon) == BASE_ITEM_TWOBLADEDSWORD)
    {
        return TRUE;
    }

    return FALSE;
}

/******************************************************************************/

int DCS_IPGetIsBluntWeapon(object oWeapon)
{
    if(GetBaseItemType(oWeapon) == BASE_ITEM_BATTLEAXE ||
       GetBaseItemType(oWeapon) == BASE_ITEM_DIREMACE ||
       GetBaseItemType(oWeapon) == BASE_ITEM_DOUBLEAXE ||
       GetBaseItemType(oWeapon) == BASE_ITEM_DWARVENWARAXE ||
       GetBaseItemType(oWeapon) == BASE_ITEM_GREATAXE ||
       GetBaseItemType(oWeapon) == BASE_ITEM_HEAVYFLAIL ||
       GetBaseItemType(oWeapon) == BASE_ITEM_LIGHTHAMMER ||
       GetBaseItemType(oWeapon) == BASE_ITEM_LIGHTMACE ||
       GetBaseItemType(oWeapon) == BASE_ITEM_LIGHTFLAIL ||
       GetBaseItemType(oWeapon) == BASE_ITEM_WARHAMMER ||
       GetBaseItemType(oWeapon) == BASE_ITEM_WHIP)
    {
        return TRUE;
    }

    return FALSE;
}

/******************************************************************************/

int DCS_IPGetIsThiefWeapon(object oWeapon)
{
    if(GetBaseItemType(oWeapon) == BASE_ITEM_DAGGER ||
       GetBaseItemType(oWeapon) == BASE_ITEM_HANDAXE ||
       GetBaseItemType(oWeapon) == BASE_ITEM_KUKRI ||
       GetBaseItemType(oWeapon) == BASE_ITEM_RAPIER ||
       GetBaseItemType(oWeapon) == BASE_ITEM_KAMA ||
       GetBaseItemType(oWeapon) == BASE_ITEM_SHORTSWORD)
    {
        return TRUE;
    }

    return FALSE;
}

/******************************************************************************/

int DCS_IPGetIsContainer(object oItem)
{
    return GetCached2DAInt("baseitems", "container", GetBaseItemType(oItem)) == 1;
}

/******************************************************************************/

int DCS_IPGetIsMiscEquipableItem(object oItem)
{
    int nBaseType = GetBaseItemType(oItem);

    return nBaseType == BASE_ITEM_AMULET ||
           nBaseType == BASE_ITEM_BELT   ||
           nBaseType == BASE_ITEM_BOOTS  ||
           nBaseType == BASE_ITEM_BRACER ||
           nBaseType == BASE_ITEM_CLOAK  ||
           nBaseType == BASE_ITEM_GLOVES ||
           nBaseType == BASE_ITEM_HELMET ||
           nBaseType == BASE_ITEM_RING;
}

/******************************************************************************/

int DCS_IPGetIsArmor(object oItem, int iIncludeShields=TRUE)
{
    int nBaseType = GetBaseItemType(oItem);
    int nShield;

    if(iIncludeShields)
    nShield = GetCached2DAInt("baseitems", "weaponwield", nBaseType) == 7;

    return nBaseType == BASE_ITEM_ARMOR || nShield;
}

/******************************************************************************/

int DCS_IPGetIsGem(object oItem)
{
    int nBaseType = GetBaseItemType(oItem);

    return nBaseType == BASE_ITEM_GEM || nBaseType == 411 || nBaseType == 412;
}

/******************************************************************************/
/*                         CAST SPELL FUNCTIONS                               */
/******************************************************************************/

string DCS_IPGetSpellName(int ipSpell)
{
    //ipSpell++; //Necessary, because database starts at rowid '1'

    //AdvDebug(GetPCSpeaker(), "Spellname - ipSpell (def): "+inStr(ipSpell));

    string sName = GetInternString("IPRP_Spell_Name_"+inStr(ipSpell), GetModule());
    if(sName == "")
    {
        SQLExecDirect("select "+DCS_COL_2DA_NAME+" from "+DCS_TABLE_2DA_IPRP_SPELLS+" where "+DCS_COL_ROWID+"="+inStr(ipSpell+1));

        if(SQLFetch())
        {
            sName = GetStringByStrRef(SQLGetDataInt(1));
            SetInternString("IPRP_Spell_Name_"+inStr(ipSpell), sName, GetModule());
        }
    }

    //AdvDebug(GetPCSpeaker(), "Spellname 2 - ipSpell (def): "+inStr(ipSpell)+" sName: "+sName);

    return sName;
}

/******************************************************************************/

int DCS_IPGetOriginalSpell(int ipSpell)
{
    //ipSpell++; //Necessary, because database starts at rowid '1'

    int ipOrigin = GetInternModuleSwitch("IPRP_Spell_Original_"+inStr(ipSpell));

    //AdvDebug(GetPCSpeaker(), "Original Spell - ipSpell (def): "+inStr(ipSpell)+", ipOrigin: "+inStr(ipOrigin));

    if(ipOrigin == 0)
    {
        SQLExecDirect("select "+DCS_COL_ROWID+" from "+DCS_TABLE_2DA_IPRP_SPELLS+" where "+DCS_COL_2DA_SPELLINDEX+"=(select "+DCS_COL_2DA_SPELLINDEX+" from "+DCS_TABLE_2DA_IPRP_SPELLS+" where "+DCS_COL_ROWID+"="+inStr(ipSpell+1)+") limit 1");

        if(SQLFetch())
        {
            ipOrigin = SQLGetDataInt(1)-1;
            SetInternModuleSwitch("IPRP_Spell_Original_"+inStr(ipSpell), ipOrigin);
        }
    }

    //AdvDebug(GetPCSpeaker(), "Original Spell 2 - ipSpell: "+inStr(ipSpell)+", ipOrigin: "+inStr(ipOrigin));

    return ipOrigin;
}

/******************************************************************************/

int DCS_IPGetCastspellUpdates(int ipSpell)
{
    //ipSpell++; //Necessary, because database starts at rowid '1'

    int ipUpdate = GetInternModuleSwitch("IPRP_Spell_Updates_"+inStr(ipSpell));

    //AdvDebug(GetPCSpeaker(), "Castspell Updates ipSpell: "+inStr(ipSpell)+", ipUpdate: "+inStr(ipUpdate));

    if(ipUpdate == 0)
    {
        SQLExecDirect("select count(*) from "+DCS_TABLE_2DA_IPRP_SPELLS+" where "+DCS_COL_2DA_SPELLINDEX+"=(select "+DCS_COL_2DA_SPELLINDEX+" from "+DCS_TABLE_2DA_IPRP_SPELLS+" where "+DCS_COL_ROWID+"="+inStr(ipSpell+1)+") and "+DCS_COL_ROWID+">"+inStr(ipSpell+1)+" limit 1");

        if(SQLFetch())
        {
            ipUpdate = SQLGetDataInt(1);
            SetInternModuleSwitch("IPRP_Spell_Updates_"+inStr(ipSpell), ipUpdate);
        }
    }

    //AdvDebug(GetPCSpeaker(), "Castspell Updates 2 ipSpell: "+inStr(ipSpell)+", ipUpdate: "+inStr(ipUpdate));

    return ipUpdate;
}

/******************************************************************************/

int DCS_IPGetCastSpellModification(int ipSpell, int ipModification)
{
    //ipSpell++; //Necessary, because database starts at rowid '1'

    int ipNewSpell, ipOffset;

    //AdvDebug(GetPCSpeaker(), "Castspell Mod ipSpell: "+inStr(ipSpell)+", iModification: "+inStr(ipModification));

    // Get the Spells Offset
    SQLExecDirect("select (select count(*) from "+DCS_TABLE_2DA_IPRP_SPELLS+" where "+DCS_COL_2DA_SPELLINDEX+"=(select "+DCS_COL_2DA_SPELLINDEX+" from "+DCS_TABLE_2DA_IPRP_SPELLS+" where "+DCS_COL_ROWID+"="+inStr(ipSpell+1)+")) - (select count(*) from iprp_spells where "+DCS_COL_ROWID+">"+inStr(ipSpell+1)+" and "+DCS_COL_2DA_SPELLINDEX+"=(select "+DCS_COL_2DA_SPELLINDEX+" from "+DCS_TABLE_2DA_IPRP_SPELLS+" where "+DCS_COL_ROWID+"="+inStr(ipSpell+1)+"))-1+"+inStr(ipModification));

    if(SQLFetch())
    {
        ipOffset = SQLGetDataInt(1);
        SQLExecDirect("select "+DCS_COL_ROWID+" from "+DCS_TABLE_2DA_IPRP_SPELLS+" where "+DCS_COL_2DA_SPELLINDEX+"=(select "+DCS_COL_2DA_SPELLINDEX+" from "+DCS_TABLE_2DA_IPRP_SPELLS+" where "+DCS_COL_ROWID+"="+inStr(ipSpell+1)+") limit 1 offset "+inStr(ipOffset));

        if(SQLFetch())
        ipNewSpell = SQLGetDataInt(1) - 1;
    }

    //AdvDebug(GetPCSpeaker(), "Castspell Mod 2 ipSpell: "+inStr(ipSpell)+", iModification: "+inStr(ipModification)+", ipOffset"+inStr(ipOffset)+", iNewSpell: "+inStr(ipNewSpell));

    return ipNewSpell;
}

/******************************************************************************/

int DCS_IPGetCastspellMaxUpdateValue(int ipSpell)
{
    //ipSpell++; //Necessary, because database starts at rowid '1'

    int ipMaxUpdate = GetInternModuleSwitch("IPRP_Spell_Max_Update_"+inStr(ipSpell));

    //AdvDebug(GetPCSpeaker(), "Maxupdate ipSpell: "+inStr(ipSpell)+", ipMaxUpdate: "+inStr(ipMaxUpdate));

    if(ipMaxUpdate == 0)
    {
        SQLExecDirect("select "+DCS_COL_ROWID+" from "+DCS_TABLE_2DA_IPRP_SPELLS+" where "+DCS_COL_2DA_SPELLINDEX+"=(select "+DCS_COL_2DA_SPELLINDEX+" from "+DCS_TABLE_2DA_IPRP_SPELLS+" where "+DCS_COL_ROWID+"="+inStr(ipSpell+1)+") order by "+DCS_COL_ROWID+" desc");

        if(SQLFetch())
        {
            ipMaxUpdate = SQLGetDataInt(1) - 1;
            SetInternModuleSwitch("IPRP_Spell_Max_Update_"+inStr(ipSpell), ipMaxUpdate);
        }
    }

    //AdvDebug(GetPCSpeaker(), "Maxupdate 2 ipSpell: "+inStr(ipSpell)+", ipMaxUpdate: "+inStr(ipMaxUpdate));

    return ipMaxUpdate;
}

/******************************************************************************/
/*                           ITEM PROPERTY FUNCTIONS                          */
/******************************************************************************/

int DCS_IPGetQuality(object oItem)
{
    itemproperty ipQuality = GetFirstItemProperty(oItem);

    while(GetIsItemPropertyValid(ipQuality))
    {
        if(GetItemPropertyType(ipQuality) == ITEM_PROPERTY_QUALITY)
        break;

       ipQuality = GetNextItemProperty(oItem);
    }

    if(!GetIsItemPropertyValid(ipQuality))
    return 0;

    return GetItemPropertyCostTableValue(ipQuality);
}

/******************************************************************************/

string DCS_IPGetItemPropertyName(int IPType, int iSubType)
{
    switch(IPType)
    {
        case ITEM_PROPERTY_CAST_SPELL:                  return DCS_IPGetSpellName(iSubType);break;
        case ITEM_PROPERTY_ABILITY_BONUS:               return "Attribut ("+GetStringByStrRef(GetCached2DAInt("iprp_abilities", "Name", iSubType))+")";break;
        case ITEM_PROPERTY_AC_BONUS:                    return "Rüstungsklasse";break;
        case ITEM_PROPERTY_MIGHTY:                      return "Mächtig";break;
        case ITEM_PROPERTY_ATTACK_BONUS:                return "Angriffsbonus";break;
        case ITEM_PROPERTY_DAMAGE_BONUS:                return "Schaden ("+GetStringByStrRef(GetCached2DAInt("iprp_damagetype", "Name", iSubType))+")";break;
        case ITEM_PROPERTY_ENHANCEMENT_BONUS:           return "Verbesserungsbonus";break;
        case ITEM_PROPERTY_REGENERATION:                return "Regeneration";break;
        case ITEM_PROPERTY_REGENERATION_VAMPIRIC:       return "Vamp. Regeneration";break;
        case ITEM_PROPERTY_SAVING_THROW_BONUS:          return "RW ("+GetStringByStrRef(GetCached2DAInt("iprp_saveelement", "Name", iSubType))+")";break;
        case ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC: return "RW ("+GetStringByStrRef(GetCached2DAInt("iprp_savingthrow", "Name", iSubType))+")";break;
        case ITEM_PROPERTY_SKILL_BONUS:                 return "Fertigkeit ("+GetStringByStrRef(GetCached2DAInt("skills", "Name", iSubType))+")";break;
        case ITEM_PROPERTY_DAMAGE_RESISTANCE:           return "Resistenz ("+GetStringByStrRef(GetCached2DAInt("iprp_damagetype", "Name", iSubType))+")";break;
        case ITEM_PROPERTY_SOCKET:                      return "Edelsteinfassung";break;
        case ITEM_PROPERTY_BIG_SOCKET:                  return "Große Edelsteinfassung";break;
    }

    return "";
}

/******************************************************************************/

int DCS_IPGetItemPropertyLimit(int ipType, int ipSubType, int iNegativeLimit=FALSE)
{
    if(iNegativeLimit)
    {
        // The negative limit. -1 means IP has no negative values (e.g.: as ability bonus has ability decrease as negative limit defined below)
        switch(ipType)
        {
            case ITEM_PROPERTY_CAST_SPELL:            return DCS_IPGetOriginalSpell(ipSubType);break;
            case ITEM_PROPERTY_ARCANE_SPELL_FAILURE:
            case ITEM_PROPERTY_BIG_SOCKET:
            case ITEM_PROPERTY_DAMAGE_RESISTANCE:
            case ITEM_PROPERTY_ENHANCED_CONTAINER_REDUCED_WEIGHT:
            case ITEM_PROPERTY_MIGHTY:
            case ITEM_PROPERTY_QUALITY:
            case ITEM_PROPERTY_REGENERATION:
            case ITEM_PROPERTY_REGENERATION_VAMPIRIC:
            case ITEM_PROPERTY_SOCKET: return -1;break;
        }
    }
    else
    {
        switch(ipType)
        {
            case ITEM_PROPERTY_CAST_SPELL:                        return DCS_IPGetCastspellMaxUpdateValue(ipSubType);break;
            case ITEM_PROPERTY_ABILITY_BONUS:                     return 12;break;
            case ITEM_PROPERTY_AC_BONUS:                          return 20;break;
            case ITEM_PROPERTY_ATTACK_BONUS:                      return 20;break;
            case ITEM_PROPERTY_DAMAGE_BONUS:                      return 11;break; //2d8 real damage
            case ITEM_PROPERTY_DAMAGE_RESISTANCE:                 return 39;break;
            case ITEM_PROPERTY_ENHANCEMENT_BONUS:                 return 20;break;
            case ITEM_PROPERTY_REGENERATION:                      return 20;break;
            case ITEM_PROPERTY_REGENERATION_VAMPIRIC:             return 20;break;
            case ITEM_PROPERTY_SAVING_THROW_BONUS:                return 20;break;
            case ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC:       return 20;break;
            case ITEM_PROPERTY_SKILL_BONUS:                       return 50;break;
            case ITEM_PROPERTY_QUALITY:                           return 12;break;
            case ITEM_PROPERTY_MIGHTY:                            return 20;break;
            case ITEM_PROPERTY_ARCANE_SPELL_FAILURE:              return IP_CONST_ARCANE_SPELL_FAILURE_PLUS_50_PERCENT;
            case ITEM_PROPERTY_ENHANCED_CONTAINER_REDUCED_WEIGHT: return IP_CONST_CONTAINERWEIGHTRED_100_PERCENT;break;
            case ITEM_PROPERTY_BIG_SOCKET:                        return 5;break;
            case ITEM_PROPERTY_SOCKET:                            return 10;break;

            case ITEM_PROPERTY_DECREASED_ABILITY_SCORE:           return -10;break;
            case ITEM_PROPERTY_DECREASED_AC:                      return -5;break;
            case ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER:         return -5;break;
            case ITEM_PROPERTY_DECREASED_DAMAGE:                  return -5;break;
            case ITEM_PROPERTY_DECREASED_ENHANCEMENT_MODIFIER:    return -20;break;
            case ITEM_PROPERTY_DECREASED_SAVING_THROWS:           return -20;break;
            case ITEM_PROPERTY_DECREASED_SAVING_THROWS_SPECIFIC:  return -20;break;
            case ITEM_PROPERTY_DECREASED_SKILL_MODIFIER:          return -10;break;
        }
    }

    return 0;
}

/******************************************************************************/

int DCS_IPGetOpposedItemPropertyType(int ipType)
{
    int iRet = ipType;
    switch(ipType)
    {
        case ITEM_PROPERTY_ABILITY_BONUS:               iRet = ITEM_PROPERTY_DECREASED_ABILITY_SCORE;break;
        case ITEM_PROPERTY_AC_BONUS:                    iRet = ITEM_PROPERTY_DECREASED_AC;break;
        case ITEM_PROPERTY_ATTACK_BONUS:                iRet = ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER;break;
        case ITEM_PROPERTY_DAMAGE_BONUS:                iRet = ITEM_PROPERTY_DECREASED_DAMAGE;break;
        case ITEM_PROPERTY_ENHANCEMENT_BONUS:           iRet = ITEM_PROPERTY_DECREASED_ENHANCEMENT_MODIFIER;break;
        case ITEM_PROPERTY_SAVING_THROW_BONUS:          iRet = ITEM_PROPERTY_DECREASED_SAVING_THROWS;break;
        case ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC: iRet = ITEM_PROPERTY_DECREASED_SAVING_THROWS_SPECIFIC;break;
        case ITEM_PROPERTY_SKILL_BONUS:                 iRet = ITEM_PROPERTY_DECREASED_SKILL_MODIFIER;break;

        case ITEM_PROPERTY_DECREASED_ABILITY_SCORE:          iRet = ITEM_PROPERTY_ABILITY_BONUS;break;
        case ITEM_PROPERTY_DECREASED_AC:                     iRet = ITEM_PROPERTY_AC_BONUS;break;
        case ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER:        iRet = ITEM_PROPERTY_ATTACK_BONUS;break;
        case ITEM_PROPERTY_DECREASED_DAMAGE:                 iRet = ITEM_PROPERTY_DAMAGE_BONUS;break;
        case ITEM_PROPERTY_DECREASED_ENHANCEMENT_MODIFIER:   iRet = ITEM_PROPERTY_ENHANCEMENT_BONUS;break;
        case ITEM_PROPERTY_DECREASED_SAVING_THROWS:          iRet = ITEM_PROPERTY_SAVING_THROW_BONUS;break;
        case ITEM_PROPERTY_DECREASED_SAVING_THROWS_SPECIFIC: iRet = ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC;break;
        case ITEM_PROPERTY_DECREASED_SKILL_MODIFIER:         iRet = ITEM_PROPERTY_SKILL_BONUS;break;
    }

    return iRet;
}

/******************************************************************************/

itemproperty DCS_IPGetItemPropertyByType(object oItem, int IPType)
{
    itemproperty ipProp = GetFirstItemProperty(oItem);

    while(GetIsItemPropertyValid(ipProp))
    {
        if(GetItemPropertyType(ipProp) == IPType)
        break;

        ipProp = GetNextItemProperty(oItem);
    }

    return ipProp;
}
/******************************************************************************/

int DCS_IPGetItemPropertyTypeValue(object oItem, int IPType)
{
    itemproperty ipProp = GetFirstItemProperty(oItem);
    int iValue;

    while(GetIsItemPropertyValid(ipProp))
    {
        if(GetItemPropertyType(ipProp) == IPType)
        {
            if(GetItemPropertyType(ipProp) == ITEM_PROPERTY_CAST_SPELL)
                return GetItemPropertySubType(ipProp);
            else
                return GetItemPropertyCostTableValue(ipProp);
            break;
        }

        ipProp = GetNextItemProperty(oItem);
    }

    return 0;
}

/******************************************************************************/

int DCS_IPGetItemPropertyValue(itemproperty ipProp)
{
    switch(GetItemPropertyType(ipProp))
    {
        case ITEM_PROPERTY_CAST_SPELL:
            return GetItemPropertySubType(ipProp);
        break;
        default:
            return GetItemPropertyCostTableValue(ipProp);
        break;
    }

    return 0;
}

/******************************************************************************/

int DCS_IPGetRealDamageBonusValue(int ipDamageBonus)
{
    switch(ipDamageBonus)
    {
        case IP_CONST_DAMAGEBONUS_1:    return 1;break;
        case IP_CONST_DAMAGEBONUS_2:    return 2;break;
        case IP_CONST_DAMAGEBONUS_3:    return 3;break;
        case IP_CONST_DAMAGEBONUS_1d4:  return 4;break;
        case IP_CONST_DAMAGEBONUS_4:    return 5;break;
        case IP_CONST_DAMAGEBONUS_1d6:  return 6;break;
        case IP_CONST_DAMAGEBONUS_5:    return 7;break;
        case IP_CONST_DAMAGEBONUS_1d8:  return 8;break;
        case IP_CONST_DAMAGEBONUS_1d10: return 9;break;
        case IP_CONST_DAMAGEBONUS_2d6:  return 10;break;
        case IP_CONST_DAMAGEBONUS_2d8:  return 11;break;
    }

    if(ipDamageBonus <= 0)
    return 0;

    return 11;
}

/******************************************************************************/

int DCS_IPGetNewItemPropertyValue(itemproperty ipProp, int iValue, int iModification)
{
    int iType   = GetItemPropertyType(ipProp);
    int iNewVal = iValue + iModification;

    if(iType == ITEM_PROPERTY_SKILL_BONUS)
    {
        return iValue + iModification * 2;
    }
    if(iType == ITEM_PROPERTY_ARCANE_SPELL_FAILURE)
    {
        return iValue - abs(iValue - iModification);
    }
    else if(iType == ITEM_PROPERTY_DAMAGE_BONUS && iModification > 0)
    {
        switch(DCS_IPGetRealDamageBonusValue(iValue) + iModification)
        {
            case 0:  return 0;break;
            case 1:  return IP_CONST_DAMAGEBONUS_1;break;
            case 2:  return IP_CONST_DAMAGEBONUS_2;break;
            case 3:  return IP_CONST_DAMAGEBONUS_3;break;
            case 4:  return IP_CONST_DAMAGEBONUS_1d4;break;
            case 5:  return IP_CONST_DAMAGEBONUS_4;break;
            case 6:  return IP_CONST_DAMAGEBONUS_1d6;break;
            case 7:  return IP_CONST_DAMAGEBONUS_5;break;
            case 9:  return IP_CONST_DAMAGEBONUS_1d10;break;
            case 10: return IP_CONST_DAMAGEBONUS_2d6;break;
            case 11: return IP_CONST_DAMAGEBONUS_2d8;break;
            default: return IP_CONST_DAMAGEBONUS_2d8;break;
        }
    }
    else if(iType == ITEM_PROPERTY_DAMAGE_RESISTANCE && iNewVal > 0)
    {
        if(iValue >= IP_CONST_DAMAGERESIST_1 && iValue <= IP_CONST_DAMAGERESIST_15a)
        {
            if(iNewVal > IP_CONST_DAMAGERESIST_15a)
                return iNewVal - 36;
            else if(iNewVal < IP_CONST_DAMAGERESIST_1)
                return 0;
        }
    }
    else if(iType == ITEM_PROPERTY_CAST_SPELL)
    {
        iNewVal = DCS_IPGetCastSpellModification(iValue, iModification);
    }

    return iNewVal;
}

/******************************************************************************/

itemproperty DCS_IPCreateNewItemProperty(int ipType, int ipCostTable, int ipSubType, int iNewValue=-1)
{
    itemproperty ipNew;
    switch(ipType)
    {
        case ITEM_PROPERTY_ABILITY_BONUS:                     return ItemPropertyAbilityBonus(ipSubType, iNewValue);break;
        case ITEM_PROPERTY_AC_BONUS:                          return ItemPropertyACBonus(iNewValue);break;
        case ITEM_PROPERTY_ARCANE_SPELL_FAILURE:              return ItemPropertyArcaneSpellFailure(iNewValue);break;
        case ITEM_PROPERTY_ATTACK_BONUS:                      return ItemPropertyAttackBonus(iNewValue);break;
        case ITEM_PROPERTY_CAST_SPELL:                        return ItemPropertyCastSpell(iNewValue, ipCostTable);break;
        case ITEM_PROPERTY_DAMAGE_BONUS:                      return ItemPropertyDamageBonus(ipSubType, iNewValue);break;
        case ITEM_PROPERTY_DAMAGE_RESISTANCE:                 return ItemPropertyDamageResistance(ipSubType, iNewValue);break;
        case ITEM_PROPERTY_ENHANCEMENT_BONUS:                 return ItemPropertyEnhancementBonus(iNewValue);break;
        case ITEM_PROPERTY_ENHANCED_CONTAINER_REDUCED_WEIGHT: return ItemPropertyContainerReducedWeight(iNewValue);break;
        case ITEM_PROPERTY_MIGHTY:                            return ItemPropertyMaxRangeStrengthMod(iNewValue);break;
        case ITEM_PROPERTY_REGENERATION:                      return ItemPropertyRegeneration(iNewValue);break;
        case ITEM_PROPERTY_REGENERATION_VAMPIRIC:             return ItemPropertyVampiricRegeneration(iNewValue);break;
        case ITEM_PROPERTY_SAVING_THROW_BONUS:                return ItemPropertyBonusSavingThrowVsX(ipSubType, iNewValue);break;
        case ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC:       return ItemPropertyBonusSavingThrow(ipSubType, iNewValue);break;
        case ITEM_PROPERTY_SKILL_BONUS:                       return ItemPropertySkillBonus(ipSubType, iNewValue);break;
        case ITEM_PROPERTY_SOCKET:                            return ItemPropertySocket(iNewValue);break;
        case ITEM_PROPERTY_BIG_SOCKET:                        return ItemPropertyBigSocket(iNewValue);break;
        case ITEM_PROPERTY_SOCKET_TYPE:                       return ItemPropertySocketType(ipCostTable);break;
        case ITEM_PROPERTY_GEM_STATUS:                        return ItemPropertyGemStatus(ipCostTable);break;

        case ITEM_PROPERTY_DECREASED_ABILITY_SCORE:           return ItemPropertyDecreaseAbility(ipSubType, iNewValue);break;
        case ITEM_PROPERTY_DECREASED_AC:                      return ItemPropertyDecreaseAC(ipSubType, iNewValue);break;
        case ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER:         return ItemPropertyAttackPenalty(iNewValue);break;
        case ITEM_PROPERTY_DECREASED_DAMAGE:                  return ItemPropertyDamagePenalty(iNewValue);break;
        case ITEM_PROPERTY_DECREASED_ENHANCEMENT_MODIFIER:    return ItemPropertyEnhancementPenalty(iNewValue);break;
        case ITEM_PROPERTY_DECREASED_SAVING_THROWS:           return ItemPropertyReducedSavingThrow(ipSubType, iNewValue);break;
        case ITEM_PROPERTY_DECREASED_SAVING_THROWS_SPECIFIC:  return ItemPropertyReducedSavingThrowVsX(ipSubType, iNewValue);break;
        case ITEM_PROPERTY_DECREASED_SKILL_MODIFIER:          return ItemPropertyDecreaseSkill(ipSubType, iNewValue);break;
    }

    return ipNew;
}

/******************************************************************************/

itemproperty DCS_IPCreateItemProperty(int ipType, int ipCostTable, int ipSubType)
{
    itemproperty ipNew;
    switch(ipType)
    {
        case ITEM_PROPERTY_ABILITY_BONUS:                           return ItemPropertyAbilityBonus(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_AC_BONUS:                                return ItemPropertyACBonus(ipCostTable);break;
        case ITEM_PROPERTY_AC_BONUS_VS_ALIGNMENT_GROUP:             return ItemPropertyACBonusVsAlign(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_AC_BONUS_VS_DAMAGE_TYPE:                 return ItemPropertyACBonusVsDmgType(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_AC_BONUS_VS_RACIAL_GROUP:                return ItemPropertyACBonusVsRace(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_AC_BONUS_VS_SPECIFIC_ALIGNMENT:          return ItemPropertyACBonusVsSAlign(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_ARCANE_SPELL_FAILURE:                    return ItemPropertyArcaneSpellFailure(ipCostTable);break;
        case ITEM_PROPERTY_ATTACK_BONUS:                            return ItemPropertyAttackBonus(ipCostTable);break;
        case ITEM_PROPERTY_ATTACK_BONUS_VS_ALIGNMENT_GROUP:         return ItemPropertyAttackBonusVsAlign(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_ATTACK_BONUS_VS_RACIAL_GROUP:            return ItemPropertyAttackBonusVsRace(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_ATTACK_BONUS_VS_SPECIFIC_ALIGNMENT:      return ItemPropertyAttackBonusVsSAlign(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_BASE_ITEM_WEIGHT_REDUCTION:              return ItemPropertyWeightReduction(ipCostTable);break;
        case ITEM_PROPERTY_BONUS_FEAT:                              return ItemPropertyBonusFeat(ipSubType);break;
        case ITEM_PROPERTY_BONUS_SPELL_SLOT_OF_LEVEL_N:             return ItemPropertyBonusLevelSpell(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_CAST_SPELL:                              return ItemPropertyCastSpell(ipCostTable, ipSubType);break;
        case ITEM_PROPERTY_DAMAGE_BONUS:                            return ItemPropertyDamageBonus(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_DAMAGE_REDUCTION:                        return ItemPropertyDamageReduction(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_DAMAGE_RESISTANCE:                       return ItemPropertyDamageResistance(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_DAMAGE_VULNERABILITY:                    return ItemPropertyDamageVulnerability(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_DARKVISION:                              return ItemPropertyDarkvision();break;
        case ITEM_PROPERTY_DECREASED_ABILITY_SCORE:                 return ItemPropertyDecreaseAbility(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_DECREASED_AC:                            return ItemPropertyDecreaseAC(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_DECREASED_ATTACK_MODIFIER:               return ItemPropertyAttackPenalty(ipCostTable);break;
        case ITEM_PROPERTY_DECREASED_DAMAGE:                        return ItemPropertyDamagePenalty(ipCostTable);break;
        case ITEM_PROPERTY_DECREASED_ENHANCEMENT_MODIFIER:          return ItemPropertyEnhancementPenalty(ipCostTable);break;
        case ITEM_PROPERTY_DECREASED_SAVING_THROWS:                 return ItemPropertyReducedSavingThrow(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_DECREASED_SAVING_THROWS_SPECIFIC:        return ItemPropertyReducedSavingThrowVsX(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_DECREASED_SKILL_MODIFIER:                return ItemPropertyDecreaseSkill(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_ENHANCED_CONTAINER_REDUCED_WEIGHT:       return ItemPropertyContainerReducedWeight(ipCostTable);break;
        case ITEM_PROPERTY_ENHANCEMENT_BONUS:                       return ItemPropertyEnhancementBonus(ipCostTable);break;
        case ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_ALIGNMENT_GROUP:    return ItemPropertyEnhancementBonusVsAlign(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_RACIAL_GROUP:       return ItemPropertyEnhancementBonusVsRace(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_ENHANCEMENT_BONUS_VS_SPECIFIC_ALIGNEMENT:return ItemPropertyEnhancementBonusVsSAlign(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_EXTRA_MELEE_DAMAGE_TYPE:                 return ItemPropertyExtraMeleeDamageType(ipSubType);break;
        case ITEM_PROPERTY_EXTRA_RANGED_DAMAGE_TYPE:                return ItemPropertyExtraRangeDamageType(ipSubType);break;
        case ITEM_PROPERTY_FREEDOM_OF_MOVEMENT:                     return ItemPropertyFreeAction();break;
        case ITEM_PROPERTY_HASTE:                                   return ItemPropertyHaste();break;
        case ITEM_PROPERTY_HEALERS_KIT:                             return ItemPropertyHealersKit(ipCostTable);break;
        case ITEM_PROPERTY_HOLY_AVENGER:                            return ItemPropertyHolyAvenger();break;
        case ITEM_PROPERTY_IMMUNITY_DAMAGE_TYPE:                    return ItemPropertyDamageImmunity(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS:                  return ItemPropertyImmunityMisc(ipCostTable);break;
        case ITEM_PROPERTY_IMMUNITY_SPECIFIC_SPELL:                 return ItemPropertyImmunityToSpellLevel(ipCostTable);break;
        case ITEM_PROPERTY_IMMUNITY_SPELL_SCHOOL:                   return ItemPropertySpellImmunitySchool(ipCostTable);break;
        case ITEM_PROPERTY_IMMUNITY_SPELLS_BY_LEVEL:                return ItemPropertyImmunityToSpellLevel(ipCostTable);break;
        case ITEM_PROPERTY_IMPROVED_EVASION:                        return ItemPropertyImprovedEvasion();break;
        case ITEM_PROPERTY_KEEN:                                    return ItemPropertyKeen();break;
        case ITEM_PROPERTY_LIGHT:                                   return ItemPropertyLight(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_MASSIVE_CRITICALS:                       return ItemPropertyMassiveCritical(ipCostTable);break;
        case ITEM_PROPERTY_MATERIAL:                                return ItemPropertyMaterial(ipCostTable);break;
        case ITEM_PROPERTY_MIGHTY:                                  return ItemPropertyMaxRangeStrengthMod(ipCostTable);break;
        case ITEM_PROPERTY_MONSTER_DAMAGE:                          return ItemPropertyMonsterDamage(ipCostTable);break;
        case ITEM_PROPERTY_NO_DAMAGE:                               return ItemPropertyNoDamage();break;
        case ITEM_PROPERTY_ON_HIT_PROPERTIES:                       return ItemPropertyOnHitProps(ipCostTable, ipSubType);break;
        case ITEM_PROPERTY_ON_MONSTER_HIT:                          return ItemPropertyOnMonsterHitProperties(ipCostTable, ipSubType);break;
        case ITEM_PROPERTY_ONHITCASTSPELL:                          return ItemPropertyOnHitCastSpell(ipCostTable, ipSubType);break;
        case ITEM_PROPERTY_QUALITY:                                 return ItemPropertyQuality(ipCostTable);break;
        case ITEM_PROPERTY_REGENERATION:                            return ItemPropertyRegeneration(ipCostTable);break;
        case ITEM_PROPERTY_REGENERATION_VAMPIRIC:                   return ItemPropertyVampiricRegeneration(ipCostTable);break;
        case ITEM_PROPERTY_SAVING_THROW_BONUS:                      return ItemPropertyBonusSavingThrowVsX(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC:             return ItemPropertyBonusSavingThrow(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_SKILL_BONUS:                             return ItemPropertySkillBonus(ipSubType, ipCostTable);break;
        case ITEM_PROPERTY_SOCKET:                                  return ItemPropertySocket(ipCostTable);break;
        case ITEM_PROPERTY_BIG_SOCKET:                              return ItemPropertyBigSocket(ipCostTable);break;
        case ITEM_PROPERTY_SOCKET_TYPE:                             return ItemPropertySocketType(ipCostTable);break;
        case ITEM_PROPERTY_GEM_STATUS:                              return ItemPropertyGemStatus(ipCostTable);break;
        case ITEM_PROPERTY_SPECIAL_WALK:                            return ItemPropertySpecialWalk(ipCostTable);break;
        case ITEM_PROPERTY_SPELL_RESISTANCE:                        return ItemPropertyBonusSpellResistance(ipCostTable);break;
        case ITEM_PROPERTY_THIEVES_TOOLS:                           return ItemPropertyThievesTools(ipCostTable);break;
        case ITEM_PROPERTY_TRAP:                                    return ItemPropertyTrap(ipCostTable, ipSubType);break;
        case ITEM_PROPERTY_TRUE_SEEING:                             return ItemPropertyTrueSeeing();break;
        case ITEM_PROPERTY_TURN_RESISTANCE:                         return ItemPropertyTurnResistance(ipCostTable);break;
        case ITEM_PROPERTY_UNLIMITED_AMMUNITION:                    return ItemPropertyUnlimitedAmmo(ipCostTable);break;
        case ITEM_PROPERTY_VISUALEFFECT:                            return ItemPropertyVisualEffect(ipCostTable);break;
        case ITEM_PROPERTY_WEIGHT_INCREASE:                         return ItemPropertyWeightIncrease(ipCostTable);break;
    }

    return ipNew;
}

/******************************************************************************/

itemproperty ItemPropertySocket(int nSocketNum)
{
    //return NWNXFuncs_ItemPropertyCustom(ITEM_PROPERTY_SOCKET, -1, nSocketNum, -1);
    return DCS_IPFindItemProperty(DCS_GetCustomIPStorage(), ITEM_PROPERTY_SOCKET, nSocketNum);
}

/******************************************************************************/

itemproperty ItemPropertyBigSocket(int nSocketNum)
{
    //return NWNXFuncs_ItemPropertyCustom(ITEM_PROPERTY_BIG_SOCKET, -1, nSocketNum, -1);
    return DCS_IPFindItemProperty(DCS_GetCustomIPStorage(), ITEM_PROPERTY_BIG_SOCKET, nSocketNum);
}

/******************************************************************************/

itemproperty ItemPropertySocketType(int nSocketType)
{
    //return NWNXFuncs_ItemPropertyCustom(ITEM_PROPERTY_SOCKET_TYPE, -1, nSocketType, -1);
    return DCS_IPFindItemProperty(DCS_GetCustomIPStorage(), ITEM_PROPERTY_SOCKET_TYPE, nSocketType);
}

/******************************************************************************/

itemproperty ItemPropertyGemStatus(int nGemStatus)
{
    //return NWNXFuncs_ItemPropertyCustom(ITEM_PROPERTY_GEM_STATUS, -1, nGemStatus, -1);
    return DCS_IPFindItemProperty(DCS_GetCustomIPStorage(), ITEM_PROPERTY_GEM_STATUS, nGemStatus);
}

/******************************************************************************/

itemproperty ItemPropertyHorn(int nHornType)
{
    //return NWNXFuncs_ItemPropertyCustom(ITEM_PROPERTY_HORN, -1, nHornType, -1);
    return DCS_IPFindItemProperty(DCS_GetCustomIPStorage(), ITEM_PROPERTY_HORN, nHornType);
}

/******************************************************************************/
/*                     UP/DEGRADING ITEMPROPERTY FUNCTIONS                    */
/******************************************************************************/

void DCS_IPUpgradeItemPropertyValue(object oItem, itemproperty ipProp, int nUpgradeBy, int bDestroyOnZero=FALSE)
{
    int ipType  = GetItemPropertyType(ipProp);
    int ipSub   = GetItemPropertySubType(ipProp);
    int ipCost  = GetItemPropertyCostTableValue(ipProp);
    int iValue  = DCS_IPGetItemPropertyValue(ipProp);
    int ipLimit = DCS_IPGetItemPropertyLimit(ipType, ipSub);
    int iNewVal = DCS_IPGetNewItemPropertyValue(ipProp, iValue, abs(nUpgradeBy));

    IPRemoveMatchingItemProperty(oItem, ipType, DURATION_TYPE_PERMANENT, ipSub);

    if(iNewVal == 0 && !bDestroyOnZero)
    iNewVal++;

    AdvDebug(GetPCSpeaker(), "\n-----------------------------\nUpgrading IP Value ("+IntToString(ipType)+")\nValue: "+IntToString(iValue)+"\nUpgrading by: "+IntToString(nUpgradeBy)+"\nLimit: "+IntToString(ipLimit)+"\nNewVal: "+inStr(iNewVal)+"\n-----------------------------");

    if(iNewVal > ipLimit)
    iNewVal = ipLimit;

    IPSafeAddItemProperty(oItem, DCS_IPCreateNewItemProperty(ipType, ipCost, ipSub, iNewVal));
}

/******************************************************************************/

void DCS_IPDegradeItemPropertyValue(object oItem, itemproperty ipProp, int nDegradeBy, int bChangeIntoNegative=TRUE, int bDestroyOnZero=FALSE)
{
    int ipType  = GetItemPropertyType(ipProp);
    int ipSub   = GetItemPropertySubType(ipProp);
    int ipCost  = GetItemPropertyCostTableValue(ipProp);
    int iValue  = DCS_IPGetItemPropertyValue(ipProp);
    int ipLimit = DCS_IPGetItemPropertyLimit(ipType, ipSub, TRUE); // Going into Negative?
    int iNewVal = DCS_IPGetNewItemPropertyValue(ipProp, iValue, -abs(nDegradeBy));

    IPRemoveMatchingItemProperty(oItem, ipType, DURATION_TYPE_PERMANENT, ipSub);

    if(iNewVal == 0 && !bDestroyOnZero)
    iNewVal--;

    AdvDebug(GetPCSpeaker(), "\n-----------------------------\nDegrading IP Value ("+IntToString(ipType)+")\nValue: "+IntToString(iValue)+"\nDegrading by: "+IntToString(nDegradeBy)+"\nNewVal: "+inStr(iNewVal)+"\nLimit: "+IntToString(ipLimit));

    // Change IP to the opposite (penalty or decrease) if iNewVal < 0 and is allowed to change into negative
    if((iNewVal < ipLimit || iNewVal < 0) && ipLimit != -1 && bChangeIntoNegative)
    {
        ipType  = DCS_IPGetOpposedItemPropertyType(ipType);
        ipLimit = DCS_IPGetItemPropertyLimit(ipType, ipSub);
        AdvDebug(GetPCSpeaker(), "\nGot Negative IP ("+IntToString(ipType)+")\nNewLimit: "+IntToString(ipLimit));
    }

    // Add new IP if iNewVal > 0 or ipLimit not -1 (has no negative IP)
    if((iNewVal > 0 || ipLimit != -1) && iNewVal >= ipLimit)
    {
        if(iNewVal < ipLimit)
            iNewVal = abs(ipLimit);
        else
            iNewVal = abs(iNewVal);

        AdvDebug(GetPCSpeaker(), "End Value: "+IntToString(iNewVal));
        AdvDebug(GetPCSpeaker(), "Getting IP Name: "+GetItemPropertyTypeName(ipProp));

        IPSafeAddItemProperty(oItem, DCS_IPCreateNewItemProperty(ipType, ipCost, ipSub, iNewVal));
    }
}

/******************************************************************************/
/******************************************************************************/

itemproperty DCS_IPUpgradeItemPropertyValueAndReturn(object oItem, itemproperty ipProp, int nUpgradeBy, int bDestroyOnZero=FALSE)
{
    int ipType  = GetItemPropertyType(ipProp);
    int ipSub   = GetItemPropertySubType(ipProp);
    int ipCost  = GetItemPropertyCostTableValue(ipProp);
    int iValue  = DCS_IPGetItemPropertyValue(ipProp);
    int ipLimit = DCS_IPGetItemPropertyLimit(ipType, ipSub);
    int iNewVal = DCS_IPGetNewItemPropertyValue(ipProp, iValue, abs(nUpgradeBy));
    itemproperty ipNewIP;

    IPRemoveMatchingItemProperty(oItem, ipType, DURATION_TYPE_PERMANENT, ipSub);

    if(iNewVal == 0 && !bDestroyOnZero)
    iNewVal++;

    AdvDebug(GetPCSpeaker(), "\nUpgrading IP Value.\nValue: "+IntToString(iValue)+"\nUpgrading by: "+IntToString(nUpgradeBy)+"\nLimit: "+IntToString(ipLimit)+"\n-----------------------------");

    if(iNewVal > ipLimit)
    iNewVal = ipLimit;

    ipNewIP = DCS_IPCreateNewItemProperty(ipType, ipCost, ipSub, iNewVal);
    IPSafeAddItemProperty(oItem, ipNewIP);

    return ipNewIP;
}

/******************************************************************************/

itemproperty DCS_IPDegradeItemPropertyValueAndReturn(object oItem, itemproperty ipProp, int nDegradeBy, int bChangeIntoNegative=TRUE, int bDestroyOnZero=FALSE)
{
    int ipType  = GetItemPropertyType(ipProp);
    int ipSub   = GetItemPropertySubType(ipProp);
    int ipCost  = GetItemPropertyCostTableValue(ipProp);
    int iValue  = DCS_IPGetItemPropertyValue(ipProp);
    int ipLimit = DCS_IPGetItemPropertyLimit(ipType, ipSub, TRUE); // Going into Negative?
    int iNewVal = DCS_IPGetNewItemPropertyValue(ipProp, iValue, -abs(nDegradeBy));
    itemproperty ipNewIP;

    IPRemoveMatchingItemProperty(oItem, ipType, DURATION_TYPE_PERMANENT, ipSub);

    if(iNewVal == 0 && !bDestroyOnZero)
    iNewVal--;

    AdvDebug(GetPCSpeaker(), "\n-----------------------------\nDegrading IP Value ("+IntToString(ipType)+")\nValue: "+IntToString(iValue)+"\nDegrading by: "+IntToString(nDegradeBy)+"\nLimit: "+IntToString(ipLimit));

    // Change IP to the opposite (penalty or decrease) if iNewVal < 0 and is allowed to change into negative
    if((iNewVal < ipLimit || iNewVal < 0) && ipLimit != -1 && bChangeIntoNegative)
    {
        ipType  = DCS_IPGetOpposedItemPropertyType(ipType);
        ipLimit = DCS_IPGetItemPropertyLimit(ipType, ipSub);
        AdvDebug(GetPCSpeaker(), "\nGot Negative IP ("+IntToString(ipType)+")\nNewLimit: "+IntToString(ipLimit));
    }

    // Add new IP if iNewVal > 0 or ipLimit not -1 (has no negative IP)
    if((iNewVal > 0 || ipLimit != -1) && iNewVal >= ipLimit)
    {
        if(iNewVal < ipLimit)
            iNewVal = abs(ipLimit);
        else
            iNewVal = abs(iNewVal);

        AdvDebug(GetPCSpeaker(), "End Value: "+IntToString(iNewVal));
        AdvDebug(GetPCSpeaker(), "Getting IP Name: "+GetItemPropertyTypeName(ipProp));
        ipNewIP = DCS_IPCreateNewItemProperty(ipType, ipCost, ipSub, iNewVal);
        IPSafeAddItemProperty(oItem, ipNewIP);
    }

    return ipNewIP;
}

/******************************************************************************/

void DCS_IPUpgradeOrAddItemProperty(object oItem, int nUpgrade, int ipFindType, int ipFindCostTableValue=-1, int ipFindSubType=-1, int nDefaultCostTable=-1, int nDefaultSubType=-1, int ipDurationType=DURATION_TYPE_PERMANENT)
{
    itemproperty IPFind = DCS_IPFindItemProperty(oItem, ipFindType, ipFindCostTableValue, ipFindSubType, ipDurationType);

    AdvDebug(GetPCSpeaker(), "Upgrade or Add itemprop");

    if(ipFindType != -1 && GetIsItemPropertyValid(IPFind))
        DCS_IPUpgradeItemPropertyValue(oItem, IPFind, nUpgrade, FALSE);
    else
        IPSafeAddItemProperty(oItem, DCS_IPCreateItemProperty(ipFindType, nDefaultCostTable, nDefaultSubType));
}

/******************************************************************************/

void DCS_IPApplyRandomItemProperty(object oItem)
{
     int nRandom = d3();

     // Random Itemproperty
     switch(nRandom)
     {
        case 1:
            AdvDebug(GetPCSpeaker(), "Random IP: Ability Bonus");
            IPUpgradeItemAbilityBonus(oItem, GetItemPropertySubType(DCS_IPFindItemProperty(oItem, ITEM_PROPERTY_ABILITY_BONUS)), 1);
        break;

        case 2:
            if(IPGetIsMeleeWeapon(oItem))
            {
                AdvDebug(GetPCSpeaker(), "Random IP: Damage Bonus");
                DCS_IPUpgradeItemPropertyValue(oItem, DCS_IPFindItemProperty(oItem, ITEM_PROPERTY_DAMAGE_BONUS), 1);
            }
            else if(IPGetIsRangedWeapon(oItem))
            {
                switch(d2())
                {
                    case 1: AdvDebug(GetPCSpeaker(), "Random IP: Mighty Bonus");
                    DCS_IPUpgradeOrAddItemProperty(oItem, 1, ITEM_PROPERTY_MIGHTY);break;
                    case 2: AdvDebug(GetPCSpeaker(), "Random IP: Attack Bonus");
                    DCS_IPUpgradeOrAddItemProperty(oItem, 1, ITEM_PROPERTY_ATTACK_BONUS);break;
                }
            }
            else if(DCS_IPGetIsArmor(oItem))
            {
                AdvDebug(GetPCSpeaker(), "Random IP: Resistance Bonus");
                DCS_IPUpgradeItemPropertyValue(oItem, DCS_IPFindItemProperty(oItem, ITEM_PROPERTY_DAMAGE_RESISTANCE), 1);
            }
        break;

        case 3:
            if(IPGetIsMeleeWeapon(oItem))
            {
                switch(d2())
                {
                    case 1: AdvDebug(GetPCSpeaker(), "Random IP: Regeneration Bonus");
                    DCS_IPUpgradeOrAddItemProperty(oItem, 1, ITEM_PROPERTY_REGENERATION_VAMPIRIC);break;
                    case 2: AdvDebug(GetPCSpeaker(), "Random IP: Vamp Regeneration Bonus");
                    DCS_IPUpgradeOrAddItemProperty(oItem, 1, ITEM_PROPERTY_REGENERATION);break;
                }
            }
            else if(DCS_IPGetIsArmor(oItem) || IPGetIsRangedWeapon(oItem))
            {
                AdvDebug(GetPCSpeaker(), "Random IP: Regeneration Bonus");
                DCS_IPUpgradeOrAddItemProperty(oItem, 1, ITEM_PROPERTY_REGENERATION);
            }
        break;

        case 4:
            AdvDebug(GetPCSpeaker(), "Random IP: Saving Throw Bonus");
            DCS_IPUpgradeOrAddItemProperty(oItem, 1, ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC, -1, IP_CONST_SAVEVS_UNIVERSAL);
        break;
     }
}

/******************************************************************************/

void DCS_IPChangeItemPropertyStats(object oItem, itemproperty ipProp, int iPoints, int ipExNumber=-1, int iNegative=FALSE)
{
    itemproperty ipChangedIP;

    if(iNegative)
        ipChangedIP = DCS_IPDegradeItemPropertyValueAndReturn(oItem, ipProp, iPoints);
    else
        ipChangedIP = DCS_IPUpgradeItemPropertyValueAndReturn(oItem, ipProp, iPoints);

    if(GetIsItemPropertyValid(ipChangedIP))
    {
        if(GetItemPropertyType(ipChangedIP) == ITEM_PROPERTY_CAST_SPELL)
        {
            DCS_IPEXReplaceItemProperty(ipExNumber, GetItemPropertyType(ipChangedIP), GetItemPropertySubType(ipChangedIP), oItem);
            DCS_IPEXSetConsumedItemPropertyPoints(ipExNumber, 0, oItem);
        }
    }
}

/******************************************************************************/
//*                      ITEMPROPERTY + EXPERIMENTATION                      *\\
/******************************************************************************/

int DCS_IPEXGetItemPropertiesStored(object oItem)
{
    return GetLocalInt(oItem, "DCS_IPEX_Itemprops_Stored");
}

int DCS_IPEXGetNthItemPropertyType(int iNth, object oItem)
{
    return GetLocalInt(oItem, "DCS_IPEX_Itemprop_Type_"+IntToString(iNth));
}

int DCS_IPEXGetNthItemPropertySubType(int iNth, object oItem)
{
    return GetLocalInt(oItem, "DCS_IPEX_Itemprop_SubType_"+IntToString(iNth));
}

int DCS_IPEXGetItemPropertyStatus(int iNth, object oItem)
{
    return GetLocalInt(oItem, "DCS_IPEX_Status_Itemprop_Type_"+IntToString(iNth));
}

int DCS_IPEXGetEntriesStored(object oItem)
{
    return GetLocalInt(oItem, "DCS_IPEX_Itemprop_Entries_Stored");
}

int DCS_IPEXGetEntryIPNumber(int iNth, object oItem)
{
    return GetLocalInt(oItem, "DCS_IPEX_Itemprop_Entry_IP_"+IntToString(iNth));
}

string DCS_IPEXGetEntry(int iNth, object oItem)
{
    return GetLocalString(oItem, "DCS_IPEX_Itemprop_Entry_"+IntToString(iNth));
}

/******************************************************************************/

int DCS_IPEXGetItemPropertyNumber(int IPType, int IPSubType, object oItem)
{
    int iCount;

    for(iCount=1; iCount<=DCS_IPEXGetItemPropertiesStored(oItem); iCount++)
    {
        if(IPType == DCS_IPEXGetNthItemPropertyType(iCount, oItem) && IPSubType == DCS_IPEXGetNthItemPropertySubType(iCount, oItem))
        return iCount;
    }

    return 0;
}

int DCS_IPEXGetIsItemPropertyStored(int IPType, int IPSubType, object oItem)
{
    int iCount;

    for(iCount=1; iCount<=DCS_IPEXGetItemPropertiesStored(oItem); iCount++)
    {
        if(IPType == DCS_IPEXGetNthItemPropertyType(iCount, oItem) && IPSubType == DCS_IPEXGetNthItemPropertySubType(iCount, oItem))
        return TRUE;
    }

    return FALSE;
}

/******************************************************************************/
/******************************************************************************/

void DCS_IPEXStoreItemProperty(int iNth, int IPType, int IPSubType, object oItem)
{
    SetLocalInt(oItem, "DCS_IPEX_Itemprop_Type_"+IntToString(iNth), IPType);
    SetLocalInt(oItem, "DCS_IPEX_Itemprop_SubType_"+IntToString(iNth), IPSubType);
    DCS_IPEXSetItemPropertiesStored(DCS_IPEXGetItemPropertiesStored(oItem) + 1, oItem);
}

void DCS_IPEXReplaceItemProperty(int iNth, int iIPTypeReplace, int iIPSubTypeReplace, object oItem)
{
    SetLocalInt(oItem, "DCS_IPEX_Itemprop_Type_"+IntToString(iNth), iIPTypeReplace);
    SetLocalInt(oItem, "DCS_IPEX_Itemprop_SubType_"+IntToString(iNth), iIPSubTypeReplace);
}

void DCS_IPEXSetItemPropertiesStored(int iAmount, object oItem)
{
    SetLocalInt(oItem, "DCS_IPEX_Itemprops_Stored", iAmount);
}

void DCS_IPEXSetItemPropertyStatus(int iNth, int iStatus, object oItem)
{
    SetLocalInt(oItem, "DCS_IPEX_Status_Itemprop_Type_"+IntToString(iNth), iStatus);
    SetLocalInt(oItem, "DCS_IPEX_Status_Itemprop_SubType_"+IntToString(iNth), iStatus);
}

void DCS_IPEXDeleteItemProperty(int iNth, object oItem)
{
    DeleteLocalInt(oItem, "DCS_IPEX_Itemprop_Type_"+IntToString(iNth));
    DeleteLocalInt(oItem, "DCS_IPEX_Itemprop_SubType_"+IntToString(iNth));
}

void DCS_IPEXSetEntriesStored(int iAmount, object oItem)
{
    SetLocalInt(oItem, "DCS_IPEX_Itemprop_Entries_Stored", iAmount);
}

void DCS_IPEXSetEntry(int iNth, string sEntry, int iEntryIP, object oItem)
{
    SetLocalString(oItem, "DCS_IPEX_Itemprop_Entry_"+IntToString(iNth), sEntry);
    SetLocalInt   (oItem, "DCS_IPEX_Itemprop_Entry_IP_"+IntToString(iNth), iEntryIP);
    DCS_IPEXSetEntriesStored(iNth, oItem);
}

void DCS_IPEXDeleteEntry(int iNth, object oItem)
{
    DeleteLocalString(oItem, "DCS_IPEX_Itemprop_Entry_"+IntToString(iNth));
    DeleteLocalInt   (oItem, "DCS_IPEX_Itemprop_Entry_IP_"+IntToString(iNth));
}

/******************************************************************************/
//*                       General Itemprops + Entries                        *\\
/******************************************************************************/

void DCS_IPEXDeleteEntries(object oItem)
{
    int iStored = DCS_IPEXGetEntriesStored(oItem);
    int iCount;

    for(iCount=1; iCount <= iStored; iCount++)
    {
        DCS_IPEXDeleteEntry(iCount, oItem);
    }

    DCS_IPEXSetEntriesStored(0, oItem);
}

/******************************************************************************/

void DCS_IPEXDeleteStoredItemProperties(object oItem)
{
    int iStored = DCS_IPEXGetItemPropertiesStored(oItem);
    int iCount;

    for(iCount=1; iCount <= iStored; iCount++)
    {
        DCS_IPEXSetConsumedItemPropertyPoints(iCount, 0, oItem);
        DCS_IPEXSetTemporaryConsumedItemPropertyPoints(iCount, 0, oItem);
        DCS_IPEXSetItemPropertyStatus(iCount, 0, oItem);
        DCS_IPEXDeleteItemProperty(iCount, oItem);
    }

    DCS_IPEXSetItemPropertiesStored(0, oItem);
    DCS_IPEXSetPointsConsumed(0, oItem);
    DCS_IPEXSetTemporaryPointsConsumed(0, oItem);
}

/******************************************************************************/

void DCS_IPEXCheckItemProperties(object oItem)
{
    int iStore = DCS_IPEXGetItemPropertiesStored(oItem);
    int iIPType, iCount;

    for(iCount=1; iCount <= iStore; iCount++)
    {
        iIPType = DCS_IPEXGetNthItemPropertyType(iCount, oItem);
        AdvDebug(GetPCSpeaker(), "Checking IP status("+IntToString(iIPType)+"); Num: "+IntToString(iCount));

        if(!GetItemHasItemProperty(oItem, iIPType))
        {
            AdvDebug(GetPCSpeaker(), "IP doesn't exist anymore ("+IntToString(iIPType)+"); Num: "+IntToString(iCount));
            DCS_IPEXSetItemPropertyStatus(iCount, DCS_IPEX_STATUS_DELETED, oItem);
        }
    }
}

/******************************************************************************/

void DCS_IPEXStoreItemProperties(object oItem)
{
    itemproperty IPProp = GetFirstItemProperty(oItem);
    int IPType          = GetItemPropertyType(IPProp);
    int IPSubType       = GetItemPropertySubType(IPProp);
    int iStore          = DCS_IPEXGetItemPropertiesStored(oItem) + 1; //Adds new itemprops, but leaves old ones

    while(GetIsItemPropertyValid(IPProp))
    {
        if(!DCS_IPEXGetIsItemPropertyStored(IPType, IPSubType, oItem))
        {
            AdvDebug(GetPCSpeaker(), "Storing IP("+inStr(IPType)+", "+inStr(IPSubType)+") to "+IntToString(iStore));
            DCS_IPEXStoreItemProperty(iStore, IPType, IPSubType, oItem);
            iStore++;
        }

        IPProp    = GetNextItemProperty(oItem);
        IPType    = GetItemPropertyType(IPProp);
        IPSubType = GetItemPropertySubType(IPProp);
    }

    DCS_IPEXCheckItemProperties(oItem);
}

/******************************************************************************/
//*                        Experimentation + Points                          *\\
/******************************************************************************/

void DCS_IPEXSetTemporaryConsumedItemPropertyPoints(int iNth, int iAmount, object oItem)
{
    SetLocalInt(oItem, "DCS_IPEX_Consumed_ItemProperty_Points_Temp_"+IntToString(iNth), iAmount);
}

void DCS_IPEXSetConsumedItemPropertyPoints(int iNth, int iAmount, object oItem)
{
    SetLocalInt(oItem, "DCS_IPEX_Consumed_ItemProperty_Points_"+IntToString(iNth), iAmount);
}

void DCS_IPEXSetTemporaryPointsConsumed(int iAmount, object oItem)
{
    SetLocalInt(oItem, "DCS_IPEX_Consumed_Points_Temporary", iAmount);
}

void DCS_IPEXSetPointsConsumed(int iAmount, object oItem)
{
    SetLocalInt(oItem, "DCS_IPEX_Consumed_Points", iAmount);
}

/******************************************************************************/

int DCS_IPEXGetTemporaryConsumedItemPropertyPoints(int iNth, object oItem)
{
    return GetLocalInt(oItem, "DCS_IPEX_Consumed_ItemProperty_Points_Temp_"+IntToString(iNth));
}

int DCS_IPEXGetConsumedItemPropertyPoints(int iNth, object oItem)
{
    return GetLocalInt(oItem, "DCS_IPEX_Consumed_ItemProperty_Points_"+IntToString(iNth));
}

int DCS_IPEXGetTemporaryPointsConsumed(object oItem)
{
    return GetLocalInt(oItem, "DCS_IPEX_Consumed_Points_Temporary");
}

int DCS_IPEXGetPointsConsumed(object oItem)
{
    return GetLocalInt(oItem, "DCS_IPEX_Consumed_Points");
}

int DCS_IPEXGetOverallPointsUsed(object oItem)
{
    return DCS_IPEXGetTemporaryPointsConsumed(oItem) + DCS_IPEXGetPointsConsumed(oItem);
}

/******************************************************************************/
/******************************************************************************/

string DCS_IPEXGetItemPropertyName(int iNthIP, object oItem)
{
    int iIPType    = DCS_IPEXGetNthItemPropertyType(iNthIP, oItem);
    int iIPSubType = DCS_IPEXGetNthItemPropertySubType(iNthIP, oItem);

    return DCS_IPGetItemPropertyName(iIPType, iIPSubType);
}

/******************************************************************************/

float DCS_IPEXGetItemPropertyFactorProps(int IPType, int IPSubType, int iGetMax=FALSE)
{
    float fRet, fMax;

    switch(IPType)
    {
        case ITEM_PROPERTY_CAST_SPELL:                  fMax = inFloat(DCS_IPGetCastspellUpdates(IPSubType)); fRet = fMax/dcsQualityExcellent; break;//DCS_IPGetCastspellUpdates(IPSubType) / DCS_SETTING_EXPERIMENTATION_SPELL_DIVIDOR; fMax = IntToFloat(DCS_IPGetCastspellUpdates(IPSubType));
        case ITEM_PROPERTY_ABILITY_BONUS:               fMax = 3.0; fRet = fMax/dcsQualityMasterwork; break;//0.272727272727; break;//0.54;
        case ITEM_PROPERTY_AC_BONUS:                    fMax = 3.0; fRet = fMax/dcsQualityMasterwork; break;//0.272727272727; break;//0.54;
        case ITEM_PROPERTY_ATTACK_BONUS:                fMax = 6.0; fRet = fMax/dcsQualityMasterwork; break;//0.545454545454; break; //0.7
        case ITEM_PROPERTY_DAMAGE_RESISTANCE:           fMax = 4.0; fRet = fMax/dcsQualityMasterwork; break;//0.363636363636; break;//0.72
        case ITEM_PROPERTY_DAMAGE_BONUS:                fMax = 2.0; fRet = fMax/dcsQualityMasterwork; break;//0.181818181818; break;//0.36
        case ITEM_PROPERTY_MIGHTY:                      fMax = 4.0; fRet = fMax/dcsQualityMasterwork; break;//0.363636363636; break;//0.72
        case ITEM_PROPERTY_ENHANCEMENT_BONUS:           fMax = 3.0; fRet = fMax/dcsQualityMasterwork; break;//0.272727272727; break;//0.54
        case ITEM_PROPERTY_REGENERATION:                fMax = 2.0; fRet = fMax/dcsQualityMasterwork; break;//0.181818181818; break;//0.36
        case ITEM_PROPERTY_REGENERATION_VAMPIRIC:       fMax = 3.0; fRet = fMax/dcsQualityMasterwork; break;//0.272727272727; break;//0.36
        case ITEM_PROPERTY_SKILL_BONUS:                 fMax = 10.0;fRet = fMax/dcsQualityMasterwork; break;//0.909090909091; break;//1.0
        case ITEM_PROPERTY_SAVING_THROW_BONUS:          fMax = 4.0; fRet = fMax/dcsQualityMasterwork; break;//0.363636363636; break;//0.8
        case ITEM_PROPERTY_SAVING_THROW_BONUS_SPECIFIC: fMax = 4.0; fRet = fMax/dcsQualityMasterwork; break;//0.363636363636; break;//0.8
        case ITEM_PROPERTY_SOCKET:                      fMax = 1.0; fRet = fMax/dcsQualityVeryGood;break;//0.363636363636; break;//0.8
        case ITEM_PROPERTY_BIG_SOCKET:                  fMax = 1.0; fRet = fMax/dcsQualityMasterwork;break;
    }

    return iGetMax ? fMax : fRet;
}

/******************************************************************************/

int DCS_IPEXGetUseableItemPropertyPoints(int iNthIP, float fFactor, object oItem)
{
    if(DCS_IPEXGetItemPropertyStatus(iNthIP, oItem))
    return 0;

    int iIPType    = DCS_IPEXGetNthItemPropertyType(iNthIP, oItem);
    int iIPSubType = DCS_IPEXGetNthItemPropertySubType(iNthIP, oItem);
    int iConsumed  = DCS_IPEXGetConsumedItemPropertyPoints(iNthIP, oItem);
    int iPoints    = FloatToInt(DCS_IPRoundValue(fFactor * DCS_IPEXGetItemPropertyFactorProps(iIPType, iIPSubType), 9));
    int iMax       = FloatToInt(DCS_IPEXGetItemPropertyFactorProps(iIPType, iIPSubType, TRUE));

    AdvDebug(DCS_GetCraftingPlayer(), "calc ip points: "+inStr(iPoints)+", consumed ip points: "+inStr(iConsumed));

    if(iPoints > iMax)
    iPoints = iMax;

    AdvDebug(DCS_GetCraftingPlayer(), "max ip points: "+inStr(iPoints));

    return iPoints - iConsumed;
}

/******************************************************************************/

itemproperty DCS_IPFindItemPropertyByIP(object oItem, itemproperty ipSearch, int bIgnoreItemPropertyValue=TRUE)
{
    int ipType = GetItemPropertyType(ipSearch);
    int ipSubType = GetItemPropertySubType(ipSearch);
    int ipCostTable = GetItemPropertyCostTableValue(ipSearch);

    if(ipType == ITEM_PROPERTY_CAST_SPELL)
    return DCS_IPFindItemProperty(oItem, ipType, ipCostTable, (bIgnoreItemPropertyValue ? -1 : ipSubType));

    return DCS_IPFindItemProperty(oItem, ipType, (bIgnoreItemPropertyValue ? -1 : ipCostTable), ipSubType);
}

/******************************************************************************/

itemproperty DCS_IPFindItemProperty(object oItem, int ipType=-1, int ipCostTableValue=-1, int ipSubType=-1, int ipDurationType=DURATION_TYPE_PERMANENT)
{
    itemproperty ipProp = GetFirstItemProperty(oItem);

    //AdvDebug(GetPCSpeaker(), "searching for: ipProp type: "+inStr(ipType)+", costtable: "+inStr(ipCostTableValue)+", subtype: "+inStr(ipSubType));
    while(GetIsItemPropertyValid(ipProp))
    {
        //AdvDebug(GetPCSpeaker(), "ipProp type: "+inStr(GetItemPropertyType(ipProp))+", costtable: "+inStr(GetItemPropertyCostTableValue(ipProp))+", subtype: "+inStr(GetItemPropertySubType(ipProp)));
        if((GetItemPropertyType(ipProp) == ipType || ipType == -1) &&
           (GetItemPropertyCostTableValue(ipProp) == ipCostTableValue || ipCostTableValue == -1) &&
           (GetItemPropertyDurationType(ipProp) == ipDurationType   || ipDurationType == -1) &&
           (GetItemPropertySubType(ipProp) == ipSubType        || ipSubType == -1))
        break;

       ipProp = GetNextItemProperty(oItem);
    }

    return ipProp;
}

/******************************************************************************/

void DCS_IPEXDecreaseItemQuality(object oItem, int iDecrease)
{
    itemproperty ipQuality = DCS_IPFindItemProperty(oItem, ITEM_PROPERTY_QUALITY);
    if(!GetIsItemPropertyValid(ipQuality))return;

    int iCurrent = GetItemPropertyCostTableValue(ipQuality);
    int iNew;

    // Minimum value nicht unterschreiten
    if (iDecrease > iCurrent)
    {
       iNew = DCS_MIN_ITEM_QUALITY;
    }
    else
    {
        iNew = iCurrent - iDecrease;

        if (iNew < DCS_MIN_ITEM_QUALITY)
        iNew = DCS_MIN_ITEM_QUALITY;
    }

    IPSafeAddItemProperty(oItem, ItemPropertyQuality(iNew));

    /*
    iDecrease = abs(iDecrease);
    iNew      = iCurrent - iDecrease;
    iDecrease = iNew >= 2 ? iDecrease : iDecrease - abs(iNew - 2); // new < ruined :


    if(iCurrent >= 2 && iDecrease > 0)
    {
        IPSafeAddItemProperty(oItem, ItemPropertyQuality(iCurrent - iDecrease));
        //DCS_IPDegradeItemPropertyValue(oItem, ipQuality, iDecrease, FALSE);
    }
    */
}

/******************************************************************************/

void DCS_IPTransferItemProperties(object oSource, object oDestination)
{
    itemproperty ipProp = GetFirstItemProperty(oSource);

    while(GetIsItemPropertyValid(ipProp))
    {
        AddItemProperty(DURATION_TYPE_PERMANENT, ipProp, oDestination);
        ipProp = GetNextItemProperty(oSource);
    }
}

/******************************************************************************/

int IPGetIsAmmunation(object oItem)
{
    int iBaseType = GetBaseItemType(oItem);
    return iBaseType == BASE_ITEM_ARROW    ||
           iBaseType == BASE_ITEM_BOLT     ||
           iBaseType == BASE_ITEM_BULLET   ||
           iBaseType == BASE_ITEM_SHURIKEN ||
           iBaseType == BASE_ITEM_THROWINGAXE;
}

/******************************************************************************/

int DCS_IPGetRandomSpellFromGrade(int iSpellGrade=1, int iSpellClass=DCS_SPELLCLASS_SORCWIZ)
{
    int iMax   = 561;
    int iSpell = Random(iMax);
    string sClass;

    switch(iSpellClass)
    {
        case DCS_SPELLCLASS_BARD:    sClass = "Bard";break;
        case DCS_SPELLCLASS_CLERIC:  sClass = "Cleric";break;
        case DCS_SPELLCLASS_DRUID:   sClass = "Druid";break;
        case DCS_SPELLCLASS_PALADIN: sClass = "Paladin";break;
        case DCS_SPELLCLASS_RANGER:  sClass = "Ranger";break;
        case DCS_SPELLCLASS_SORCWIZ: sClass = "Wiz_Sorc";break;
    }

    while(GetCached2DAInt("spells", sClass, GetCached2DAInt("iprp_spells", "spellindex", iSpell)) != iSpellGrade)
    {
        iSpell = Random(iMax);
    }

    return iSpell;
}

/******************************************************************************/

string DCS_IPGetItemPropertyString(object oItemToCheck)
{
    itemproperty IPProp = GetFirstItemProperty(oItemToCheck);
    string       IPString;

    while(GetIsItemPropertyValid(IPProp))
    {
        if(GetItemPropertyType(IPProp) != ITEM_PROPERTY_RANGEDAMMO && !(GetItemPropertyType(IPProp) == ITEM_PROPERTY_CAST_SPELL && GetItemPropertySubType(IPProp) == 554))
        IPString += inStr(GetItemPropertyType(IPProp)+DCS_IPGetItemPropertyValue(IPProp));
        IPProp    = GetNextItemProperty(oItemToCheck);
    }

    return IPString;
}

/******************************************************************************/

string DCS_GetAmmoShortCut(int iBaseAmmoType)
{
    switch (iBaseAmmoType)
    {
        case BASE_ITEM_ARROW:       return "Arw_";break;
        case BASE_ITEM_BOLT:        return "Bol_";break;
        case BASE_ITEM_BULLET:      return "Bul_";break;
        case BASE_ITEM_SHURIKEN:    return "Shu_";break;
        case BASE_ITEM_THROWINGAXE: return "Thx_";break;
    }

    return "";
}

/******************************************************************************/

int DCS_IPGetCopyItemPropertyException(itemproperty ipExcept)
{
    int iType = GetItemPropertyType(ipExcept);
    int iSubType = GetItemPropertySubType(ipExcept);

    return iType == ITEM_PROPERTY_RANGEDAMMO ||
          (iType == ITEM_PROPERTY_CAST_SPELL && iSubType == 554) ||
           iType == ITEM_PROPERTY_MATERIAL ||
           iType == ITEM_PROPERTY_QUALITY ||
           iType == ITEM_PROPERTY_SOCKET ||
           iType == ITEM_PROPERTY_SOCKET_TYPE ||
           iType == ITEM_PROPERTY_GEM_STATUS;
}

/******************************************************************************/

void DCS_IPCopyItemProperties(object oSource, object oDestination, int bItemPropertyIncrease=FALSE)
{
    itemproperty ipSource = GetFirstItemProperty(oSource);
    while(GetIsItemPropertyValid(ipSource))
    {
        if(!DCS_IPGetCopyItemPropertyException(ipSource))
        {
            int ipType = GetItemPropertyType(ipSource);
            itemproperty ipFind;

            AdvDebug(GetPCSpeaker(), ColorText("Current IP: "+GetItemPropertyTypeName(ipSource), nwcGreen));

            if(bItemPropertyIncrease && GetIsItemPropertyValid(ipFind = DCS_IPFindItemPropertyByIP(oDestination, ipSource)))
            {
                AdvDebug(GetPCSpeaker(), ColorText("Copy Item properties: upgrade ip "+GetItemPropertyTypeName(ipFind), nwcGreen));
                DCS_IPUpgradeItemPropertyValue(oDestination, ipFind, DCS_IPGetItemPropertyValue(ipSource));
            }
            else
            {
                AdvDebug(GetPCSpeaker(), ColorText("Copy Item properties: Adding ip "+GetItemPropertyTypeName(ipSource), nwcGreen));
                IPSafeAddItemProperty(oDestination, ipSource);
            }
        }

        ipSource = GetNextItemProperty(oSource);
    }
}

/******************************************************************************/

void IPDebugItemProperties(object oItem, object oDebug)
{
    itemproperty ipProp = GetFirstItemProperty(oItem);
    int iCount;
    while(GetIsItemPropertyValid(ipProp))
    {
        iCount++;
        DCS_Display(oDebug,
        IntToString(iCount)+" - Type: "+IntToString(GetItemPropertyType(ipProp))+
        "; SubType: "+IntToString(GetItemPropertySubType(ipProp))+
        "; CostTableValue: "+IntToString(GetItemPropertyCostTableValue(ipProp))+
        "; DurationType: "+IntToString(GetItemPropertyDurationType(ipProp))+";");

        ipProp = GetNextItemProperty(oItem);
    }
}

//void main(){}
