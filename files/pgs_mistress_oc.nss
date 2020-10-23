//::///////////////////////////////////////////////
//:: Name: pgs_mistress_oc
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    OnConversation event for the Guild Mistress.
*/
//:://////////////////////////////////////////////
//:: Created By: Samius Maximus
//:: Created On:
//:://////////////////////////////////////////////
#include "inc_gsystem"

void main()
{
    object oPlayer = GetLastSpeaker();

    //--------------------------------------------
    //Check for valid object and/or action.
    //--------------------------------------------
    if ((GetListenPatternNumber() == -1) || (oPlayer != GetLocalObject (OBJECT_SELF, "Temp_Player")))
        return;

    //--------------------------------------------
    //Determine what the GM should do with the
    //information she has recorded from the player.
    //--------------------------------------------
    switch (GetLocalInt (oPlayer, "Do_What_With_Info"))
    {
        case 1:  /*Temporary guild name.*/
            SpeakString ("As you wish.  Recording guild name...");
            SetLocalString (oPlayer, "Temp_Guild_Name", GetMatchedSubstring (0));
            break;
        case 2:  /*Guild description.*/
            if (GetIsDM (oPlayer))  /*Check if DM is editing description.*/
            {
                SpeakString ("I have updated the guild description.");
                SetModuleGuildDescription (GetLocalInt (oPlayer, "Temp_Guild_" +
                    "List_Number"), GetMatchedSubstring (0));
            }
            else  /*Player is entering guild description.*/
            {
                if (GetLocalInt (oPlayer, "Player_Guild_Rank") == 4)
                {
                    int iGuild = GetLocalInt (oPlayer, "Player_Guild_Number");

                    SpeakString ("As you wish.  You're guild description has been updated.");
                    SendPGSGuildNotice (iGuild, "Guild description has been updated.");
                    SetModuleGuildDescription (iGuild, GetMatchedSubstring (0));
                }
                else  /*New guild is being created - store temporary descrip.*/
                {
                    SpeakString ("As you wish.  Recording guild description...");
                    SetLocalString (oPlayer, "Temp_Guild_Description",
                        GetMatchedSubstring (0));
                }
            }
            break;
        case 3:  /*Temporary message title - pending validation.*/
            SpeakString ("As you wish.  Recording message title...");
            SetLocalString (oPlayer, "Temp_Message_Title", GetMatchedSubstring (0));
            break;
        case 4:  /*Temporary message post - pending validation.*/
            SpeakString ("As you wish.  Recording message post...");
            SetLocalString (oPlayer, "Temp_Message_Post", GetMatchedSubstring (0));
            break;
        case 5:  /*Temporary reply title - pending verification.*/
            SpeakString ("As you wish.  Recording reply title...");
            SetLocalString (oPlayer, "Temp_Reply_Title", GetMatchedSubstring (0));
            break;
        case 6:  /*Temporary reply post - pending verification.*/
            SpeakString ("As you wish.  Recording reply post...");
            SetLocalString (oPlayer, "Temp_Reply_Post", GetMatchedSubstring (0));
            break;
        case 7:  /*Temporary territory name - pending validation.*/
            SpeakString ("As you wish.  Recording territory name...");
            SetLocalString (oPlayer, "Temp_Territory_Name", GetMatchedSubstring (0));
            break;
        case 8:  /*Player is entering new rank name.*/
            SpeakString ("As you wish.  Recording guild rank name...");
            SetModuleGuildRankName (GetLocalInt (oPlayer, "Player_Guild_Number"),
                GetLocalInt (oPlayer, "Rank_Position"), GetMatchedSubstring (0));
            break;
    }
}
