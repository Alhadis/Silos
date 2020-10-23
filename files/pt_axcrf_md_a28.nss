#include "pt_axcrf_md_cons"
#include "pt_frame000"

#include "x3_inc_string"


void main()
{
object oModule=GetModule();
object oActivator=GetPCSpeaker();
object oTarget=GetLocalObject(oActivator, "pt_craft_dialToolIsRawCreateTarget");

int iSelectedIndex=GetLocalInt(oActivator, "pt_craft_dialSelectedItem");
string sItemInd=IntToString(iSelectedIndex);

string sItemRawTag=GetLocalString(oActivator, "pt_craft_dialNodeArray"+sItemInd+"_ItemRawTag");
string sItemToolTag=GetLocalString(oActivator, "pt_craft_dialNodeArray"+sItemInd+"_ItemToolTag");
string sItemSkillId=GetLocalString(oActivator, "pt_craft_dialNodeArray"+sItemInd+"_ItemSkillId");


string sSkills=GetLocalString(oTarget, "pt_CRAFT_SKILL_ID");
string sSkillsVal=GetLocalString(oTarget, "pt_CRAFT_SKILL_VALUE");

int i, iCurI;
int iLen=pArrayLength(sSkills);
for(i=0; i<iLen; i++)
    {
    string sTempStr=pArray(sSkills, i);
    if(sTempStr==sItemSkillId)  {sSkills=pArray(sSkills, i, ""); iCurI=i; break;};
    };
SetCustomToken(pt_CUSTTOK_NODE_CURRENT_ITEM_VALUE, "");
sSkillsVal=pArray(sSkillsVal, iCurI, "");

/////////////////////////////////////
sSkills=StringReplace(sSkills, ",,", "");
sSkillsVal=StringReplace(sSkillsVal, ",,", "");

if(GetStringLeft(sSkills, 1)==",") sSkills=GetStringRight(sSkills, GetStringLength(sSkills)-1);
if(GetStringLeft(sSkillsVal, 1)==",") sSkillsVal=GetStringRight(sSkillsVal, GetStringLength(sSkillsVal)-1);
if(GetStringRight(sSkills, 1)==",") sSkills=GetStringLeft(sSkills, GetStringLength(sSkills)-1);
if(GetStringRight(sSkillsVal, 1)==",") sSkillsVal=GetStringLeft(sSkillsVal, GetStringLength(sSkillsVal)-1);

SetLocalString(oTarget, "pt_CRAFT_SKILL_ID", sSkills);
SetLocalString(oTarget, "pt_CRAFT_SKILL_VALUE", sSkillsVal);

DeleteLocalString(oActivator, "pt_craft_dialNodeArray"+sItemInd+"_ItemName");
//DeleteLocalString(oActivator, "pt_craft_dialNodeArray"+sItemInd+"_ItemRawTag");
//DeleteLocalString(oActivator, "pt_craft_dialNodeArray"+sItemInd+"_ItemToolTag");
DeleteLocalString(oActivator, "pt_craft_dialNodeArray"+sItemInd+"_ItemSkillId");
}

