

#include "acr_quest_i"


void main()//
 {//
    object oPC = GetEnteringObject();//
	object oTarget;//
	int n;//
	string sQuestToken = "bg_jaffee_ibexcrystal";

	
		
	if ((GetIsPC(oPC) || GetIsDM(oPC) || GetIsDMPossessed(oPC)) && !GetLocalInt(OBJECT_SELF, "DoOnce"))//
	if (!GetIsPC(oPC)) return;

{

    if(GetLocalInt(oPC, "GetJournalEntry" + sQuestToken) == 2)
	 {//
 
int n = 0;//
object oTarget = GetObjectByTag("wp_qst_jaffee_ibex");//
while (GetIsObjectValid(oTarget))//
    {//
    CreateObject(OBJECT_TYPE_PLACEABLE, "plc_qst_cc2a_crystal_ibex", GetLocation(oTarget));//

	
    n++;//
    oTarget = GetObjectByTag("wp_qst_jaffee_ibex", n);//
	SetLocalInt(OBJECT_SELF, "DoOnce", TRUE); ///
	
	}
	 }//
 }
}//