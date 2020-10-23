#include "d0_functions_inc"
void main()
{
    object oPC         = GetPCSpeaker();
    int    iMenuPage   = GetLocalInt(oPC, "SKILL_MENUPAGE");
    int    iCount      = 1;
    int    iMenuCounter;
    itemproperty ipProp;
    string sCount, sTokenString;

    if (iMenuPage == 0)
    {
        if(iMenuPage == 0)
        {
            SetLocalInt(oPC, "SKILL_MENUPAGE", 1);
            iMenuPage = 1;
        }
        iMenuCounter = 1;
    }
    else
    {
        iMenuCounter = (iMenuPage-1)*8 + 1;
    }

    sTokenString = GetNthSkillName(iMenuCounter);

    AdvDebug(oPC, "iMenuPage: "+IntToString(iMenuPage)+", iMenuCounter: "+IntToString(iMenuCounter)+", sTokenString: "+sTokenString);

    while (iCount <= 9)
    {
        sCount = IntToString (iCount);

        if (sTokenString == "")
            break;

        // "Next Page" activation
        if (iCount == 9)
        {
            SetLocalInt (oPC, "SKILL_List_Next", TRUE);
            break;
        }

        AdvDebug(oPC, "iCount: "+IntToString(iCount)+", iMenuCounter: "+IntToString(iMenuCounter)+", sTokenString: "+sTokenString);

        SetLocalString(oPC, "SKILL_List_Entry" + sCount, sTokenString);

        iCount++;
        iMenuCounter++;
        sTokenString = GetNthSkillName(iMenuCounter);
    }

    // "Previous Page" activation
    if(iMenuPage > 1)
    SetLocalInt (oPC, "SKILL_List_Prev", TRUE);

}
