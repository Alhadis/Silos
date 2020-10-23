// TestAndSetCollision fix, -AL


#include "acr_area_i" 
#include "dmfi_inc_tool"

void _TestAndSetCollision(object oPC) {
	if (GetIsObjectValid(oPC)) {
		 SetCollision(oPC, TRUE);
	}
}


void main () { 

object oExiter = GetExitingObject(); 
effect eTest = GetFirstEffect(oExiter); 
object oTool = DMFI_GetTool(oExiter);
object oPartyLeader = GetFactionLeader(oExiter);
object oPCDestination = GetLocalObject(oExiter, "oPCDestination");
location lStartFrom = GetLocalLocation(oExiter, "lStartFrom");
if(GetIsLocationValid(lStartFrom) == FALSE)
	{lStartFrom = GetLocation(oExiter);
	}
SetLocalLocation(GetArea(oPCDestination), "lStartFrom", lStartFrom);		


if (!GetIsDM(oExiter))
{   AssignCommand(oExiter, ClearAllActions());
	DelayCommand(1800.0, SetLocalString(oPartyLeader, GetName(oExiter), ""));
	DelayCommand(1800.0, SetLocalString(oExiter, GetName(oPartyLeader), ""));
	_TestAndSetCollision(oExiter);
		
	SetCommandable(TRUE, oExiter);
	CloseGUIScreen(oExiter, SCREEN_DMFI_FOLLOWOFF);
	while (GetIsEffectValid(eTest)) 
		{if (GetEffectCreator(eTest) == OBJECT_SELF) 
		{RemoveEffect(oExiter, eTest); 
	      } 
      eTest = GetNextEffect(oExiter); 
   		} 
			


} 

ACR_AreaOnExit(); 

SendMessageToPC(oExiter, "You have left travel area "+GetName(OBJECT_SELF)); 

}