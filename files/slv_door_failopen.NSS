//OnFailToOpen for all Silvy Uni dormitory doors
//Wynna October 2007


#include "acr_door_i"
#include "acr_spawn_i"

void main()
{
	ACR_DoorOnFailToOpen();
    object oStudent = GetClickingObject();
    object oMyDoorTrig=GetNearestObjectByTag("slv_dorm", OBJECT_SELF, 1);
	object oArea = GetArea(OBJECT_SELF);
	string sPrefix = GetStringLeft(GetName(oMyDoorTrig), 3);		
	
		string sOwner = GetLocalString(OBJECT_SELF, "Owner");
		string sDescription = "This room is assigned to " + sOwner + ".  ";
		string sVisitors = GetLocalString(OBJECT_SELF, "Visitors");
					 
	    if(GetName(oStudent) != sOwner)
		    {SetCampaignString("SLV_UNI", sPrefix + "_Dorm_1_Visitors", sVisitors + GetName(oStudent) + ", "); 
			SetLocalString(oArea, sPrefix + "_Dorm_1_Visitors", sVisitors + GetName(oStudent) + ", ");
			SetLocalString(OBJECT_SELF, "Visitors", sVisitors + GetName(oStudent) + ", ");
			sVisitors = GetLocalString(OBJECT_SELF, "Visitors");
			SetDescription(OBJECT_SELF, sDescription + "Visitors:  " + sVisitors);  
			SendMessageToPC(oStudent, "Your name appears on the door, on a list of visitors."); 
			}
	}