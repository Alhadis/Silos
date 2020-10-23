//Silvy Uni Trigger OnEnter. All triggers.
//Wynna September 2007


#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_trigger_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "acr_quest_i"
 
void main()
{	
	ACR_TriggerOnExit();
	object oHarvester = GetExitingObject();
    object oMod = GetModule();
	

 if((GetIsPC(oHarvester) != TRUE) && (GetIsDMPossessed(oHarvester) != TRUE))
		{return;}
		
	

				     				     		
			  //Thorns
			    if((GetTag(OBJECT_SELF) == "deandragon_d_thorns") && (GetLocalString(oHarvester, "Thorns") != "Out"))
					{SetLocalString(oHarvester, "Thorns", "Out");
					 DelayCommand(5.0, SetLocalString(oHarvester, "Thorns", ""));
					 }
					
   
}