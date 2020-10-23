//::///////////////////////////////////////////////
//:: Name: pgs_disp_mlist
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Display the member list tokens based on the
    list being built.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int iTokenPosition = GetLocalInt (oPlayer, "Token_Position");
    string sCheck = GetLocalString (oPlayer, "Temp_List_Member" + IntToString
        (iTokenPosition));

    //--------------------------------------------
    //Check if valid information to display.
    //--------------------------------------------
    if (sCheck == "")
        return FALSE;

    SetCustomToken (3019 + iTokenPosition, sCheck);
    SetLocalInt (oPlayer, "Token_Position", iTokenPosition + 1);  /*Update pos.*/
    return TRUE;
}
