string LIST_ITEM_NAME = "PC_";
string PC_ID_NAME = "OID";

const int NWNXCHAT_CHANNEL_TALK        = 1;
const int NWNXCHAT_CHANNEL_SHOUT       = 2;
const int NWNXCHAT_CHANNEL_WHISPER     = 3;
const int NWNXCHAT_CHANNEL_PRIVATE     = 4;
const int NWNXCHAT_CHANNEL_SERVER_MSG  = 5;
const int NWNXCHAT_CHANNEL_PARTY       = 6;

struct chat_message
{
    int    Mode;
    object Recipient;
    string Text;
};

string GetStringFrom(string s, int from = 1);
string GetStringFrom(string s, int from = 1)
{
    return GetStringRight(s, GetStringLength(s) - from);
}

void NWNXChat_Init();
void NWNXChat_Init()
{
    int i;
    object oMod = GetModule();
    // memory for chat text
    string sMemory;
    for (i = 0; i < 8; i++) // reserve 8*128 bytes
        sMemory += "................................................................................................................................";
    SetLocalString(oMod, "NWNX!CHAT!SPACER", sMemory);
}

string NWNXChat_GetSpacer();
string NWNXChat_GetSpacer()
{
    return GetLocalString(GetModule(), "NWNX!CHAT!SPACER");
}

void NWNXChat_PCEnter(object oPC);
void NWNXChat_PCEnter(object oPC)
{
  if (!GetIsObjectValid(oPC)) return;
  object oMod = GetModule();
  SetLocalString(oPC, "NWNX!CHAT!GETID", ObjectToString(oPC)+"        ");
  string sID = GetLocalString(oPC, "NWNX!CHAT!GETID");
  int nID = StringToInt(sID);
  if (nID != -1)
  {
    SetLocalObject(oMod, LIST_ITEM_NAME + sID, oPC);
    SetLocalInt(oPC, PC_ID_NAME, nID);
  }
  DeleteLocalString(oPC, "NWNX!CHAT!GETID");
}

void NWNXChat_PCExit(object oPC);
void NWNXChat_PCExit(object oPC)
{
  if (!GetIsObjectValid(oPC)) return;
  int nID = GetLocalInt(oPC, PC_ID_NAME);
  DeleteLocalInt(oPC, PC_ID_NAME);
  DeleteLocalObject(GetModule(), LIST_ITEM_NAME + IntToString(nID));
}

object NWNXChat_GetPCByPlayerID(int nID);
object NWNXChat_GetPCByPlayerID(int nID)
{
  return GetLocalObject(GetModule(), LIST_ITEM_NAME + IntToString(nID));
}

string NWNXChat_GetMessageText();
string NWNXChat_GetMessageText()
{
    SetLocalString(GetModule(), "NWNX!CHAT!TEXT", NWNXChat_GetSpacer());
    return GetLocalString(GetModule(), "NWNX!CHAT!TEXT");
}

struct chat_message NWNXChat_GetMessage();
struct chat_message NWNXChat_GetMessage()
{
    struct chat_message cmMessage;
    string sText = NWNXChat_GetMessageText();

    int nMode = StringToInt(GetStringLeft(sText,2));
    int nTo = StringToInt(GetSubString(sText,2,10));
    sText = GetStringFrom(sText, 12);
    cmMessage.Mode = nMode;
    cmMessage.Recipient = NWNXChat_GetPCByPlayerID(nTo);
    cmMessage.Text = sText;
    return cmMessage;
}

void NWNXChat_Log(string sLogMessage);
void NWNXChat_Log(string sLogMessage)
{
    SetLocalString(GetModule(), "NWNX!CHAT!LOG", sLogMessage);
}

void NWNXChat_SuppressMessage();
void NWNXChat_SuppressMessage()
{
    SetLocalString(GetModule(), "NWNX!CHAT!SUPRESS", "1");
    DeleteLocalString(GetModule(), "NWNX!CHAT!SUPRESS");
}

void NWNXChat_Reset(object oPC);
void NWNXChat_Reset(object oPC)
{
  DeleteLocalString(oPC, "NWNX!CHAT!TEXT");
  DeleteLocalString(oPC, "NWNX!CHAT!SUPRESS");
}

int NWNXChat_SendMessage(object oSender, int nChannel, string sMessage, object oRecipient=OBJECT_INVALID);
int NWNXChat_SendMessage(object oSender, int nChannel, string sMessage, object oRecipient=OBJECT_INVALID)
{
    if (!GetIsObjectValid(oSender)) return FALSE;
    if (FindSubString(sMessage, "¬")!=-1) return FALSE;
    if (nChannel == NWNXCHAT_CHANNEL_PRIVATE && !GetIsObjectValid(oRecipient)) return FALSE;
    SetLocalString(oSender, "NWNX!CHAT!SPEAK", ObjectToString(oSender)+"¬"+ObjectToString(oRecipient)+"¬"+IntToString(nChannel)+"¬"+sMessage);
    if(GetLocalString(oSender, "NWNX!CHAT!SPEAK")=="1") return TRUE;
    else return FALSE;
}

int NWNXChat_GetChannelTalkvolume(int NWNXChannel);
int NWNXChat_GetChannelTalkvolume(int NWNXChannel)
{
    int iChan;
    switch(NWNXChannel)
    {
        case NWNXCHAT_CHANNEL_PARTY:        iChan = TALKVOLUME_PARTY;break;
        case NWNXCHAT_CHANNEL_PRIVATE:      iChan = TALKVOLUME_TELL;break;
        case NWNXCHAT_CHANNEL_SERVER_MSG:   iChan = TALKVOLUME_SILENT_SHOUT;break;
        case NWNXCHAT_CHANNEL_SHOUT:        iChan = TALKVOLUME_SHOUT;break;
        case NWNXCHAT_CHANNEL_TALK:         iChan = TALKVOLUME_TALK;break;
        case NWNXCHAT_CHANNEL_WHISPER:      iChan = TALKVOLUME_WHISPER;break;
    }

    return iChan;
}

string NWNXChat_GetMsgText(string sNWNXChatMessageText);
string NWNXChat_GetMsgText(string sNWNXChatMessageText)
{
    return GetStringFrom(sNWNXChatMessageText, 12);
}

object NWNXChat_GetMsgTarget(string sNWNXChatMessageText);
object NWNXChat_GetMsgTarget(string sNWNXChatMessageText)
{
    return NWNXChat_GetPCByPlayerID(StringToInt(GetSubString(sNWNXChatMessageText,2,10)));
}

int NWNXChat_GetMsgChannel(string sNWNXChatMessageText);
int NWNXChat_GetMsgChannel(string sNWNXChatMessageText)
{
    return StringToInt(GetStringLeft(sNWNXChatMessageText, 2));
}

// oPC ignores oIgnore?
int NWNXChat_GetIgnorePC(object oPC, object oIgnore);
int NWNXChat_GetIgnorePC(object oPC, object oIgnore)
{
    return GetLocalInt(GetModule(), GetPCPlayerName(oPC)+"_ignore_"+GetPCPlayerName(oIgnore));
}

// oPC ignores oIgnore
void NWNXChat_SetIgnorePC(object oPC, object oIgnore, int bIgnore);
void NWNXChat_SetIgnorePC(object oPC, object oIgnore, int bIgnore)
{
    SetLocalInt(GetModule(), GetPCPlayerName(oPC)+"_ignore_"+GetPCPlayerName(oIgnore), bIgnore);
}

void NWNXChat_SetPCSupressChannelMode(object oPC, int iChannel, int bSupress);
void NWNXChat_SetPCSupressChannelMode(object oPC, int iChannel, int bSupress)
{
    if(!GetIsObjectValid(oPC) || !GetIsPC(oPC) || iChannel > 6 || iChannel < 0)return;

    SetLocalInt(GetModule(), GetPCPlayerName(oPC)+"_supress_channel_"+IntToString(iChannel), bSupress);
}

int NWNXChat_GetIsPCChannelSupressed(object oPC, int iChannel);
int NWNXChat_GetIsPCChannelSupressed(object oPC, int iChannel)
{
    if(!GetIsObjectValid(oPC) || !GetIsPC(oPC) || iChannel > 6 || iChannel < 0)return FALSE;

    return GetLocalInt(GetModule(), GetPCPlayerName(oPC)+"_supress_channel_"+IntToString(iChannel));
}
