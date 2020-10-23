#include "inc_d20"
// Item identification system for D20 Modern.
void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetLocalObject(oPC, "oMdrnTarget");
    int nDC = GetLocalInt(oItem, "IDDC");
    int nSkill = SKILL_KNOWLEDGE_TECHNOLOGY;
    string sSkill = GetLocalString(oItem, "IDSKILL");
    if (GetLocalInt(oPC, "nMdrnID"+GetResRef(oItem))==1)
    {
        SendMessageToPC(oPC, "You must wait ten minutes between identification attempts.");
        return;

    }
    if (sSkill == "Research")
       nSkill = SKILL_RESEARCH;
    if (sSkill == "Decipher Script")
       nSkill = SKILL_DECIPHER_SCRIPT;
    if (sSkill == "Computer Use")
       nSkill = SKILL_COMPUTER_USE;
    if (sSkill == "Gather Information")
       nSkill = SKILL_GATHER_INFORMATION;
    if (sSkill == "Investigate")
       nSkill = SKILL_INVESTIGATE;
    if (sSkill == "Arcane Lore")
       nSkill = SKILL_KNOWLEDGE_ARCANE_LORE;
    if (sSkill == "Art")
       nSkill = SKILL_KNOWLEDGE_ART;
    if (sSkill == "Behavioral Sciences")
       nSkill = SKILL_KNOWLEDGE_BEHAVIORAL;
    if (sSkill == "Business")
       nSkill = SKILL_KNOWLEDGE_BUSINESS;
    if (sSkill == "Civics")
        nSkill = SKILL_KNOWLEDGE_CIVICS;
    if (sSkill == "Current Events")
       nSkill = SKILL_KNOWLEDGE_CURRENT;
    if (sSkill == "Earth And Life Sciences")
       nSkill = SKILL_KNOWLEDGE_EARTH_SCIENCES;
    if (sSkill == "History")
       nSkill = SKILL_KNOWLEDGE_HISTORY;
    if (sSkill == "Physcial Sciences")
       nSkill = SKILL_KNOWLEDGE_PHYSICAL_SCIENCES;
    if (sSkill == "Popular Culture")
       nSkill = SKILL_KNOWLEDGE_POPULAR;
    if (sSkill == "Business")
       nSkill = SKILL_KNOWLEDGE_STREETWISE;
    if (sSkill == "Tactics")
       nSkill = SKILL_KNOWLEDGE_TACTICS;
    if (sSkill == "Technology")
       nSkill = SKILL_KNOWLEDGE_TECHNOLOGY;
    if (sSkill == "Theology")
       nSkill = SKILL_KNOWLEDGE_THEOLOGY;
    if (nDC == 0)
        nDC = FloatToInt(2.6*log(1.0*GetGoldPieceValue(oItem))-5.3);
    if (nDC < 5)
        nDC = 5;
    int nRoll = d20();
    nSkill = GetSkillRank(nSkill, oPC);
    int nResult = nRoll + nSkill;
    if (sSkill == "")
    {
        int nType = GetBaseItemType(oItem);
        if (nType == BASE_ITEM_BOOK || nType == BASE_ITEM_SCROLL)
        {
            sSkill = "Decipher Script";
            nSkill = SKILL_DECIPHER_SCRIPT;
        }
        else if (nType == BASE_ITEM_POTIONS)
        {
            sSkill = "Earth And Life Sciences";
            nSkill = SKILL_KNOWLEDGE_EARTH_SCIENCES;

        }
        else if (nType == BASE_ITEM_GRENADE)
        {
            sSkill = "Physical Sciences";
            nSkill = SKILL_KNOWLEDGE_PHYSICAL_SCIENCES;

        }
        else
            sSkill = "Technology";


    }
    if (sSkill == "Research" || sSkill == "Decipher Script" || sSkill == "Computer Use" || sSkill == "Gather Information" || sSkill == "Investigate")
        SendMessageToPC(oPC, "Skill roll for "+sSkill+": "+IntToString(nRoll)+"+"+IntToString(nSkill)+"="+IntToString(nResult)+" vs. DC: "+IntToString(nDC));
    else
        SendMessageToPC(oPC, "Skill roll for Knowledge ("+sSkill+"): "+IntToString(nRoll)+"+"+IntToString(nSkill)+"="+IntToString(nResult)+" vs. DC: "+IntToString(nDC));
    if (nResult + 1 > nDC)
   {
        SetIdentified(oItem, TRUE);
        SendMessageToPC(oPC, "Success.");
    }
    else
    {
        SendMessageToPC(oPC, "Failure.  Must wait ten minutes before attempting again.");
        SetLocalInt(oPC, "nMdrnID"+GetResRef(oItem), 1);
        DelayCommand(600.0, SetLocalInt(oPC, "nMdrnID"+GetResRef(oItem), 0));
    }
}
