int StartingConditional()
{
object oPC = GetPCSpeaker();

if(GetItemPossessedBy(oPC, "ct_heavypackywhistle") == OBJECT_INVALID)
	return TRUE;
else
	return FALSE;
}