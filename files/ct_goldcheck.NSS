int StartingConditional(int iAmt)
{
object oPC = GetPCSpeaker();

if(GetGold(oPC) >= iAmt)
	return TRUE;
else
	return FALSE;
}