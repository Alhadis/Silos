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


string sRaws=GetLocalString(oTarget, "pt_CRAFT_RAW");
string sRawsCost=GetLocalString(oTarget, "pt_CRAFT_RAW_COST");

int i, iCurI;
int iLen=pArrayLength(sRaws);
for(i=0; i<iLen; i++)
    {
    string sTempStr=pArray(sRaws, i);
    if(sTempStr==sItemRawTag)  {sRaws=pArray(sRaws, i, ""); iCurI=i; break;};
    };
SetCustomToken(pt_CUSTTOK_NODE_CURRENT_ITEM_VALUE, "");
sRawsCost=pArray(sRawsCost, iCurI, "");

/////////////////////////////////////
sRaws=StringReplace(sRaws, ",,", "");
sRawsCost=StringReplace(sRawsCost, ",,", "");

if(GetStringLeft(sRaws, 1)==",") sRaws=GetStringRight(sRaws, GetStringLength(sRaws)-1);
if(GetStringLeft(sRawsCost, 1)==",") sRawsCost=GetStringRight(sRawsCost, GetStringLength(sRawsCost)-1);
if(GetStringRight(sRaws, 1)==",") sRaws=GetStringLeft(sRaws, GetStringLength(sRaws)-1);
if(GetStringRight(sRawsCost, 1)==",") sRawsCost=GetStringLeft(sRawsCost, GetStringLength(sRawsCost)-1);


SetLocalString(oTarget, "pt_CRAFT_RAW", sRaws);
SetLocalString(oTarget, "pt_CRAFT_RAW_COST", sRawsCost);

DeleteLocalString(oActivator, "pt_craft_dialNodeArray"+sItemInd+"_ItemName");
DeleteLocalString(oActivator, "pt_craft_dialNodeArray"+sItemInd+"_ItemRawTag");
//DeleteLocalString(oActivator, "pt_craft_dialNodeArray"+sItemInd+"_ItemToolTag");
//DeleteLocalString(oActivator, "pt_craft_dialNodeArray"+sItemInd+"_ItemSkillId");
}
