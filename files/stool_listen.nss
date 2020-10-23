#include "d0_functions_inc"
void main()
{
    object oPC    = GetLocalObject(OBJECT_SELF, "PCSpeaker");
    object oTar   = GetLocalObject(oPC, "stool_fix_object");
    string sText  = GetMatchedSubstring(0);
    string sIndex = "#i!j$k%l{&M/n(o)p=q?r^¤Xs`Tu'v]AwBxCyDzEF-Gt;I}Y:J_K+Z[LmN\ lkOjPhQ,gRfSeHdUcVbWa.";

    if(GetListenPatternNumber() == 9988)
    {
        //This is used to change the appearance of oTar
        if(GetLocalInt(oPC, "App_Activ") && GetStringLength(sText) <= 4)
        {
            int nLen = GetStringLength(sText);
            int i, nFound, nChar;
            for(i=0;i<nLen;i++)
            {
                nChar = FindSubString(sIndex, GetSubString(sText,i,1));

                if(nChar == -1)
                nFound++;
            }

            if(nFound == nLen)
            {
                SetCreatureAppearanceType(oTar, StringToInt(sText));
                SendMessageToPC(oPC, "New Appearance-Type Number: "+sText);
            }
        }

        //This is used to change the name of oTar
        if(GetLocalInt(oPC, "Item_Name_Activ"))
        {
            SetName(oTar, sText);
            SendMessageToPC(oPC, "New Item Name: "+sText);
        }

        //This is used to unban a CD-Key or IP-Address
        if(GetLocalInt(oPC, "Ban_Key_Address"))
        {
            if(GetLocalInt(oPC, "sTool_SetVar") == 1)
            {
                SendMessageToPC(oPC, "Given CD-Key: "+sText);
            }
            else if(GetLocalInt(oPC, "sTool_SetVar") == 2)
            {
                SendMessageToPC(oPC, "Given IP-Address: "+sText);
            }
            SetCustomToken(20003, sText);
            SetLocalString(oPC, "UNBAN_STRING", sText);
            DeleteLocalInt(oPC, "Ban_Key_Address");
        }

        if(GetLocalInt(oPC, "dcs_sql_request_listen"))
        {
            SetLocalString(oPC, "dcs_sql_request", sText);
            SetCustomToken(901230, ColorText(sText, nwcYellow));
        }
    }
}
