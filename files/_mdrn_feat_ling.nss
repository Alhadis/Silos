// Linguist

#include "inc_d20"
void main()
{
    object oPC = OBJECT_SELF;
    int nSpoken = d20()+GetAbilityModifier(ABILITY_INTELLIGENCE, oPC)+GetLevelByClass(CLASS_TYPE_SMART, oPC);
    int nWritten = d20()+GetSkillRank(SKILL_DECIPHER_SCRIPT, oPC);
    string sResult = "Result for spoken languages: "+IntToString(nSpoken)+"; result for written languages: "+IntToString(nWritten);
     SendMessageToPC(oPC, sResult);
    SendMessageToAllDMs(GetName(oPC)+" uses the Linguist feat. "+sResult);

}
