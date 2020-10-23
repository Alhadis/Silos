//Страницу вперед


#include "pt_axcrf_md_cons"
#include "pt_frame000"



void main()
{
object oModule=GetModule();
object oActivator=GetPCSpeaker();



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
    };
if(iMaxI<=4) {iMaxI=4;};






iDialogCurMaxI+=5;
iDialogCurMinI+=5;
//if(iDialogCurMaxI>=iMaxI) {iDialogCurMaxI=iMaxI; iDialogCurMinI=iDialogCurMaxI-4;};



SetLocalInt(oActivator, "pt_craft_dialMinI", iDialogCurMinI);
SetLocalInt(oActivator, "pt_craft_dialMaxI", iDialogCurMaxI);
}
