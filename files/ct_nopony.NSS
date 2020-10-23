int StartingConditional()
{
object oPC = GetPCSpeaker();

if(GetItemPossessedBy(oPC, "ct_ponywhistle") == OBJECT_INVALID)
	return TRUE;
else
	return FALSE;
}