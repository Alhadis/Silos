int StartingConditional()
{
object oPC = GetPCSpeaker();
int iChk = GetGold(oPC);

if(iChk >= 500)
	return TRUE;
else
	return FALSE;
}