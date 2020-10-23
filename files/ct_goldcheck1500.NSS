int StartingConditional()
{
object oPC = GetPCSpeaker();
int iChk = GetGold(oPC);

if(iChk >= 1500)
	return TRUE;
else
	return FALSE;
}