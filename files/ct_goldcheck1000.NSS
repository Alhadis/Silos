int StartingConditional()
{
object oPC = GetPCSpeaker();
int iChk = GetGold(oPC);

if(iChk >= 1000)
	return TRUE;
else
	return FALSE;
}