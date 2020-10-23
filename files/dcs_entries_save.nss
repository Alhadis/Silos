#include "dcs_inc_main"
#include "dqs_include"

string DCS_GetColor(int iHasResources, int iMenupage)
{
    int iMenuSize    = DCS_GetMenuSize();
    int iCurrentMenu = DCS_GetCurrentMenu() + 1;

    // Change color to current menu color, if we aren't already choosing recipes
    if(!iMenupage && iCurrentMenu < iMenuSize)
        return DCS_TextColor;
    else if(iHasResources)
        return nwcGreen;

    return nwcRed;
}

//*-------------------------------------------------------------------------*\\

void FinishEntryStore(object oPC)
{
    // Increase the current menu, and resume the conversation after fDelay
    DQS_ResetLastEntryAndIncreaseCounter(DCS_SETTING_CRAFTING_SYSTEM_QUEUE);
    DCS_SetCurrentMenu(DCS_GetCurrentMenu() + 1);
    DCS_SwitchConversation(oPC);
    AdvDebug(oPC, ColorText("script 'dcs_entries_save' finished", nwcRed));
}

//*-------------------------------------------------------------------------*\\

void DCS_StoreEntriesOnToken(object oPC, int iCount=1, int iStored=0, int iMaximum=DCS_TOKEN_PER_PAGE_MENU, int iMode=-1)
{
    object oStation  = OBJECT_SELF;
    int    iMenupage = DCS_GetMenupage();

    if(iMode == -1)
    {
        iMode = 0;

        if(!DCS_GetInformationMode(oPC))
        {
            int iChooseMode = DCS_GetChooseItemMode();

            if(iChooseMode == DCS_MODE_CHOOSE_GEM)
                iMode = DCS_MODE_CHOOSE_GEM;
            else if(iChooseMode == DCS_MODE_REMOVE_GEM)
                iMode = DCS_MODE_REMOVE_GEM;
            else if(iChooseMode == DCS_MODE_CHOOSE_ITEM || DCS_GetGemBindingMode() || DCS_GetDisenchantingMode())
                iMode = DCS_MODE_CHOOSE_ITEM;
        }
    }

    AdvDebug(oPC, "Mode: "+inStr(iMode));

    // General Choosing mode
    if(iMode == 0)
    {
        string sEntry = DCS_GetToken(iMenupage, DCS_TOKEN_MENU_SOURCE + iCount);

        AdvDebug(oPC, "sEntry: "+sEntry+", iCount: "+inStr(iCount));
        if(sEntry != "")
        {
            int iHasRess;
            int iRecNum   = DCS_GetRecipeNumber(iCount);
            int iLimited  = DCS_GetOption(DCS_OPTION_SHOW_LIMITED_RECIPES);
            int iResCheck = DCS_GetOption(DCS_OPTION_ALLOW_RECIPE_CHECK);
            string sColor = DCS_GetRecipeEntry(DCS_COL_RECIPE_COLOR, DCS_GetRecipeID(iRecNum));

            if(DCS_GetInformationMode(oPC))
            iLimited = FALSE;

            if(sEntry != DCS_TOKEN_SKIP)
            {
                if(iStored >= iMaximum)
                {
                    if(iMenupage && iResCheck)
                    {
                        iHasRess = DCS_GetStationHasResources(iRecNum);
                        AdvDebug(oPC, "Max Reached. iHasRess: "+inStr(iHasRess));
                        if(iHasRess || (!iHasRess && !iLimited))
                        SetLocalInt(oStation, DCS_VAR_LIST_NEXT, TRUE);
                    }
                    else
                        SetLocalInt(oStation, DCS_VAR_LIST_NEXT, TRUE);

                    FinishEntryStore(oPC);
                    return;
                }

                if(iMenupage)
                {
                    if(iResCheck)
                    {
                        iHasRess = DCS_GetStationHasResources(iRecNum);
                        AdvDebug(oPC, "Normal Menu, iHasRess: "+inStr(iHasRess));
                        if(iHasRess || (!iHasRess && !iLimited))
                        {
                            AdvDebug(oPC, "Storing");
                            iStored++;
                            SetLocalInt   (oStation, DCS_VAR_LIST_OFFSET + inStr(iStored), iCount);
                            SetLocalString(oStation, DCS_VAR_LIST_ENTRY  + inStr(iStored), sEntry);
                            SetLocalString(oStation, DCS_VAR_LIST_COLOR  + inStr(iStored), DCS_GetColor(iHasRess, iMenupage));
                        }
                    }
                    else
                    {
                        AdvDebug(oPC, "Normal Menu - Storing");
                        iStored++;
                        SetLocalInt   (oStation, DCS_VAR_LIST_OFFSET + inStr(iStored), iCount);
                        SetLocalString(oStation, DCS_VAR_LIST_ENTRY  + inStr(iStored), sEntry);
                        SetLocalString(oStation, DCS_VAR_LIST_COLOR  + inStr(iStored), (sColor != "" ? sColor : DCS_TextColor));
                    }
                }
                else
                {
                    AdvDebug(oPC, "Submenu - Storing");
                    iStored++;
                    SetLocalInt   (oStation, DCS_VAR_LIST_OFFSET + inStr(iStored), iCount);
                    SetLocalString(oStation, DCS_VAR_LIST_ENTRY  + inStr(iStored), sEntry);
                    SetLocalString(oStation, DCS_VAR_LIST_COLOR  + inStr(iStored), DCS_GetColor(iHasRess, iMenupage));
                }
                AdvDebug(oPC, "iStored: "+inStr(iStored)+", RecipeNumber: "+inStr(DCS_GetRecipeNumber(iCount)));
            }

            AdvDebug(oPC, "-------------------");
            DelayCommand(0.02, DCS_StoreEntriesOnToken(oPC, iCount+1, iStored));
        }
        else
        {
            FinishEntryStore(oPC);
        }
    }
    // Special case for menu extensions and disenchanting mode
    else if(iMode == DCS_MODE_CHOOSE_ITEM)
    {
        object oSearch = DCS_GetRandomObjectInStation(DCS_ArrayGetString(DCS_GetRecipeID((DCS_GetDisenchantingMode() || DCS_GetGemBindingMode()) ? 1 : 0), "resource"), iCount + (iMenupage - 1) * iMaximum);

        AdvDebug(oPC, "nNth: "+inStr(iCount + (iMenupage - 1) * iMaximum)+", iMenupage: "+inStr(iMenupage)+", oItem: "+GetName(oSearch)+", Random: "+DCS_ArrayGetString(DCS_GetRecipeID((DCS_GetDisenchantingMode() || DCS_GetGemBindingMode()) ? 1 : 0), "resource"));

        if(GetIsObjectValid(oSearch))
        {
            if(iCount > iMaximum)
            {
                SetLocalInt(oStation, DCS_VAR_LIST_NEXT, TRUE);
                FinishEntryStore(oPC);
                return;
            }

            int iQuality = DCS_IPGetQuality(oSearch);
            SetLocalString(oStation, DCS_VAR_LIST_COLOR  + inStr(iCount), DCS_TextColor);
            SetLocalString(oStation, DCS_VAR_LIST_ENTRY  + inStr(iCount), GetName(oSearch)+(iQuality > 0 ? " ("+DCS_GetQualityName(iQuality)+")" : ""));
            SetLocalObject(oStation, DCS_VAR_LIST_OBJECT + inStr(iCount), oSearch);

            DelayCommand(0.028, DCS_StoreEntriesOnToken(oPC, iCount+1));
        }
        else
        {
            FinishEntryStore(oPC);
        }
    }
    // Another special case for gem binding mode
    else if(iMode == DCS_MODE_CHOOSE_GEM)
    {
        object oSearch = DCS_GetRandomObjectInStation(dcsRandomGem, iCount + (iMenupage - 1) * iMaximum);
        string sID = DCS_GetRecipeID(1);
        int iSockets = DCS_GetLocalSockets(ITEM_PROPERTY_SOCKET);
        int iBigSockets = DCS_GetLocalSockets(ITEM_PROPERTY_BIG_SOCKET);

        while(GetIsObjectValid(oSearch))
        {
            //AdvDebug(oPC, "oSearch: "+GetName(oSearch));

            int iSocketType = DCS_IPGetItemPropertyTypeValue(oSearch, ITEM_PROPERTY_SOCKET_TYPE);

            //AdvDebug(oPC, "iSockets: "+inStr(iSockets)+", BigSockets: "+inStr(iBigSockets)+", SocketType: "+inStr(iSocketType));
            if(DCS_GetStoredResourceValue(GetResRef(oSearch), oStation) < DCS_GetItemNum(oStation, GetResRef(oSearch)) &&
             ((iSocketType == IP_CONST_SOCKET_TYPE_SMALL && iSockets > 0) || (iSocketType == IP_CONST_SOCKET_TYPE_BIG && iBigSockets > 0)))
            break;

            oSearch = DCS_GetRandomObjectInStation(dcsRandomGem, ++iCount + (iMenupage - 1) * iMaximum);
        }

        AdvDebug(oPC, "nNth: "+inStr(iCount + (iMenupage - 1) * iMaximum)+", iMenupage: "+inStr(iMenupage)+", oItem: "+GetName(oSearch)+", Random: "+DCS_ArrayGetString(sID, "resource"));
        if(GetIsObjectValid(oSearch))
        {
            if(iCount > iMaximum)
            {
                SetLocalInt(oStation, DCS_VAR_LIST_NEXT, TRUE);
                FinishEntryStore(oPC);
                return;
            }

            SetLocalString(oStation, DCS_VAR_LIST_COLOR  + inStr(iCount), DCS_TextColor);
            SetLocalString(oStation, DCS_VAR_LIST_ENTRY  + inStr(iCount), GetName(oSearch));
            SetLocalObject(oStation, DCS_VAR_LIST_OBJECT + inStr(iCount), oSearch);

            DelayCommand(0.028, DCS_StoreEntriesOnToken(oPC, iCount+1));
        }
        else
        {
            // Title: No Gems found
            if(iCount == 1)
            SetCustomToken(DCS_TOKEN_MENU_SOURCE, ColorText(DCS_TEXT_NO_GEMS_FOUND, nwcRed));

            FinishEntryStore(oPC);
        }
    }
    else if(iMode == DCS_MODE_REMOVE_GEM)
    {
        if(iCount == 1)
        iCount++;

        string sResource = DCS_GetLocalResource(iCount);
        //AdvDebug(oPC, "iCount: "+inStr(iCount)+", sResource: "+sResource);
        object oSearch = GetFirstItemInInventory(oStation);

        while(GetIsObjectValid(oSearch))
        {
            //AdvDebug(oPC, "iCount: "+inStr(iCount)+", sResource: "+sResource+", oSearch: "+GetName(oSearch)+", sSearch: "+GetTag(oSearch)+", sRes: "+GetResRef(oSearch));
            if(GetResRef(oSearch) == sResource)
            break;

            oSearch = GetNextItemInInventory(oStation);
        }

        AdvDebug(oPC, "oItem: "+GetName(oSearch));

        if(GetIsObjectValid(oSearch))
        {
            if(iCount == iMaximum)
            {
                SetLocalInt(oStation, DCS_VAR_LIST_NEXT, TRUE);
                FinishEntryStore(oPC);
                return;
            }

            SetLocalString(oStation, DCS_VAR_LIST_COLOR  + inStr(iCount), DCS_TextColor);
            SetLocalString(oStation, DCS_VAR_LIST_ENTRY  + inStr(iCount), GetName(oSearch));
            SetLocalObject(oStation, DCS_VAR_LIST_OBJECT + inStr(iCount), oSearch);

            DelayCommand(0.02, DCS_StoreEntriesOnToken(oPC, iCount+1));
        }
        else
        {
            FinishEntryStore(oPC);
        }

    }
}

//*--------------------------------------------------------------------------*\\

int GetEntriesCount()
{
    string sID    = DCS_GetRecipeID();
    int    iIDLen = GetStringLength(sID);

    SQLExecDirect("select count(*) from "+DCS_TABLE_RECIPES+" where "+DCS_COL_RECIPE_ID+" like '"+GetStringLeft(sID, iIDLen-2)+"%' and LENGTH("+DCS_COL_RECIPE_ID+")="+inStr(iIDLen));

    if(SQLFetch())
    return SQLGetDataInt(1);

    return 0;
}

//*--------------------------------------------------------------------------*\\

float DCS_GetTimeExpire(float fDelayMulti=0.065)
{
    if(!DCS_GetInformationMode() && DCS_GetDisenchantingMode())
        return 0.45;
    else if(!DCS_GetMenupage())
        return 0.35;
    else
        return GetEntriesCount() * fDelayMulti;
}

//*--------------------------------------------------------------------------*\\

void main()
{
    object oPC        = GetPCSpeaker();
    int    iMenuCount = DCS_GetMenuCounter();
    //float  fDelay     = DCS_GetTimeExpire();

    AdvDebug(oPC, ColorText("script 'dcs_entries_save' started", nwcRed));

    // Delete the "next page" selection and store all tokens to local variables.
    DeleteLocalInt(OBJECT_SELF, DCS_VAR_LIST_NEXT);
    DCS_SetListingPosition(0);
    DCS_StoreEntriesOnToken(oPC);
}
