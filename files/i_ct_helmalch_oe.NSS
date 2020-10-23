void main()
{
object oPC = OBJECT_SELF;
int iGE = GetAlignmentGoodEvil(oPC);
int iLC = GetAlignmentLawChaos(oPC);
int iGEC;
int iLCC;
int iRand = 0;
int iUsed = GetLocalInt(GetPCItemLastEquipped(), "used");

if(iUsed == 0)
{
if(iGE == 5)
	AdjustAlignment(oPC, ALIGNMENT_GOOD, 100);
else if (iGE == 4)
	AdjustAlignment(oPC, ALIGNMENT_EVIL, 100);
if(iLC == 3)
	AdjustAlignment(oPC, ALIGNMENT_LAWFUL, 100);
else if (iLC == 2)
	AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 100);
if(iGE == ALIGNMENT_NEUTRAL && iLC == ALIGNMENT_NEUTRAL)
	iRand = d4();

else if(iRand == 1)
	{
		AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 100);
		AdjustAlignment(oPC, ALIGNMENT_EVIL, 100);
	}
else if(iRand == 2)
	{
		AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 100);
		AdjustAlignment(oPC, ALIGNMENT_GOOD, 100);
	}
else if(iRand == 3)
	{
		AdjustAlignment(oPC, ALIGNMENT_LAWFUL, 100);
		AdjustAlignment(oPC, ALIGNMENT_EVIL, 100);
	}
else if(iRand == 4)
	{
		AdjustAlignment(oPC, ALIGNMENT_LAWFUL, 100);
		AdjustAlignment(oPC, ALIGNMENT_GOOD, 100);
	}
ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_10), oPC);
AssignCommand(oPC, ActionSpeakString("Puts on the helmet, which briefly seems to absorb the light around as it is equipped, creating a small black cloud which quickly fades as if it never happened."));
SetLocalInt(GetPCItemLastEquipped(), "used", 1);
}
}