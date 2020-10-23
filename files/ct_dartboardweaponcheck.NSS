int StartingConditional(int feat1, int feat2, int feat3)
{
object oPC = GetPCSpeaker();

if(GetHasFeat(feat1, oPC) == TRUE)
	return TRUE;
else if (feat2 != 0 && GetHasFeat(feat2, oPC) == TRUE)
	return TRUE;
else if (feat2 != 3 && GetHasFeat(feat3, oPC) == TRUE)
	return TRUE;
else
	return FALSE;
}