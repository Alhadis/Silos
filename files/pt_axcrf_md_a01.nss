//Скрипт действия начального диалога


#include "x3_inc_string"

#include "pt_frame000"

#include "pt_axcrf_md_cons"
#include "pt_axcrf_oveskin"
#include "pt_axcrf_include"


void main()
{
object oModule=GetModule();
object oActivator=GetPCSpeaker();

SetCustomToken(pt_CUSTTOK_NODE_CURRENT_ITEM_RAW, "");


//Индекс итема который используется в заданных ветках диалога
SetLocalInt(oActivator, "pt_craft_dialTok"+IntToString(pt_CUSTTOK_NODE_ONE)+"_Index", -1);
SetLocalInt(oActivator, "pt_craft_dialTok"+IntToString(pt_CUSTTOK_NODE_TWO)+"_Index", -1);
SetLocalInt(oActivator, "pt_craft_dialTok"+IntToString(pt_CUSTTOK_NODE_THREE)+"_Index", -1);
SetLocalInt(oActivator, "pt_craft_dialTok"+IntToString(pt_CUSTTOK_NODE_FOUR)+"_Index", -1);
SetLocalInt(oActivator, "pt_craft_dialTok"+IntToString(pt_CUSTTOK_NODE_FIVE)+"_Index", -1);



int iMinI=0;
int iMaxI=GetLocalInt(oActivator, "pt_craft_dialNodeArray_Length")-1;

int iDialogCurMinI=GetLocalInt(oActivator, "pt_craft_dialMinI");
int iDialogCurMaxI=GetLocalInt(oActivator, "pt_craft_dialMaxI");


if(iDialogCurMaxI<=4)
    {
    iDialogCurMinI=0; iDialogCurMaxI=4;
    SetLocalInt(oActivator, "pt_craft_dialMinI", iDialogCurMinI);
    SetLocalInt(oActivator, "pt_craft_dialMaxI", iDialogCurMaxI);
    };


int iPageQuantity=(iMaxI)/5+1;
int iCurPage=StringToInt(StringParse(FloatToString((IntToFloat(iDialogCurMaxI))/5.0, 2, 2), "."))+1;
SetCustomToken(pt_CUSTTOK_PAGE, "Страница "+IntToString(iCurPage)+" из "+IntToString(iPageQuantity));



////
int iRawCreRawMode=GetLocalInt(oActivator, "pt_craft_dialToolIsRawSeeRawSp");
int iRawCreToolMode=GetLocalInt(oActivator, "pt_craft_dialToolIsRawSeeToolSp");
int iRawCreSkillMode=GetLocalInt(oActivator, "pt_craft_dialToolIsRawSeeSkillSp");
////
int iTokI=pt_CUSTTOK_NODE_ONE;
int i;
for(i=iDialogCurMinI; i<=iDialogCurMaxI; i++)
    {
    string sI=IntToString(i);
    string sItem=GetLocalString(oActivator, "pt_craft_dialNodeArray"+sI+"_ItemName");
    string sItemRawTag=GetLocalString(oActivator, "pt_craft_dialNodeArray"+sI+"_ItemRawTag");
    string sItemToolTag=GetLocalString(oActivator, "pt_craft_dialNodeArray"+sI+"_ItemToolTag");
    string sItemSkillId=GetLocalString(oActivator, "pt_craft_dialNodeArray"+sI+"_ItemSkillId");

    SetCustomToken(iTokI, sItem);
    if((sItem!="") || (sItemRawTag!="" && iRawCreRawMode) || (sItemToolTag!="" && iRawCreToolMode) || (sItemSkillId!="" && iRawCreSkillMode))
        {
        SetLocalInt(oActivator, "pt_craft_dialTok"+IntToString(iTokI)+"_Index", i);

        if(iRawCreRawMode) SetLocalString(oActivator, "pt_craft_dialNodeArray"+sI+"_ItemName", pTagDictGetWord(sItemRawTag));
        if(iRawCreToolMode) SetLocalString(oActivator, "pt_craft_dialNodeArray"+sI+"_ItemName", pTagDictGetWord(sItemToolTag));
        if(iRawCreSkillMode) SetLocalString(oActivator, "pt_craft_dialNodeArray"+sI+"_ItemName", pTagDictGetWord(sItemSkillId));
        }
        else
        {
        SetLocalInt(oActivator, "pt_craft_dialTok"+IntToString(iTokI)+"_Index", -1);
        };

    if(iTokI==pt_CUSTTOK_NODE_FIVE) break;
    iTokI++;
    };





///
string sRawsWithCost="";
int k;
if(iRawCreRawMode)
    {
    object oTarget=GetLocalObject(oActivator, "pt_craft_dialToolIsRawCreateTarget");
    string sRaws=GetLocalString(oTarget, "pt_CRAFT_RAW");
    string sRawsCost=GetLocalString(oTarget, "pt_CRAFT_RAW_COST");

        if(sRaws!="")
            {
            sRawsWithCost=="\nНеобходимые материалы: ";
            int iRawLen=pArrayLength(sRaws);
            int iRawCostLen=pArrayLength(sRawsCost);
            for(i=0; i<iRawLen; i++)
                {
                    int iValI=(i<=(iRawCostLen-1)?i:iRawCostLen-1);

                    string sTag=pArray(sRaws, i);
                    string sName=pTagDictGetWord(sTag);
                    string sTempCost=pArray(sRawsCost, iValI);
                    sRawsWithCost+=sName+" - "+((sTempCost=="")?pArray(sRawsCost, pArrayLength(sTempCost)-1):sTempCost)+" ед."+", ";
                };
            sRawsWithCost=GetSubString(sRawsWithCost, 0, GetStringLength(sRawsWithCost)-2);
            sRawsWithCost+=".";
            };
    }
    else if(iRawCreToolMode)
    {


    object oTarget=GetLocalObject(oActivator, "pt_craft_dialToolIsRawCreateTarget");
    string sTools=GetLocalString(oTarget, "pt_CRAFT_TOOL");

        sRawsWithCost=="\nНеобходимые инструменты: ";
        int iToolLen=pArrayLength(sTools);
        for(i=0; i<iToolLen; i++)
            {
                string sTag=pArray(sTools, i);
                string sName=pTagDictGetWord(sTag);
                sRawsWithCost+=sName+", ";
            };
        sRawsWithCost=GetSubString(sRawsWithCost, 0, GetStringLength(sRawsWithCost)-2);
        sRawsWithCost+=".";
    }
    else if(iRawCreSkillMode)
    {


    object oTarget=GetLocalObject(oActivator, "pt_craft_dialToolIsRawCreateTarget");
    string sSkills=GetLocalString(oTarget, "pt_CRAFT_SKILL_ID");
    string sSkillsVal=GetLocalString(oTarget, "pt_CRAFT_SKILL_VALUE");

        sRawsWithCost=="\nНеобходимые навыки: ";
        string sProcSkill=sSkills;
        string sProcSkillVal=sSkillsVal;
        int iSkillLen=pArrayLength(sProcSkill);
        int iSkillValLen=pArrayLength(sProcSkillVal);
        for(k=0; k<iSkillLen; k++)
            {
                int iValK=(k<=(iSkillValLen-1)?k:iSkillValLen-1);
                sRawsWithCost+=pArray(sProcSkill, k)+" "+pArray(sSkillsVal, iValK)+", ";
            };
        sRawsWithCost=GetSubString(sRawsWithCost, 0, GetStringLength(sRawsWithCost)-2);
        sRawsWithCost+=".";
    };

///
SetCustomToken(pt_CUSTTOK_NODE_CURRENT_ITEM_RAW, sRawsWithCost);
}
