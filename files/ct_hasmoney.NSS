int StartingConditional(int iAmount)
{
object oPC = GetPCSpeaker();
int iChk = GetGold(oPC);

if(iChk >= iAmount)
	return TRUE;
else
	return FALSE;
}