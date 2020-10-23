#include "ct_includes"

void Search(object oPC, object oMe)
{
int iDC = GetLocalInt(oMe, "SearchDC");
string sTag = GetLocalString(oMe, "DoorTag");
object oDoor = GetNearestObjectByTag(sTag);
object oTool = GetItemInInventory(oPC, "dmfi_exe_tool");
string sMat = GetLocalString(oMe, "AutoFind");
int iAuto = GetLocalInt(oTool, sMat);

if(GetIsDM(oPC))
	{
		AssignCommand(oDoor, ActionOpenDoor(oDoor));
		SendMessageToPC(oPC, "As a DM, you cause the secret door to open automatically. If you do not want the door to remain open for PCs, please move out of the immediate area of the door until it shuts and vanishes again.");
	}
else if(iAuto == 1)
	{
		AssignCommand(oDoor, ActionOpenDoor(oDoor));
		SendMessageToPC(oPC, "You easily find the small push panel on the wall as you pass near where the hidden door is, having former knowledge of the door's location. Casually, you press the switch, and the door slides away.");
	}
else if(GetIsSkillSuccessful(oPC, SKILL_SEARCH, iDC, FALSE) == TRUE && iAuto == 0)
	{
		AssignCommand(oDoor, ActionOpenDoor(oDoor));
		SendMessageToPC(oPC, "You notice a small part of the wall that seems to look different from the rest, and press it. Next to it, part of the wall slides away, leaving a doorway in its place.");
		SetLocalInt(oTool, sMat, 1);
	}
else if (GetLocalInt(oMe, "pcnum") >= 1 && GetLocalInt(oPC, "doorsearch") == 1)
	DelayCommand(6.0, AssignCommand(oPC, Search(oPC, oMe)));
}
			 

void main()
{
object oMe = OBJECT_SELF;
object oPC = GetEnteringObject();
int iPCs = GetLocalInt(oMe, "pcnum");

if (GetIsPC(oPC) == FALSE || GetIsDM(oPC) == FALSE)
	{}

else
{
	SetLocalInt(oPC, "doorsearch", 1);
	SetLocalInt(oMe, "pcnum", iPCs + 1);
	AssignCommand(oPC, Search(oPC, oMe));
}
}
	