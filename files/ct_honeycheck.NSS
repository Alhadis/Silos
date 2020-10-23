#include "ct_includes"

int StartingConditional()
{
object oPC = GetPCSpeaker();
int iHoney = HasXofX(oPC, "ct_honeybottle");

SetLocalInt(oPC, "honeyreward", (iHoney / 2));

if(iHoney >=2)
	{
		SetLocalInt(oPC, "honeytake", iHoney);
		return TRUE;
	}
else
	return FALSE;
}