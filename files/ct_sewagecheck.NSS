#include "ct_includes"

int StartingConditional()
{
object oPC = GetPCSpeaker();
int iChk = HasXofX(oPC, "ct_sewoozerem");

if(iChk > 0)
	return TRUE;
else
	return FALSE;
}