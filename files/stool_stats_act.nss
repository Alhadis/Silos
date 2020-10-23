#include "d0_functions_inc"
int StartingConditional()
{
    object oPC         = GetPCSpeaker();
    object oTarget     = GetLocalObject(oPC, "stool_fix_object");
    int    iMenuPage   = GetLocalInt(oPC, "STATS_MENUPAGE");
    int    iCount      = 1;
    int    iMenuCounter;
    itemproperty ipProp;
    string sCount, sTokenString;

    if (iMenuPage == 0)
    {
        if(iMenuPage == 0)
        {
            SetLocalInt(oPC, "STATS_MENUPAGE", 1);
            iMenuPage = 1;
        }
        iMenuCounter = 1;
    }
    else
    {
        iMenuCounter = (iMenuPage-1)*8 + 1;
    }

    ipProp       = GetNthItemProperty(oTarget, iMenuCounter);
    sTokenString = GetItemPropertyTypeName(ipProp);

    AdvDebug(oPC, "iMenuPage: "+IntToString(iMenuPage)+", iMenuCounter: "+IntToString(iMenuCounter)+", sTokenString: "+sTokenString);

    while (iCount <= 9)
    {
        sCount = IntToString (iCount);

        if (sTokenString == "")
            break;

        // "Next Page" activation
        if (iCount == 9)
        {
            SetLocalInt (oPC, "STATS_List_Next", TRUE);
            break;
        }

        AdvDebug(oPC, "iCount: "+IntToString(iCount)+", iMenuCounter: "+IntToString(iMenuCounter)+", sTokenString: "+sTokenString);

        SetLocalString(oPC, "STATS_List_Entry" + sCount, sTokenString);

        iCount++;
        iMenuCounter++;
        ipProp       = GetNthItemProperty(oTarget, iMenuCounter);
        sTokenString = GetItemPropertyTypeName(ipProp);
    }

    // "Previous Page" activation
    if(iMenuPage > 1)
    SetLocalInt (oPC, "STATS_List_Prev", TRUE);

    //Menutext
    SetCustomToken(11880, GetName(oTarget));
   return TRUE;
}
