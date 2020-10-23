int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetSubRace(oPC) != RACIAL_SUBTYPE_FIRE_GENASI) return FALSE;

return TRUE;
}
