//::///////////////////////////////////////////////
//:: Name: pgs_check_reply
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check guild message reply information to make
    sure everything was entered.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
void main()
{
    object oPlayer = GetPCSpeaker();

    SetLocalInt (oPlayer, "Guild_Data_Error", FALSE);  /*No errors yet.*/

    //--------------------------------------------
    //Validate player entered information.
    //--------------------------------------------
    if ((GetLocalString (oPlayer, "Temp_Reply_Title") == "") || (GetLocalString (oPlayer, "Temp_Reply_Post") == ""))
    {
        SetLocalInt (oPlayer, "Guild_Data_Error", TRUE);
        SendMessageToPC (oPlayer, "Invalid reply message and/or title was entered.");
    }
}
