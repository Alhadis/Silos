#include "d0_moschstat_inc"
#include "d0_functions_inc"

int StartingConditional()
{
    object oTarget     = GetPCSpeaker();
    int    iMenuPage   = GetLocalInt(oTarget, "MOS_MENUPAGE");
    int    iCount      = 1;
    int    iMenuCounter;
    string sCount, sTokenString;

    if (iMenuPage == 0)
    {
        if(iMenuPage == 0)
        {
            SetLocalInt(oTarget, "MOS_MENUPAGE", 1);
            iMenuPage = 1;
        }
        iMenuCounter = 1;
    }
    else
    {
        iMenuCounter = (iMenuPage-1)*18 + 1;
    }

    sTokenString = GetRankingList(iMenuCounter, oTarget);

    AdvDebug(oTarget, "iMenuPage: "+IntToString(iMenuPage)+", iMenuCounter: "+IntToString(iMenuCounter)+", sTokenString: "+sTokenString);

    while (iCount <= 19)
    {
        sCount = IntToString (iCount);

        if (sTokenString == "")
            break;

        // "Next Page" activation
        if (iCount == 19)
        {
            SetLocalInt (oTarget, "MOS_List_Next", TRUE);
            break;
        }

        AdvDebug(oTarget, "iCount: "+IntToString(iCount)+", iMenuCounter: "+IntToString(iMenuCounter)+", sTokenString: "+sTokenString);

        SetLocalString(oTarget, "MOS_List_Entry" + sCount, sTokenString);

        iCount++;
        iMenuCounter++;
        sTokenString = GetRankingList(iMenuCounter, oTarget);
    }

    // "Previous Page" activation
    if(iMenuPage > 1)
    SetLocalInt (oTarget, "MOS_List_Prev", TRUE);

    //Menutext
   SetCustomToken(800008, "<cþ>"+IntToString(GetMaxPlayersInTempDB())+"</c>");

   return TRUE;
}
