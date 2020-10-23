#include "inc_d20"
// Bonus skill area system for D20 Modern.
void main()
{
    object oPC = GetEnteringObject();
    string sSkill = GetLocalString(OBJECT_SELF, "SKILL");
    int nSkill = SKILL_RESEARCH;
    int nBonus = GetLocalInt(OBJECT_SELF, "BONUS");
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
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectSkillIncrease(nSkill, nBonus), oPC);
}
