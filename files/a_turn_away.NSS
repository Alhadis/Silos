//by fkirenicus from BioBoards
void main()
{
	object oPC = GetPCSpeaker();
	object oTurner = OBJECT_SELF;
	float fPC = GetFacing(oPC);
	float fLookAway = 180.0f;
	
	SetFacing(fPC + fLookAway);
}
