int StartingConditional()
{
object oPC = GetPCSpeaker();
int iChk = GetGold(oPC);

if(iChk >= 400)
	return TRUE;
else
	return FALSE;
}