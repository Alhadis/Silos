#include "profession_include"

//Used for producing items related to professions via conversation.
//sOUTPUT = the tag of the item that should be made.
//nMULT = the amount of production loops that should be made (generally 1, 5 or 200)
//nSKILL = the row ID of the skill.2da to which this product is related (for example SKILL_CRAFTING = 37)
//nXP = The amount of crafting XP received on successful crafting per item
//sTAG_A = the tag of the required first input
//nQTY_A = the amount of INPUT A required to make one OUTPUT.
//sTAG_B = the tag of the required second input. By default this is an empty string (which means there's no second input required).
//nQTY_B = the amount of INPUT B required to make one OUTPUT. By default this is zero.
//nFAIL = The % chance that a recipe might succeed, between 0 (guaranteed failure) and 100 (guaranteed success).
//sFAIL = The tag of the item obtained on failure. By default this is an empty string (nothing).
//nQTY_O = The amount of OUTPUT items produced per loop. If it's lower than 1, it will count as 1.

void main(string sOUTPUT, int nMULT, int nSKILL, int nXP, string sTAG_A, int nQTY_A, string sTAG_B = "", int nQTY_B = 0, int nFAIL = 100, string sFAIL = "", int nQTY_O = 1)
{
	object oPC = GetPCSpeaker();
	object oPOOL = OBJECT_SELF;
	string sANIM = "craft01";
	string sSOUND;
	switch (nSKILL)
	{
		case SKILL_CRAFTING: sSOUND = "Crafting"; sANIM = "craft01"; break;
		case SKILL_SMITHING: sSOUND = "Smithing"; sANIM = "forge01"; break;
		case SKILL_RUNECRAFTING: sSOUND = "Runecrafting"; sANIM = "worship "; break;
		case SKILL_CONSTRUCTION: sSOUND = "Construction"; sANIM = "forge02"; break;
		case SKILL_COOKING: sSOUND = "Cooking"; sANIM = "cooking01"; break;
		case SKILL_FLETCHING: sSOUND = "Fletching"; sANIM = "craft01"; break;
		case SKILL_PRAYER: sSOUND = "Prayer"; sANIM = "worship"; break;
		case SKILL_HERBLORE: sSOUND = "Herblore"; sANIM = "cooking01"; break;
	}
	if (GetTag(oPOOL) == "furnace") sANIM = "forge02";
	SetLocalInt(oPC, "PROF_SKILL", nSKILL);
	SetLocalString(oPC, "INPUT_TAG_A", sTAG_A);
	SetLocalString(oPC, "INPUT_TAG_B", sTAG_B);
	SetLocalString(oPC, "OUTPUT_TAG", sOUTPUT);
	SetLocalString(oPC, "FAIL_TAG", sFAIL);
	SetLocalInt(oPC, "INPUT_QTY_A", nQTY_A);
	SetLocalInt(oPC, "INPUT_QTY_B", nQTY_B);
	SetLocalInt(oPC, "SUCCESS_CHANCE", nFAIL);
	SetLocalInt(oPC, "OUTPUT_XP", nXP);
	SetLocalInt(oPC, "OUTPUT_MULT", nMULT);
	SetLocalInt(oPC, "OUTPUT_QTY", nQTY_O);
	BeginProfessionLoop(oPC, oPOOL, sSOUND, sANIM);
}