//::///////////////////////////////////////////////
//:: Name: pgs_check_messge
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check guild message data that was entered,
    and make sure it's valid.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
void main()
{
    object oPlayer = GetPCSpeaker();

    //--------------------------------------------
    //No errors have occured yet, begin checks.
    //--------------------------------------------
    SetLocalInt (oPlayer, "Guild_Data_Error", FALSE);

    //--------------------------------------------
    //Validate player entered information.
    //--------------------------------------------
    if ((GetLocalString (oPlayer, "Temp_Message_Title") == "") || (GetLocalString (oPlayer, "Temp_Message_Post") == ""))
    {
        SetLocalInt (oPlayer, "Guild_Data_Error", TRUE);
        SendMessageToPC (oPlayer, "Invalid message title and/or post was entered.");
    }
}
