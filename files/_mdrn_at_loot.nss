// Main handler for unlocking doors from conversation menu.

#include "inc_d20"

void main()
{
    object oPC = GetPCSpeaker();
    object oLock = GetLocalObject(oPC, "oMdrnTarget");
    SetLootable(oLock, TRUE);
}
