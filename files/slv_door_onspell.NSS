//OnSpellCastAt for all Silvy Uni doors
//Wynna September 2007


#include "acr_door_i"
#include "acr_spawn_i"

void main()
{
	ACR_DoorOnSpellCastAt();
    object oStudent = GetLastSpellCaster();
    object oMyDoorTrig=GetNearestObjectByTag("slv_dorm", oStudent, 1);
	object oArea = GetArea(OBJECT_SELF);
	string sName = GetLocalString(oArea, GetName(oMyDoorTrig) + "_Owner");
	string sPrefix = GetSubString(GetName(oMyDoorTrig), 0, 3);
	string sSchool;
	if(sPrefix == "Abj")
		{sSchool = "Abjuration";}
	if(sPrefix == "Con")
		{sSchool = "Conjuration";}
	if(sPrefix == "Div")
		{sSchool = "Divination";}
	if(sPrefix == "Enc")
		{sSchool = "Enchantment";}
	if(sPrefix == "Evo")
		{sSchool = "Evocation";}
	if(sPrefix == "Ill")
		{sSchool = "Illusion";}
	if(sPrefix == "Nec")
		{sSchool = "Necromancy";}
	if(sPrefix == "Tra")
		{sSchool = "Transmutation";}
	
	string sDescription = "This room is unassigned.";
	string sGender = "sir";
	string sMaster = "master";
	if(GetGender(oStudent) == GENDER_FEMALE)
		{sGender = "madame";
		 sMaster = "mistress";
		}
		{}
				
  
   if(((!GetIsDM(oStudent)) && (!GetIsDMPossessed(oStudent))) && (GetLastSpell() == SPELL_KNOCK) && (GetDistanceBetween(oStudent, OBJECT_SELF) >=10.0))
		 {DelayCommand(1.0, SetLocked(OBJECT_SELF, TRUE));
		  }
		  {}
   
   if (((GetIsDM(oStudent)) || (GetIsDMPossessed(oStudent))) && (GetLastSpell() == SPELL_KNOCK) && (GetDistanceBetween(oStudent, OBJECT_SELF) < 10.0))
		{SetFirstName(OBJECT_SELF, sSchool + " Dormitory #1");
		 SetCampaignString("SLV_UNI", GetName(oMyDoorTrig) + "_Owner", "Empty", oArea);
		 SetCampaignString("SLV_UNI", GetName(oMyDoorTrig) + "_Visitors", "None", oArea);
		 SetLocalString(oArea, GetName(oMyDoorTrig) + "_Owner", "Empty");
		 SetLocalString(oArea, GetName(oMyDoorTrig) + "_Visitors", "None");
		 ActionSpeakString("This room is now unassigned. Previous keys will no longer open me.");
		 SetDescription(OBJECT_SELF, sDescription);
		 SetLocked(OBJECT_SELF, TRUE); 
		 SetLocalInt(oMyDoorTrig, "Unlocked", 0);
		 
		 }	
   else if (((GetLastSpell() == SPELL_KNOCK)|| (GetLastSpell() == SPELL_GREASE)|| (GetLastSpell() == SPELL_CURE_MINOR_WOUNDS)|| (GetLastSpell() == SPELL_DAZE)|| (GetLastSpell() == SPELL_FLARE)) && (GetDistanceBetween(oStudent, OBJECT_SELF) < 10.0) && ((sName == "") || (sName == "Empty")))
		{SetLocalInt(oMyDoorTrig, "Unlocked", 1);
		 SetFirstName(OBJECT_SELF, "Dormitory: " + GetName(oStudent));
		 SetLocalString(oArea, GetName(oMyDoorTrig) + "_Owner", GetName(oStudent));
		 SetCampaignString("SLV_UNI", GetName(oMyDoorTrig) + "_Owner", GetName(oStudent), oStudent);
		 SetCampaignString("SLV_UNI", GetName(oMyDoorTrig) + "_Owner", GetName(oStudent), oArea);
		 object oKey = CreateItemOnObject("slv_dorm_key", oStudent, 1, GetName(oStudent) + "_slv_key");  
		 SetFirstName(oKey, GetName(oStudent) + "'s Dorm Room");
		 ActionSpeakString("Your key, " + sGender + ". You shan't need it, of course, but if you wish to bestow it on a friend he or she may pass me without you.");
		 DelayCommand(5.0, ActionSpeakString("You have been reported as my new " + sMaster + ". I look forward to warding your rooms."));
		 DelayCommand(10.0, ActionSpeakString("Should you receive visitors while you are out, I will provide their names to you upon your return." ));
		 SetDescription(OBJECT_SELF, "This room is assigned to " + GetName(oStudent) + ".");
		 SetDescription(oKey, "This key opens the Silvermoon University dormitory assigned to " + GetName(oStudent));
		 DelayCommand(57.0, ActionCloseDoor(OBJECT_SELF));
		 DelayCommand(60.0, SetLocked(OBJECT_SELF, TRUE));
		 DelayCommand(60.0, SetLocalInt(oMyDoorTrig, "Unlocked", 0));
		 }
	 else if ((GetLastSpell() == SPELL_KNOCK) && (GetDistanceBetween(oStudent, OBJECT_SELF) < 10.0) && (sName != "Empty"))
		{DelayCommand(2.0, SetLocked(OBJECT_SELF, TRUE));
		 DelayCommand(2.0, SetLocalInt(OBJECT_SELF, "Unlocked", 0));
		 ActionSpeakString("This room is assigned to " +sName + ". Please see a member of the faculty for information.");
		 }	 
	  

}