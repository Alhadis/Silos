#include "ct_includes"

void main()
{
object oPC = GetPCSpeaker();
int iRew = HasXofX(oPC, "ct_sewoozerem");
int iGive = iRew * 10;

DestroyXofX(oPC, "ct_sewoozerem", iRew);
GiveGoldToCreature(oPC, iGive);
}