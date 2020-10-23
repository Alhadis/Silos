#include "nwnx_chat"
void main()
{
    object oPC = GetEnteringObject();

    if(GetIsPC(oPC))
    {
        SetCommandable(TRUE, oPC);
        NWNXChat_SetPCSupressChannelMode(oPC, TALKVOLUME_SHOUT, FALSE);
    }
}
