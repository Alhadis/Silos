#include "d0_functions_inc"
int StartingConditional()
{
    object oTarget     = GetPCSpeaker();
    int    iMenuPage   = GetLocalInt(oTarget, "LOG_MENUPAGE");
    int    iCount      = 1;
    int    iMenuCounter;
    string sCount, sTokenString;

    if(!iMenuPage)
    {
        SetLocalInt(oTarget, "LOG_MENUPAGE", 1);
        iMenuPage    = 1;
        iMenuCounter = 1;
    }
    else
    {
        iMenuCounter = (iMenuPage-1)*D0_KEYLOGGER_TOKEN_MAX + 1;
    }

    sTokenString = GetNthCDKeyFromDB(iMenuCounter);
    //AdvDebug(oTarget, "iMenuPage: "+IntToString(iMenuPage)+", iMenuCounter: "+IntToString(iMenuCounter)+", sTokenString: "+sTokenString);

    while (iCount <= D0_KEYLOGGER_TOKEN_MAX+1)
    {
        if (sTokenString == "")
            break;

        // "Next Page" activation
        if (iCount == D0_KEYLOGGER_TOKEN_MAX+1)
        {
            SetLocalInt (oTarget, "LOG_List_Next", TRUE);
            break;
        }

        //AdvDebug(oTarget, "iCount: "+IntToString(iCount)+", iMenuCounter: "+IntToString(iMenuCounter)+", sTokenString: "+sTokenString);
        sCount = IntToString (iCount);
        SetLocalString(oTarget, "LOG_List_Entry" + sCount, sTokenString);

        iCount++;
        iMenuCounter++;
        sTokenString = GetNthCDKeyFromDB(iMenuCounter);

    }

    // "Previous Page" activation
    if(iMenuPage > 1)
    SetLocalInt (oTarget, "LOG_List_Prev", TRUE);

    //Menutext
    float fInput = GetCDKeysFromDB()/IntToFloat(D0_KEYLOGGER_TOKEN_MAX);
    int   iInput = FloatToInt(fInput);

    //AdvDebug(oTarget, "fInput: "+FloatToString(fInput)+", iInput: "+IntToString(iInput)+", fInput > IntToFloat(iInput): "+FloatToString(fInput)+" > "+FloatToString(IntToFloat(iInput)));
    if(fInput > IntToFloat(iInput))iInput++;

    //AdvDebug(oTarget, "iInput: "+IntToString(iInput));

    SetCustomToken(D0_KEYLOGGER_TOKEN_KEYS, IntToString(GetCDKeysFromDB()));
    SetCustomToken(D0_KEYLOGGER_TOKEN_CUR_PAGE, IntToString(iMenuPage));
    SetCustomToken(D0_KEYLOGGER_TOKEN_MAX_PAGE, IntToString(iInput));

    return TRUE;
}
