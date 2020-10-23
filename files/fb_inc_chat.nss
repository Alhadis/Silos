/*
Fireboar's Chat library

Contains functions for using the NWNX-Chat plugin for NWNX2. Functions
should be used primarily within the chat script, but fbCHInit(); should
be called from OnModuleLoad, fbCHEnter(GetEnteringObject()); from
OnClientEnter and fbCHLeave(GetExitingObject()); from OnClientLeave.
*/

const string FB_CH_LIST_ITEM_NAME = "FB_CH_PC_";
const string FB_CH_PC_ID_NAME = "FB_CH_ID";

// Player channels
const int CHAT_CHANNEL_TALK           =  1;
const int CHAT_CHANNEL_SHOUT          =  2;
const int CHAT_CHANNEL_WHISPER        =  3;
const int CHAT_CHANNEL_PRIVATE        =  4;
const int CHAT_CHANNEL_SERVER_MSG     =  5;
const int CHAT_CHANNEL_PARTY          =  6;
const int CHAT_CHANNEL_DM             = 14;

// DM Channels
const int CHAT_CHANNEL_DM_TALK        = 17;
const int CHAT_CHANNEL_DM_SHOUT       = 18;
const int CHAT_CHANNEL_DM_WHISPER     = 19;
const int CHAT_CHANNEL_DM_PRIVATE     = 20;
const int CHAT_CHANNEL_DM_SERVER_MSG  = 21;
const int CHAT_CHANNEL_DM_PARTY       = 22;
const int CHAT_CHANNEL_DM_DM          = 30;


// Called once OnModuleLoad to initialize all chat functions globally.
void fbCHInit();
// Called once OnClientEnter to initialize all chat functions.
void fbCHEnter(object oPC);
// Called once OnClientLeave to terminate all chat functions.
void fbCHLeave(object oPC);
// A more powerful variant of SpeakString, this causes oSpeaker to speak sMessage
// in nChannel. nChannel must be one of the CHAT_CHANNEL_* constants. If using
// one of the _PRIVATE constants, oRecipient must be specified or it will fail.
//
// NOTE: sMessage must NOT contain the symbol ¬.
void fbCHSpeakString(object oSpeaker, string sMessage, int nChannel = CHAT_CHANNEL_TALK, object oRecipient = OBJECT_INVALID);
// Suppresses text spoken
void fbCHSuppress();

// Retrieves the raw chat data to be processed
string fbCHGetRawString(object oSpeaker = OBJECT_SELF);
// Returns the channel that sString is being spoken on
int fbCHGetChannel(string sString);
// Returns the target of a tell, if any
object fbCHGetTellTarget(string sString);

// Returns all of sString starting from the point nFrom. (First character is 0.)
string fbCHGetStringFrom(string sString, int nFrom = 1);
// Set the module string NWNX!CHAT!TEXT to this value to reserve memory ready
// to receive the text.
string fbCHGetSpacer();

// Returns the ID of oPC
int fbCHGetClientID(object oPC);
// Returns the PC defined by nID
object fbCHGetPC(int nID);

void fbCHInit()
{
    int i;
    object oMod = GetModule();
    // memory for chat text
    string sMemory;
    for (i = 0; i < 8; i++) // reserve 8*128 bytes
        sMemory += "................................................................................................................................";
    SetLocalString(oMod, "NWNX!INIT", "1");
    SetLocalString(oMod, "NWNX!CHAT!SPACER", sMemory);
}

string fbCHGetStringFrom(string sString, int nFrom = 1)
{
    return GetStringRight(sString, GetStringLength(sString) - nFrom);
}

string fbCHGetSpacer()
{
    return GetLocalString(GetModule(), "NWNX!CHAT!SPACER");
}

void fbCHEnter(object oPC)
{
    if (!GetIsObjectValid(oPC)) return;
    object oMod = GetModule();
    SetLocalString(oPC, "NWNX!CHAT!GETID", ObjectToString(oPC)+"        ");
    string sID = GetLocalString(oPC, "NWNX!CHAT!GETID");
    int nID = StringToInt(sID);
    if (nID != -1)
    {
        SetLocalObject(oMod, FB_CH_LIST_ITEM_NAME + sID, oPC);
        SetLocalInt(oPC, FB_CH_PC_ID_NAME, nID);
    }
    DeleteLocalString(oPC, "NWNX!CHAT!GETID");
}

int fbCHGetClientID(object oPC)
{
    if (!GetIsObjectValid(oPC)) return -1;
    if (!GetIsPC(oPC) && !GetIsPossessedFamiliar(oPC) && !GetIsDM(oPC) && !GetIsDMPossessed(oPC)) return -1;
    SetLocalString(oPC, "NWNX!CHAT!GETID", ObjectToString(oPC)+"        ");
    string sID = GetLocalString(oPC, "NWNX!CHAT!GETID");
    int nID = StringToInt(sID);
    return nID;
}

void fbCHSpeakString(object oSpeaker, string sMessage, int nChannel = CHAT_CHANNEL_TALK, object oRecipient = OBJECT_INVALID)
{
    if (!GetIsObjectValid(oSpeaker)) return;
    if (FindSubString(sMessage, "¬") != -1) return;
    if (!GetIsObjectValid(oRecipient))
    {
        if (nChannel == CHAT_CHANNEL_PRIVATE || nChannel == CHAT_CHANNEL_DM_PRIVATE) return;
        else oRecipient = oSpeaker;
    }
    SetLocalString(oSpeaker, "NWNX!CHAT!SPEAK", ObjectToString(oSpeaker)+"¬"+ObjectToString(oRecipient)+"¬"+IntToString(nChannel)+"¬"+sMessage);
    DeleteLocalString(oSpeaker, "NWNX!CHAT!SPEAK"); // Cleanup
}

void fbCHSuppress()
{
    SetLocalString(OBJECT_SELF, "NWNX!CHAT!SUPRESS", "1");
    DeleteLocalString(OBJECT_SELF, "NWNX!CHAT!SUPRESS");
}

string fbCHGetRawString(object oSpeaker = OBJECT_SELF)
{
    SetLocalString(oSpeaker, "NWNX!CHAT!TEXT", fbCHGetSpacer());
    string sString = GetLocalString(oSpeaker, "NWNX!CHAT!TEXT");
    DeleteLocalString(oSpeaker, "NWNX!CHAT!TEXT");
    return sString;
}

int fbCHGetChannel(string sString)
{
    return StringToInt(GetStringLeft(sString, 2));
}

object fbCHGetTellTarget(string sString)
{
    return fbCHGetPC(StringToInt(GetSubString(sString, 2, 10)));
}

void fbCHLeave(object oPC)
{
    if (!GetIsObjectValid(oPC)) return;
    int nID = GetLocalInt(oPC, FB_CH_PC_ID_NAME);
    DeleteLocalInt(oPC, FB_CH_PC_ID_NAME);
    DeleteLocalObject(GetModule(), FB_CH_LIST_ITEM_NAME + IntToString(nID));
}

object fbCHGetPC(int nID)
{
    return GetLocalObject(GetModule(), FB_CH_LIST_ITEM_NAME + IntToString(nID));
}
