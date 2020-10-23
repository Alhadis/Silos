#include "d0_functions_inc"
int StartingConditional()
{
    object oTarget     = GetPCSpeaker();
    int    iMenuPage   = GetLocalInt(oTarget, "BN_MENUPAGE");
    int    iCount      = 1;
    int    iMenuCounter;
    string sCount, sTokenString;

    if (iMenuPage == 0)
    {
        if(iMenuPage == 0)
        {
            SetLocalInt(oTarget, "BN_MENUPAGE", 1);
            iMenuPage = 1;
        }
        iMenuCounter = 1;
    }
    else
    {
        iMenuCounter = (iMenuPage-1)*8 + 1;
    }

    sTokenString = GetNthBannedCDKey(iMenuCounter);

    AdvDebug(oTarget, "iMenuPage: "+IntToString(iMenuPage)+", iMenuCounter: "+IntToString(iMenuCounter)+", sTokenString: "+sTokenString);

    while (iCount <= 9)
    {
        sCount = IntToString (iCount);

        if (sTokenString == "")
            break;

        // "Next Page" activation
        if (iCount == 9)
        {
            SetLocalInt (oTarget, "BN_List_Next", TRUE);
            break;
        }

        AdvDebug(oTarget, "iCount: "+IntToString(iCount)+", iMenuCounter: "+IntToString(iMenuCounter)+", sTokenString: "+sTokenString);

        SetLocalString(oTarget, "BN_List_Entry" + sCount, sTokenString);

        iCount++;
        iMenuCounter++;
        sTokenString = GetNthBannedCDKey(iMenuCounter);
    }

    // "Previous Page" activation
    if(iMenuPage > 1)
    SetLocalInt (oTarget, "BN_List_Prev", TRUE);

    //Menutext
    SetCustomToken(353535, IntToString(GetCDKeysBanned()));

   return TRUE;
}
