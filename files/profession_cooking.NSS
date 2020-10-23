#include "profession_include"

void main(string sINPUT, string sOUTPUT, int nMULT, int nREQ, int nXP, int nSTOP)
{
	object oPC = GetPCSpeaker();
	SetLocalString(oPC, "INPUT_TAG_A", sINPUT);
	SetLocalString(oPC, "OUTPUT_TAG", sOUTPUT);
	SetLocalInt(oPC, "INPUT_QTY_A", 1);
	SetLocalInt(oPC, "OUTPUT_MULT", nMULT);
	SetLocalInt(oPC, "OUTPUT_REQ", nREQ);
	SetLocalInt(oPC, "OUTPUT_STOP", nSTOP);
	SetLocalInt(oPC, "OUTPUT_XP", nXP);
	SetLocalInt(oPC, "PROF_SKILL", SKILL_COOKING);
	object oFIRE = GetNearestObjectByTag("bonfire");
	BeginProfessionLoop(oPC, oFIRE, "Cooking", "cooking02");
}