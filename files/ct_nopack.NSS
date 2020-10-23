int StartingConditional()
{
object oPC = GetPCSpeaker();

if(GetItemPossessedBy(oPC, "ct_packwhistle") == OBJECT_INVALID)
	return TRUE;
else
	return FALSE;
}