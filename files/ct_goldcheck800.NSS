int StartingConditional()
{
object oPC = GetPCSpeaker();
int iChk = GetGold(oPC);

if(iChk >= 800)
	return TRUE;
else
	return FALSE;
}