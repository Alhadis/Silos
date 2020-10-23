#include "nwnx_chat"
void main()
{
    object oPC = GetEnteringObject();

    if(GetIsPC(oPC))
    {
        SetCommandable(FALSE, oPC);
        NWNXChat_SetPCSupressChannelMode(oPC, TALKVOLUME_SHOUT, TRUE);
    }
}
