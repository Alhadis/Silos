/*
    Perform a skill check, send a message and execute a script of the same
    name as the tag of the trigger on entering a trigger
*/

void main()
{
    object oPC = GetEnteringObject();

    //check if the PC had the message before
    if(GetLocalInt(OBJECT_SELF,GetName(oPC))==1)
    return;

    int nDC = GetLocalInt(OBJECT_SELF,"DC");
    int nSkill = GetLocalInt(OBJECT_SELF,"Skill");
    string sScript = GetTag(OBJECT_SELF);

    //set the skill
    switch(nSkill)
    {
        case 1: nSkill = SKILL_LISTEN; break;
        case 2: nSkill = SKILL_SEARCH; break;
        case 3: nSkill = SKILL_SPOT; break;
        case 4: nSkill = SKILL_LORE; break;
        default: nSkill = 0;
    }
    //check a valid skill was set and get on with it if so
    if (nSkill!=0)
    {
        nSkill = GetSkillRank(nSkill,oPC);
        //do the roll and deliver any message
        if(d20() + nSkill >= nDC)
        {
            FloatingTextStringOnCreature(GetLocalString(OBJECT_SELF,"Message"),oPC,FALSE);
            //stop repeated messages
            SetLocalInt(OBJECT_SELF,GetName(oPC),1);
            //execute script associated with the check
            ExecuteScript(sScript,oPC);
        }
    }
}
