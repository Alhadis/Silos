//::///////////////////////////////////////////////
//:: Name dcs_inc_main
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Main include file with all necessary functions
    for the crafting system to work properly
*/
//:://////////////////////////////////////////////
//:: Created By: doxic
//:: Created On: 08.04.2009
//:://////////////////////////////////////////////

#include "dcs_inc_store"
#include "dcs_inc_menu"
#include "dcs_inc_skill"

// *  This function adds a specific tag into oItems description
// *  iTagType: This is the specific tag that will be integrated in oItems description. Use the DCS_ITEM_TAG_TYPE_* values here
// *  iProcessQuality: If this is TRUE, the function will try to rename the item regarding its quality itemproperty.
// *                   There is an additional if-clause, which checks if the quality should be added to oItems name or not
// *  NOTE: This function identifies oItem!
void DCS_AppendTagIntoItem(object oItem, object oCreator, int iTagType=DCS_ITEM_TAG_TYPE_CREATE, int iIncrementBy=0);

// *  Same function as SafeCopyItem(), but is used as a void and can copy items more than once via iCount
void DCS_CopyItemVoid(object oItem, int iCount, object oTargetInventory=OBJECT_INVALID, string sNewTag="");

// *  'Event' for crafting failure
void DCS_CraftingFailure(int iResult);

// *  'Event' for crafting success
void DCS_CraftingSuccess(int iResult, int iNum=1);

// *  This function 'copies' oItem into oTargetInventory. While copying oItem it compares the maximum stack size of each item with iCount and makes as many
// *  copies of oItem as needed.
// *  - iModifyTagByQuality: If this is TRUE, the function will add the quality to the end of the tag to make it unique to other items with different quality
// *                         which would normally stack and override one quality type. This will only work, if the baseitems stacksize is > 1.
void DCS_CreateItems(object oItem, int iCount, object oTargetInventory=OBJECT_SELF, int iModifyTagByQuality=TRUE);

// *  Decreases size of sItem by nMaxValue
void DCS_DecreaseItemSize(string sItem, int iDecrease, int iResRef=FALSE, object oTarget=OBJECT_SELF);

// *  Decreases the amount of objects crafted by iDecrease
void DCS_DecreaseObjectsCount(int iDecrease=1, object oStation=OBJECT_SELF);

void DCS_DeleteCraftingResults();

// *  Delete all experiment entries from oStation
void DCS_DeleteExperimentEntries(object oStation=OBJECT_SELF);

// *  Deletes all local stored resources from oStation
void DCS_DeleteLocalResoures(object oStation=OBJECT_SELF);

void DCS_DeleteLocalSockets(object oStation=OBJECT_SELF);

void DCS_DeleteMultiObjectID(object oStation=OBJECT_SELF);

// *  Deletes the current used resource dimension from oStation
void DCS_DeleteResourceDimension(object oStation=OBJECT_SELF);

// *  A function to delete the resources by the amount of iItemsCount
void DCS_DestroyResourcesInStation(int iItemsCount=1);

// *  Instantly finishes to current crafting session for oStation and clears all actions
void DCS_DoFinish(object oStation=OBJECT_SELF);

// *  Finishes the current crafting process by resetting all necessary variables,
// *  creating the crafted object(s) and deleting all resources needed.
void DCS_FinishCraftingProcess();

// *  Increases the amount of objects crafted by iIncrease
void DCS_IncreaseObjectsCount(int iIncrease=1, object oStation=OBJECT_SELF);

// *Initializing the crafting system
void DCS_Init();

// *  Function for the OnClientEnter-Event in module Options.
// *  Needs (!) to be implemented into this Event
void DCS_OnClientEnter(object oPlayer);

// *  Function for the OnClientEnter-Event in module Options.
// *  Needs (!) to be implemented into this Event
void DCS_OnClientLeave(object oPlayer);

// *  Opens a popup window for oPC with sTitle and sPopupText
void DCS_PopupWindow(object oPC, string sTitle, string sPopupText);

// *  Prepares all crafting stations for their use to craft objects
void DCS_PrepareCraftingStations();

// *  Removes sResources iValue-times from the local stored ones on oStation
void DCS_RemoveLocalResource(string sResource, int iValue, object oStation=OBJECT_SELF);

// *  Prepare and free all used tokens from their nasty
// *  "UNRECOGNIZED TOKEN" text to a reservation string
void DCS_ReserveToken();

// *  Resets the last crafted item
void DCS_ResetCraftedItem();

// *  Runs current experiment with all points spent on oItem
void DCS_RunExperiment(object oItem);

// *  Sets the status of the current recipe being able to craft by the crafting player to iValue
void DCS_SetCanCraftRecipe(int iValue, object oStation=OBJECT_SELF);

// *  Sets the status of the current choose-item-mode to bStatus
void DCS_SetChooseItemMode(int bStatus, object oStation=OBJECT_SELF);

// *  Stores last crafted item
void DCS_SetCraftedItem(object oItem, int iNum=1);

// *  Stores last crafted item result
void DCS_SetCraftedItemResult(string sResult, object oStation=OBJECT_SELF);

// *  Set the result of the last crafting action to iResult
void DCS_SetCraftingResult(int iResult, int iMulti=1);

// *  Makes oPlayers current Crafting Station to oStation
void DCS_SetCraftingStation(object oPlayer, object oStation);

// *  Sets the current status of crafting to iStatus
void DCS_SetCraftingStatus(int iStatus);

// *  Sets the current status of the crafting success to iSuccess
void DCS_SetCraftingSuccess(int iSuccess, object oObject=OBJECT_SELF);

// *  Set experiment entry from iPosition to sEntry for oStation
void DCS_SetExperimentEntry(int iPosition, string sEntry, object oStation=OBJECT_SELF);

// *  Set value of current experimentation points to iPoints
void DCS_SetExperimentationPoints(int iPoints);

// *  Set the profession status from oPC to oStation to iHasProfession
void DCS_SetHasProfession(int iHasProfession, object oStation=OBJECT_SELF);

// *  Sets the amount of local resources stored on oStation to iAmount
void DCS_SetLocalResourcesStored(int iAmount, object oStation=OBJECT_SELF);

void DCS_SetLocalSockets(int iValue, int iSocketType=ITEM_PROPERTY_SOCKET, object oStation=OBJECT_SELF);

void DCS_SetMultiObjectID(string sID, int iNum, object oStation=OBJECT_SELF);

// *  Set the current amount of objects that will be crafted to iAmount
void DCS_SetObjectAmount(int iAmount, int iMoreItemChanceAmount=FALSE, int iNum=1, object oStation=OBJECT_SELF);

// *  Set the current number of objects that should be crafted to iCount
void DCS_SetObjectsCount(int iCount=1, object oStation=OBJECT_SELF);

// *  Set the dimension used for the resources from oStation to iChosen
void DCS_SetResourceDimension(int iChosen, object oStation=OBJECT_SELF);

// *  Marks oTarget crafting state to iStatus
void DCS_SetCraftingActive(int iState=TRUE, object oTarget=OBJECT_SELF);

// *  Stores sInfo as the current profession information about iProfession to oPC
void DCS_SetProfessionInfo(object oPC, int iProfession, string sInfo);

// *  Sets the status of the recipes shown to iShow
// *   - iShow: 0 = All Recipes, 1 = Just craftable recipes
void DCS_ShowRecipes(object oPlayer, int iShow);

// *  Stores the resources sResourve with the value iValue local to oStation.
// *  if it already exists it will add the value to the existing value
void DCS_StoreLocalResource(string sResource, int iValue, object oStation=OBJECT_SELF);

void DCS_StoreLocalSockets(object oItem, object oStation=OBJECT_SELF);

// *  Turns conversation status to pause and resume
void DCS_SwitchConversation(object oPlayer);

// *  Updates all players skills on local vars on the server
void DCS_UpdateAllPlayerSkills(int ResetInfo=FALSE);

// *  Updates oPC's player skill on local vars
void DCS_UpdatePlayerSkill(object oPC, int ResetInfo=FALSE);

// *  The function changes the model of an item by the specified types defined in sAppearance.
// *  Appearance scheme: "TYPE:INDEX:NUMBER,TYPE:INDEX:NUMBER,..."
// *    - TYPE: e.g ITEM_APPR_TYPE_WEAPON_COLOR: 1, ITEM_APPR_TYPE_WEAPON_MODEL: 2 (values in nwscript)
// *    - INDEX: e.g ITEM_APPR_WEAPON_*_BOTTOM: 0, ITEM_APPR_WEAPON_*_MIDDLE: 1, ITEM_APPR_WEAPON_*_TOP: 2
// *  Example: The Weapon Model in the middle should be changed to number 10 with the color 3
// *            sAppearance = "2:1:10,1:1:3"
// *  NOTE: If you don't want to change the Model or Color, put in ""
object DCS_ChangeItemAppearance(object oItem, string sAppearance="", int bSetAsCrafted=TRUE);

// *  Same function as CreateItemOnObject, but this function also changes the items name to the scripted one, if turned to TRUE
// *  (Using the constant DCS_SETTING_USE_SCRIPTED_ITEM_NAMES)
// *  sItemColor: The color tag the item will gain when created
object DCS_CreateItemOnObject(string sItemTemplate, object oTarget=OBJECT_SELF, int nStackSize=1, string sNewTag="", string sItemColor=dcsItemColor);

// *  Returns last crafted item
object DCS_GetCraftedItem(int iNum=1);

// *  Returns oPlayers current Crafting Station
object DCS_GetCraftingStation(object oPlayer);

// *  Returns first item in oTarget's inventory.
// *  -  iUseResRef: If this is TRUE, the script will compare the Resrefs, on FALSE it compares the tags
object DCS_GetFirstItemInInventory(string sSpecification, object oTarget=OBJECT_SELF, int iUseResRef=TRUE);

// *  Returns next item in oTarget's inventory.
// *  This picks up where the last DCS_GetFirstItemInInventory() left off.
// *  -  iUseResRef: If this is TRUE, the script will compare the Resrefs, on FALSE it compares the tags
object DCS_GetNextItemInInventory(string sSpecification, object oTarget=OBJECT_SELF, int iUseResRef=TRUE);

// *  Returns global object chest
object DCS_GetObjectChest();

// *  Returns the nth random item in oStation with sRandomItemType as base type definition
// *  - iSetAsCraftedItem: if this is TRUE, the function will also store the item as DCS_SetCraftedItem(), if its valid
object DCS_GetRandomObjectInStation(string sRandomItemType, int iNth=1, int iSetAsCraftedItem=FALSE, object oStation=OBJECT_SELF);

// *  Calculates the experimenting points for the crafting player based on the
// *  - Profession rank / DCS_SETTING_EXPERIMENTATION_FACTOR_RANK
// *  - Profession level / 10
// *  - Experimentation skill * DCS_SETTING_EXPERIMENTATION_POINTS_PER_SKILL
int DCS_CalculateExperimentingPoints();

// *  iBase: The base Resource value (e.g 2x recipe "nails")
// *  iMulti: The value of the sub resource needed (e.g 1x recipe "nails" = 1 bar = Multi)
// *  iResourceAmount: The actual amount of nails created(e.g 1x recipe "nails" creates 5 nails = Amount)
int DCS_CalculateResourcesNeeded(int iBase, int iMulti, int iResourceAmount);

// *  Find out if IPStack has more than 1 IPTypes to choose from
// *  - Must contain a Rnd(IP1$IP2$IP3); Stack to continue
// *  - Also if IPStack contains Up(IP), it will filter and progress with
// *    itemproperty updating
int DCS_DoItemPropertyOperations(string IPStack);

// *  Returns an amount from sAmount
// *  - There are 2 cases: 1. A value with 2 parameters like "2-8". In this case the function will return a random amount between those parameters
// *                       2. The other is a single value in which nothing but the value will be returned
int DCS_GetAmount(string sAmount);

// *  Returns TRUE, if the current Recipe may be crafted by the crafting player or not
int DCS_GetCanCraftRecipe(object oStation=OBJECT_SELF);

// *  Runs special action/s for oStation when it's closed
// *  Returns TRUE, if oStation should resume after this action
int DCS_GetCloseAction(int iNoStartOnClose=FALSE);

// *  Returns the amount of items the player can craft with the
// *  next attempt and stores it on the crafting station
// *  - bForceReset: if this is TRUE, the function won't use the stored variable and recalculate the item value
int DCS_GetCraftableItems(int bForceReset=FALSE);

// *  Get one of the 2 important abilities by choosing iNumber
// *  - iNumber MUST be between 1 and 2 otherwise its 1
// *  - iProfession: if this is -1 the current profession will be chosen
int DCS_GetCraftingAbility(int iNumber = 1, int iProfession=-1);

// *  Returns TRUE, if the crafting is limited to the crafting player
int DCS_GetCraftingLimited(object oStation=OBJECT_SELF);

// *  Returns last crafting result
int DCS_GetCraftingResult(int iMulti, object oStation=OBJECT_SELF);

// *  Returns current crafting status
int DCS_GetCraftingStatus();

// *  Returns TRUE, if crafting should stop
int DCS_GetCraftingStop(object oStation=OBJECT_SELF);

// *  Returns TRUE, if the last crafting attempt was successful
int DCS_GetCraftingSuccess(object oObject=OBJECT_SELF);

// *  Returns experience points, oPC gains using iRecipeDCals Difficulty Check
int DCS_GetExperienceFromRecipe(object oPC, int iRecipeDC);

// *  Returns current stored experimentation points
int DCS_GetExperimentationPoints();

// *  Returns the Recipe DC for RecipeID
int DCS_GetRecipeDC(string RecipeID);

// *  Returns TRUE, if oPC has the appropriate Rank that is needed for iPosition
int DCS_GetHasNeededRank(object oPC, int iProfession, int iPosition);

// *  Returns TRUE, if the recipe with sRecipeID has a valid Tree to display
int DCS_GetHasRecipeTree(string sRecipeID="");

// *  Returns TRUE, if oStation is marked as activated
int DCS_GetIsCraftingActive(object oTarget=OBJECT_SELF);

// *  Returns TRUE, if oItem is a random item except for the items listed in DCS_GetIsRandomItemException()
// *  - iExcludeAmmunation: If this is TRUE, the function will return FALSE, if oItem is Ammo
int DCS_GetIsRandomItem(object oItem, int iExcludeAmmunation=TRUE);

// *  Returns TRUE, if oItem is a random jewelry (ring or amulet)
int DCS_GetIsRandomJewelry(object oItem);
// *  Returns TRUE, if oItem is a random misc item
// *  NOTE: This function excludes all dcsVerz* (enchanter objects).
// *  - iExcludeAmmunation: If this is TRUE, ammunation won't count as misc item either
int DCS_GetIsRandomMiscItem(object oItem, int iExcludeAmmunation=TRUE);

// *  Returns TRUE, if Recipe is able to experiment
int DCS_GetIsRecipeExperimentable(string RecipeType="", int RecipeNumber=-1);

// *  Returns TRUE, if sResource is stored on oStation
int DCS_GetIsResourceStored(string sResource, object oStation=OBJECT_SELF);

// *  Retrurns TRUE, if oObject is a Trader
int DCS_GetIsTrader(object oObject=OBJECT_SELF);

// *  Returns TRUE, if oObject is an universal trainer
int DCS_GetIsUniversalTrainer(object oObject=OBJECT_SELF);

// *  Returns the number of items oTarget comprises with sItemString as Resref or as Tag, if iUseItemTag=TRUE
// *  - iOnRandomUseOne: If this is TRUE and sItemString is one of the dcsRandom*** strings, this function will always return 1
int DCS_GetItemNum(object oTarget, string sItemString, int iUseItemTag=FALSE, int iOnRandomReturnOne=TRUE);

// *  Returns the Qualitylevel of oItem.
// *  NOTE: This is calculated by the quality-itemproperty. If the item has none, the function will return -1
int DCS_GetItemQualityLevel(object oItem);

// *  Returns the value of the nth stored resource on oStation
int DCS_GetLocalResourceValue(int iNth, object oStation=OBJECT_SELF);

// *  Returns the amount of resources stored on oStation
int DCS_GetLocalResourcesStored(object oStation=OBJECT_SELF);

int DCS_GetLocalSockets(int iSocketType=ITEM_PROPERTY_SOCKET, object oStation=OBJECT_SELF);

// *  Returns current number of objects that should be crafted
// *  - iGetCraftableItems: if this and the setting DCS_OPTION_ALWAYS_CRAFT_ALL_ITEMS are TRUE,
// *                        this function returns the number of items that can be crafted in oStation
int DCS_GetObjectsCount(int iGetCraftableItems=FALSE, object oStation=OBJECT_SELF);

// *  Returns overall quality from all resources needed for the current recipe
int DCS_GetOverallQuality(int iNum, float fStartingQuality=-1.0);

// *  Returns TRUE, if oPC equipped an item with the tag of sItem
// *  - if sItem is "" this function always returns TRUE.
int DCS_GetPCEquippedItem(object oPC, string sItem);

// *  Returns one of 6 abilities randomly
int DCS_GetRandomAbility();

// *  Returns current amount of items that will be created after a successful crafting attempt
// *  iAmountType: Returns the specific amount. Use DCS_AMOUNT_* values here!
int DCS_GetObjectAmount(int iAmountType=DCS_AMOUNT_BOTH, int iNum=1, object oStation=OBJECT_SELF);

// *  Returns the amount of resources needed for sRecipeID
// *  - Example: A recipe needs 2x ResourceA and 1x ResourceB, so this function
// *             returns 3
int DCS_GetRecipeResourcesNeeded(string sRecipeID);

// *  Get amount of crafting material in oStation
// *   - sResource: dcs***
int DCS_GetResourcesInCraftingStation(string sResource);

// *  Returns the current dimension oStation has stored for resources
int DCS_GetResourceDimension(object oStation=OBJECT_SELF);

// *  Returns the complete amount of resources needed for sRecipeID
int DCS_GetResourceWorth(string sRecipeID, int iObjects=1, int iOffset=0);

// *  Returns the D20 result, including the 'perfect chance' potion
int DCS_GetResultDice();

// * Detemines, if oStation has all Resources that are needed for completing the recipe
// *  - iObjectsCount: Increases number of Resources needed by number of objects that should be crafted
// *  - bForceReset: Force a reset and ignore the stored value
int DCS_GetStationHasResources(int iRecipeNumber=-1, int iObjects=1, int bStoreLocalObjects=FALSE, int bForceReset=FALSE);

// *  Returns the stored value for the resource sResource from oStation
int DCS_GetStoredResourceValue(string sResource, object oStation=OBJECT_SELF);

// *  Returns the value of all valid itemproperties
int DCS_GetValidItemProperties(object oItem);

// *  Returns the status of the recipes shown
// *   0 = All Recipes, 1 = Just craftable recipes
int DCS_GetRecipesShown(object oPlayer);

// *  Returns a result type integer.
// *  - iDice: The result number that the crafting player threw at the crafting attempt
// *  - fChance: The overall success chance of the crafting player to craft the last recipe
// *  - Return values:
// *    1: absolute failure
// *    2: failure
// *    3: success
// *    4: amazing success
int DCS_GetResultType(int iDice, float fChance);

// *  Returns the profession status of the crafting player to oStation
int DCS_HasProfession(object oStation=OBJECT_SELF);

// *  Returns TRUE, if oCheck has all resources for the recipe with ID to craft iObjects
int DCS_HasRecipeResources(string ID, int iObjects, int iStoreLocalResources=TRUE, object oStation=OBJECT_SELF);

// *  Returns the recalculated item cost for oItem, counting (e.g: reduced ammo cost)
int DCS_RecalculateItemGoldPieceValue(object oItem);

// *  Rounds a common percentage into a 5-step integer (e.g 69,5% to 70 or 66,4% to 65)
int DCS_RoundPercentToInt(float fPercentage);

// *  Returns an amount from sAmount
// *  - There are 2 cases: 1. A value with 2 parameters like "2.0-8.0". In this case the function will return a random amount between those parameters
// *                       2. The other is a single value in which nothing but the value will be returned
float DCS_GetAmountFloat(string sAmount);

// *  Calculates the success chance in % for the current crafting player to succeed
// *  the current experiment
float DCS_GetExperimentationChance();

// *  Calculates the starting quality of the current recipe, by using the crafting result
// *  and the success chance plus the recipe quality
// *  - Note: The maximum starting quality is RecipeQuality + 1.95 (norm. 2.0)
float DCS_GetStartingQuality(int iNum);

// *  Returns the dc for all quality levels from all local stored resources, starting to count at iOffset
float DCS_GetStoredItemQualityDC(int iOffset=1, object oCraftedItem=OBJECT_INVALID, object oStation=OBJECT_SELF);

// *  Calculates the success chance in % for the current crafting player to succeed
// *  in crafting the current object
float DCS_GetSuccessChance(int iDisplay=FALSE, int bForceReset=FALSE);

// *  Same function as DCS_GetCraftingDisplay(), but this function returns all
// *  available ressource combinations
string DCS_GetCompleteDisplay();

// *  Returns last crafted item result
string DCS_GetCraftedItemResult(object oStation=OBJECT_SELF);

string DCS_GetCraftedItemResult(object oStation=OBJECT_SELF);

// *  Returns the display for the current recipe which tells the player
// *  what resources he needs and his chance of success in percent
string DCS_GetCraftingDisplay(int iIgnoreCount=TRUE, int bForceReset=FALSE);

// *  Returns a crafting-limited string, if theres just limited crafting possible
string DCS_GetCraftingLimitingReason(object oStation=OBJECT_SELF);

// *  Returns a crafting-stop string, if there's a reason to stop
string DCS_GetCraftingStopReason(object oStation=OBJECT_SELF);

// *  Returns experiment entry from oStation at iPosition
string DCS_GetExperimentEntry(int iPosition, object oStation=OBJECT_SELF);

// *  Returns the nth stored resource on oStation
// *  NOTE: Nth starts at 1!
string DCS_GetLocalResource(int iNth, object oStation=OBJECT_SELF);

string DCS_GetMultiObjectID(int iNum, object oStation=OBJECT_SELF);

// *  Returns specific information about oItem,  concerning iTagType.
// *  - Valid tag types are: - DCS_ITEM_TAG_TYPE_CREATE
// *                         - DCS_ITEM_TAG_TYPE_ENCHANT
// *                         - DCS_ITEM_TAG_TYPE_KEEN
string DCS_GetObjectInformation(object oItem, int iTagType=DCS_ITEM_TAG_TYPE_CREATE);

// *  Get information about oPC including his level and rank
string DCS_GetProfessionInfo(object oPC, int iProfession, int iReset=FALSE);

// *  This function checks, how many objects of sResource are in the inventory
// *  of oStation and returns in specified color determining if the resources are
// *  equal or greater than nValueNeeded
// *   - On Error return: 0
string DCS_GetResourceCount(string sResource, int nValueNeeded);

// *  Returns the stored information of oPC about iProfession
string DCS_GetStoredProfessionInfo(object oPC, int iProfession);

// *  Returns the recipe tree for sRecipeID or the current one if sRecipeID=""
string DCS_ShowRecipeTree(string sRecipeID="", int iObjects=1, int iOffset=0);

/******************************************************************************/
/*                             GENERAL FUNCTIONS                              */
/******************************************************************************/

int DCS_GetGemSocketType(object oGem)
{
    int iValue = DCS_IPGetItemPropertyTypeValue(oGem, ITEM_PROPERTY_SOCKET_TYPE);

    //AdvDebug(DCS_GetCraftingPlayer(), "Gem Socket Type value for "+GetName(oGem)+": "+inStr(iValue));

    if(!iValue)
    return 0;

    return iValue == IP_CONST_SOCKET_TYPE_SMALL ? ITEM_PROPERTY_SOCKET : ITEM_PROPERTY_BIG_SOCKET;
}

/******************************************************************************/

int DCS_GetLocalSockets(int iSocketType=ITEM_PROPERTY_SOCKET, object oStation=OBJECT_SELF)
{
    return GetLocalInt(oStation, "DCS_Socket_"+inStr(iSocketType));
}

/******************************************************************************/

void DCS_SetLocalSockets(int iValue, int iSocketType=ITEM_PROPERTY_SOCKET, object oStation=OBJECT_SELF)
{
    SetLocalInt(oStation, "DCS_Socket_"+inStr(iSocketType), iValue);
}

/******************************************************************************/

void DCS_StoreLocalSockets(object oItem, object oStation=OBJECT_SELF)
{
    if(!GetLocalInt(oStation, "DCS_Sockets_Set"))
    {
        int bigSocket = GetItemPropertyCostTableValue(DCS_IPFindItemProperty(oItem, ITEM_PROPERTY_BIG_SOCKET));
        int socket = GetItemPropertyCostTableValue(DCS_IPFindItemProperty(oItem, ITEM_PROPERTY_SOCKET));

        SetLocalInt(oStation, "DCS_Socket_"+inStr(ITEM_PROPERTY_BIG_SOCKET), bigSocket);
        SetLocalInt(oStation, "DCS_Socket_"+inStr(ITEM_PROPERTY_SOCKET), socket);
        SetLocalInt(oStation, "DCS_Sockets_Set", TRUE);
    }
}

/******************************************************************************/

void DCS_DeleteLocalSockets(object oStation=OBJECT_SELF)
{
    DeleteLocalInt(oStation, "DCS_Socket_"+inStr(ITEM_PROPERTY_SOCKET));
    DeleteLocalInt(oStation, "DCS_Socket_"+inStr(ITEM_PROPERTY_BIG_SOCKET));
    DeleteLocalInt(oStation, "DCS_Sockets_Set");
}

/******************************************************************************/

int DCS_GetAmount(string sAmount)
{
    int   iDiv  = FindSubString(sAmount, "-");
    int   iLen  = GetStringLength(sAmount);
    float fAdd  = 1.0;
    float fDice = inFloat(d100());

    //if(iProcessSkill)
    //fAdd = fDice <= DCS_GetProfessionSkill(DCS_GetCraftingPlayer(), DCS_GetCraftingProfession(), SKILL_MORE_ITEM_CHANCE) * DCS_SETTING_MORE_ITEM_CHANCE_PER_SKILL ? DCS_GetAmountFloat(DCS_SETTING_MORE_ITEM_AMOUNT, FALSE) : 1.0;

    //AdvDebug(DCS_GetCraftingPlayer(), "fDice: "+DCS_RearrangeFloat(fDice)+", fAdd: "+DCS_RearrangeFloat(fAdd));

    if(iDiv == -1)
    return flInt(stInt(sAmount) * fAdd);

    return flInt(GetRandomInt(stInt(GetStringLeft(sAmount, iDiv)), stInt(GetSubString(sAmount, iDiv+1, iLen - (iDiv+1)))) * fAdd);
}

/******************************************************************************/

float DCS_GetAmountFloat(string sAmount)
{
    int   iDiv = FindSubString(sAmount, "-");
    int   iLen = GetStringLength(sAmount);
    float fAdd = 1.0;

    //if(iProcessSkill)
    //fAdd = inFloat(d100()) <= DCS_GetProfessionSkill(DCS_GetCraftingPlayer(), DCS_GetCraftingProfession(), SKILL_MORE_ITEM_CHANCE) * DCS_SETTING_MORE_ITEM_CHANCE_PER_SKILL ? DCS_GetAmountFloat(DCS_SETTING_MORE_ITEM_AMOUNT, FALSE) : 1.0;

    if(iDiv == -1)
    return stFloat(sAmount) * fAdd;

    return GetRandomFloat(stFloat(GetStringLeft(sAmount, iDiv)), stFloat(GetSubString(sAmount, iDiv+1, iLen - (iDiv+1)))) * fAdd;
}

/******************************************************************************/

void DCS_SetChooseItemMode(int bStatus, object oStation=OBJECT_SELF)
{
    if(!bStatus)
    {
        DCS_SetMenupage(GetInternSwitch(DCS_VAR_CHOOSE_ITEM_MENUPAGE));
        DeleteLocalInt(OBJECT_SELF, DCS_VAR_CHOOSE_ITEM_MENUPAGE);
    }
    else
    {
        SetInternSwitch(DCS_VAR_CHOOSE_ITEM_MENUPAGE, DCS_GetMenupage());
        DCS_SetMenupage(1);
    }
    SetLocalInt(oStation, DCS_VAR_SET_CHOOSE_ITEM, bStatus);
}

/******************************************************************************/

int DCS_GetIsRandomMiscItem(object oItem, int iExcludeAmmunation=TRUE)
{
    int iAmmo = TRUE;
    if(iExcludeAmmunation) iAmmo = !IPGetIsAmmunation(oItem);

    return iAmmo && !GetIsWeapon(oItem, FALSE) && !DCS_IPGetIsArmor(oItem) && !DCS_GetIsRandomItemException(GetResRef(oItem));
}

/******************************************************************************/

int DCS_GetIsRandomJewelry(object oItem)
{
    string equipSlot = GetCached2DAString("baseitems", "EquipableSlots", GetBaseItemType(oItem));
    return equipSlot == "0x00180" || equipSlot == "0x00200"; // left ring / right ring
}

/******************************************************************************/

int DCS_GetIsRandomItem(object oItem, int iExcludeAmmunation=TRUE)
{
    int iAmmo = TRUE;
    if(iExcludeAmmunation) iAmmo = !IPGetIsAmmunation(oItem);

    return iAmmo && !DCS_GetIsRandomItemException(GetResRef(oItem));
}

/******************************************************************************/

int DCS_GetItemNum(object oTarget, string sItemString, int iUseItemTag=FALSE, int iOnRandomReturnOne=TRUE)
{
    object oItem;
    int nNumItems;

    if(sItemString == "")
    return 0;

    if(DCS_GetIsRandomResource(sItemString))
    {
        oItem = DCS_GetRandomObjectInStation(sItemString, 1, FALSE, oTarget);

        if(iOnRandomReturnOne && GetIsObjectValid(oItem))
        return 1;

        return DCS_GetItemNum(oTarget, GetResRef(oItem));
    }
    else
    {
        oItem = GetFirstItemInInventory(oTarget);

        if(iUseItemTag)
        {
            while(GetIsObjectValid(oItem))
            {
                if(GetTag(oItem) == sItemString)
                nNumItems += GetNumStackedItems(oItem);

                oItem = GetNextItemInInventory(oTarget);
            }
        }
        else
        {
            while(GetIsObjectValid(oItem))
            {
                if(GetResRef(oItem) == sItemString)
                nNumItems += GetNumStackedItems(oItem);

                oItem = GetNextItemInInventory(oTarget);
            }
        }
   }

   return nNumItems;
}

/******************************************************************************/

object DCS_GetFirstItemInInventory(string sSpecification, object oTarget=OBJECT_SELF, int iUseResRef=TRUE)
{
    SetLocalInt(oTarget, DCS_VAR_INVENTORY_ITEMTAG, 1);

    if(!iUseResRef)
    return GetItemPossessedBy(oTarget, sSpecification);

    object oItem = GetFirstItemInInventory(oTarget);
    while(GetIsObjectValid(oItem))
    {
        if(GetResRef(oItem) == sSpecification)
        break;

        oItem = GetNextItemInInventory(oTarget);
    }

    return oItem;
}

/******************************************************************************/

object DCS_GetNextItemInInventory(string sSpecification, object oTarget=OBJECT_SELF, int iUseResRef=TRUE)
{
    int iCount;
    int iCounter = GetLocalInt(oTarget, DCS_VAR_INVENTORY_ITEMTAG) + 1;
    object oItem = GetFirstItemInInventory(oTarget);

    SetLocalInt(oTarget, DCS_VAR_INVENTORY_ITEMTAG, iCounter);

    while(GetIsObjectValid(oItem))
    {
        // Resref
        if(iUseResRef && GetResRef(oItem) == sSpecification)
        {
            iCount++;

            if(iCount == iCounter)
            break;
        }
        // Tag
        else if(!iUseResRef && GetTag(oItem) == sSpecification)
        {
            iCount++;

            if(iCount == iCounter)
            break;
        }

        oItem = GetNextItemInInventory(oTarget);
    }

    return oItem;
}

/******************************************************************************/

int DCS_GetIsRandomItemApproved(object oItem, string sRandom)
{
    if(DCS_GetDisenchantingMode() && (GetGoldPieceValue(oItem) / powInt(GetItemStackSize(oItem), 2) < 4000) || DCS_IPGetIsGem(oItem))
    return FALSE;

         if(sRandom == dcsRandomAll)         return DCS_GetIsRandomItem(oItem);
    else if(sRandom == dcsRandomArmor)       return DCS_IPGetIsArmor(oItem, FALSE);
    else if(sRandom == dcsRandomArmorShield) return DCS_IPGetIsArmor(oItem);
    else if(sRandom == dcsRandomArmorWeapon) return GetIsWeapon(oItem, FALSE) || DCS_IPGetIsArmor(oItem);
    else if(sRandom == dcsRandomEquip)       return DCS_IPGetIsMiscEquipableItem(oItem) || GetIsWeapon(oItem, FALSE) || DCS_IPGetIsArmor(oItem);
    else if(sRandom == dcsRandomMelee)       return GetIsWeapon(oItem, FALSE) && !IPGetIsRangedWeapon(oItem);
    else if(sRandom == dcsRandomMiscItem)    return DCS_GetIsRandomMiscItem(oItem);
    else if(sRandom == dcsRandomRanged)      return GetWeaponRanged(oItem);
    else if(sRandom == dcsRandomWeapon)      return GetIsWeapon(oItem, FALSE);
    else if(sRandom == dcsRandomContainer)   return DCS_IPGetIsContainer(oItem);
    else if(sRandom == dcsRandomSocketJew)   return DCS_GetIsRandomJewelry(oItem) && (GetItemHasItemProperty(oItem, ITEM_PROPERTY_SOCKET) || GetItemHasItemProperty(oItem, ITEM_PROPERTY_BIG_SOCKET)) ;
    else if(sRandom == dcsRandomGem)         return GetItemHasItemProperty(oItem, ITEM_PROPERTY_SOCKET_TYPE);

    return FALSE;
}

/******************************************************************************/

object DCS_GetRandomObjectInStation(string sRandomItemType, int iNth=1, int iSetAsCraftedItem=FALSE, object oStation=OBJECT_SELF)
{
    object oItem = GetFirstItemInInventory(oStation);
    object oSelect;
    int iCount;

    if(DCS_GetIsRandomResource(sRandomItemType))
    {
        while(GetIsObjectValid(oItem))
        {
            if(DCS_GetIsRandomItemApproved(oItem, sRandomItemType))
            {
                iCount++;

                if(iCount == iNth)
                {
                    if(iSetAsCraftedItem)
                    DCS_SetCraftedItem(oItem);
                    oSelect = oItem;
                    break;
                }
            }

            oItem = GetNextItemInInventory(oStation);
        }
    }

    return oSelect;
}

/******************************************************************************/

int DCS_GetResultDice()
{
    if(GetLocalInt(DCS_GetCraftingPlayer(), DCS_PERFECT_CHANCE))
    return d2() + 18; // 19 to 20 only, no misses

    return d20();
}

/******************************************************************************/

int DCS_RecalculateItemGoldPieceValue(object oItem)
{
    int iCost = GetGoldPieceValue(oItem);

    // If the selected item is ammunation, the cost Modifer will be reduced to regulate the amount of output items
    if(IPGetIsAmmunation(oItem))
    iCost /= 100;

    return iCost;
}

/******************************************************************************/

float DCS_GetStoredItemQualityDC(int iOffset=1, object oCraftedItem=OBJECT_INVALID, object oStation=OBJECT_SELF)
{
    int iMax = DCS_GetLocalResourcesStored(oStation);
    int i;
    float fCounter;

    //AdvDebug(GetFirstPC(), "Offset: "+inStr(iOffset)+", Max: "+inStr(iMax));

    if(iMax == 0 || iOffset >= iMax)
    return 0.0;

    for(i = iOffset; i < iMax; i++)
    {
        object oRes = GetItemPossessedBy(oStation, DCS_GetLocalResource(i + 1, oStation));
        int iValue = DCS_GetLocalResourceValue(i + 1, oStation);

        fCounter += 1.0 + 0.0675 * DCS_IPGetQuality(oRes) * iValue;

        //AdvDebug(GetFirstPC(), ColorText("Stored Item avg: "+inStr(i)+", Max: "+inStr(iMax)+", Res: "+GetName(oRes)+", Value: "+inStr(iValue)+", Quality: "+inStr(DCS_IPGetQuality(oRes))+", fCounter: "+flStr(fCounter), nwcGreen));
    }

    if(GetIsObjectValid(oCraftedItem))
    {
        iMax++;
        fCounter += 1.375 * DCS_IPGetQuality(oCraftedItem);
    }

    //AdvDebug(DCS_GetCraftingPlayer(), ColorText("Stored Item quality average, iOffset: "+inStr(iOffset)+", iMax: "+inStr(iMax)+", fCounter: "+FloatToString(fCounter)+" rounded: "+flStr(DCS_IPRoundValue(fCounter)), nwcGreen));
    //AdvDebug(DCS_GetCraftingPlayer(), ColorText(FloatToString(fCounter / (iMax - iOffset), 6, 5), nwcGreen));
    return DCS_IPRoundValue(fCounter);// / (iMax - iOffset);
}

/******************************************************************************/

int DCS_GetRecipeDC(string RecipeID)
{
    if(DCS_GetDisenchantingMode())
        return flInt(sqrt(sqrt(inFloat(DCS_RecalculateItemGoldPieceValue(DCS_GetCraftedItem()))) * 1.2));//flInt(sqrt(sqrt(inFloat(DCS_RecalculateItemGoldPieceValue(DCS_GetCraftedItem())))));
    else if(DCS_GetGemBindingMode())
        return flInt(DCS_GetStoredItemQualityDC(1, DCS_GetCraftedItem()));

    return DCS_GetRecipeEntryInt(DCS_COL_RECIPE_DC, RecipeID);
}

/******************************************************************************/

void DCS_SwitchConversation(object oPlayer)
{
/*
    if(bForceResume && GetLocalInt(oPlayer, DCS_VAR_CONVERSATION_STATUS))
    {
        AdvDebug(oPlayer, ColorText("** ", nwcRed)+"DCS_SwitchConversation: Force Resuming Conversation");
        ActionResumeConversation();
        DeleteLocalInt(oPlayer, DCS_VAR_CONVERSATION_STATUS);
    }
*/
    if(!GetLocalInt(oPlayer, DCS_VAR_CONVERSATION_STATUS))
    {
        AdvDebug(oPlayer, ColorText("** ", nwcRed)+"DCS_SwitchConversation: Pausing Conversation");
        ActionPauseConversation();
        SetLocalInt(oPlayer, DCS_VAR_CONVERSATION_STATUS, TRUE);
    }
    else
    {
        AdvDebug(oPlayer, ColorText("** ", nwcRed)+"DCS_SwitchConversation: Resuming Conversation");
        ActionResumeConversation();
        DeleteLocalInt(oPlayer, DCS_VAR_CONVERSATION_STATUS);
    }
}

/******************************************************************************/

void DCS_SetHasProfession(int iHasProfession, object oStation=OBJECT_SELF)
{
    SetLocalInt(oStation, DCS_VAR_HAS_PROFESSION, iHasProfession);
}

/******************************************************************************/

int DCS_HasProfession(object oStation=OBJECT_SELF)
{
    return GetLocalInt(oStation, DCS_VAR_HAS_PROFESSION);
}

/******************************************************************************/

int DCS_GetPCEquippedItem(object oPC, string sItem)
{
    if(sItem == "")return TRUE;

    int iSlot;
    for(iSlot = 0; iSlot < NUM_INVENTORY_SLOTS; iSlot++)
    {
        if(GetTag(GetItemInSlot(iSlot, oPC)) == sItem)
        return TRUE;
    }

    return FALSE;
}

/******************************************************************************/

int DCS_GetCloseAction(int iNoStartOnClose=FALSE)
{
    object oStation = OBJECT_SELF;
    object oPC      = GetLastClosedBy();

    // Reset the disturbed status
    DeleteLocalInt(oStation, DCS_VAR_STATION_DISTURBED);

    // The default function that will react only if oStation is a Forge
    DCS_CloseForge(oStation);

    // Localize nearest forge and store it to oStation, if it's an Anvil or Goldsmithtable
    DCS_FindForge(oStation);

    if(!iNoStartOnClose)
    {
        // Last reasons to stop crafting
        // oPC did not equip the needed item/s to begin crafting
        if(!DCS_GetPCEquippedItem(oPC, GetLocalString(oStation, "DCS_Equip_Item")))
        {
            DCS_Display(oPC, GetLocalString(oStation, "DCS_Equip_Failure_Msg"), TRUE);
            return FALSE;
        }
        // oPC did not possess the needed item/s to begin crafting
        if(GetLocalString(oStation, "DCS_Inventory_Item") != "" && !GetIsObjectValid(GetItemPossessedBy(oPC, GetLocalString(oStation, "DCS_Inventory_Item"))))
        {
            DCS_Display(oPC, GetLocalString(oStation, "DCS_Inventory_Failure_Msg"), TRUE);
            return FALSE;
        }
        // Other Reasons to stop crafting (e.g the anvils forge is not activated).
        if(DCS_GetCraftingStop())
        {
            DCS_Display(oPC, DCS_GetCraftingStopReason(oStation), TRUE);
            return FALSE;
        }
    }

    // The close action script will continue, if the station is not a forge
    // and the main crafting menu will appear
    return !DCS_GetIsForge(oStation);
}

/******************************************************************************/

string DCS_GetCraftingStopReason(object oStation=OBJECT_SELF)
{
    if(GetTag(oStation) == DCS_STATION_SMITH_ANVIL && !DCS_GetIsForgeActivated(DCS_GetAnvilForge(oStation)))
    return DCS_TEXT_NEED_TO_HEAT_FORGE;

    return "";
}

/******************************************************************************/

int DCS_GetCraftingStop(object oStation=OBJECT_SELF)
{
    if(GetTag(oStation) == DCS_STATION_SMITH_ANVIL)
    return !DCS_GetIsForgeActivated(DCS_GetAnvilForge(oStation));

    return FALSE;
}


/******************************************************************************/

string DCS_GetCraftingLimitingReason(object oStation=OBJECT_SELF)
{
    if(GetTag(oStation) == DCS_STATION_GOLDSMITH_TABLE && !DCS_GetIsForgeActivated(DCS_GetAnvilForge(oStation)))
    return DCS_TEXT_CRAFTING_LIMITED;

    return "";
}


/******************************************************************************/

int DCS_GetCraftingLimited(object oStation=OBJECT_SELF)
{
    if( GetTag(oStation) == DCS_STATION_GOLDSMITH_TABLE)
    return !DCS_GetIsForgeActivated(DCS_GetAnvilForge(oStation));

    return FALSE;
}

/******************************************************************************/

void DCS_SetCanCraftRecipe(int iValue, object oStation=OBJECT_SELF)
{
    SetLocalInt(oStation, DCS_VAR_CAN_CRAFT_RECIPE, iValue);
}

/******************************************************************************/

int DCS_GetCanCraftRecipe(object oStation=OBJECT_SELF)
{
    return GetLocalInt(oStation, DCS_VAR_CAN_CRAFT_RECIPE);
}

/******************************************************************************/

void DCS_SetObjectsCount(int iCount=1, object oStation=OBJECT_SELF)
{
    SetLocalInt(oStation, DCS_VAR_OBJECTS_COUNT, iCount);
}

/******************************************************************************/

void DCS_DeleteObjectAmount(object oStation=OBJECT_SELF)
{
    int iObjects = DCS_GetObjectsCount();
    int i;

    for(i = 1; i <= iObjects; i++)
    {
       DeleteLocalObject(OBJECT_SELF, DCS_VAR_OBJECT_AMOUNT_SKILL+inStr(i));
       DeleteLocalObject(OBJECT_SELF, DCS_VAR_OBJECT_AMOUNT+inStr(i));
    }

    DeleteLocalObject(OBJECT_SELF, DCS_VAR_OBJECT_AMOUNT_SKILL);
    DeleteLocalObject(OBJECT_SELF, DCS_VAR_OBJECT_AMOUNT);
}

/******************************************************************************/

void DCS_SetObjectAmount(int iAmount, int iMoreItemChanceAmount=FALSE, int iNum=1, object oStation=OBJECT_SELF)
{
    if(iMoreItemChanceAmount)
    {
        SetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT_SKILL+inStr(iNum), iAmount);
        SetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT_SKILL, GetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT_SKILL) + iAmount);

        //AdvDebug(GetPCSpeaker(),ColorText(inStr(iNum)+", SetObjectAmount Skill: "+inStr(GetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT_SKILL)), nwcBrown));
    }
    else
    {
        SetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT+inStr(iNum), iAmount);
        SetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT, GetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT) + iAmount);
        //AdvDebug(GetPCSpeaker(),ColorText(inStr(iNum)+", SetObjectAmount: "+inStr(GetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT)), nwcBrown));
    }
}

/******************************************************************************/

void DCS_IncreaseObjectsCount(int iIncrease=1, object oStation=OBJECT_SELF)
{
    DCS_SetObjectsCount(DCS_GetObjectsCount() + iIncrease);
}

/******************************************************************************/

void DCS_DecreaseObjectsCount(int iDecrease=1, object oStation=OBJECT_SELF)
{
    DCS_SetObjectsCount(DCS_GetObjectsCount() - iDecrease);
}

/******************************************************************************/

int DCS_GetObjectsCount(int iGetCraftableItems=FALSE, object oStation=OBJECT_SELF)
{
    if(DCS_GetDisenchantingMode())
    return GetItemStackSize(DCS_GetCraftedItem());//DCS_GetItemNum(oStation, GetResRef(DCS_GetCraftedItem()));

    if(iGetCraftableItems && DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_MULTI_ITEM_CRAFT) && DCS_GetOption(DCS_OPTION_ALWAYS_CRAFT_ALL_ITEMS))
    return DCS_GetCraftableItems();

    return GetLocalInt(oStation, DCS_VAR_OBJECTS_COUNT);
}

/******************************************************************************/

int DCS_GetObjectAmount(int iAmountType=DCS_AMOUNT_BOTH, int iNum=1, object oStation=OBJECT_SELF)
{
    if(iAmountType == DCS_AMOUNT_SKILL)
        return GetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT_SKILL+inStr(iNum));
    else if(iAmountType == DCS_AMOUNT_DEFAULT)
        return GetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT+inStr(iNum));
    else if(iAmountType == DCS_AMOUNT_BOTH)
        return GetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT_SKILL+inStr(iNum)) + GetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT+inStr(iNum));
    else if(iAmountType == DCS_AMOUNT_COMPLETE)
        return GetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT) + GetLocalInt(oStation, DCS_VAR_OBJECT_AMOUNT_SKILL);

    return 0;
}

/******************************************************************************/

void DCS_SetCraftingActive(int iState=TRUE, object oTarget=OBJECT_SELF)
{
    SetLocalInt(oTarget, DCS_VAR_STATION_ACTIVE, iState);
}

/******************************************************************************/

int DCS_GetIsCraftingActive(object oTarget=OBJECT_SELF)
{
    return GetLocalInt(oTarget, DCS_VAR_STATION_ACTIVE);
}

/******************************************************************************/

void DCS_ResetCraftedItem()
{
    int iObjects = DCS_GetObjectsCount();
    int i;

    for(i = 1; i <= iObjects; i++)
    {
       DeleteLocalObject(OBJECT_SELF, DCS_VAR_CRAFTED_ITEM+inStr(i));
    }
}

/******************************************************************************/

void DCS_SetCraftedItem(object oItem, int iNum=1)
{
    SetLocalObject(OBJECT_SELF, DCS_VAR_CRAFTED_ITEM+inStr(iNum), oItem);
}

/******************************************************************************/

object DCS_GetCraftedItem(int iNum=1)
{
    return GetLocalObject(OBJECT_SELF, DCS_VAR_CRAFTED_ITEM+inStr(iNum));
}

/******************************************************************************/

void DCS_SetCraftingSuccess(int iSuccess, object oObject=OBJECT_SELF)
{
    SetLocalInt(oObject, DCS_VAR_CRAFTING_SUCCESS, iSuccess);
}

/******************************************************************************/

int DCS_GetCraftingSuccess(object oObject=OBJECT_SELF)
{
    return GetLocalInt(oObject, DCS_VAR_CRAFTING_SUCCESS);
}

/******************************************************************************/

void DCS_DeleteCraftingResults()
{
    int iObjects = DCS_GetObjectsCount();
    int i;

    for(i = 1; i <= iObjects; i++)
    {
       DeleteLocalObject(OBJECT_SELF, DCS_VAR_CRAFTING_RESULT+inStr(i));
    }
}

/******************************************************************************/

void DCS_SetCraftingResult(int iResult, int iMulti=1)
{
    SetLocalInt(OBJECT_SELF, DCS_VAR_CRAFTING_RESULT+inStr(iMulti), iResult);
}

/******************************************************************************/

void DCS_SetCraftedItemResult(string sResult, object oStation=OBJECT_SELF)
{
    SetLocalString(oStation, DCS_VAR_CRAFTED_ITEM_RESULT, sResult);
}

/******************************************************************************/

string DCS_GetCraftedItemResult(object oStation=OBJECT_SELF)
{
    return GetLocalString(oStation, DCS_VAR_CRAFTED_ITEM_RESULT);
}

/******************************************************************************/


int DCS_GetCraftingResult(int iMulti, object oStation=OBJECT_SELF)
{
    return GetLocalInt(oStation, DCS_VAR_CRAFTING_RESULT+inStr(iMulti));
}

/******************************************************************************/

string DCS_GetResourceCount(string sResource, int nValueNeeded)
{
    int nResourceCount = DCS_GetItemNum(OBJECT_SELF, sResource);

    if(nResourceCount >= nValueNeeded)
    return ColorText(inStr(nResourceCount), nwcGreen);

    return ColorText(inStr(nResourceCount), nwcRed);
}

/******************************************************************************/

void DCS_SetProfessionInfo(object oPC, int iProfession, string sInfo)
{
    string Prof = inStr(iProfession);
    SetLocalString(oPC, "DCS_ProfInfo_"+Prof+"_"+GetPCPlayerName(oPC)+"_"+GetName(oPC), sInfo);
}

/******************************************************************************/

string DCS_GetStoredProfessionInfo(object oPC, int iProfession)
{
    string Prof = inStr(iProfession);
    return GetLocalString(oPC, "DCS_ProfInfo_"+Prof+"_"+GetPCPlayerName(oPC)+"_"+GetName(oPC));
}

/******************************************************************************/

string DCS_GetProfessionInfo(object oPC, int iProfession, int iReset=FALSE)
{
    string ProfInfo = DCS_GetStoredProfessionInfo(oPC, iProfession);

    if(ProfInfo == "" || iReset)
    {
        struct DCS_PCData Profession = GetProfessionData(oPC, iProfession);
        int    iLevel = Profession.Level;
        int    iRank  = Profession.Rank;
        int    iXP    = Profession.XP;
        int    iSpec  = DCS_GetProfessionSpecialisation(oPC, iProfession);
        string sName  = DCS_GetSpecialisationName(iSpec);

        if(GetIsDM(oPC) || (iLevel > 0 && iRank > 0))
        {
            ProfInfo  = sName+": "+ColorText(inStr(iLevel), DCS_TextColor)+"/"+ColorText(inStr(DCS_SETTING_MAXIMUM_LEVEL), DCS_TextColor)+" ("+ColorText(DCS_GetRankName(iRank), DCS_TextColor)+")";

            if(iLevel < DCS_SETTING_MAXIMUM_LEVEL)
            ProfInfo += nwCrLf+"Erfahrung: " + ColorText(inStr(iXP), DCS_TextColor)+"/"+ColorText(inStr(DCS_GetNextXPLimit(iLevel)), DCS_TextColor);
        }
        else
        {
            ProfInfo = ColorText(DCS_TEXT_NEED_TO_LEARN_PROFESSION, nwcRed);
        }

        DCS_SetProfessionInfo(oPC, iProfession, ProfInfo);
    }

    return ProfInfo;
}

/******************************************************************************/
/******************************************************************************/

void DCS_UpdatePlayerSkill(object oPC, int ResetInfo=FALSE)
{
    object oSkin = SKIN_SupportGetSkin(oPC);
    DCS_RemoveProfessionFeats(oPC);

    DCS_CheckPlayerProfession(oPC, DCS_GetProfession(oPC, 1, TRUE));
    DCS_CheckPlayerProfession(oPC, DCS_GetProfession(oPC, 2, TRUE));

    DCS_UpdateLocalProfessionStatus(oPC, 1);
    DCS_UpdateLocalProfessionStatus(oPC, 2);
    DCS_UpdateLocalSkillStatus(oPC, 1);
    DCS_UpdateLocalSkillStatus(oPC, 2);
    DelayCommand(0.3, DCS_UpdateProfessionFeat(oPC, 1));
    DelayCommand(0.3, DCS_UpdateProfessionFeat(oPC, 2));

    if(!GetHasFeat(1116, oPC))
    IPSafeAddItemProperty(oSkin, ItemPropertyBonusFeat(973));

    if(ResetInfo)
    {
        DCS_SetProfessionInfo(oPC, DCS_GetProfession(oPC, 1, TRUE), "");
        DCS_SetProfessionInfo(oPC, DCS_GetProfession(oPC, 2, TRUE), "");
    }
}

/******************************************************************************/

void DCS_UpdateAllPlayerSkills(int ResetInfo=FALSE)
{
    object oPC = GetFirstPC();
    while(GetIsObjectValid(oPC))
    {
        DCS_UpdatePlayerSkill(oPC, ResetInfo);
        oPC = GetNextPC();
    }
}

/******************************************************************************/

void DCS_ReserveToken()
{
    string sReserve = "TokenReservation";

    SetCustomToken(DCS_TOKEN_CRAFTING_SKILLS+1, ReplaceTextPhrase(FloatToString(DCS_SETTING_SUCCESS_CHANCE_PER_SKILL, 3, 1), ".", ",")+"%");
    SetCustomToken(DCS_TOKEN_CRAFTING_SKILLS+2, ReplaceTextPhrase(FloatToString(DCS_SETTING_EXPERIMENTATION_CHANCE_PER_SKILL, 3, 1), ".", ",")+"%");
    SetCustomToken(DCS_TOKEN_CRAFTING_SKILLS+3, ReplaceTextPhrase(FloatToString(DCS_SETTING_EXPERIMENTATION_POINTS_PER_SKILL, 3, 1), ".", ","));
    SetCustomToken(DCS_TOKEN_CRAFTING_SKILLS+4, ReplaceTextPhrase(FloatToString(DCS_SETTING_MORE_ITEM_CHANCE_PER_SKILL, 3, 1), ".", ",")+"%");
    SetCustomToken(DCS_TOKEN_CRAFTING_SKILLS+5, ReplaceTextPhrase(ReplaceTextPhrase(DCS_SETTING_MORE_ITEM_AMOUNT, ".", ","), "-", " bis ")+"-fache");
    SetCustomToken(DCS_TOKEN_INFO_PROFESSION, sReserve);
    SetCustomToken(DCS_TOKEN_INFO_PROFESSION, sReserve);
    SetCustomToken(DCS_TOKEN_INFO_PROFESSION+10, sReserve);
    SetCustomToken(DCS_TOKEN_MENU_SOURCE+1000, sReserve);
    SetCustomToken(DCS_TOKEN_PROFESSION+1, sReserve);
    SetCustomToken(DCS_TOKEN_PROFESSION+2, sReserve);
    SetCustomToken(DCS_TOKEN_PROFESSION+3, sReserve);

    SetCustomToken(DCS_TOKEN_TRAINER_LEVEL+1, inStr(LevelNovice));
    SetCustomToken(DCS_TOKEN_TRAINER_LEVEL+2, inStr(LevelApprentice));
    SetCustomToken(DCS_TOKEN_TRAINER_LEVEL+3, inStr(LevelExpert));
    SetCustomToken(DCS_TOKEN_TRAINER_LEVEL+4, inStr(LevelMaster));
    SetCustomToken(DCS_TOKEN_TRAINER_LEVEL+5, inStr(LevelGrandmaster));
    SetCustomToken(DCS_TOKEN_COLOR_1, DCS_MainColor);
    SetCustomToken(DCS_TOKEN_COLOR_2, DCS_TextColor);
    SetCustomToken(DCS_TOKEN_COLOR_3, nwcYellow);
    SetCustomToken(DCS_TOKEN_COLOR_END, nwcEnd);
    SetCustomToken(DCS_TOKEN_INFO_VERSION, ColorText("Handwerkssystem - v"+ColorText(DCS_INFO_VERSIONNUMBER, nwcYellow)+", ©by doxic", DCS_TextColor));
}

/******************************************************************************/

void DCS_SQLCreateRecipeTables(int iUpdate)
{
    // Delete these tables first, because of references
    if(iUpdate)
    SQLExecDirect("drop table "+DCS_TABLE_RECIPE_DATA+", "+DCS_TABLE_RECIPE_OBJECT);

    DCS_SQLCreateTable(DCS_TABLE_RECIPES, iUpdate);
    DCS_SQLCreateTable(DCS_TABLE_RECIPE_DATA, iUpdate);
    DCS_SQLCreateTable(DCS_TABLE_RECIPE_OBJECT, iUpdate);
}

void DCS_Cache2DAColumns()
{
    Cache2DAColumn("dcs_objects", "ResRef", "Name", 0);
    Cache2DAColumn("dcs_objects", "Color", "Name", 0);
    Cache2DAColumn("baseitems", "container");
    Cache2DAColumn("baseitems", "weapontype");
    Cache2DAColumn("baseitems", "weaponwield");
    Cache2DAColumn("baseitems", "stacking");
    Cache2DAColumn("weapondata", "WeaponOfChoice");
    Cache2DAColumn("weapondata", "focus");
    Cache2DAColumn("weapondata", "focus_epic");
    Cache2DAColumn("weapondata", "crit_improved");
    Cache2DAColumn("weapondata", "crit_overwhelm");
    Cache2DAColumn("weapondata", "crit_devastating");
    Cache2DAColumn("weapondata", "spec");
    Cache2DAColumn("weapondata", "spec_epic");
    Cache2DAColumn("weapondata", "usefinesse");
    Cache2DAColumn("weapondata", "useubab");
    Cache2DAColumn("weapondata", "hasareaeffect");
    Cache2DAColumn("weapondata", "applydata");
}

void DCS_Init()
{
    DCS_SQLWriteDatabaseSettings();

    int iDatabaseUpdate = DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_DATABASE_UPDATE);
    DCS_SQLCreateTable(DCS_TABLE_PROFESSIONS);
    DCS_SQLCreateTable(DCS_TABLE_RANK_REQUIREMENTS);
    DCS_SQLCreateTable(DCS_TABLE_CRAFTING_LOCK);
    DCS_SQLCreateTable(DCS_TABLE_CRAFTING_STATISTIC, DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_RESET_CRAFTSTAT));
    DCS_SQLCreateRecipeTables(iDatabaseUpdate);
    DCS_SQLCreateTable(DCS_TABLE_2DA_IPRP_SPELLS, iDatabaseUpdate);
    DCS_SQLCreateTable(BBS_TABLE);

    if(iDatabaseUpdate)
    {
        if(DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_UPDATE_ONCE_ONLY))
        DCS_SQLWriteSingleDatabaseSetting(DCS_COL_SETTING_DATABASE_UPDATE, "0", TRUE);

        DelayCommand(1.0,  DCS_Debug("Doxics Crafting System - Datenbankeinträge werden ins Modul übertragen..."));
        DelayCommand(1.0,  DCS_DebugToPlayers("Doxics Crafting System - Datenbankeinträge werden ins Modul übertragen..."));
        DelayCommand(1.0,  DCS_StoreRecipes());
        DelayCommand(10.0, DCS_SQLWrite2DAToDatabase(DCS_2DA_IPRP_SPELLS));
    }
    else
    {
        DelayCommand(10.0, DCS_StoreRecipesLocal());
    }

    DelayCommand(5.0, DCS_SetResourceNames());
    DelayCommand(5.0, DCS_ReserveToken());
    DelayCommand(8.0, DCS_Cache2DAColumns());
}

/******************************************************************************/

void DCS_OnClientEnter(object oPlayer)
{
    DCS_SQLAddPlayerToDatabase(oPlayer, DCS_TABLE_TE_DATA);
    DCS_SQLAddPlayerToDatabase(oPlayer, DCS_TABLE_DATA);
    DelayCommand(2.0, DCS_UpdatePlayerSkill(oPlayer, TRUE));
}

/******************************************************************************/

void DCS_OnClientLeave(object oPlayer)
{
    object oStation = DCS_GetCraftingStation(oPlayer);

    if(GetLocked(oStation) && DCS_GetIsCraftingActive(oStation)){

        AssignCommand(oStation, ClearAllActions());
        ExecuteScript("dcs_finish", oStation);
    }
}

/******************************************************************************/

int DCS_GetIsUniversalTrainer(object oObject=OBJECT_SELF)
{
    return GetLocalInt(oObject, "dcs_teacher_universal");
}

/******************************************************************************/

int DCS_GetIsTrader(object oObject=OBJECT_SELF)
{
    return GetLocalInt(oObject, "dcs_trader");
}

/******************************************************************************/

int DCS_GetCraftingAbility(int iNumber = 1, int iProfession=-1)
{
    if(iNumber < 1  || iNumber > 2)iNumber = 1;
    if(iProfession == -1)iProfession = DCS_GetCraftingProfession();

    switch(iProfession)
    {
        case DCS_PROFESSION_ALCHEMIST: return iNumber == 1 ? ABILITY_INTELLIGENCE : ABILITY_WISDOM;break;
        case DCS_PROFESSION_CARPENTER: return iNumber == 1 ? ABILITY_DEXTERITY    : ABILITY_CONSTITUTION;break;
        case DCS_PROFESSION_COOK:      return iNumber == 1 ? ABILITY_DEXTERITY    : ABILITY_CHARISMA;break;
        case DCS_PROFESSION_ENCHANTER: return iNumber == 1 ? ABILITY_WISDOM       : ABILITY_CHARISMA;break;
        case DCS_PROFESSION_ENGINEER:  return iNumber == 1 ? ABILITY_STRENGTH     : ABILITY_CONSTITUTION;break;
        case DCS_PROFESSION_GOLDSMITH: return iNumber == 1 ? ABILITY_DEXTERITY    : ABILITY_INTELLIGENCE;break;
        case DCS_PROFESSION_SCRIBER:   return iNumber == 1 ? ABILITY_INTELLIGENCE : ABILITY_WISDOM;break;
        case DCS_PROFESSION_SMELTER:   return iNumber == 1 ? ABILITY_STRENGTH     : ABILITY_CONSTITUTION;break;
        case DCS_PROFESSION_SMITH:     return iNumber == 1 ? ABILITY_STRENGTH     : ABILITY_CONSTITUTION;break;
        case DCS_PROFESSION_TAILOR:    return iNumber == 1 ? ABILITY_INTELLIGENCE : ABILITY_DEXTERITY;break;
        case DCS_PROFESSION_TANNER:    return iNumber == 1 ? ABILITY_DEXTERITY    : ABILITY_STRENGTH;break;
    }

    return -1;
}

/******************************************************************************/

object DCS_GetObjectChest()
{
    return GetObjectByTag("dcs_objectchest");
}

/******************************************************************************/

int DCS_GetResourcesInCraftingStation(string sResource)
{
    return DCS_GetItemNum(OBJECT_SELF, sResource);
}

/******************************************************************************/

void DCS_DecreaseItemSize(string sItem, int iDecrease, int iResRef=FALSE, object oTarget=OBJECT_SELF)
{
    object oItem   = GetFirstItemInInventory(oTarget);
    string sSwitch = GetTag(oItem);
    int    iCount, iSize, iDiff;

    // function stops immediately, because we're not in disenchanting mode and the random items aren't available and may not be destroyed
    if(!DCS_GetDisenchantingMode() && DCS_GetIsRandomResource(sItem))
    return;

    while(GetIsObjectValid(oItem))
    {
        if(iCount >= iDecrease)
        break;

        if(iResRef)
        sSwitch = GetResRef(oItem);

        if(sSwitch == sItem)
        {
            iDiff = iDecrease - iCount;
            iSize = GetItemStackSize(oItem);

            if(iSize == 1)
            {
                iCount++;
                DestroyObject(oItem);
            }
            else if(iSize > 1)
            {
                if(iSize <= iDiff)
                {
                    iCount += iSize;
                    DestroyObject(oItem);
                }
                else if(iSize > iDiff)
                {
                    iCount += iDiff;
                    SetItemStackSize(oItem, iSize-iDiff);
                }
            }
        }

        oItem   = GetNextItemInInventory(oTarget);
        sSwitch = GetTag(oItem);
    }
}

/******************************************************************************/
/*                          CRAFTING & RESOURCE FUNCTIONS                    */
/******************************************************************************/

void DCS_DestroyResourcesInStation(int iItemsCount=1)
{
    string sRecipeID = DCS_GetRecipeID();
    int iSize = DCS_GetLocalResourcesStored();
    int iCount;

    for(iCount = 1; iCount <= iSize; iCount++)
    {
        DCS_DecreaseItemSize(DCS_GetLocalResource(iCount), DCS_GetLocalResourceValue(iCount) * iItemsCount, TRUE);
    }
}

/******************************************************************************/

void DCS_SetCraftingStatus(int iStatus)
{
    SetLocalInt(OBJECT_SELF, "dcs_crafting_status", iStatus);
}

/******************************************************************************/

int DCS_GetCraftingStatus()
{
    return GetLocalInt(OBJECT_SELF, "dcs_crafting_status");
}

/******************************************************************************/

void DCS_ChangeItemAppearanceVoid(object oItem, string sAppearance="", int bSetAsCrafted=TRUE)
{
    object oNew = DCS_ChangeItemAppearance(oItem, sAppearance, bSetAsCrafted);
}

/******************************************************************************/

object DCS_ChangeItemAppearance(object oItem, string sAppearance="", int bSetAsCrafted=TRUE)
{
    int nBase = GetBaseItemType(oItem);

    AdvDebug(GetPCSpeaker(), "Changing Item "+GetName(oItem)+" with "+sAppearance);

    if(sAppearance == "" || GetCached2DAInt("baseitems", "ModelType", nBase) == 0 || GetCached2DAInt("baseitems", "stacksize", nBase) > 1)
    return oItem;

    int iChanges = SplitStringSize(sAppearance, ",");
    int i;

    for(i=1; i<=iChanges; i++)
    {
        string sTemp = SplitStringValue(sAppearance, i, ",");
        int iType = SplitStringValueInt(sTemp, 1, ":");
        int iIndex = SplitStringValueInt(sTemp, 2, ":");
        int iNum = SplitStringValueInt(sTemp, 3, ":");
        object oTemp = SafeCopyItemAndModify(oItem, iType, iIndex, iNum);
        DestroyObject(oItem, 0.1);

        AdvDebug(GetPCSpeaker(), "Change "+inStr(i)+": "+sTemp+", type: "+inStr(iType)+", iIndex: "+inStr(iIndex)+", iNum: "+inStr(iNum)+", new item: "+GetName(oTemp));

        oItem = oTemp;
    }

    if(bSetAsCrafted)
    DCS_SetCraftedItem(oItem);

    return oItem;
}

/******************************************************************************/

string DCS_GetRecipeName(object oItem=OBJECT_INVALID)
{
    string sRecipeID = DCS_GetRecipeID();
    string sColor = DCS_GetRecipeEntry(DCS_COL_RECIPE_COLOR, DCS_GetRecipeID());
    string sResRef;

    if(GetIsObjectValid(oItem))
        sResRef = GetResRef(oItem);
    else
        sResRef = DCS_GetRecipeEntry(DCS_COL_RECIPE_RESREF, sRecipeID);

    string sNameDB = DCS_GetRecipeEntry(DCS_COL_RECIPE_NAME, sRecipeID) != "" && DCS_GetRecipeEntry(DCS_COL_RECIPE_NAME, sRecipeID) != dcsEmpty ? DCS_GetRecipeEntry(DCS_COL_RECIPE_NAME, sRecipeID) : DCS_GetRecipeEntry(DCS_COL_RECIPE_MENUTEXT, sRecipeID);

    if(sColor != "")
    sNameDB = ColorText(sNameDB, sColor);

    //AdvDebug(DCS_GetCraftingPlayer(), "DCS_GetRecipeName Color: "+(sColor != "" ? sColor+"text"+nwcEnd : ""));

    return DCS_GetResourceName(sResRef) != "" && DCS_SETTING_USE_SCRIPTED_ITEM_NAMES ? DCS_GetResourceName(sResRef) : sNameDB;
}

/******************************************************************************/

void DCS_RenameCraftedItem(object oItem, int iProcessQuality=TRUE)
{
    string sName = GetName(oItem);
    string sQuality;

    // Writing the quality into oItems name
    if(iProcessQuality && DCS_GetRecipeEntryInt(DCS_COL_RECIPE_QUALITY_IN_NAME, DCS_GetRecipeID()))
    {
        sQuality = DCS_GetQualityName(DCS_IPGetQuality(oItem));
        sQuality = (sQuality != "" ? " ["+sQuality+"]" : "");
    }

    if(DCS_GetRecipeName(oItem) != "")
    sName  = DCS_GetRecipeName(oItem);
    sName += sQuality;

    SetName(oItem, sName);
}

/******************************************************************************/

int DCS_GetRandomAbility()
{
    return Random(6);
}

/******************************************************************************/

int DCS_GetItemQualityLevel(object oItem)
{
    int iQuality = DCS_IPGetQuality(oItem);
    int iQLevel  = 1 + iQuality - DCS_SETTING_QUALITY_QUALITY_BEGINNING;

    if(iQuality == -1)
    return 0;

    return iQuality > DCS_SETTING_QUALITY_QUALITY_BEGINNING ? iQLevel : 1;
}

/******************************************************************************/

float DCS_GetStartingQuality(int iNum)
{
    object oPC         = DCS_GetCraftingPlayer();
    string sRecipeID   = DCS_GetMultiObjectID(iNum);
    int    iResult     = DCS_GetCraftingResult(iNum);
    int    iRecipeDC   = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_DC, sRecipeID);
    int    iRecipeQual = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_QUALITY, sRecipeID);
    int    iProfession = DCS_GetCraftingProfession();
    int    iRank       = DCS_GetProfessionRank(oPC, iProfession);
    int    iLevel      = DCS_GetProfessionLevel(oPC, iProfession);
    float  fDC         = 1 + iRecipeQual * 0.8 + iRecipeDC * 0.65;
    float  fChance     = (DCS_GetSuccessChance() - (DCS_GetSuccessChance() / (fDC / 1.75))) / 18.0;
    float  fResult     = (iResult - (iResult / (fDC * 2.0))) / 4.0;
    float  fRank       = iRank / 3.5;
    float  fLevel      = iLevel / 10.0;

    //AdvDebug(oPC, "StartingQuality, RecipeID: "+sRecipeID+", iResult: "+inStr(iResult)+", recDC: "+inStr(iRecipeDC));

    return fChance + fResult + fRank + fLevel;
}

/******************************************************************************/

int DCS_GetOverallQuality(int iNum, float fStartingQuality=-1.0)
{
    string sRecipeID = DCS_GetMultiObjectID(iNum);
    int iRecipeQuality = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_QUALITY, sRecipeID);
    int iSize = DCS_GetLocalResourcesStored();
    int iOQ, iCounter, i;
    float fQuality;

    //AdvDebug(DCS_GetCraftingPlayer(), ColorText("Quality: iSize: "+inStr(iSize)+", RecipeQuality: "+inStr(iRecipeQuality), nwcGreen));

    if(!iSize || (!iRecipeQuality && DCS_SETTING_QUALITY_IGNORE_NO_QUALITY))
    return 0;

    if(fStartingQuality != -1.0)
    {
        iCounter++;
        fQuality += fStartingQuality;
    }

    if(DCS_SETTING_QUALITY_INCLUCE_RECIPE)
    {
        iCounter++;
        fQuality += inFloat(iRecipeQuality);
    }

    //AdvDebug(DCS_GetCraftingPlayer(), ColorText("Quality: fStart: "+flStr(fStartingQuality)+", fMulti: "+FloatToString(fComponentMulti)+", fQCount: "+FloatToString(fQCount)+",fQCounter: "+FloatToString(fQCounter), nwcGreen));

    // Loop through all items needed for the recipe
    for(i=1; i <= iSize; i++)
    {
        float fResQuality;
        int iValueCount, iResCounter;
        int iValueNeed  = DCS_GetLocalResourceValue(i);
        string sResource = DCS_GetLocalResource(i);
        object oResource = DCS_GetFirstItemInInventory(sResource);

        // sub-loop for the specific item search
        while(iValueCount < iValueNeed && GetIsObjectValid(oResource))
        {
            int iStack = GetItemStackSize(oResource) + iValueCount > iValueNeed ? iValueNeed - iValueCount : GetItemStackSize(oResource);
            int iQuality = DCS_IPGetQuality(oResource);
            iValueCount += iStack;

            if(iQuality > 0 || (!iQuality && !DCS_SETTING_QUALITY_IGNORE_ZERO))
            {
                fResQuality += inFloat(iStack * iQuality);
                iResCounter += iStack;
                AdvDebug(DCS_GetCraftingPlayer(), ColorText("Quality: iResCounter: "+IntToString(iResCounter)+", fResQuality: "+FloatToString(fResQuality), nwcGreen));
            }

            oResource = DCS_GetNextItemInInventory(sResource);
            AdvDebug(DCS_GetCraftingPlayer(), ColorText("Quality: ValueNeed: "+inStr(iValueNeed)+", Stack: "+inStr(iStack)+", ValueCount: "+inStr(iValueCount)+", Itemstack: "+inStr(GetItemStackSize(oResource))+", iQuality: "+inStr(iQuality)+", oResource: "+GetName(oResource), nwcGreen));
        }

        // Handle each resource type as one item, regardless of the amount, by taking the average quality of all items from the same recipetype
        if(fResQuality > 0.0 && iResCounter > 0)
        {
            iCounter++;
            fQuality += fResQuality / iResCounter;
            AdvDebug(DCS_GetCraftingPlayer(), ColorText("------------- Quality avg: "+flStr(fResQuality / iResCounter)+", current counter: "+inStr(iCounter)+", current quality: "+flStr(fQuality)+", current quality avg: "+inStr(flInt(DCS_IPRoundValue(fQuality/iCounter, DCS_SETTING_QUALITY_ROUND_NUMBER))), nwcGreen));
        }
    }

    iOQ = flInt(DCS_IPRoundValue(fQuality/iCounter, DCS_SETTING_QUALITY_ROUND_NUMBER));

    AdvDebug(DCS_GetCraftingPlayer(), ColorText("Quality: Ended; iCounter: "+IntToString(iCounter)+", fQuality: "+FloatToString(fQuality), nwcGreen));

    if(!iCounter)
    return 0;

    AdvDebug(DCS_GetCraftingPlayer(), ColorText("Quality: Endwert: "+DCS_RearrangeFloat(fQuality/iCounter)+", Startqualität: "+flStr(fStartingQuality)+", Itemqualität: "+inStr(flInt(DCS_IPRoundValue(fQuality/iCounter, DCS_SETTING_QUALITY_ROUND_NUMBER))), nwcGreen));

    // Maximum quality is Masterwork!
    return iOQ > dcsQualityMasterwork ? dcsQualityMasterwork : iOQ;
}

/******************************************************************************/

int DCS_DoItemPropertyOperations(string IPStack)
{
    if(FindSubString(IPStack, "Rnd(") != -1)
    {
        string IPRandomSpace = dcsIPRndSpace;
        int    IPCount;

        IPStack = GetSubString(IPStack, 4, GetStringLength(IPStack)-5);
        IPCount = SplitStringSize(IPStack, IPRandomSpace, 1, FALSE);

        if(IPCount > 1)
            IPStack = SplitStringValue(IPStack, Random(IPCount)+1, IPRandomSpace);
        else
            IPStack = SplitStringValue(IPStack, 1, IPRandomSpace);
    }
    else if(FindSubString(IPStack, "Up(") != -1)
    {
        IPStack = GetSubString(IPStack, 3, GetStringLength(IPStack)-4);
    }

    //AdvDebug(GetPCSpeaker(), "IPStack: "+IPStack);
    return stInt(IPStack);
}

int DCS_GetIsItemPropertyUpdate(string IPStack)
{
    return FindSubString(IPStack, "Up(") != -1;
}

/******************************************************************************/

void DCS_ApplyItemProperties(object oItem, int iNum, int iUseIPOnly=-1)
{
    string sID   = DCS_GetMultiObjectID(iNum);
    int    iSize = DCS_ArrayGetInt(sID, "size", 1, 1, "ip");
    int    iCount, IPType, IPCostTable, IPSubType;
    string IPTypeBase;
    itemproperty IPFind;

    if(!iSize)return;

    //AdvDebug(GetPCSpeaker(), "Size: "+inStr(iSize));

    for(iCount=1; iCount <= iSize; iCount++)
    {
        if(iUseIPOnly == -1 || iCount == iUseIPOnly)
        {
            IPTypeBase = DCS_ArrayGetString(sID, "type", iCount, 1, "ip");
            IPType     = DCS_DoItemPropertyOperations(IPTypeBase);

            //AdvDebug(GetPCSpeaker(), "IPTypeBase: "+IPTypeBase+" IPType:"+inStr(IPType));
            if(DCS_GetIsItemPropertyUpdate(IPTypeBase))
            {
                //AdvDebug(GetPCSpeaker(), "Itemproperty Update");
                IPCostTable = DCS_DoItemPropertyOperations(DCS_ArrayGetString(sID, "costtable", iCount, 1, "ip"));
                IPSubType   = DCS_DoItemPropertyOperations(DCS_ArrayGetString(sID, "subtype",   iCount, 1, "ip"));
                DCS_IPUpgradeOrAddItemProperty(oItem, IPCostTable, IPType, -1, -1, IPCostTable, IPSubType);
            }
            else if(IPType == DCS_ITEM_PROPERTY_RANDOM)
            {
                //AdvDebug(GetPCSpeaker(), inStr(iCount)+" - Random IP");
                DCS_IPApplyRandomItemProperty(oItem);
            }
            else if(IPType == DCS_ITEM_PROPERTY_SPELLGRADE)
            {
                //AdvDebug(GetPCSpeaker(), inStr(iCount)+" - Spellgrade");
                IPCostTable = DCS_DoItemPropertyOperations(DCS_ArrayGetString(sID, "costtable", iCount, 1, "ip"));
                IPSubType   = DCS_DoItemPropertyOperations(DCS_ArrayGetString(sID, "subtype",   iCount, 1, "ip"));

                IPSafeAddItemProperty(oItem, ItemPropertyCastSpell(DCS_IPGetRandomSpellFromGrade(IPCostTable), IPSubType));
            }
            else
            {
                //AdvDebug(GetPCSpeaker(), inStr(iCount)+" - Normal IP");
                IPCostTable = DCS_DoItemPropertyOperations(DCS_ArrayGetString(sID, "costtable", iCount, 1, "ip"));
                IPSubType   = DCS_DoItemPropertyOperations(DCS_ArrayGetString(sID, "subtype",   iCount, 1, "ip"));
                IPSafeAddItemProperty(oItem, DCS_IPCreateItemProperty(IPType, IPCostTable, IPSubType));
            }
        }
    }
}

/******************************************************************************/

void DCS_ApplyQualityAndMaterial(object oItem, int iNum)
{
    int iQuality  = DCS_GetOverallQuality(iNum, DCS_GetStartingQuality(iNum));
    int iMaterial = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_MATERIAL, DCS_GetMultiObjectID(iNum));

    if(iQuality || (!iQuality && !DCS_SETTING_QUALITY_IGNORE_NO_QUALITY))
    IPSafeAddItemProperty(oItem, ItemPropertyQuality(iQuality));

    if(iMaterial)
    IPSafeAddItemProperty(oItem, ItemPropertyMaterial(iMaterial));
}

/******************************************************************************/

string DCS_GetObjectInformation(object oItem, int iTagType=DCS_ITEM_TAG_TYPE_CREATE)
{
    string sDesc = GetDescription(oItem);
    string sColor;
    int iPosTagBegin, iPosTagFinish, iPosNameSearch, iPosNameFinish;

    // Creating a description tag for oItem depending on iTagType
    switch(iTagType)
    {
        case DCS_ITEM_TAG_TYPE_CREATE:  sColor = nwcOrange; break;
        case DCS_ITEM_TAG_TYPE_ENCHANT: sColor = nwcYellow; break;
        case DCS_ITEM_TAG_TYPE_KEEN:    sColor = nwcRed;    break;
        case DCS_ITEM_TAG_TYPE_GEMBIND: sColor = nwcLightBlue; break;
    }

    iPosTagBegin  = FindSubString(sDesc, DCS_DESCRIPTION_NAMES_BEGIN);
    iPosTagFinish = FindSubString(sDesc, DCS_DESCRIPTION_NAMES_FINISH);

    // Search for listed tags
    if(iPosTagBegin != -1)
    {
        iPosNameSearch  = FindSubString(sDesc, nwcPurple, FindSubString(sDesc, sColor, iPosTagBegin));
        iPosNameFinish  = FindSubString(sDesc, nwcEnd, iPosNameSearch);

        // Search for the tag's color within the crafting-system tag phrase and for the creators name within the tag.
        return GetSubString(sDesc, iPosNameSearch, iPosNameFinish-iPosNameSearch);
    }

    return "";
}

/******************************************************************************/

void DCS_AppendTagIntoItem(object oItem, object oCreator, int iTagType=DCS_ITEM_TAG_TYPE_CREATE, int iIncrementBy=0)
{
    string sDesc    = GetDescription(oItem);
    string sColorPC = nwcPurple;
    string sColor, sTag, sRecipe;
    int iPosTagBegin, iPosTagFinish, iPosColorSearch, iPosNameSearch, iPosNameFinish;

    // Creating a description tag for oItem depending on iTagType
    switch(iTagType)
    {
        case DCS_ITEM_TAG_TYPE_CREATE:  sColor = nwcOrange;                    sTag = ColorText("**", sColor)+" Hergestellt von: "+ColorText(GetName(oCreator), sColorPC);break;
        case DCS_ITEM_TAG_TYPE_ENCHANT: sColor = nwcYellow;                    sTag = ColorText("**", sColor)+" Verzaubert von: "+ColorText(GetName(oCreator), sColorPC); sRecipe = DCS_GetRecipeID();break;
        case DCS_ITEM_TAG_TYPE_KEEN:    sColor = nwcRed;                       sTag = ColorText("**", sColor)+" Dieser Gegenstand wurde von "+ColorText(GetName(oCreator), sColorPC)+" geschärft!";break;
        case DCS_ITEM_TAG_TYPE_GEMBIND: sColor = nwcLightBlue;                 sTag = ColorText("**", sColor)+" Fasser: "+ColorText(GetName(oCreator), sColorPC);break;
        case DCS_ITEM_TAG_TYPE_GEM:     sColor = nwcGold; sColorPC = nwcGreen; sTag = ColorText("**", sColor)+" Edelsteine eingesetzt: "+ColorText(GetName(oCreator)+(iIncrementBy > 0 ? " ("+inStr(iIncrementBy)+")": ""), sColorPC);break;
    }

    //AdvDebug(GetLastUsedBy(), nwCrLf+"Adding special tag to Description ("+sTag+"), increment: "+inStr(iIncrementBy));

    // Writing the given tag into oItems description
    if(sTag != "")
    {
        iPosTagBegin  = FindSubString(sDesc, DCS_DESCRIPTION_NAMES_BEGIN);
        iPosTagFinish = FindSubString(sDesc, DCS_DESCRIPTION_NAMES_FINISH);

        //AdvDebug(GetLastUsedBy(), nwCrLf+"Trying to add tag into description. Begin: "+inStr(iPosTagBegin)+", Finish: "+inStr(iPosTagFinish)+", Tag: "+sTag);
        // Search for listed tags
        if(iPosTagBegin != -1)
        {
            iPosColorSearch = FindSubString(sDesc, sColor, iPosTagBegin);
            iPosNameSearch  = FindSubString(sDesc, sColorPC, iPosColorSearch);
            iPosNameFinish  = FindSubString(sDesc, nwcEnd, iPosNameSearch);

            //AdvDebug(GetLastUsedBy(), nwCrLf+"Names Tag already exists. Tag Color: "+inStr(iPosColorSearch)+", Names Search: "+inStr(iPosNameSearch)+", Names Finish: "+inStr(iPosNameFinish));

            // The current tag already exists, so we need to look for oCreators name within it
            if(iPosColorSearch != -1 && iPosColorSearch < iPosTagFinish)
            {
                //AdvDebug(GetLastUsedBy(), nwCrLf+"Current tag exists. Searching for oCreators name within");

                if(FindSubString(GetSubString(sDesc, iPosNameSearch, iPosNameFinish-iPosNameSearch), GetName(oCreator)) == -1)
                {
                    sDesc = InsertTextPhraseByPosition(sDesc, ", "+GetName(oCreator)+(iIncrementBy > 0 ? " ("+inStr(iIncrementBy)+")": ""), iPosNameFinish);
                    //AdvDebug(GetLastUsedBy(), nwCrLf+"Name doesn't exist, inserting into current tag: "+sDesc);
                }
                // Increment the "amount" of oCreator by iIncrementBy if > 0
                else if(iIncrementBy)
                {
                    int iNameBegin = FindSubString(sDesc, GetName(oCreator), iPosNameSearch);
                    int iExBegin = FindSubString(sDesc, "(", iNameBegin) + 1;
                    int iExFinish = FindSubString(sDesc, ")", iNameBegin);
                    int iNum = StringToInt(GetSubString(sDesc, iExBegin, iExFinish - iExBegin)) + iIncrementBy;
                    sDesc = ReplaceTextPhraseByPosition(sDesc, GetName(oCreator)+" ("+inStr(iNum)+")", iNameBegin, iExFinish+1);
                    //AdvDebug(GetLastUsedBy(), "iIncrementBy: "+inStr(iIncrementBy)+", new Desc: "+sDesc+", new Num: "+inStr(iNum));
                }
            }
            // The current Tag doesn't exist, so we just insert it into the names-tag.
            else
            {
                sDesc = InsertTextPhraseByPosition(sDesc, sTag+nwCrLf, iPosTagFinish);
                //AdvDebug(GetLastUsedBy(), nwCrLf+"Current tag doesn't exist yet, inserting into Names tag: "+sDesc);
            }
        }
        // If there are no tags present, create a new phrase where all tags are listed
        else
        {
            sDesc += nwCrLf+DCS_DESCRIPTION_NAMES_BEGIN+nwCrLf+sTag+nwCrLf+DCS_DESCRIPTION_NAMES_FINISH;
            //AdvDebug(GetLastUsedBy(), nwCrLf+"Names Tag doesn't exist yet. Appending into description: "+sDesc);
        }
    }

    //AdvDebug(GetLastUsedBy(), nwCrLf+"Trying to add recipe id into description");

    // Writing the recipe tag into oItems description to prevent multiple enchantments
    if(sRecipe != "" && DCS_GetEnchantingMode(TRUE, DCS_ID_ENCHANTING_MAGICAL) && DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_TAG_ENCHANT_ITEM))
    {
        iPosTagBegin  = FindSubString(sDesc, DCS_DESCRIPTION_RECIPES_BEGIN);
        iPosTagFinish = FindSubString(sDesc, DCS_DESCRIPTION_RECIPES_FINISH);

        //AdvDebug(GetLastUsedBy(), nwCrLf+"Writing Recipe into Description. Recipes Begin: "+inStr(iPosTagBegin)+", Recipes Finish: "+inStr(iPosTagFinish)+", sRecipe: "+sRecipe);

        // Search for listed recipes
        if(iPosTagBegin != -1)
        {
            iPosNameSearch = FindSubString(sDesc, nwcBlack, iPosTagBegin);
            iPosNameFinish = FindSubString(sDesc, nwcEnd, iPosNameSearch);

            //AdvDebug(GetLastUsedBy(), nwCrLf+"Recipes tag already exists. Now searching for sRecipe within. Names Search: "+inStr(iPosNameSearch)+", Names Finish: "+inStr(iPosNameFinish));

            // Search for the recipe within the recipes tag.
            if(FindSubString(GetSubString(sDesc, iPosNameSearch, iPosNameFinish-iPosNameSearch), sRecipe) == -1)
            {
                sDesc = InsertTextPhraseByPosition(sDesc, "|"+sRecipe, iPosNameFinish);
                //AdvDebug(GetLastUsedBy(), nwCrLf+"sRecipe doesn't exist yet, inserting into current tag: "+sDesc);
            }
        }
        else
        {
            sDesc += DCS_DESCRIPTION_RECIPES_BEGIN+nwCrLf+ColorText(sRecipe, nwcBlack)+DCS_DESCRIPTION_RECIPES_FINISH;
            //AdvDebug(GetLastUsedBy(), nwCrLf+"Recipes tag doesn't exist yet. Appending into description: "+sDesc);
        }
    }

    SetIdentified(oItem, TRUE);

    if(sDesc != "")
    SetDescription(oItem, sDesc);
}

/******************************************************************************/

void DCS_CreateCraftingRemains(int iResult, object oDestination=OBJECT_SELF)
{
    object oPC        = DCS_GetCraftingPlayer();
    string sRecipeID  = DCS_GetRecipeID();
    string sResRef    = DCS_GetRecipeEntry(DCS_COL_RECIPE_REMAINS, sRecipeID);
    float  fSuccess   = DCS_GetSuccessChance() / 100.0;
    float  fResult    = iResult / 20.0;
    int    iResource  = flInt(DCS_GetResourceWorth(sRecipeID) / 5.0); //take a third of the resource worth
    object oItem;

    AdvDebug(oPC, "Resource Worth: "+inStr(iResource)+", iResult: "+inStr(iResult)+", fResult: "+flStr(fResult)+", Success: "+flStr(fSuccess));

    if(iResult <= 3 && fSuccess >= 0.80) {
        fResult = fSuccess / 1.5;
        AdvDebug(oPC, "result <= 3 && success > 80%: new fResult: "+flStr(fResult));
    }
    iResource = flInt(DCS_IPRoundValue(iResource * fResult));

    AdvDebug(oPC, "Resources Amount (iResource * fResult): "+inStr(iResource));

    while(iResource > 0)
    {
        if(iResource > 500)
        {
            oItem      = DCS_CreateItemOnObject(sResRef, oDestination, 500);
            iResource -= 500;
        }
        else
        {
            oItem     = DCS_CreateItemOnObject(sResRef, oDestination, iResource);
            iResource = 0;
        }
    }
}

/******************************************************************************/

int DCS_CreateEssence(string sEssence, int iItemCost, int iCostDividor, int iMaxAmount, float fChanceDividor, object oCreate)
{
    object oEssence;
    int   iEssenceAmount, iCount, iDice, iCreate;
    float fEssenceChance;

    iEssenceAmount = iItemCost / iCostDividor;

    if(iEssenceAmount >= 1)
    {
        iEssenceAmount = GetRandomInt(iEssenceAmount/2, iEssenceAmount);
        iEssenceAmount = iEssenceAmount > iMaxAmount ? iMaxAmount: iEssenceAmount;
        fEssenceChance = iItemCost / fChanceDividor;
        fEssenceChance = fEssenceChance >= 95.0 ? 95.0 : fEssenceChance;

        //AdvDebug(DCS_GetCraftingPlayer(), "Essence: "+sEssence+", Amount: "+inStr(iEssenceAmount)+", Chance: "+flStr(fEssenceChance));

        for(iCount=1; iCount <= iEssenceAmount; iCount++)
        {
            iDice = d100();
            //AdvDebug(DCS_GetCraftingPlayer(), "Counter: "+inStr(iCount)+", Dice: "+inStr(iDice));
            if(iDice + fEssenceChance >= 100.0 && iDice > 5)
            iCreate++;
        }

        if(iCreate >= 1)
        oEssence = DCS_CreateItemOnObject(sEssence, oCreate, iCreate);
    }

    return iCreate;
}

/******************************************************************************/

void DCS_CraftingFailure(int iResult)
{
    // Disenchanting or Gembinding
    if((DCS_GetDisenchantingMode() || DCS_GetGemBindingMode()) && DCS_GetResultType(iResult, DCS_GetSuccessChance()) == DCS_RESULT_ABSOLUTE_FAILURE)
        DestroyObject(DCS_GetCraftedItem());

    /* Temporarily disabled
    else
        DCS_CreateCraftingRemains(iResult);
    */

//    if(DCS_GetGemBindingMode())
//    {
//Lokale Ressourcen iterieren (ResRefs)
    int iResources = DCS_GetLocalResourcesStored();
    int iStart = DCS_GetGemBindingMode() ? 2 : 1;
    int iGems, i;
    string sResult;
    string sTemp = "fail_temp_size_";
    string sObjCount = "object_count";
    int iCount;

    // Alle lokal gespeicherten Ressourcen iterieren, die fuer den HWS Vorgangen benoetigt werden
    for(i = iStart; i <= iResources; i++)
    {
        string sLocal = DCS_GetLocalResource(i);
        int iValue = DCS_GetLocalResourceValue(i); // max. ressourcenanzahl
        object oItem = GetFirstItemInInventory();

        // Alle Items in Station iterieren
        while(GetIsObjectValid(oItem) && iValue > 0)
        {
            // ResRef abfrage
            if(GetResRef(oItem) == sLocal)
            {
                // Wenn Stacksize von Item >= benoetigter Value, dann iValue
                // sonst iValue-StackSize
                int iSize = GetItemStackSize(oItem);
                int iTempSize;
                iCount++;

                if(iSize > iValue)
                {
                    iTempSize = iValue;
                    iValue = 0;
                }
                else
                {
                  //...
                }
                SetLocalInt(OBJECT_SELF, sTemp+inStr(iCount), iTempSize);
                SetLocalObject(OBJECT_SELF, sTemp+inStr(iCount), oItem);
            }

            oItem = GetNextItemInInventory();
        }
        SetLocalInt(OBJECT_SELF, sObjCount, iCount);
    }

// To-Do: sObjCount local int iterieren, qualitaet abfragen und fuer gespeicherte itemanzahl (stemp+i) wuerfeln
    for(iObjects = 1; iObjects <= GetLocalInt(OBJECT_SELF, sObjCount); iObjects++)
    {
    object oI
         int iQuality = DCS_IPGetQuality(
         if(Random(100)+1 < iChance)
         DecreaseItemSize(oItem);

        int iRandom = Random(100) + 1;

//switch(quality)
        // 30% chance auf zerstoerung
        if(iRandom <= iChance)
        iCount++;

        //AdvDebug(DCS_GetCraftingPlayer(), "iRandom: "+inStr(iRandom)+", destroyed: "+inStr(iRandom <= 30));
    }

    if(iCount > 0)
    {
        DCS_DecreaseItemSize(sLocal, iCount, TRUE);
        sResult += (sResult != "" ? ", " : "") + inStr(iCount)+"x "+ColorText(DCS_GetResourceName(sLocal), nwcRed);
    }

    string sObject = "Gegenstände";

    if(DCS_GetBindingMode())
    sObject = "Edelsteine";

    if(sResult != "")
    DCS_SetCraftedItemResult(nwCrLf+nwCrLf+"Bei diesem Vorgang sind folgende "+sObject+" zerstört worden: "+sResult+"."+nwCrLf);
//    }
}

/******************************************************************************/

void DCS_CraftingSuccess(int iResult, int iNum=1)
{
    object oStation     = OBJECT_SELF;
    object oPC          = DCS_GetCraftingPlayer();
    object oCraftedItem = DCS_GetCraftedItem();
    object oCreatedItem;
    string sContainer;

    // If the player is enchanting a non ranged weapon or an armor no items will be placed in the station, but
    // the 'crafted item' will be enchanted with new item properties. If the item is a ranged weapon, a new enchanting item "container" will
    // be placed in the station, containing ammonation for the item.
    // Otherwise the default crafting procedure will continue
    if(DCS_GetEnchantingMode())
    {
        // Apply the item properties to the crafted item, if its not a ranged weapon
        if(DCS_GetEnchantingMode(TRUE, DCS_ID_ENCHANTING_MAGICAL) || !IPGetIsRangedWeapon(oCraftedItem))
        {
            DCS_SetEnchantingMode(TRUE);
            DCS_ApplyItemProperties(oCraftedItem, iNum, DCS_GetEnchantingMode(TRUE, DCS_ID_ENCHANTING_ELEMENTAL) ? (DCS_IPGetIsArmor(oCraftedItem) ? 2 : 1) : -1);
            DCS_AppendTagIntoItem(oCraftedItem, oPC, DCS_ITEM_TAG_TYPE_ENCHANT);

            DCS_SetCraftedItemResult(ColorText(GetName(oCraftedItem), nwcYellow)+" verzaubert.");
        }
        // Create the ranged weapon type enchanting ammonation "container"
        else
        {
            sContainer   = DCS_GetAmmoContainer(GetBaseItemType(oCraftedItem));
            oCreatedItem = DCS_CreateItemOnObject(sContainer, DCS_GetObjectChest(), 1, sContainer+"_"+GetName(oPC), "");

            SetName(oCreatedItem, GetName(oCreatedItem)+" ("+DCS_GetDefaultAmmoName(oCraftedItem)+")");
            DCS_SetCraftedItem(oCreatedItem);
            DCS_SetCraftedItemResult(ColorText(GetName(oCreatedItem), nwcYellow)+" hergestellt.");
            DelayCommand(1.0, DCS_ApplyQualityAndMaterial(oCreatedItem, iNum));
            DelayCommand(3.0, DCS_ApplyItemProperties(oCreatedItem, iNum, 3));
            DelayCommand(3.0, DCS_AppendTagIntoItem(oCreatedItem, oPC, DCS_ITEM_TAG_TYPE_CREATE));

            // Apply the item properties also to the current "enchanted" ammunation
            if(IPGetIsAmmunation(oCraftedItem))
            DelayCommand(5.0, DCS_ApplyItemProperties(oCraftedItem, iNum, 3));

            AdvDebug(oPC, "sResRef: "+sContainer+", CraftedItem: "+GetName(oCraftedItem)+" ("+GetTag(oCraftedItem)+"), CreatedItem: "+GetName(oCreatedItem)+" ("+GetTag(oCreatedItem)+")");
        }
    }

    // If the player is in disenchanting mode, the current item will be disassembled into
    // enchanting pulver and with a chance some enchanting essences.
    // The higher the item gold piece value, the higher the chance for high class essences and valuable pulver.
    else if(DCS_GetDisenchantingMode())
    {
        int iObjects = DCS_GetObjectsCount();
        int iCost    = DCS_RecalculateItemGoldPieceValue(oCraftedItem) * iObjects;
        int iPulver, iEssence;
        string sEssence;
        AdvDebug(oPC, "iCost: "+inStr(iCost)+", iObjects: "+inStr(iObjects)+", Goldpiece Value: "+inStr(GetGoldPieceValue(oCraftedItem)));

        // Chance for class 3 enchanting pulver and essences
        if(iCost >= 85000)
        {
            iPulver  = GetRandomInt(flInt(sqrt(inFloat(iCost)) / 15.0), flInt(sqrt(inFloat(iCost)) / 8.5));
            iEssence = DCS_CreateEssence(dcsVerzEssenzC, iCost, 25000, 15, 2500.0, oStation);

            DCS_CreateItems(DCS_CreateItemOnObject(dcsVerzPulverC, DCS_GetObjectChest()), iPulver, oStation, FALSE);
            DCS_SetCraftedItemResult(GetName(oCraftedItem)+" entzaubert.\n\nDabei konntet ihr "+ColorText(inStr(iPulver)+"x ", nwcYellow)+DCS_GetResourceName(dcsVerzPulverC)+(iEssence == 0 ? "" : " und "+ColorText(inStr(iEssence)+"x ", nwcYellow)+DCS_GetResourceName(dcsVerzEssenzC))+" herstellen.");
        }
        // Chance for class 2 enchanting pulver and essences
        else if(iCost >= 30000)
        {
            iPulver  = GetRandomInt(flInt(sqrt(inFloat(iCost)) / 6.0), flInt(sqrt(inFloat(iCost)) / 3.5));
            iEssence = DCS_CreateEssence(dcsVerzEssenzB, iCost, 11000, 15, 1400.0, oStation);

            DCS_CreateItems(DCS_CreateItemOnObject(dcsVerzPulverB, DCS_GetObjectChest()), iPulver, oStation, FALSE);
            DCS_SetCraftedItemResult(GetName(oCraftedItem)+" entzaubert.\n\nDabei konntet ihr "+ColorText(inStr(iPulver)+"x ", nwcYellow)+DCS_GetResourceName(dcsVerzPulverB)+(iEssence == 0 ? "" : " und "+ColorText(inStr(iEssence)+"x ", nwcYellow)+DCS_GetResourceName(dcsVerzEssenzB))+" herstellen.");
        }
        // Class 1 enchanting pulver will always be created and chance for class 1 essences
        else
        {
            iPulver  = GetRandomInt(flInt(sqrt(inFloat(iCost)) / 2.0), flInt(sqrt(inFloat(iCost)) / 1.25));
            iEssence = DCS_CreateEssence(dcsVerzEssenzA, iCost, 5000, 15, 450.0, oStation);

            DCS_CreateItems(DCS_CreateItemOnObject(dcsVerzPulverA, DCS_GetObjectChest()), iPulver, oStation, FALSE);
            DCS_SetCraftedItemResult(GetName(oCraftedItem)+" entzaubert.\n\nDabei konntet ihr "+ColorText(inStr(iPulver)+"x ", nwcYellow)+DCS_GetResourceName(dcsVerzPulverA)+(iEssence == 0 ? "" : " und "+ColorText(inStr(iEssence)+"x ", nwcYellow)+DCS_GetResourceName(dcsVerzEssenzA))+" herstellen.");
        }

        // Destroying the disenchanted object
        DestroyObject(oCraftedItem);
    }
    else if(DCS_GetGemBindingMode())
    {
        int iResources = DCS_GetLocalResourcesStored();
        int iTop = GetItemAppearance(oCraftedItem, 1, 2) == 1 && GetItemAppearance(oCraftedItem, 2, 2) == 1; // Top slot not used
        int iGems, i, n;
        string sTop;

    // looping through all local stored ResRefs
        for(i = 1; i <= iResources; i++)
        {
            object oCopy = GetFirstItemInInventory(oStation);
            string sLocal = DCS_GetLocalResource(i);
            int iValue = DCS_GetLocalResourceValue(i);

            AdvDebug(oPC, ColorText("LocalResource "+inStr(i)+": "+sLocal+", Value: "+inStr(iValue)+", Gems: "+inStr(iGems), nwcRed));

            //Looping through all objects looking for gems with the ResRef sLocal
            while(GetIsObjectValid(oCopy))
            {
                if(GetItemHasItemProperty(oCopy, ITEM_PROPERTY_SOCKET_TYPE) && GetResRef(oCopy) == sLocal)
                {
                    int iSocketType = GetItemPropertyCostTableValue(DCS_IPFindItemProperty(oCopy, ITEM_PROPERTY_SOCKET_TYPE));
                    int iGemID = DCS_GetGemOrderedID(sLocal) + 1; // Starting at 1 as 0 is reserved for empty slots

                    // Declare the first gem as the "visible" one on the ring
                    if(iTop && sTop == "") // model(2):position:number,color(1):position:number
                        sTop = "2:2:"+inStr(iGemID / 4 + 1)+",1:2:"+inStr(iGemID % 4 + 1);

                    iGems += iValue;
                    AdvDebug(GetPCSpeaker(), "Appending Tag: "+GetName(oCopy));
                    DCS_AppendTagIntoItem(oCraftedItem, oCopy, DCS_ITEM_TAG_TYPE_GEM, iValue);

                    // copying the item properties of the found gem n-times
                    for(n = 1; n <= iValue; n++)
                    {
                        DCS_IPCopyItemProperties(oCopy, oCraftedItem, TRUE);
                    }
                    break;
                }

                oCopy = GetNextItemInInventory(oStation);
            }
        }

        AdvDebug(oPC, ColorText("iGems: "+inStr(iGems), nwcRed)+", Top unused: "+inStr(iTop));
        AdvDebug(GetPCSpeaker(), "\n\nIP Debug:");
        DCS_IPDebugItemProperties(GetPCSpeaker(), oCraftedItem);

         DCS_SetCraftedItemResult(inStr(iGems)+ColorText((iGems == 1 ? " Edelstein" : " Edelsteine"), nwcYellow)+" in "+ColorText(GetName(oCraftedItem), nwcYellow)+" eingesetzt.");
        DCS_AppendTagIntoItem(oCraftedItem, oPC, DCS_ITEM_TAG_TYPE_GEMBIND);

        if(FindSubString(GetName(oCraftedItem), DCS_TEXT_SOCKETED) == -1)
        SetName(oCraftedItem, GetName(oCraftedItem)+" "+DCS_TEXT_SOCKETED);

        itemproperty ipSocket = DCS_IPFindItemProperty(oCraftedItem, ITEM_PROPERTY_SOCKET);
        itemproperty ipBigSocket = DCS_IPFindItemProperty(oCraftedItem, ITEM_PROPERTY_BIG_SOCKET);
        int iSockets = GetItemPropertyCostTableValue(ipSocket);
        int iSocketsUnused = DCS_GetLocalSockets(ITEM_PROPERTY_SOCKET);
        int iBigSockets = GetItemPropertyCostTableValue(ipBigSocket);
        int iBigSocketsUnused = DCS_GetLocalSockets(ITEM_PROPERTY_BIG_SOCKET);

        if(iSockets != iSocketsUnused)
            DCS_IPDegradeItemPropertyValue(oCraftedItem, ipSocket, iSockets-iSocketsUnused, FALSE, TRUE);
        if(iBigSockets != iBigSocketsUnused)
            DCS_IPDegradeItemPropertyValue(oCraftedItem, ipBigSocket, iBigSockets-iBigSocketsUnused, FALSE, TRUE);

        DelayCommand(0.25, DCS_ChangeItemAppearanceVoid(oCraftedItem, sTop));

        AdvDebug(oPC, ColorText("Finished, item tag: "+GetTag(DCS_GetCraftedItem())+", previous: "+GetTag(oCraftedItem), nwcRed));
    }
    // Default crafting procedure
    else
    {
        string sRecipeID = DCS_GetMultiObjectID(iNum);
        string sResRef   = DCS_GetRecipeEntry(DCS_COL_RECIPE_RESREF, sRecipeID);
        oCreatedItem     = DCS_CreateItemOnObject(sResRef, DCS_GetObjectChest(), 1, sResRef+"_"+inStr(iNum)+"_"+GetName(oPC), "");

        DCS_SetCraftedItem(oCreatedItem, iNum);
        DelayCommand(1.0, DCS_ApplyQualityAndMaterial(oCreatedItem, iNum));
        DelayCommand(2.0, DCS_ApplyItemProperties(oCreatedItem, iNum));
        DelayCommand(3.0, DCS_AppendTagIntoItem(oCreatedItem, oPC, DCS_ITEM_TAG_TYPE_CREATE));
        DelayCommand(4.0, DCS_RenameCraftedItem(oCreatedItem));
    }
}

/******************************************************************************/

void DCS_CopyItemVoid(object oItem, int iCount, object oTargetInventory=OBJECT_INVALID, string sNewTag="")
{
    object oNewItem;
    int i;

    for(i=1; i <= iCount; i++)
    {
        oNewItem = SafeCopyObject(oItem, GetLocation(oTargetInventory), oTargetInventory, sNewTag);
    }
}

/******************************************************************************/

object DCS_CreateItemOnObject(string sItemTemplate, object oTarget=OBJECT_SELF, int nStackSize=1, string sNewTag="", string sItemColor=dcsItemColor)
{
    object oItem = CreateItemOnObject(sItemTemplate, oTarget, nStackSize, sNewTag);

    if(DCS_SETTING_USE_SCRIPTED_ITEM_NAMES)
    SetName(oItem, ColorText(DCS_GetResourceName(sItemTemplate), sItemColor));

    SetStolenFlag(oItem, TRUE);

    return oItem;
}

/******************************************************************************/

void DCS_CreateItems(object oItem, int iCount, object oTargetInventory=OBJECT_SELF, int iModifyTagByQuality=TRUE)
{
    int iMaxStack = GetCached2DAInt("baseitems", "stacking", GetBaseItemType(oItem));
    int iPlayerTag = DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_CRAFT_PLAYER_TAG);
    object oPC = DCS_GetCraftingPlayer();
    string sPCName = GetName(oPC);
    string sLastNameTag = FindSubString(sPCName, " ") != -1 ? GetSubString(sPCName, FindSubString(sPCName, " ") + 1, 4) : GetStringRight(sPCName, 4);
    string sNewTag = GetResRef(oItem)+GetStringLowerCase(iPlayerTag ? "_"+GetStringLeft(sPCName, 4)+sLastNameTag : "")+(iModifyTagByQuality ? "_q"+inStr(DCS_IPGetQuality(oItem)) : "");

    if(GetItemStackSize(oItem) > 1)
    SetItemStackSize(oItem, 1);

    //AdvDebug(GetPCSpeaker(), "Finish: "+GetName(oItem)+", x"+inStr(iCount)+", Max: "+inStr(iMaxStack));

    if(iCount > 1 && iMaxStack > 1)
    {
        int iStack, iCopied;
        object oNewItem;

        while(iCopied == 0 || iCopied < iCount)
        {
            oNewItem = SafeCopyObject(oItem, GetLocation(oTargetInventory), oTargetInventory, sNewTag);
            iStack   = GetItemStackSize(oNewItem) - 1;

            //AdvDebug(GetFirstPC(), "Tag: "+sNewTag+", iCount: "+inStr(iCount)+", iCopied: "+inStr(iCopied)+", iStack-1: "+inStr(iStack)+", iMax: "+inStr(iMaxStack));
            if(iCount + iStack - iCopied > iMaxStack)
            {
                SetItemStackSize(oNewItem, iMaxStack);
                iCopied += iMaxStack - iStack;
                //AdvDebug(GetFirstPC(), "> Maxstack. iCount: "+inStr(iCount)+", iCopied: "+inStr(iCopied)+", iStack-1: "+inStr(iStack)+", iMax: "+inStr(iMaxStack));
            }
            else
            {
                //AdvDebug(GetFirstPC(), "<= Maxstack. iCount: "+inStr(iCount)+", iCopied: "+inStr(iCount + iStack - iCopied)+", iStack-1: "+inStr(iStack)+", iMax: "+inStr(iMaxStack));
                SetItemStackSize(oNewItem, iCount + iStack - iCopied);
                break;
            }
        }
    }
    else
    DCS_CopyItemVoid(oItem, iCount, oTargetInventory, sNewTag);
}

/******************************************************************************/

void DCS_FinishCreateItems(object oTargetInventory=OBJECT_SELF, int iModifyTagByQuality=TRUE, float fDelay=1.0)
{
    int iObjects = DCS_GetObjectsCount();
    int iAmount, i, iA;
    object oItem;
    string sNewTag;

    if(iObjects == 1)
    {
        oItem = DCS_GetCraftedItem();
        iAmount = DCS_GetObjectAmount();
        DelayCommand(fDelay, DCS_CreateItems(oItem, iAmount, oTargetInventory, iModifyTagByQuality));
        DelayCommand(fDelay + 0.75, DestroyObject(DCS_GetCraftedItem()));
        return;
    }

    for(i = 1; i <= iObjects; i++)
    {
        oItem = DCS_GetCraftedItem(i);
        iAmount = DCS_GetObjectAmount(DCS_AMOUNT_BOTH, i);
        DelayCommand(fDelay, DCS_CreateItems(oItem, iAmount, oTargetInventory, iModifyTagByQuality));
        DelayCommand(fDelay + 0.75, DestroyObject(oItem));
    }
}

void DCS_FinishCraftingProcess()
{
    // There was no crafting session
    if(!DCS_GetCraftingStatus()) return;

    object oStation = OBJECT_SELF;
    object oPC      = DCS_GetCraftingPlayer();
    object oItem    = DCS_GetCraftedItem();
    int    iObjects = DCS_GetObjectsCount();
    int    iSuccess = DCS_GetCraftingSuccess();
    int    iXP      = DCS_GetXPGained();
    float  fDelay   = 1.0;

    // Mark the crafting status as stopped
    DCS_SetCraftingStatus(FALSE);

    // Destroying all resources that were used
    // Except for gem binding failure
    // !a + (a * b)
    // !a + b
    //if(!DCS_GetGemBindingMode() || iSuccess)
    if(iSuccess)
    DCS_DestroyResourcesInStation(iObjects);

    // Give XP's gained to the player and store the "got xp" variable on oItem to signalize
    // that the player already got xp from this item on a failure (affects only disenchanting!)
    if(!GetLocalInt(oItem, DCS_VAR_CRAFTING_GOT_XP) || iSuccess)
    {
        DCS_GiveXPToPlayer(oPC, iXP);

        if((DCS_GetDisenchantingMode() || DCS_GetGemBindingMode()) && !iSuccess)
        SetLocalInt(oItem, DCS_VAR_CRAFTING_GOT_XP, TRUE);
    }

    // Copying the item when we're not in special crafting modes mode
    if(iSuccess && !DCS_GetEnchantingMode(FALSE) && !DCS_GetDisenchantingMode() && !DCS_GetGemBindingMode())
    DCS_FinishCreateItems(oStation, TRUE, fDelay);
}

/******************************************************************************/
/*                               MENU & DISPLAY                               */
/******************************************************************************/

int DCS_GetResourceDimension(object oStation=OBJECT_SELF)
{
    if(DCS_GetInformationMode(DCS_GetCraftingPlayer()))
    return 1;

    return GetLocalInt(oStation, "DCS_ResourceChosen");
}

/******************************************************************************/

void DCS_SetResourceDimension(int iChosen, object oStation=OBJECT_SELF)
{
    SetLocalInt(oStation, "DCS_ResourceChosen", iChosen);
}

/******************************************************************************/

void DCS_DeleteResourceDimension(object oStation=OBJECT_SELF)
{
    DeleteLocalInt(oStation, "DCS_ResourceChosen");
}

/******************************************************************************/

int DCS_GetRecipeResourcesNeeded(string sRecipeID)
{
    //int iDim = DCS_GetResourceDimension();
    int iSize, iCount, iValue;

    //if(!iDim)iDim=1;

    iSize = DCS_GetLocalResourcesStored();//DCS_ArrayGetInt(sRecipeID, "size", 1, 1);

    for(iCount=1; iCount <= iSize; iCount++)
    {
        iValue += DCS_GetLocalResourceValue(iCount);//DCS_ArrayGetInt(sRecipeID, "value", iCount, iDim);
    }

    return iValue;
}

/******************************************************************************/

int DCS_GetResourceWorth(string sRecipeID, int iObjects=1, int iOffset=0)
{
    object oPC = DCS_GetCraftingPlayer();
    int iValue, iCount, iSG;
    int iSize = DCS_ArrayGetInt(sRecipeID, "size");
    int iAmount = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_AMOUNT, sRecipeID); // Number of items created in sRecipeID (1 crafting attempt = x items)
    string sOffset = StrCat("", "   ", iOffset)+StrCat("", ColorText("==> ", nwcRed), 1);

    //if(iOffset == 0)
    //iObjects *= iAmount;

    AdvDebug(oPC,  ColorText(sOffset+"----ResourceWorth for: "+sRecipeID+"; objects: "+inStr(iObjects)+", with size: "+inStr(iSize), nwcRed)+", Amount: "+IntToString(iAmount));

    for(iCount=1; iCount <= iSize; iCount++)
    {
        string sResource = DCS_ArrayGetString(sRecipeID, "resource", iCount);
        string sResourceID = DCS_GetRecipeEntry(DCS_COL_RECIPE_ID, sResource, TRUE, TRUE); // ResRef of subresource #iCount
        int iResCount = DCS_ArrayGetInt(sRecipeID, "value", iCount); // Number of items you need of sub resource
        int iResourceValue = DCS_CalculateResourcesNeeded(iObjects, iResCount, iAmount); // The actual amount of items needed

        AdvDebug(oPC, sOffset+"i: "+inStr(iCount)+", resource: "+sResource+", sResourceID: "+sResourceID+", res count: "+inStr(iResCount)+", resources needed: "+inStr(iResourceValue));

        // sub resource id available and has sub resources
        if(sResourceID != "" && DCS_ArrayGetInt(sResourceID, "size") > 0)
        {
            iValue += DCS_GetResourceWorth(sResourceID, iResourceValue, iOffset + 1);
            AdvDebug(oPC, sOffset+"sResourceID has resources, getting resource worth");
        }
        else
        {
            iValue += iResourceValue;
            AdvDebug(oPC, sOffset+"sResourceID size = 0");
        }

        iSG += DCS_GetRecipeEntryInt(DCS_COL_RECIPE_DC, sResourceID);
        AdvDebug(oPC, sOffset+"------ next resource, current value: "+inStr(iValue));
    }

    AdvDebug(oPC, ColorText(sOffset+"-------------ResourceWorth for "+sRecipeID+": "+inStr(iValue), nwcRed));
    return iValue + iSG / (iSize > 0 ? iSize : 1);
}

/******************************************************************************/

int DCS_GetResourceWorth2(object oPC, string sRecipeID, int iObjects=1, int iOffset=0)
{
    int iValue, iCount, iSG;
    int iSize = DCS_ArrayGetInt(sRecipeID, "size");
    int iAmount = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_AMOUNT, sRecipeID); // Number of items created in sRecipeID (1 crafting attempt = x items)
    string sOffset = StrCat("", "   ", iOffset)+StrCat("", ColorText("==> ", nwcRed), 1);

    //if(iOffset == 0)
    //iObjects *= iAmount;

    AdvDebug(oPC,  ColorText(sOffset+"----ResourceWorth for: "+sRecipeID+"; objects: "+inStr(iObjects)+", with size: "+inStr(iSize), nwcRed)+", Amount: "+IntToString(iAmount));

    for(iCount=1; iCount <= iSize; iCount++)
    {
        string sResource = DCS_ArrayGetString(sRecipeID, "resource", iCount);
        string sResourceID = DCS_GetRecipeEntry(DCS_COL_RECIPE_ID, sResource, TRUE, TRUE); // ResRef of subresource #iCount
        int iResCount = DCS_ArrayGetInt(sRecipeID, "value", iCount); // Number of items you need of sub resource
        int iResourceValue = DCS_CalculateResourcesNeeded(iObjects, iResCount, iAmount); // The actual amount of items needed

        AdvDebug(oPC, sOffset+"i: "+inStr(iCount)+", resource: "+sResource+", sResourceID: "+sResourceID+", res count: "+inStr(iResCount)+", resources needed: "+inStr(iResourceValue));

        // sub resource id available and has sub resources
        if(sResourceID != "" && DCS_ArrayGetInt(sResourceID, "size") > 0)
        {
            iValue += DCS_GetResourceWorth2(oPC, sResourceID, iResourceValue, iOffset + 1);
            AdvDebug(oPC, sOffset+"sResourceID has resources, getting resource worth");
        }
        else
        {
            iValue += iResourceValue;
            AdvDebug(oPC, sOffset+"sResourceID size = 0");
        }

        iSG += DCS_GetRecipeEntryInt(DCS_COL_RECIPE_DC, sResourceID);
        AdvDebug(oPC, sOffset+"------ next resource, current value: "+inStr(iValue));
    }

    AdvDebug(oPC, ColorText(sOffset+"-------------ResourceWorth for "+sRecipeID+": "+inStr(iValue), nwcRed));
    return iValue + iSG / (iSize > 0 ? iSize : 1);
}

/******************************************************************************/



string DCS_ResourceNeeded(string sResource, int nResCount)
{
    if(DCS_GetInformationMode(DCS_GetCraftingPlayer()))
    {
        if(DCS_GetIsRandomResource(sResource))
            return DCS_GetResourceName(sResource)+nwCrLf;
        else
            return ColorText(inStr(nResCount)+"x", nwcYellow)+" "+DCS_GetResourceName(sResource);
    }
    else if(DCS_GetIsRandomResource(sResource))
    {
        if(!GetIsObjectValid(DCS_GetCraftedItem()))
        {
            object oRandom = DCS_GetRandomObjectInStation(sResource, 1, TRUE);
        }
    }
    else if(sResource != "" && nResCount > 0)
    return DCS_GetResourceCount(sResource, nResCount)+" von "+inStr(nResCount)+" "+DCS_GetResourceName(sResource)+nwCrLf;

    return "";
}

/******************************************************************************/

void DCS_DeleteCraftingDisplay()
{
    DeleteLocalString(OBJECT_SELF, DCS_VAR_CRAFTING_DISPLAY);
    DeleteLocalString(OBJECT_SELF, DCS_VAR_COMPLETE_DISPLAY);
}

/******************************************************************************/

string DCS_GetCraftingDisplay(int iIgnoreCount=TRUE, int bForceReset=FALSE)
{
    object oPC = DCS_GetCraftingPlayer();
    string sDisplay = GetLocalString(OBJECT_SELF, DCS_VAR_CRAFTING_DISPLAY);

    if(sDisplay == "" || bForceReset)
    {
        float  fSuccessChance = DCS_GetSuccessChance(TRUE);
        string sColor         = nwcRed;
        string sSuccessChance = ColorText(inStr(flInt(fSuccessChance)), nwcYellow);
        string sFirstAbility  = ColorText(GetStringByStrRef(GetCached2DAInt("iprp_abilities", "Name", DCS_GetCraftingAbility())), nwcYellow);
        string sSecondAbility = ColorText(GetStringByStrRef(GetCached2DAInt("iprp_abilities", "Name", DCS_GetCraftingAbility(2))), nwcYellow);
        string sID            = DCS_GetRecipeID();
        string sRecipeName    = DCS_GetRecipeName();
        string sRecipeAmount  = DCS_GetRecipeEntry(DCS_COL_RECIPE_AMOUNT, sID);
        string sRecipeCrit    = DCS_GetRecipeEntry(DCS_COL_RECIPE_CRITICAL, sID);
        int    iDC            = DCS_GetRecipeDC(sID);
        int    iRecipeAmount  = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_AMOUNT, sID);
        int    iObjects       = DCS_GetObjectsCount();
        int    iResourceCheck = DCS_GetStationHasResources();
        int    iSize          = DCS_GetLocalResourcesStored();
        int    iGemBind       = DCS_GetGemBindingMode();
        int    iEnchant       = DCS_GetEnchantingMode();
        int    iDisenchant    = DCS_GetDisenchantingMode();
        int    iValue, iCount;
        string sResource, sResourceDisplay, sResourceAdd;
        object oRandom;

        sDisplay = "";

        if(FindSubString(sRecipeAmount, "-") != -1)
        sRecipeName += " ("+inStr(stInt(GetStringLeft(sRecipeAmount, FindSubString(sRecipeAmount, "-"))) * iObjects)+"-"+inStr(stInt(GetStringRight(sRecipeAmount, GetStringLength(sRecipeAmount) - (FindSubString(sRecipeAmount, "-") + 1))) * iObjects)+")";
        else if(iRecipeAmount > 1)
        sRecipeName += " ("+inStr(iRecipeAmount * iObjects)+")";

        if(iRecipeAmount == 1 && DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_MULTI_ITEM_CRAFT) && iObjects > 1 && !iIgnoreCount && iResourceCheck && !DCS_GetDisenchantingMode())
        sDisplay += ColorText(inStr(iObjects)+"x ", nwcYellow);
        sDisplay += sRecipeName+nwCrLf+nwCrLf;
        sDisplay += iDC > 0 ? DCS_TEXT_DIFFICULTY_CHECK+ColorText(inStr(iDC), nwcYellow)+nwCrLf : "";

        if(sRecipeCrit != "")
        {
            if(stInt(sRecipeCrit) == 0)
                sDisplay += DCS_TEXT_AMAZING_SUCCESS+ColorText(DCS_GetRecipeEntry(DCS_COL_RECIPE_NAME, sRecipeCrit), nwcYellow)+nwCrLf;
            else
                sDisplay += DCS_TEXT_AMAZING_SUCCESS+ColorText("+"+sRecipeCrit+(stInt(sRecipeCrit) == 1 ? " Gegenstand" : " Gegenstände"), nwcYellow)+nwCrLf;
        }

        sDisplay += DCS_GetProfessionSkill(oPC, DCS_GetCraftingProfession(), SKILL_MORE_ITEM_CHANCE) > 0 ? DCS_TEXT_MORE_ITEM_CHANCE+ColorText(inStr(flInt(DCS_GetProfessionSkill(oPC, DCS_GetCraftingProfession(), SKILL_MORE_ITEM_CHANCE) * DCS_SETTING_MORE_ITEM_CHANCE_PER_SKILL))+"%", nwcYellow)+nwCrLf : "";//"(Ihr habt eine "+ColorText(inStr(flInt(DCS_GetProfessionSkill(oPC, DCS_GetCraftingProfession(), SKILL_MORE_ITEM_CHANCE) * DCS_SETTING_MORE_ITEM_CHANCE_PER_SKILL))+"%", nwcYellow)+DCS_TEXT_MORE_ITEM_CHANCE+")"+nwCrLf;

        for(iCount=1; iCount <= iSize; iCount++)
        {
            iValue = DCS_GetLocalResourceValue(iCount);
            sResource = DCS_GetLocalResource(iCount);
            sResourceDisplay += DCS_ResourceNeeded(sResource, iValue * iObjects);
        }

        if(iEnchant || iDisenchant)
        {
            oRandom   = DCS_GetCraftedItem();
            iValue    = GetItemStackSize(oRandom);
            sDisplay  = DCS_GetRecipeEntry(DCS_COL_RECIPE_MENUTEXT, sID)+nwCrLf+nwCrLf;
            sDisplay += iEnchant ? DCS_TEXT_ENCHANTING_ITEM+nwCrLf : DCS_TEXT_DISENCHANTING_ITEM+nwCrLf;

            if(iDisenchant && iValue > 1)
            sDisplay += ColorText(inStr(iValue)+"x ", nwcYellow);

            if(GetIsObjectValid(oRandom))
                sDisplay += GetName(oRandom)+(iDisenchant ? " (Wert: "+ColorText(inStr(DCS_RecalculateItemGoldPieceValue(oRandom) * iValue), nwcYellow)+")" : "")+nwCrLf;
            else
                sDisplay += ColorText(DCS_TEXT_NO_ITEM_FOUND, nwcRed)+nwCrLf;

            sDisplay += nwCrLf+DCS_TEXT_DIFFICULTY_CHECK+ColorText(inStr(iDC), nwcYellow)+nwCrLf;

            if(iDisenchant)
            {
                sResourceDisplay = "";
                sSuccessChance   = ColorText(inStr(flInt(DCS_GetSuccessChance(TRUE))), nwcYellow);
            }
        }

        if(iGemBind)
        {
            int iSockets = DCS_GetLocalSockets();
            int iBigSockets = DCS_GetLocalSockets(ITEM_PROPERTY_BIG_SOCKET);

            oRandom = DCS_GetCraftedItem();
            sResourceAdd += iSockets > 0 ? ColorText(inStr(iSockets)+"x ", nwcYellow)+" Kleine Edelsteinfassung" + nwCrLf : "";
            sResourceAdd += iBigSockets > 0 ? ColorText(inStr(iBigSockets)+"x ", nwcYellow)+" Große Edelsteinfassung" + nwCrLf : "";

            int iQuality = DCS_IPGetQuality(oRandom);
            sDisplay += DCS_TEXT_GEM_BINDING_ITEM+ColorText(GetName(oRandom), nwcYellow)+(iQuality > 0 ? " ("+DCS_GetQualityName(iQuality)+")" : "")+nwCrLf;
            sDisplay += sResourceAdd != "" ? nwCrLf + "Edelsteinfassungen:" + nwCrLf + sResourceAdd : "";
            sDisplay += sResourceDisplay != "" ? nwCrLf + DCS_TEXT_RES_GEMS_AVAILABLE + nwCrLf + sResourceDisplay : "";
        }
        else
        {
            sDisplay += sResourceDisplay != "" ? nwCrLf + DCS_TEXT_RESOURCES_AVAILABLE + nwCrLf + sResourceDisplay : "";
        }

        //AdvDebug(oPC, "fSuccess: "+FloatToString(fSuccessChance)+", sSuccess: "+sSuccessChance);
        if(fSuccessChance > -1.0)
        {
            sDisplay += nwCrLf         + DCS_TEXT_GIVEN_YOUR_ABILITIES;
            sDisplay += sFirstAbility  + DCS_TEXT_AND;
            sDisplay += sSecondAbility + DCS_TEXT_CHANCE_IN_PERCENT;
            sDisplay += sSuccessChance;

            // Special cases: Enchanting/Disenchanting Items
            if(iEnchant)
                sDisplay += DCS_TEXT_PERCENT_TO_ENCHANT_OBJECT;
            else if(iDisenchant)
                sDisplay += DCS_TEXT_PERCENT_TO_DISENCH_OBJECT;
            else if(iGemBind)
                sDisplay += iSize > 1 ? DCS_TEXT_PERCENT_TO_BIND_GEMS : DCS_TEXT_PERCENT_TO_BIND_GEM;
            else
                sDisplay += DCS_TEXT_PERCENT_TO_CRAFT_OBJECT;
        }
        else
        {
            if(iGemBind)
                sDisplay += nwCrLf + DCS_TEXT_NEED_TO_CHOOSE_GEMS;
            else
                sDisplay += nwCrLf + DCS_TEXT_IMPOSSIBLE_TO_CRAFT;
        }
    }

    return sDisplay;
}

/******************************************************************************/

string DCS_GetCompleteDisplay()
{
    object oStation = OBJECT_SELF;
    object oPC      = DCS_GetCraftingPlayer();
    string sDisplay = GetLocalString(oStation, DCS_VAR_COMPLETE_DISPLAY);

    if(sDisplay == "")
    {
        float  fSuccessChance = DCS_GetSuccessChance(TRUE);
        string sColor         = nwcRed;
        string sSuccessChance = ColorText(inStr(flInt(fSuccessChance)), nwcYellow);
        string sFirstAbility  = ColorText(GetStringByStrRef(GetCached2DAInt("iprp_abilities", "Name", DCS_GetCraftingAbility())), nwcYellow);
        string sSecondAbility = ColorText(GetStringByStrRef(GetCached2DAInt("iprp_abilities", "Name", DCS_GetCraftingAbility(2))), nwcYellow);
        string sID            = DCS_GetRecipeID();
        string sRecipeName    = DCS_GetRecipeName();
        string sRecipeCrit    = DCS_GetRecipeEntry(DCS_COL_RECIPE_CRITICAL, sID);
        int    iObjects       = DCS_GetObjectsCount();
        int    iGemBind       = DCS_GetGemBindingMode();
        int    iEnchant       = DCS_GetEnchantingMode();
        int    iDisenchant    = DCS_GetDisenchantingMode();
        int    iSize          = DCS_ArrayGetInt(sID, "size");
        int    iValue, iCount, iSizeAlt;
        string sResource, sResourceDisplay;

        sDisplay  = sRecipeName+nwCrLf+nwCrLf;
        sDisplay += !iDisenchant && DCS_GetRecipeEntryInt(DCS_COL_RECIPE_DC, sID) > 0 ? DCS_TEXT_DIFFICULTY_CHECK+ColorText(DCS_GetRecipeEntry(DCS_COL_RECIPE_DC, sID), nwcYellow)+nwCrLf : "";

        if(!iDisenchant && sRecipeCrit != "")
        {
            if(stInt(sRecipeCrit) == 0)
                sDisplay += DCS_TEXT_AMAZING_SUCCESS+ColorText(DCS_GetRecipeEntry(DCS_COL_RECIPE_NAME, sRecipeCrit), nwcYellow)+nwCrLf;
            else
                sDisplay += DCS_TEXT_AMAZING_SUCCESS+ColorText("+"+sRecipeCrit+(stInt(sRecipeCrit) == 1 ? " Gegenstand" : " Gegenstände"), nwcYellow)+nwCrLf;
        }

        if(DCS_GetProfessionSkill(oPC, DCS_GetCraftingProfession(), SKILL_MORE_ITEM_CHANCE) > 0)
        sDisplay += DCS_TEXT_MORE_ITEM_CHANCE+ColorText(inStr(flInt(DCS_GetProfessionSkill(oPC, DCS_GetCraftingProfession(), SKILL_MORE_ITEM_CHANCE) * DCS_SETTING_MORE_ITEM_CHANCE_PER_SKILL))+"%", nwcYellow)+nwCrLf;//"(Ihr habt eine "+ColorText(inStr(flInt(DCS_GetProfessionSkill(oPC, DCS_GetCraftingProfession(), SKILL_MORE_ITEM_CHANCE) * DCS_SETTING_MORE_ITEM_CHANCE_PER_SKILL))+"%", nwcYellow)+DCS_TEXT_MORE_ITEM_CHANCE+")"+nwCrLf;

        //AdvDebug(oPC, "iSize: "+inStr(iSize));

        for(iCount=1; iCount <= iSize; iCount++)
        {
            iSizeAlt = DCS_ArrayGetInt(sID, "size", 1, 1, "alt"+inStr(iCount));
            //AdvDebug(oPC, "iSizeAlt: "+inStr(iSizeAlt));

            // Alternative way for single resources having multple choices (ResC and (ResD or ResE))
            if(iSizeAlt)
            {
                int iCountAlt;
                for(iCountAlt=1; iCountAlt <= iSizeAlt; iCountAlt++)
                {
                    iValue = DCS_ArrayGetInt(sID, "value", iCountAlt, 1, "alt"+inStr(iCount));
                    sResource = DCS_ArrayGetString(sID, "resource", iCountAlt, 1, "alt"+inStr(iCount));
                    sResourceDisplay += DCS_ResourceNeeded(sResource, iValue * iObjects);

                    //AdvDebug(oPC, "sResource: "+sResource+", iValue: "+inStr(iValue));

                    if(iCountAlt+1 <= iSizeAlt)
                    sResourceDisplay += ColorText(" oder ", nwcOrange);
                }
                sResourceDisplay += nwCrLf;
            }
            // Default way from DCS_HasRecipeResources()
            else
            {
                iValue = DCS_ArrayGetInt(sID, "value", iCount, 1);
                sResource = DCS_ArrayGetString(sID, "resource", iCount, 1);
                sResourceDisplay += DCS_ResourceNeeded(sResource, iValue * iObjects)+nwCrLf;
            }
        }

        if(!iDisenchant && !iGemBind)
        {
            sDisplay += sResourceDisplay != "" ? nwCrLf + DCS_TEXT_RESOURCES_AVAILABLE + nwCrLf + sResourceDisplay : "";
            sDisplay += nwCrLf         + DCS_TEXT_GIVEN_YOUR_ABILITIES;
            sDisplay += sFirstAbility  + DCS_TEXT_AND;
            sDisplay += sSecondAbility + DCS_TEXT_CHANCE_IN_PERCENT;
            sDisplay += (fSuccessChance < 0.0 ? "??" : sSuccessChance);

            // Special cases: Enchanting/Disenchanting Items
            if(iEnchant)
                sDisplay += DCS_TEXT_PERCENT_TO_ENCHANT_OBJECT;
            else
                sDisplay += DCS_TEXT_PERCENT_TO_CRAFT_OBJECT;
        }
        else if(iDisenchant)
        {
            sDisplay += DCS_TEXT_DISENCHANT_CHANCE + sFirstAbility + DCS_TEXT_AND + sSecondAbility+".";
        }
        else if(iGemBind)
        {
            sDisplay += DCS_TEXT_BIND_GEM_CHANCE + sFirstAbility + DCS_TEXT_AND + sSecondAbility+".";
        }
    }

    return sDisplay;
}

/******************************************************************************/

int DCS_GetLocalResourcesStored(object oStation=OBJECT_SELF)
{
    return GetLocalInt(oStation, "LocalRes_Amount");
}

/******************************************************************************/

int DCS_GetIsResourceStored(string sResource, object oStation=OBJECT_SELF)
{
    int iMax = DCS_GetLocalResourcesStored(oStation);
    int i;

    for(i = 1; i <= iMax; i++)
    {
        if(GetLocalString(oStation, "LocalRes_"+inStr(i)) == sResource)
        return i;
    }

    return FALSE;
}

/******************************************************************************/

string DCS_GetLocalResource(int iNth, object oStation=OBJECT_SELF)
{
    return GetLocalString(oStation, "LocalRes_"+inStr(iNth));
}

/******************************************************************************/

int DCS_GetLocalResourceValue(int iNth, object oStation=OBJECT_SELF)
{
    return GetLocalInt(oStation, "LocalRes_Val_"+inStr(iNth));
}

/******************************************************************************/

int DCS_GetStoredResourceValue(string sResource, object oStation=OBJECT_SELF)
{
    return DCS_GetLocalResourceValue(DCS_GetIsResourceStored(sResource, oStation), oStation);
}

/******************************************************************************/

void DCS_SetLocalResourcesStored(int iAmount, object oStation=OBJECT_SELF)
{
    SetLocalInt(oStation, "LocalRes_Amount", iAmount);
}

/******************************************************************************/

void DCS_StoreLocalResource(string sResource, int iValue, object oStation=OBJECT_SELF)
{
    int iStored = DCS_GetIsResourceStored(sResource, oStation);
    int iStore;

    if(!iStored)
    {
        iStore = DCS_GetLocalResourcesStored(oStation) + 1;
        DCS_SetLocalResourcesStored(iStore, oStation);
    }
    else
    {
        iStore = iStored;
        iValue += DCS_GetLocalResourceValue(iStore, oStation);
    }

    SetLocalInt(oStation, "LocalRes_Val_"+inStr(iStore), iValue);
    SetLocalString(oStation, "LocalRes_"+inStr(iStore), sResource);
}

/******************************************************************************/

void DCS_DeleteLocalResoures(object oStation=OBJECT_SELF)
{
    int iMax = DCS_GetLocalResourcesStored(oStation);
    int i;

    for(i = 1; i <= iMax; i++)
    {
        DeleteLocalInt(oStation, "LocalRes_Val_"+inStr(i));
        DeleteLocalString(oStation, "LocalRes_"+inStr(i));
    }

    DeleteLocalInt(oStation, "LocalRes_Amount");
}

/******************************************************************************/

void DCS_RemoveLocalResource(string sResource, int iValue, object oStation=OBJECT_SELF)
{
    int iMax = DCS_GetLocalResourcesStored(oStation);
    int iPos = DCS_GetIsResourceStored(sResource, oStation);
    int iCurVal = DCS_GetLocalResourceValue(iPos, oStation);
    int i;
    //AdvDebug(GetPCSpeaker(), "Removing resource "+sResource+": "+inStr(iValue)+", is Stored at: "+inStr(iPos)+" with value: "+inStr(iCurVal)+", max Stored: "+inStr(iMax));

    if(iCurVal > iValue)
    {
        SetLocalInt(oStation, "LocalRes_Val_"+inStr(iPos), iCurVal - iValue);
        //AdvDebug(GetPCSpeaker(), "stored: "+inStr(iCurVal)+" > value: "+inStr(iValue)+" new Val: "+inStr(GetLocalInt(oStation, "LocalRes_Val_"+inStr(iPos))));
    }
    else
    {
        for(i = iPos; i <= iMax; i++)
        {
            if(i == iMax)
            {
                //AdvDebug(GetPCSpeaker(), "deleting res "+inStr(i));
                DeleteLocalInt(oStation, "LocalRes_Val_"+inStr(i));
                DeleteLocalString(oStation, "LocalRes_"+inStr(i));
                SetLocalInt(oStation, "LocalRes_Amount", iMax-1);
            }
            else
            {
                //AdvDebug(GetPCSpeaker(), "setting res "+inStr(i)+" to "+inStr(i+1));
                SetLocalInt(oStation, "LocalRes_Val_"+inStr(i), DCS_GetLocalResourceValue(i+1, oStation));
                SetLocalString(oStation, "LocalRes_"+inStr(i), DCS_GetLocalResource(i+1, oStation));
            }
        }
    }
}

/******************************************************************************/

int DCS_HasRecipeResources(string ID, int iObjects, int iStoreLocalResources=TRUE, object oStation=OBJECT_SELF)
{
    int iSize = DCS_ArrayGetInt(ID, "size", 1, 1);
    int iHasResources = TRUE;
    int iValue, iCount;
    string sResource;

    object oPC = DCS_GetCraftingPlayer();
    AdvDebug(oPC, "Size: "+inStr(iSize)+", iObjects: "+inStr(iObjects));

    // Example "ResA$ ResB | ResC$ ResD/ResE"
    //       = (ResA and ResB) or (ResC and (ResD or ResE))
    // First size processing (dcsSpace)
    for(iCount=1; iCount <= iSize; iCount++)
    {
        if(!iHasResources && !iStoreLocalResources)
        break;

        int iSizeAlt = DCS_ArrayGetInt(ID, "size", 1, 1, "alt"+inStr(iCount));
        AdvDebug(GetPCSpeaker(), "ID: "+ID+", iSizeAlt: "+inStr(iSizeAlt));

        // Alternative way for single resources having multple choices (ResC and (ResD or ResE))
        if(iSizeAlt)
        {
            //iUsedAlt++;

            int iHasNumAlt, iCountAlt;
            for(iCountAlt=1; iCountAlt <= iSizeAlt; iCountAlt++)
            {
                iValue = DCS_ArrayGetInt(ID, "value", iCountAlt, 1, "alt"+inStr(iCount));
                sResource = DCS_ArrayGetString(ID, "resource", iCountAlt, 1, "alt"+inStr(iCount));

                AdvDebug(GetPCSpeaker(), "iCountAlt: "+inStr(iCountAlt)+", Resource: "+sResource+", Value: "+inStr(iValue)+", needed Value: "+inStr((DCS_GetStoredResourceValue(sResource, oStation) + iValue) * iObjects)+", Items available: "+inStr(DCS_GetItemNum(oStation, sResource)));

                if(DCS_GetItemNum(oStation, sResource) >= (DCS_GetStoredResourceValue(sResource, oStation) + iValue) * iObjects)
                {
                    iHasNumAlt = iCountAlt;
                    AdvDebug(GetPCSpeaker(), "PC Has Resources");
                    break;
                }
            }

            if(!iHasNumAlt)
            {
                AdvDebug(oPC, "pc doesn't have alt resources");
                if(!iStoreLocalResources)
                    return FALSE;
                else
                {
                    iHasResources = FALSE;
                    iValue = DCS_ArrayGetInt(ID, "value", 1, 1, "alt"+inStr(iCount));
                    sResource = DCS_ArrayGetString(ID, "resource", 1, 1, "alt"+inStr(iCount));
                }
            }
        }

        // Default way from DCS_HasRecipeResources()
        else
        {
            iValue = DCS_ArrayGetInt(ID, "value", iCount, 1);
            sResource = DCS_ArrayGetString(ID, "resource", iCount, 1);

            AdvDebug(oPC, "get item num '"+sResource+"': "+inStr(DCS_GetItemNum(oStation, sResource))+", value: "+inStr(iValue)+" obj: "+inStr(iObjects));

            if(iHasResources && DCS_GetItemNum(oStation, sResource) < iValue * iObjects)
            {
                AdvDebug(oPC, "pc doesn't have resources");

                if(!iStoreLocalResources)
                    return FALSE;
                else
                    iHasResources = FALSE;
            }
        }

        if(iStoreLocalResources)
        DCS_StoreLocalResource(sResource, iValue, oStation);
    }

    return iHasResources;
}

/******************************************************************************/

int DCS_GetStationHasResources(int iRecipeNumber=-1, int iObjects=1, int bStoreLocalObjects=FALSE, int bForceReset=FALSE)
{
    if(DCS_GetInformationMode(DCS_GetCraftingPlayer()))
    return FALSE;

    int iStored = GetInternSwitch(DCS_VAR_HAS_ALL_RESOURCES);

    if(!iStored || bForceReset)
    {
        if(iRecipeNumber == -1) iRecipeNumber = DCS_GetRecipeNumber();

        //AdvDebug(GetFirstPC(), "GetStationHasResources");
        return DCS_HasRecipeResources(DCS_GetRecipeID(iRecipeNumber), iObjects, bStoreLocalObjects);
    }

    return iStored-1;
}

/******************************************************************************/

int DCS_GetHasRecipeTree(string sRecipeID="")
{
    if(sRecipeID == "")
    sRecipeID = DCS_GetRecipeID();

    /*int iSize = DCS_ArrayGetInt(sRecipeID, "size", 1);
    int iCount;

    for(iCount=1; iCount <= iSize; iCount++)
    {
        SQLExecDirect("select Length("+DCS_COL_RECIPE_RESOURCES+") from dcs_Recipes where ResRef='"+DCS_ArrayGetString(sRecipeID, "resource", iCount)+"'");

        if(SQLFetch())
        return SQLGetDataInt(1) >= 1;
    }   */

    //AdvDebug(GetFirstPC(), ColorText("Has Recipe Tree ID: "+sRecipeID, nwcLightBlue));
    SQLExecDirect("select Length("+DCS_COL_RECIPE_RESOURCES+") from "+DCS_TABLE_RECIPE_DATA+" where ID='"+sRecipeID+"'");

    if(SQLFetch())
    return SQLGetDataInt(1) >= 1;

    return FALSE;
}


/******************************************************************************/

int DCS_CalculateResourcesNeeded(int iBase, int iMulti, int iResourceAmount)
{
    if(!iResourceAmount || iResourceAmount == 1)
    return iBase * iMulti;

    return flInt(DCS_IPRoundValue(inFloat(iBase) / inFloat(abs(iResourceAmount)), 1)) * iMulti;
}

/******************************************************************************/

string DCS_ShowRecipeTree(string sRecipeID="", int iObjects=1, int iOffset=0)
{
    object oPC = DCS_GetCraftingPlayer();
    int iSize = DCS_ArrayGetInt(sRecipeID, "size");
    int iAmount = DCS_GetRecipeEntryInt(DCS_COL_RECIPE_AMOUNT, sRecipeID);
    string sOffset = StrCat("", "   ", iOffset)+StrCat("", ColorText("==> ", nwcRed), 1);
    string sTree;

    //Title
    if(iOffset == 0)
    {
        iObjects *= iAmount;
        sTree = nwCrLf+ColorText(DCS_GetRecipeEntry(DCS_COL_RECIPE_NAME, sRecipeID), nwcLightBlue)+(iObjects > 1 ? " (x"+inStr(iObjects)+")" : "");
    }

    int iCount;
    for(iCount = 1; iCount <= iSize; iCount++)
    {
        string sResource = DCS_ArrayGetString(sRecipeID, "resource", iCount);
        string sResourceID = DCS_GetRecipeEntry(DCS_COL_RECIPE_ID, sResource, TRUE, TRUE);
        int iResAmount = DCS_ArrayGetInt(sRecipeID, "value", iCount);
        int iValue = DCS_CalculateResourcesNeeded(iObjects, iResAmount, iAmount);

        // Offsets
        sTree += nwCrLf+sOffset+ColorText(DCS_GetResourceName(sResource), nwcYellow)+" x"+inStr(iValue);

        // Sub-Offsets
        if(sResourceID != "" && DCS_GetHasRecipeTree(sResourceID))
        sTree += DCS_ShowRecipeTree(sResourceID, iValue, iOffset+1);
    }

    return sTree;
}

/******************************************************************************/

int DCS_GetCraftableItems(int bForceReset=FALSE)
{
    if(DCS_GetInformationMode(DCS_GetCraftingPlayer()))
    return 0;

    int iItems = GetInternSwitch(DCS_VAR_GET_CRAFTABLE_ITEMS);

    if(!iItems || bForceReset)
    {
        string ID   = DCS_GetRecipeID();
        int    iMax = DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_MAX_CRAFT_ITEMS);

        for(iItems = 0; iItems <= iMax; iItems++)
        {
            if(iItems + 1 > iMax)
            break;

            if(!DCS_HasRecipeResources(ID, iItems+1, FALSE))
            break;
        }

        SetInternSwitch(DCS_VAR_GET_CRAFTABLE_ITEMS, iItems);
    }

    return iItems;
}

/******************************************************************************/
/*                         EXPERIENCE & CHANCE FUNCTIONS                      */
/******************************************************************************/

float DCS_GetSkillEnhancement(object oPC)
{
    return GetLocalFloat(oPC, DCS_SKILL_ENHANCEMENT);
}

/******************************************************************************/

float DCS_CalculateAbilityScore(object oPC, int bAbilityModifer=FALSE, float fMulti=0.75, int iFirstAbility=-1, int iSecondAbility=-1)
{
    if(iFirstAbility  = -1)iFirstAbility  = DCS_GetCraftingAbility(1);
    if(iSecondAbility = -1)iSecondAbility = DCS_GetCraftingAbility(2);

    if(bAbilityModifer)
    return fMulti * (GetAbilityModifier(iFirstAbility, oPC) + GetAbilityModifier(iSecondAbility, oPC));

    return fMulti * (GetAbilityScore(oPC, iFirstAbility) + GetAbilityScore(oPC, iSecondAbility));
}

/******************************************************************************/

float GetDCDifferenceStep(float recipeLevel)
{
    if(recipeLevel >= 17.0) return 6.5;
    if(recipeLevel >= 14.0) return 4.5;
    if(recipeLevel >= 9.0) return 3.5;
    if(recipeLevel >= 5.0) return 3.0;

    // 1 - 5
    return 2.75;
}

float GetDCBase(float recipeLevel)
{
    if(recipeLevel >= 17.0) return 30.0;
    if(recipeLevel >= 14.0) return 35.0;
    if(recipeLevel >= 9.0) return 40.0;
    if(recipeLevel >= 5.0) return 45.0;

    // 1 - 5
    return 50.0;
}

/******************************************************************************/

void DebugValue(string Valuename, int Value)
{
    AdvDebug(GetPCSpeaker(), Valuename+": "+inStr(Value));
}

void DebugfValue(string Valuename, float fValue)
{
    AdvDebug(GetPCSpeaker(), Valuename+": "+flStr(fValue));
}

float DCS_GetSuccessChance(int iDisplay=FALSE, int bForceReset=FALSE)
{
    float fSuccess = GetInternFloat(DCS_VAR_SUCCESS_CHANCE);

    //AdvDebug(DCS_GetCraftingPlayer(), ColorText("Get Success Chance function", nwcOrange));
    if(fSuccess == 0.0 || iDisplay || bForceReset)
    {
        object oPC            = DCS_GetCraftingPlayer();
        float  fRecipeDC      = inFloat(DCS_GetRecipeDC(DCS_GetRecipeID()));
        int    iPerfectChance = GetLocalInt(oPC, DCS_PERFECT_CHANCE);

        //AdvDebug(oPC, ColorText("Success Chance function - RecipeDC: "+FloatToString(fRecipeDC), nwcOrange));
        if(fRecipeDC == 0.0) return -1.0;
        if(!DCS_GetInformationMode(oPC) && iPerfectChance && iDisplay) return 100.0;

        int iProfession = DCS_GetCraftingProfession();
        int iLevel = DCS_GetProfessionLevel(oPC, iProfession);
        float fDiff = iLevel - fRecipeDC;
        float fBase = GetDCBase(fRecipeDC);
        float fStep = GetDCDifferenceStep(fRecipeDC);//5.0; //Percent per level difference
        float fAbility = DCS_CalculateAbilityScore(oPC, TRUE);
        float fSkill = DCS_GetProfessionSkill(oPC, iProfession, SKILL_SUCCESS_CHANCE) * DCS_SETTING_SUCCESS_CHANCE_PER_SKILL;
        float fEnhance = DCS_GetSkillEnhancement(oPC); //Potions

        float fDC = fBase + (fStep * fDiff) + fSkill + fAbility + fEnhance;
        /*DebugfValue("fBase: ", fBase);
        DebugfValue("fDiff: ", fDiff);
        DebugfValue("fStep * fDiff: ", fStep * fDiff);
        DebugfValue("fSkill: ", fSkill);
        DebugfValue("fAbility: ", fAbility);
        DebugfValue("fEnhance: ", fEnhance);
        DebugfValue("fDC: ", fDC);    */

        if(fDC > 95.0)    fDC = 95.0;
        else if(fDC < 5.0)fDC = 5.0;

        return fDC;
    }

    return fSuccess;
}

/******************************************************************************/

float DCS_GetExperimentationChance()
{
    float fSuccess = GetLocalFloat(OBJECT_SELF, DCS_VAR_EXPERIMENT_CHANCE);

    if(fSuccess == 0.0)
    {
        object oPC       = DCS_GetCraftingPlayer();
        float  fRecipeDC = inFloat(DCS_GetRecipeDC(DCS_GetRecipeID()));

        if(fRecipeDC == 0.0) return 0.0;

        int    iProfession   = DCS_GetCraftingProfession();
        float  fSkill        = DCS_GetProfessionSkill(oPC, iProfession, SKILL_EXPERIMENT_CHANCE) * DCS_SETTING_EXPERIMENTATION_CHANCE_PER_SKILL;
        //float  fEnhancement  = DCS_GetSkillEnhancement(oPC) / 100.0;
        float  fLevel        = DCS_GetProfessionLevel(oPC, iProfession) * 1.8;
        float  fAbilityScore = DCS_CalculateAbilityScore(oPC, TRUE, 1.15, ABILITY_DEXTERITY, ABILITY_INTELLIGENCE);
        float  fRecDC        = 2.8 * (fRecipeDC + sqrt(fRecipeDC) * 1.3); // sqrt(fRecipeDC) * 0.90 + fRecipeDC; // pow(fRecipeDC, 1.18);
        float  fDC;

        AdvDebug(oPC, "Score: "+FloatToString(fAbilityScore)+" + Skill: "+FloatToString(fSkill / 100.0)+" + Level: "+FloatToString(fLevel));
        AdvDebug(oPC, "fRecDC: "+FloatToString(fRecDC)+", Original: "+FloatToString(fRecipeDC));

        fDC  = (fAbilityScore + fLevel) / fRecDC + fSkill / 100.0;
        fDC *= 100.0;

        if(fDC > 95.0)    fDC = 95.0;
        else if(fDC < 5.0)fDC = 5.0;

        return fDC;
    }

    return fSuccess;
}

/******************************************************************************/

int DCS_RoundPercentToInt(float fPercentage)
{
    string sNum = IntToString(FloatToInt(fPercentage));

    if(GetStringLength(sNum) == 2)
    {
        string sNL = GetStringLeft(sNum, 1);
        string sNR = GetStringRight(sNum, 1);
        int iRight = StringToInt(sNR);

        if(iRight >= 5 && iRight <= 9)
            sNR = "5";
        else if(iRight >= 0 && iRight <= 4)
            sNR = "0";

        return stInt(sNL+sNR);
    }

    return 5;
}

/******************************************************************************/

int DCS_GetExperienceFromRecipe(object oPC, int iRecipeDC)
{
    int iLevel = DCS_GetProfessionLevel(oPC, DCS_GetCraftingProfession());
    int iXPMax  = DCS_SQLGetDatabaseSetting(DCS_COL_SETTING_XP_MAXIMUM);
    float fXPGain = DCS_SQLGetDatabaseSettingFloat(DCS_COL_SETTING_XP_GAIN_BASE);
    float fXPBase = DCS_GetNextXPLimit(iRecipeDC) / (iRecipeDC * fXPGain);
    float fDiffStep = DCS_GetNextXPLimit(iRecipeDC + 1) / ((iRecipeDC + 1) * fXPGain) - fXPBase;
    int iDiff = iRecipeDC - iLevel;
    int iXP;

    iXP = flInt(iDiff * fDiffStep + fXPBase);
    AdvDebug(oPC, "Calculated Experience: "+inStr(iXP));

    if(iXP < 50) iXP = 50;
    if(iXP >= iXPMax && iXPMax != -1) iXP = iXPMax;

    AdvDebug(oPC, "Total Experience: "+inStr(iXP));

    return iXP;
}

/******************************************************************************/

void DCS_StoreRecipeStatus()
{
    object oStation = OBJECT_SELF;
    string sMinor = inStr(DCS_GetMinorInt());
    int iMode = DCS_GetChooseItemMode();

    object oPC = DCS_GetCraftingPlayer();
    AdvDebug(oPC, "Storing recipe status: minor: "+sMinor+", Mode: "+inStr(iMode)+", gembind: "+inStr(DCS_GetGemBindingMode())+", disench: "+inStr(DCS_GetDisenchantingMode()));
    if(iMode)
    {
        if(iMode > DCS_MODE_CHOOSE_ITEM)
        {
            object oItem = GetLocalObject(oStation, DCS_VAR_LIST_OBJECT + sMinor);
            int iSocketType = DCS_GetGemSocketType(oItem); //ITEM_PROPERTY_* type

            if(iMode == DCS_MODE_CHOOSE_GEM)
            {
                DCS_StoreLocalResource(GetResRef(oItem), 1);
                DCS_SetLocalSockets(DCS_GetLocalSockets(iSocketType) - 1, iSocketType);
                AdvDebug(oPC, "Choosing Gem: "+GetName(oItem)+", SocketType: "+inStr(iSocketType));
            }
            else if(iMode == DCS_MODE_REMOVE_GEM)
            {
                DCS_RemoveLocalResource(GetResRef(oItem), 1);
                DCS_SetLocalSockets(DCS_GetLocalSockets(iSocketType) + 1, iSocketType);
                AdvDebug(oPC, "Removing Gem: "+GetName(oItem)+", SocketType: "+inStr(iSocketType));
           }

            DCS_SetChooseItemMode(0);

            SetInternSwitch(DCS_VAR_RECIPE_NUMBER, 1);
            SetInternString(DCS_VAR_RECIPE_ID,         DCS_GetRecipeID());
            SetInternFloat (DCS_VAR_SUCCESS_CHANCE,    DCS_GetSuccessChance(FALSE, TRUE));
            SetInternString(DCS_VAR_CRAFTING_DISPLAY,  DCS_GetCraftingDisplay(FALSE, TRUE));
            return;
        }
        // DCS_MODE_CHOOSE_ITEM
        else
        {
            AdvDebug(oPC, ColorText("Choose Item Mode Mode, deleting local resources and sockets", nwcPurple));
            DCS_DeleteLocalResoures();
            DCS_DeleteLocalSockets();
            DCS_SetCraftedItem(GetLocalObject(oStation, DCS_VAR_LIST_OBJECT + sMinor));
            DCS_StoreLocalSockets(DCS_GetCraftedItem());
            DCS_SetChooseItemMode(0);

            int iOffset = GetInternSwitch(DCS_VAR_LIST_OFFSET + sMinor);
            SetInternSwitch(DCS_VAR_RECIPE_NUMBER, DCS_GetRecipeNumber(iOffset > 0 ? iOffset : -1));
        }
    }
    else if(DCS_GetGemBindingMode())
    {
        AdvDebug(oPC, "GemBinding Mode");
        DCS_SetCraftedItem(GetLocalObject(oStation, DCS_VAR_LIST_OBJECT + sMinor));
        DCS_StoreLocalSockets(DCS_GetCraftedItem());

        SetInternSwitch(DCS_VAR_RECIPE_NUMBER, 1);
    }
    else if(DCS_GetDisenchantingMode())
    {
        DCS_SetCraftedItem(GetLocalObject(oStation, DCS_VAR_LIST_OBJECT + sMinor));
        SetInternSwitch(DCS_VAR_RECIPE_NUMBER, 1);
    }
    else
    {
        int iOffset = GetInternSwitch(DCS_VAR_LIST_OFFSET + sMinor);
        SetInternSwitch(DCS_VAR_RECIPE_NUMBER, DCS_GetRecipeNumber(iOffset > 0 ? iOffset : -1));
    }

    //AdvDebug(oPC, "StoreRecipeStatus last");

    SetInternString(DCS_VAR_RECIPE_ID,         DCS_GetRecipeID());
    SetInternFloat (DCS_VAR_SUCCESS_CHANCE,    DCS_GetSuccessChance(FALSE, TRUE));
    SetInternSwitch(DCS_VAR_HAS_ALL_RESOURCES, DCS_GetStationHasResources(-1, 1, TRUE, TRUE) + 1);
    SetInternString(DCS_VAR_CRAFTING_DISPLAY,  DCS_GetCraftingDisplay(FALSE, TRUE));

    //AdvDebug(oPC, "StoreRecipeStatus finished");
}

/******************************************************************************/

void DCS_DeleteRecipeStatus()
{
    DeleteLocalString(OBJECT_SELF, DCS_VAR_RECIPE_ID);
    DeleteLocalFloat (OBJECT_SELF, DCS_VAR_SUCCESS_CHANCE);
    DeleteLocalInt   (OBJECT_SELF, DCS_VAR_RECIPE_NUMBER);
    DeleteLocalInt   (OBJECT_SELF, DCS_VAR_HAS_ALL_RESOURCES);
}

/******************************************************************************/

void DCS_SetCraftingStation(object oPlayer, object oStation)
{
    SetLocalObject(oPlayer, DCS_VAR_CRAFTING_STATION, oStation);
}

/******************************************************************************/

object DCS_GetCraftingStation(object oPlayer)
{
    return GetLocalObject(oPlayer, DCS_VAR_CRAFTING_STATION);
}

/******************************************************************************/

void DCS_ResetCraftingStation(object oPlayer)
{
    DeleteLocalObject(oPlayer, DCS_VAR_CRAFTING_STATION);
}

/******************************************************************************/
/*                              EXPERIMENTATION                               */
/******************************************************************************/

string DCS_GetExperimentEntry(int iPosition, object oStation=OBJECT_SELF)
{
    return GetLocalString(oStation, DCS_VAR_EXPERIMENT_ENTRY+inStr(iPosition));
}

/******************************************************************************/

void DCS_SetExperimentEntry(int iPosition, string sEntry, object oStation=OBJECT_SELF)
{
    SetLocalString(oStation, DCS_VAR_EXPERIMENT_ENTRY+inStr(iPosition), sEntry);
}

/******************************************************************************/

void DCS_DeleteExperimentEntries(object oStation=OBJECT_SELF)
{
    int iCount;
    for(iCount=1; iCount <= DCS_TOKEN_PER_PAGE_EXPERIMENT; iCount++)
    {
        DeleteLocalString(oStation, DCS_VAR_EXPERIMENT_ENTRY+inStr(iCount));
    }
}

/******************************************************************************/

string DCS_GetExperimentationDisplay()
{
    return GetLocalString(OBJECT_SELF, DCS_VAR_EXPERIMENT_DISPLAY);
}

/******************************************************************************/

void DCS_SetExperimentationDisplay(string sDisplay="")
{
    SetLocalString(OBJECT_SELF, DCS_VAR_EXPERIMENT_DISPLAY, sDisplay);
}

/******************************************************************************/

void DCS_SetExperimentationPoints(int iPoints)
{
    SetLocalInt(OBJECT_SELF, DCS_VAR_EXPERIMENT_POINTS, iPoints);
}

/******************************************************************************/

int DCS_GetExperimentationPoints()
{
    return GetLocalInt(OBJECT_SELF, DCS_VAR_EXPERIMENT_POINTS);
}

/******************************************************************************/

int DCS_CalculateExperimentingPoints()
{
    object oPC         = DCS_GetCraftingPlayer();
    int    iProfession = DCS_GetCraftingProfession();
    int    iRank       = RoundValue(DCS_GetProfessionRank(oPC, iProfession) / DCS_SETTING_EXPERIMENTATION_FACTOR_RANK);
    int    iLevel      = flInt(DCS_GetProfessionLevel(oPC, iProfession) / 10.0);
    int    iSkill      = flInt(DCS_GetProfessionSkill(oPC, iProfession, SKILL_EXPERIMENT_POINTS) * DCS_SETTING_EXPERIMENTATION_POINTS_PER_SKILL);

    return iLevel + iRank + iSkill;
}

/******************************************************************************/

int DCS_GetIsRecipeExperimentable(string RecipeType="", int RecipeNumber=-1)
{
    return DCS_GetRecipeEntryInt(DCS_COL_RECIPE_EXPERIMENT, DCS_GetRecipeID(RecipeNumber, RecipeType));
}

/******************************************************************************/

string DCS_GetVisualPointLines(int iPoints, int iNthIP, object oItem, int iPointsUsed=-1)
{
    string VisPoint = DCS_TEXT_EXPERIMENT_POINT;
    string Return;
    int i;

    if(iPointsUsed == -1)
    iPointsUsed = DCS_IPEXGetTemporaryConsumedItemPropertyPoints(iNthIP, oItem);

    for(i=1; i <= iPoints; i++)
    {
        if(i <= iPointsUsed)
            Return += ColorText(VisPoint, nwcGreen);
        else
            Return += ColorText(VisPoint, nwcRed);
    }
    if(iPoints > 0)Return += " ("+ColorText(inStr(iPointsUsed)+"/"+inStr(iPoints), nwcYellow)+")";

    return Return;
}

/******************************************************************************/

float DCS_GetExperimentationFactor(object oPC, object oItem)
{
    float fQuality = inFloat(DCS_IPGetQuality(oItem));// DCS_SETTING_EXPERIMENTATION_FACTOR_QUALITY;
    //float fRank    = DCS_GetProfessionRank(oPC, DCS_GetCraftingProfession()) / DCS_SETTING_EXPERIMENTATION_FACTOR_RANK;

    return fQuality;// + fRank;
}

/******************************************************************************/

int DCS_GetValidItemProperties(object oItem)
{
    int   iPoints, iCount, iCounter;
    int   iStored = DCS_IPEXGetItemPropertiesStored(oItem);
    float fFactor = DCS_GetExperimentationFactor(DCS_GetCraftingPlayer(), oItem);

    for(iCounter=1; iCounter <= iStored; iCounter++)
    {
        iPoints = DCS_IPEXGetUseableItemPropertyPoints(iCounter, fFactor, oItem);

        if(iPoints > 0)
        iCount++;
    }

    return iCount;
}

/******************************************************************************/

void DCS_ApplyExperimentResultToItem(object oItem, int iResult, float fValue)
{
    if(fValue >= 100.0) return;

    object oPC     = DCS_GetCraftingPlayer();
    float  fChance = DCS_GetExperimentationChance();
    int    iDecrease;

    if(iResult <= 3)
    iDecrease++;

    if(fChance <= 20.0 && iResult <= 3)
    iDecrease++;

    if(iDecrease > 0)
    DCS_IPEXDecreaseItemQuality(oItem, iDecrease);
}

/******************************************************************************/

string DCS_GetResultTypeString(int iResultInt)
{
    switch(iResultInt)
    {
        case DCS_RESULT_ABSOLUTE_FAILURE: return DCS_TEXT_RESULT_ABSOLUTE_FAILURE;break;
        case DCS_RESULT_FAILURE:          return DCS_TEXT_RESULT_FAILURE;break;
        case DCS_RESULT_SUCCESS:          return DCS_TEXT_RESULT_SUCCESS; break;
        case DCS_RESULT_AMAZING_SUCCESS:  return DCS_TEXT_RESULT_AMAZING_SUCCESS;break;
    }

    return "";
}

/******************************************************************************/

int DCS_GetResultType(int iDice, float fChance)
{
    float fResult = fChance + iDice * 5.0;

    if(fResult >= 100.0 && iDice > 1)
    {
        if((iDice == 20 || iDice >= 19) && fChance >= 70.0)
        {
            return DCS_RESULT_AMAZING_SUCCESS;
        }

        return DCS_RESULT_SUCCESS;
    }
    else
    {
        if(iDice == 1 || (fChance <= 20.0 && iDice <= 3))
        {
            return DCS_RESULT_ABSOLUTE_FAILURE;
        }

        return DCS_RESULT_FAILURE;
    }
}

/******************************************************************************/

string DCS_GetResultText(int iDice, float fResult)
{
    string sResult = ColorText(DCS_GetResultTypeString(DCS_GetResultType(iDice, fResult)), nwcYellow);

    AdvDebug(DCS_GetCraftingPlayer(), "GetResultText: iDice = "+inStr(iDice)+", fResult: "+flStr(fResult)+", > 100: "+flStr(fResult+iDice*5.0)+", sResult: "+sResult);

    if(fResult + iDice * 5.0 >= 100.0)
    return ColorText(sResult, nwcGreen)+" - Ihr habt eine "+ColorText(inStr(iDice), nwcYellow)+" gewürfelt";

    return ColorText(sResult, nwcRed)+" - Ihr habt eine "+ColorText(inStr(iDice), nwcYellow)+" gewürfelt. Für einen Erfolg hättet ihr mindestens eine "+ColorText(inStr(flInt((100.0 - DCS_RoundPercentToInt(fResult)) / 5)), nwcYellow)+" würfeln müssen.";
}

/******************************************************************************/

string DCS_GetMultiResultText(float fResult)
{
    if(DCS_GetObjectsCount() <= 1)
    return DCS_GetResultText(DCS_GetCraftingResult(1), fResult);

    int iObjects = DCS_GetObjectsCount();
    int iDice, iSuccess, iFailure, iGrSuccess, iGrFailure, iCount;
    string sResults, sThrows, sFailed;

    for(iCount = 1; iCount <= iObjects; iCount++)
    {
        string sCurrentColor;
        iDice = DCS_GetCraftingResult(iCount);

        switch(DCS_GetResultType(iDice, fResult))
        {
            case DCS_RESULT_SUCCESS: iSuccess++; sCurrentColor = nwcYellow; break;
            case DCS_RESULT_FAILURE: iFailure++; sCurrentColor = nwcYellow; break;
            case DCS_RESULT_AMAZING_SUCCESS: iGrSuccess++; sCurrentColor = nwcRed; break;
            case DCS_RESULT_ABSOLUTE_FAILURE: iGrFailure++; sCurrentColor = nwcRed; break;
        }

        sThrows += sThrows == "" ? ColorText(inStr(iDice), sCurrentColor) : ", "+ColorText(inStr(iDice), nwcYellow);

        AdvDebug(DCS_GetCraftingPlayer(), inStr(iCount)+": GetResultText: iDice = "+inStr(iDice)+", fResult: "+flStr(fResult)+", > 100: "+flStr(fResult+iDice*5.0)+", sThrows: "+sThrows+
        ", Success: "+inStr(iSuccess)+", iFailure: "+inStr(iFailure)+", iGrSuccess: "+inStr(iGrSuccess)+", iGrFailure: "+inStr(iGrFailure));
    }

    if(iSuccess > 0)   sResults += sResults != "" ? ", " + inStr(iSuccess)   + "x " + ColorText(DCS_GetResultTypeString(DCS_RESULT_SUCCESS), nwcYellow)         : inStr(iSuccess)   + "x " + ColorText(DCS_GetResultTypeString(DCS_RESULT_SUCCESS), nwcYellow);
    if(iGrSuccess > 0) sResults += sResults != "" ? ", " + inStr(iGrSuccess) + "x " + ColorText(DCS_GetResultTypeString(DCS_RESULT_AMAZING_SUCCESS), nwcYellow) : inStr(iGrSuccess) + "x " + ColorText(DCS_GetResultTypeString(DCS_RESULT_AMAZING_SUCCESS), nwcYellow);
    if(iFailure > 0)   sResults += sResults != "" ? ", " + inStr(iFailure)   + "x " + ColorText(DCS_GetResultTypeString(DCS_RESULT_FAILURE), nwcRed)            : inStr(iFailure)   + "x " + ColorText(DCS_GetResultTypeString(DCS_RESULT_FAILURE), nwcRed);
    if(iGrFailure > 0) sResults += sResults != "" ? ", " + inStr(iGrFailure) + "x " + ColorText(DCS_GetResultTypeString(DCS_RESULT_ABSOLUTE_FAILURE), nwcRed)   : inStr(iGrFailure) + "x " + ColorText(DCS_GetResultTypeString(DCS_RESULT_ABSOLUTE_FAILURE), nwcRed);

    if(iFailure + iGrFailure == iObjects)
    sFailed = " Für einen Erfolg hättet ihr mindestens eine "+ColorText(inStr(flInt((100.0 - DCS_RoundPercentToInt(fResult)) / 5)), nwcYellow)+" würfeln müssen.";

    return sResults + " - Ihr habt eine "+sThrows+" gewürfelt" + sFailed;
}

/******************************************************************************/

void DCS_RunExperiment(object oItem)
{
    ExecuteScript("dcs_anim_expm", DCS_GetCraftingPlayer());

    object oPC          = DCS_GetCraftingPlayer();
    itemproperty ipProp = GetFirstItemProperty(oItem);
    int   ipType        = GetItemPropertyType(ipProp);
    int   ipSubType     = GetItemPropertySubType(ipProp);
    int   ipNumber      = DCS_IPEXGetItemPropertyNumber(ipType, ipSubType, oItem);
    int   iPoints       = DCS_IPEXGetTemporaryConsumedItemPropertyPoints(ipNumber, oItem);
    int   iDice         = d20();
    int   iResult       = iDice;
    int   iDelayCount   = 1;
    float fResult       = DCS_GetExperimentationChance() + iDice * 5.0;
    float fDelay        = IPGetNumberOfItemProperties(oItem) * 0.1;

         if(iResult == 1  || fResult <  100.0)iResult = FALSE;
    else if(iResult == 20 || fResult >= 100.0)iResult = TRUE;

    while(GetIsItemPropertyValid(ipProp))
    {
        if(iPoints > 0)
        {
            DCS_IPEXSetConsumedItemPropertyPoints(ipNumber, DCS_IPEXGetConsumedItemPropertyPoints(ipNumber, oItem) + iPoints, oItem);
            DCS_IPEXSetTemporaryConsumedItemPropertyPoints(ipNumber, 0, oItem);
            DelayCommand(fDelay*iDelayCount, DCS_IPChangeItemPropertyStats(oItem, ipProp, iPoints, ipNumber, !iResult));
        }

        ipProp    = GetNextItemProperty(oItem);
        ipType    = GetItemPropertyType(ipProp);
        ipSubType = GetItemPropertySubType(ipProp);
        ipNumber  = DCS_IPEXGetItemPropertyNumber(ipType, ipSubType, oItem);
        iPoints   = DCS_IPEXGetTemporaryConsumedItemPropertyPoints(ipNumber, oItem);
        iDelayCount++;
    }

    DCS_ApplyExperimentResultToItem(oItem, iDice, fResult);
    DCS_SetExperimentationDisplay();
    DCS_IPEXSetPointsConsumed(DCS_IPEXGetPointsConsumed(oItem) + DCS_IPEXGetTemporaryPointsConsumed(oItem), oItem);
    DCS_IPEXSetTemporaryPointsConsumed(0, oItem);
    DCS_IPEXDeleteEntries(oItem);

    SetCustomToken(DCS_TOKEN_EXPERIMENT_DISPLAY_RESULT, DCS_GetResultText(iDice, DCS_GetExperimentationChance()));

    //DelayCommand(3.0 + fDelay*iDelayCount, DCS_SwitchConversation(oPC));
}

/******************************************************************************/
/*                              EVENTS & OTHER                                */
/******************************************************************************/

int DCS_OnActivate()
{
    object oPC      = GetItemActivator();
    object oItem    = GetItemActivated();
    object oTarget  = GetItemActivatedTarget();
    string sResRef  = GetResRef(oItem);
    location lLocal = GetItemActivatedTargetLocation();
    int nQuality    = 9;//DCS_IPGetQuality(oItem);

    // AC 7 + damage reduction, 1.5 Turns per Duration-level
    if(sResRef == dcsPotMightBarkskin)
    {
        effect eSkin = EffectACIncrease(flInt(nQuality / 1.175), AC_NATURAL_BONUS);
               eSkin = EffectLinkEffects(EffectDamageResistance(DAMAGE_TYPE_SLASHING, flInt(nQuality*2.5)), eSkin);
               eSkin = EffectLinkEffects(EffectDamageResistance(DAMAGE_TYPE_PIERCING, flInt(nQuality*2.5)), eSkin);
               eSkin = EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROT_BARKSKIN), eSkin);

        effect eVis  = EffectVisualEffect(VFX_DUR_AURA_PULSE_BROWN_BLACK);
               eVis  = EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE), eVis);

        SignalEvent(oPC, EventSpellCastAt(oPC, SPELL_BARKSKIN, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEAD_NATURE), oPC);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSkin, oPC, TurnsToSeconds(nQuality) * 1.5);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oPC, 10.0);
        return TRUE;
    }
    // The normal harm spell
    else if(sResRef == dcsPotHarm)
    {
        if (GetRacialType(oPC) == RACIAL_TYPE_UNDEAD)
        {
            int nHeal = GetMaxHitPoints(oPC) - GetCurrentHitPoints(oPC);
            SignalEvent(oPC, EventSpellCastAt(OBJECT_SELF, SPELL_HARM, FALSE));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(nHeal), oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_HEALING_G), oPC);
        }
        else
        {
            int nDamage = GetCurrentHitPoints(oPC) - d4(1);
            SignalEvent(oPC, EventSpellCastAt(OBJECT_SELF, SPELL_HARM));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(246), oPC);
            DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(nDamage, DAMAGE_TYPE_NEGATIVE), oPC));
        }
        return TRUE;
    }
    // + 5% skill, 5min duration
    else if(sResRef == dcsPotEasyTradeskill)
    {
        if(GetLocalFloat(oPC, DCS_SKILL_ENHANCEMENT) < 5.0)
        SetLocalFloat(oPC, DCS_SKILL_ENHANCEMENT, 5.0);
        SetLocalInt(oPC, DCS_SKILL_ENHANCEMENT_USES, 5);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE), oPC, 4.0);
        return TRUE;
    }
    // + 10% skill, 5min duration
    else if(sResRef == dcsPotAverageTradeskill)
    {
        if(GetLocalFloat(oPC, DCS_SKILL_ENHANCEMENT) < 10.0)
        SetLocalFloat(oPC, DCS_SKILL_ENHANCEMENT, 10.0);
        SetLocalInt(oPC, DCS_SKILL_ENHANCEMENT_USES, 5);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_AURA_ORANGE), oPC, 4.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE), oPC, 4.0);
        return TRUE;
    }
    // + 15% skill, 5min duration
    else if(sResRef == dcsPotAbsoluteTradeskill)
    {
        if(GetLocalFloat(oPC, DCS_SKILL_ENHANCEMENT) < 15.0)
        SetLocalFloat(oPC, DCS_SKILL_ENHANCEMENT, 15.0);
        SetLocalInt(oPC, DCS_SKILL_ENHANCEMENT_USES, 5);

        AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY3));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SUPER_HEROISM), oPC);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_AURA_PULSE_ORANGE_BLACK), oPC, 4.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE), oPC, 4.0);
        return TRUE;
    }
    // 95% chance on throwing a 20 when crafting, no missing while active
    // Norm. 3
    else if(sResRef == dcsElixPerfectChance)
    {
        effect eVis = EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE);

        AssignCommand(oPC, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY3));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE), oPC, 4.0);
        SetLocalInt(oPC, DCS_PERFECT_CHANCE_USES, flInt(nQuality / 3.0));
        SetLocalInt(oPC, DCS_PERFECT_CHANCE, TRUE);
        return TRUE;
    }

    return FALSE;
}

/******************************************************************************/

void DCS_DecreasePotionUses(object oPC, int iDecrement=1)
{
    int nChanceUses  = GetLocalInt(oPC, DCS_PERFECT_CHANCE_USES) - iDecrement;
    int nEnhanceUses = GetLocalInt(oPC, DCS_SKILL_ENHANCEMENT_USES) - iDecrement;

    SetLocalInt(oPC, DCS_PERFECT_CHANCE_USES, nChanceUses);
    SetLocalInt(oPC, DCS_SKILL_ENHANCEMENT_USES, nEnhanceUses);

    // Delete 'perfect chance' status, if uses are at 0 or lower
    if(!nChanceUses)
    {
        DeleteLocalInt(oPC, DCS_PERFECT_CHANCE);
        DeleteLocalInt(oPC, DCS_PERFECT_CHANCE_USES);
    }

    // Delete skill enhancement status, if uses are at 0 or lower
    if(!nEnhanceUses)
    {
        DeleteLocalFloat(oPC, DCS_SKILL_ENHANCEMENT);
        DeleteLocalInt(oPC, DCS_SKILL_ENHANCEMENT_USES);
    }
}

//*--------------------------------------------------------------------------*\\

void DCS_PopupWindow(object oPC, string sTitle, string sPopupText)
{
    object oExamine = CreateObject(OBJECT_TYPE_PLACEABLE, "plc_invisobj", GetLocation(oPC));

    if(sTitle     != "")SetName(oExamine, sTitle);
    if(sPopupText != "")SetDescription(oExamine, sPopupText);

    DelayCommand(0.5, AssignCommand(oPC, ActionExamine(oExamine)));
    DelayCommand(4.0, DestroyObject(oExamine));
}

//*--------------------------------------------------------------------------*\\

void DCS_DoFinish(object oStation=OBJECT_SELF)
{
    AssignCommand(oStation, ClearAllActions());
    AssignCommand(DCS_GetCraftingPlayer(oStation), ClearAllActions());
    ExecuteScript("dcs_finish", oStation);
}

//*--------------------------------------------------------------------------*\\

object DCS_CreateSpecialAmmo(object oPC, object oItem)
{
    int    iAmmo  = GetCached2DAInt("iprp_ammotypcost", "value", DCS_IPGetItemPropertyValue(DCS_IPFindItemProperty(oItem, ITEM_PROPERTY_RANGEDAMMO)));
    string sAmmo  = DCS_GetAmmoByBaseType(iAmmo);
    string sProps = DCS_IPGetItemPropertyString(oItem);
    string sName  = GetSubString(GetName(oItem), FindSubString(GetName(oItem), "(")+1, FindSubString(GetName(oItem), ")")-(FindSubString(GetName(oItem), "(")+1));
    object oAmmo  = CreateItemOnObject(sAmmo, oPC, GetCached2DAInt("baseitems", "stacking", iAmmo), DCS_GetAmmoShortCut(iAmmo)+sProps);

    SetLocalObject(oPC, D0_QUIVER_AMMO, oItem);
    SetLocalString(oPC, D0_QUIVER_AMMO, DCS_GetAmmoShortCut(iAmmo)+sProps);
    SetName(oAmmo, sName);
    DCS_AppendTagIntoItem(oAmmo, oPC, DCS_ITEM_TAG_TYPE_CREATE);
    DCS_IPCopyItemProperties(oItem, oAmmo);

    return oAmmo;
}

/******************************************************************************/

void DCS_DeleteMultiObjectID(object oStation=OBJECT_SELF)
{
    int iObjects = DCS_GetObjectsCount();
    int i;

    for(i = 1; i <= iObjects; i++)
    {
        DeleteLocalString(oStation, DCS_VAR_MULTIOBJ_ID+inStr(i));
    }
}

/******************************************************************************/

void DCS_SetMultiObjectID(string sID, int iNum, object oStation=OBJECT_SELF)
{
    SetLocalString(oStation, DCS_VAR_MULTIOBJ_ID+inStr(iNum), sID);
}

/******************************************************************************/

string DCS_GetMultiObjectID(int iNum, object oStation=OBJECT_SELF)
{
    return GetLocalString(oStation, DCS_VAR_MULTIOBJ_ID+inStr(iNum));
}

/******************************************************************************/

void DCS_IPEXDeleteExperimentationVars()
{
    int iObjects = DCS_GetObjectsCount();
    int i;

    for(i = 1; i <= iObjects; i++)
    {
        object oItem = DCS_GetCraftedItem(i);
        DCS_IPEXDeleteStoredItemProperties(oItem);
        DCS_IPEXDeleteEntries(oItem);
        DeleteLocalInt(OBJECT_SELF, DCS_VAR_EXPERIMENT_OBJ_VALID+inStr(i));
    }
}

//void main(){}
