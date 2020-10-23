//Silvy Uni Trigger OnEnter. All triggers.
//Wynna September 2007


#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_trigger_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "bbs_include"

void main()
{	
	ACR_TriggerOnEnter();
	object oStudent = GetEnteringObject();
	object oMasterDoor = GetNearestObject(OBJECT_TYPE_DOOR, oStudent, 1);
    effect eKnock = EffectVisualEffect(VFX_DUR_SOOTHING_LIGHT, FALSE);
    
	if(GetTag(OBJECT_SELF) == "slv_dorm_back_entry")
		{object oDestination = GetWaypointByTag(GetName(OBJECT_SELF) + "_WP");
		 string sOwner = GetLocalString(OBJECT_SELF, "sOwner");
		 if((sOwner == GetName(oStudent)) && (GetLocalInt(oStudent, "Home") == 1 ))
		 	{DelayCommand(3.0, AssignCommand(oStudent, ActionJumpToObject(oDestination, TRUE)));
			}
		 else if(sOwner != GetName(oStudent))
		 	{AssignCommand(oMasterDoor, ActionSpeakString("Private entrance. Please use the Master Halls door.", TALKVOLUME_TALK));
			}		
		}
		
		
	 if((GetIsPC(oStudent) == FALSE) && (GetLocalString(OBJECT_SELF, "sPOwner") == GetName(oStudent)))

           {ActionUnlockObject(oMasterDoor);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eKnock, oMasterDoor, 2.0);
            SetLocalString(oMasterDoor, "Unlocked", "Normally");
            ActionOpenDoor(oMasterDoor);
			DelayCommand(10.0, ActionCloseDoor(oMasterDoor));
			DelayCommand(12.0, SetLocked(oMasterDoor, TRUE));
			DelayCommand(12.5, SetLocalString(oMasterDoor, "Unlocked", ""));
            	}
	
	 if((GetIsPC(oStudent) != TRUE) && (GetIsDMPossessed(oStudent) != TRUE) )
		{return;}
		

	
	object oMod = GetModule();
	object oArea = GetArea(OBJECT_SELF);
	effect eKnockdown = EffectKnockdown();
	effect eParalyze = EffectParalyze();
	string sAlignment;
	if(GetAlignmentGoodEvil(oStudent) == ALIGNMENT_GOOD)
		{sAlignment = "Good";}
		 else if(GetAlignmentGoodEvil(oStudent) == ALIGNMENT_EVIL)
			{sAlignment = "Evil";}
			else
			{sAlignment = "Neutral to the struggle of good and evil";}
	

//Silvy Uni Trigger to open Uni Dorm doors to their masters. To have a door assigned to a student,
//have the student cast Knock on the door from within a distance of 10.0
//Owned doors will greet their masters and unlock for their masters or anybody carrying their key
//Master does not need a key for the unlock function. It works on a trigger checking
//GetName against a persistent string of the master's name. 
//Door will keep a list of names of visitors who try the door while master is 
//out and speak that list to the master on the master's return.
if(GetTag(OBJECT_SELF) == "slv_dorm")
    {effect eGo = EffectVisualEffect(VFX_DUR_SOOTHING_LIGHT, FALSE);
     object oMyDoorTrig=OBJECT_SELF;
	 object oMyDoor=GetObjectByTag(GetName(oMyDoorTrig)  + "_Door");
	 if(GetLocalInt(oMyDoorTrig, "Localized") != 1)
	    {object oMyArmoireStatic = GetObjectByTag(GetName(oMyDoorTrig) + "_Armoire_Static");
		 object oMyChestStatic = GetObjectByTag(GetName(oMyDoorTrig) + "_Chest_Static");
		 object oMyRoof = GetObjectByTag(GetName(oMyDoorTrig) + "_Roof");
		 object oMyRoofWP = GetObjectByTag(GetName(oMyDoorTrig) + "_Roof_WP");
	     object oMyCenterWP = GetObjectByTag(GetName(oMyDoorTrig) + "_Center_WP");
		 object oCurtainClosed = GetObjectByTag(GetName(oMyDoorTrig) + "_Curtain_Closed");
	     object oCurtainOpen = GetObjectByTag(GetName(oMyDoorTrig) + "_Curtain_Open");
    	 object oMyWood = GetObjectByTag(GetName(oMyDoorTrig) + "_Wood");
    	 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Armoire_Static", oMyArmoireStatic);
		 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Chest_Static", oMyChestStatic);
		 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Roof", oMyRoof);
		 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Curtain_Closed", oCurtainClosed);
		 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Curtain_Open", oCurtainOpen);
		 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Wood", oMyWood);
		 object oWaypoint = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(oMyRoofWP), FALSE, OBJECT_TYPE_WAYPOINT);
		 float fDistance = 12.0;
		 if((GetName(OBJECT_SELF) == "MH4") || (GetName(OBJECT_SELF) == "MH5"))
		 	{SetLocked(oMyDoor, FALSE);
		         ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGo, oMyDoor, 3.0);
		         SetLocalInt(OBJECT_SELF, "Unlocked", 1);
		         DelayCommand(57.0, AssignCommand(oMyDoor, ActionCloseDoor(oMyDoor)));
				 DelayCommand(60.0, SetLocked(oMyDoor, TRUE));
		         DelayCommand(60.0, SetLocalInt(OBJECT_SELF, "Unlocked", 0));
		         fDistance = 15.0;}
		 if(GetTag(oArea) == "6d_int_silvy_ladycol_master_lvl")
	 		{oWaypoint = GetFirstObjectInShape(SHAPE_SPHERE, fDistance, GetLocation(oMyCenterWP), FALSE, OBJECT_TYPE_WAYPOINT);
		 	}
		while (GetIsObjectValid(oWaypoint))
			{SetLocalObject(oMyDoorTrig, GetName(oWaypoint), oWaypoint);
			 if(GetName(oWaypoint) == GetName(oMyDoorTrig) + "_Armoire_WP")
				{object oMasterSpawn = oWaypoint;
				 SetLocalObject(oMyDoorTrig, "MasterSpawn", oMasterSpawn);
				 SetLocalObject(oMasterSpawn, "MyTrig", oMyDoorTrig);
				 }
				
			 oWaypoint = GetNextObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(oMyRoofWP), FALSE, OBJECT_TYPE_WAYPOINT);
			 if(GetTag(oArea) == "6d_int_silvy_ladycol_master_lvl")
		 		{oWaypoint = GetNextObjectInShape(SHAPE_SPHERE, fDistance, GetLocation(oMyCenterWP), FALSE, OBJECT_TYPE_WAYPOINT);
			 	}
			} 	
	 	  object oFirestarterWP = GetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF) + "_Firestarter_WP");
		  SetLocalObject(oFirestarterWP, "oMyTrig", OBJECT_SELF);
		  SetLocalInt(oMyDoorTrig, "Localized", 1);
		}
	 	{}	
		
	 string sPOwner;
	 if(GetTag(oArea) == "6d_int_silvy_ladycol_grd_lvl")
	 	{sPOwner  = "_Dorm_1_Owner";}
		else if(GetTag(oArea) == "6d_int_silvy_ladycol_class_lvl")
	 	{sPOwner  = "_Dorm_2_Owner";}
		else if((GetTag(oArea) == "6d_int_silvy_ladycol_master_lvl") || (GetName(OBJECT_SELF) == "Dean_Dorm_1"))
	 	{sPOwner  = GetLocalString(OBJECT_SELF, "sPOwner");}
	
                 	
 	 string sPVisitor;
	 if(GetTag(oArea) == "6d_int_silvy_ladycol_grd_lvl")
	 	{sPVisitor  = "_Dorm_1_Visitors";}
		else if(GetTag(oArea) == "6d_int_silvy_ladycol_class_lvl")
	 	{sPVisitor  = "_Dorm_2_Visitors";}
		else if(GetTag(oArea) == "6d_int_silvy_ladycol_master_lvl")
	 	{sPVisitor  = "_Dorm_3_Visitors";}
		
	 string sPrefix = GetStringLeft(GetName(OBJECT_SELF), 3);		
     string sOwner = GetLocalString(oArea, sPrefix + sPOwner);
	 string sDescription = "This room is assigned to " + sOwner + ".  ";
	 if(GetTag(oArea) == "6d_int_silvy_ladycol_master_lvl")
	 	{sOwner = sPOwner;
		 sDescription = "This room is assigned to " + sPOwner + ".  ";}
	 if(GetName(OBJECT_SELF) == "Dean_Dorm_1")
	 	{sOwner = "Dean Savengriff";
		 sDescription = "Savengriff, Dean of Admissions";}
	 string sVisitors = GetLocalString(oArea, sPrefix + sPVisitor);
	 object oMyCenterWP=GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Center_WP");
	 object oMyStudyWP=GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Study_WP");
	 object oMyBedroomWP=GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Bedroom_WP");
	 int nCount = 1;
	 object oInhabitant = GetNearestCreatureToLocation(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, GetLocation(oMyCenterWP), nCount);
	 if ((GetTag(oArea) != "6d_int_silvy_ladycol_master_lvl") && (GetDistanceBetween(oInhabitant, oMyCenterWP)> 6.15) && (GetDistanceBetween(oMyStudyWP, oInhabitant) > 2.5) && (GetDistanceBetween(oMyBedroomWP, oInhabitant) > 3.15))
				{oInhabitant = OBJECT_INVALID;}
				{}
	 if ((GetTag(oArea) == "6d_int_silvy_ladycol_master_lvl") && (GetDistanceBetween(oInhabitant, oMyCenterWP)> 9.0))
				{oInhabitant = OBJECT_INVALID;}
				{}
	 effect eStop = EffectVisualEffect(VFX_DUR_GLOW_LIGHT_RED, FALSE);
	 string sResident = "";
	 string sFamiliar = GetAnimalCompanionName(oStudent);
	 string sMaster = "sir";
	 if(GetGender(oStudent) == GENDER_FEMALE)
	 	{sMaster = "madame";}
	
				 	 
	while (GetIsObjectValid(oInhabitant))
		{ if(GetName(oInhabitant) != sOwner)
	  		{nCount ++;
			 object oNextInhabitant = GetNearestCreatureToLocation(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, GetLocation(oMyCenterWP), nCount);
	 		 if (((GetDistanceBetween(oNextInhabitant, oMyCenterWP)< 6.15) || (GetDistanceBetween(oMyStudyWP, oNextInhabitant) < 2.5) || (GetDistanceBetween(oMyBedroomWP, oNextInhabitant) < 3.15)) 
			      || ((GetTag(oArea) == "6d_int_silvy_ladycol_master_lvl") && (GetDistanceBetween(oInhabitant, oMyCenterWP)< 9.0)))
				
				{oInhabitant = oNextInhabitant;
	 			 }
			}
			
		 else if(GetName(oInhabitant) == sOwner)
		 	{sResident = sOwner;
			 break;
			}		
		}		  
	 	     	 	 
	  		
		if(GetLocalInt(OBJECT_SELF, "Unlocked") !=1)
			{if(sOwner == GetName(oStudent))  
				{oMyCenterWP = GetObjectByTag(GetName(oMyDoorTrig) + "_Center_WP");
		         SetLocked(oMyDoor, FALSE);
		         ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGo, oMyDoor, 3.0);
		         SetLocalInt(OBJECT_SELF, "Unlocked", 1);
		         DelayCommand(57.0, AssignCommand(oMyDoor, ActionCloseDoor(oMyDoor)));
				 DelayCommand(60.0, SetLocked(oMyDoor, TRUE));
		         DelayCommand(60.0, SetLocalInt(OBJECT_SELF, "Unlocked", 0));
		         if(GetName(OBJECT_SELF) != "Dean_Dorm_1")
					 {if ((GetTag(oArea) == "6d_int_silvy_ladycol_master_lvl") && (GetDistanceBetween(oStudent, oMyCenterWP)> 9.0))
							{AssignCommand(oMyDoor, SpeakString("Welcome home, " + sMaster + "."));
							 }
					  else if((GetDistanceBetween(oStudent, oMyCenterWP)> 6.15) && (GetDistanceBetween(oMyStudyWP, oStudent) > 2.5) && (GetDistanceBetween(oMyBedroomWP, oStudent) > 3.15))
						 	{AssignCommand(oMyDoor, SpeakString("Welcome home, " + sMaster + "."));
						 	}
					  if((sVisitors != "") && (sVisitors != "None"))
								 {DelayCommand(5.0, AssignCommand(oMyDoor, SpeakString("While you were out, the following visitors left their names: " + sVisitors)));
								 SetLocalString(oArea, GetName(oMyDoorTrig) + "_Visitors", "None");
								 SetCampaignString("SLV_UNI", sPrefix + sPVisitor, "None", oArea);
								 SetDescription(oMyDoor, "This room is assigned to " + GetName(oStudent) + ".");
					 			 }
					 }
				}
				
			else if (((sOwner == "") || (sOwner == "Empty")) && ((GetLevelByClass(CLASS_TYPE_WIZARD, oStudent) >= 1) || (GetLevelByClass(CLASS_TYPE_SORCERER, oStudent) >= 1)  || (GetLevelByClass(CLASS_TYPE_BARD, oStudent) >= 1))	|| (GetItemPossessedBy(oStudent, sOwner + "_slv_key") != OBJECT_INVALID))
				{SetLocked(oMyDoor, FALSE);
		         ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eGo, oMyDoor, 3.0);
		         SetLocalInt(OBJECT_SELF, "Unlocked", 1);
		         DelayCommand(57.0, AssignCommand(oMyDoor, ActionCloseDoor(oMyDoor)));
			     DelayCommand(60.0, SetLocked(oMyDoor, TRUE));
		         DelayCommand(60.0, SetLocalInt(OBJECT_SELF, "Unlocked", 0));
		         }
					
			else if((sOwner != GetName(oStudent)) && (sResident != sOwner) && (GetName(OBJECT_SELF) != "Dean_Dorm_1") && (sOwner != "Dean Vihuel") && (sOwner != "Dr. Augustine") && (FindSubString(GetName(OBJECT_SELF), "MH") != -1))
				{SetLocked(oMyDoor, TRUE);
		         SetLocalInt(OBJECT_SELF, "Unlocked", 0);
		         AssignCommand(oMyDoor, SpeakString("Welcome. " + sOwner + " is not in. If you would like to leave your name as a calling card, please try to open me by use of the door handle. I'll ensure " + sOwner + " gets the message."));
				 } 
			else if ((sOwner != "") && (GetName(OBJECT_SELF) != "Dean_Dorm_1")&& (sOwner != "Dean Vihuel") && (sOwner != "Dr. Augustine") && (FindSubString(GetName(OBJECT_SELF), "MH") != -1))
				 {SetLocked(oMyDoor, TRUE);
		          SetLocalInt(OBJECT_SELF, "Unlocked", 0);
		          AssignCommand(oMyDoor, SpeakString("Welcome. " + sOwner + " is in."));
				} 	 
			 						
			}
			
			
	 if((GetIsPC(oStudent)) && (GetLocalInt(oStudent, "Classes") != 1)) 
	{SetLocalInt(GetEnteringObject(), "Classes", 1);
	 if(GetCampaignString("SLV_UNI", "Elementary Abjuration", oStudent) == "Elementary Abjuration") 
		{SetLocalString(oStudent, "Elementary Abjuration", "Elementary Abjuration");
		}
	 if(GetCampaignString("SLV_UNI", "Elementary Conjuration", oStudent) == "Elementary Conjuration") 
		{SetLocalString(oStudent, "Elementary Conjuration", "Elementary Conjuration");
		}
	 if(GetCampaignString("SLV_UNI", "Elementary Divination", oStudent) == "Elementary Divination") 
		{SetLocalString(oStudent, "Elementary Divination", "Elementary Divination");
		}
	 if(GetCampaignString("SLV_UNI", "Elementary Enchantment", oStudent) == "Elementary Enchantment") 
		{SetLocalString(oStudent, "Elementary Enchantment", "Elementary Enchantment");
		}
	 if(GetCampaignString("SLV_UNI", "Elementary Evocation", oStudent) == "Elementary Evocation") 
		{SetLocalString(oStudent, "Elementary Evocation", "Elementary Evocation");
		}
	 if(GetCampaignString("SLV_UNI", "Elementary Illusion", oStudent) == "Elementary Illusion") 
		{SetLocalString(oStudent, "Elementary Illusion", "Elementary Illusion");
		}
	 if(GetCampaignString("SLV_UNI", "Elementary Necromancy", oStudent) == "Elementary Necromancy") 
		{SetLocalString(oStudent, "Elementary Necromancy", "Elementary Necromancy");
		}
	 if(GetCampaignString("SLV_UNI", "Elementary Transmutation", oStudent) == "Elementary Transmutation") 
		{SetLocalString(oStudent, "Elementary Transmutation", "Elementary Transmutation");
		} 
	 if(GetCampaignString("SLV_UNI", "Standard Abjuration", oStudent) == "Standard Abjuration") 
		{SetLocalString(oStudent, "Standard Abjuration", "Standard Abjuration");
		} 
	 if(GetCampaignString("SLV_UNI", "Standard Conjuration", oStudent) == "Standard Conjuration") 
		{SetLocalString(oStudent, "Standard Conjuration", "Standard Conjuration");
		}
	 if(GetCampaignString("SLV_UNI", "Standard Divination", oStudent) == "Standard Divination") 
		{SetLocalString(oStudent, "Standard Divination", "Standard Divination");
		}
	 if(GetCampaignString("SLV_UNI", "Standard Enchantment", oStudent) == "Standard Enchantment") 
		{SetLocalString(oStudent, "Standard Enchantment", "Standard Enchantment");
		}
	 if(GetCampaignString("SLV_UNI", "Standard Evocation", oStudent) == "Standard Evocation") 
		{SetLocalString(oStudent, "Standard Evocation", "Standard Evocation");
		}
	 if(GetCampaignString("SLV_UNI", "Standard Illusion", oStudent) == "Standard Illusion") 
		{SetLocalString(oStudent, "Standard Illusion", "Standard Illusion");
		}
	 if(GetCampaignString("SLV_UNI", "Standard Necromancy", oStudent) == "Standard Necromancy") 
		{SetLocalString(oStudent, "Standard Necromancy", "Standard Necromancy");
		}
	 if(GetCampaignString("SLV_UNI", "Standard Transmutation", oStudent) == "Standard Transmutation") 
		{SetLocalString(oStudent, "Standard Transmutation", "Standard Transmutation");
		}
	 if(GetCampaignString("SLV_UNI", "Advanced Abjuration", oStudent) == "Advanced Abjuration") 
		{SetLocalString(oStudent, "Advanced Abjuration", "Advanced Abjuration");
		} 
	 if(GetCampaignString("SLV_UNI", "Advanced Conjuration", oStudent) == "Advanced Conjuration") 
		{SetLocalString(oStudent, "Advanced Conjuration", "Advanced Conjuration");
		}
	 if(GetCampaignString("SLV_UNI", "Advanced Divination", oStudent) == "Advanced Divination") 
		{SetLocalString(oStudent, "Advanced Divination", "Advanced Divination");
		}
	 if(GetCampaignString("SLV_UNI", "Advanced Enchantment", oStudent) == "Advanced Enchantment") 
		{SetLocalString(oStudent, "Advanced Enchantment", "Advanced Enchantment");
		}
	 if(GetCampaignString("SLV_UNI", "Advanced Evocation", oStudent) == "Advanced Evocation") 
		{SetLocalString(oStudent, "Advanced Evocation", "Advanced Evocation");
		}
	 if(GetCampaignString("SLV_UNI", "Advanced Illusion", oStudent) == "Advanced Illusion") 
		{SetLocalString(oStudent, "Advanced Illusion", "Advanced Illusion");
		}
	 if(GetCampaignString("SLV_UNI", "Advanced Necromancy", oStudent) == "Advanced Necromancy") 
		{SetLocalString(oStudent, "Advanced Necromancy", "Advanced Necromancy");
		}
	 if(GetCampaignString("SLV_UNI", "Advanced Transmutation", oStudent) == "Advanced Transmutation") 
		{SetLocalString(oStudent, "Advanced Transmutation", "Advanced Transmutation");
		}
	 if(GetCampaignString("SLV_UNI", "DeanDragonGreeted" + GetName(oStudent), oStudent) != "Yes")
	    {SetLocalString(oStudent, "DeanDragonGreeted" + GetName(oStudent), "Yes");
		}
	
		}			 
	}
	

//Silvy Uni trigger the spawn of placeables in dorm room for oStudent joining module with dorm room start. Creating/destroying placeables this way means no popup names of usable placeables through placeable walls.
if((GetTag(OBJECT_SELF) == "slv_dorm_in") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	{object oMyDoorTrig=GetNearestObjectByTag("slv_dorm", oStudent, 1);
	 if(GetLocalInt(oMyDoorTrig, "Localized") != 1)
	    {object oMyArmoireStatic = GetObjectByTag(GetName(oMyDoorTrig) + "_Armoire_Static");
		 object oMyChestStatic = GetObjectByTag(GetName(oMyDoorTrig) + "_Chest_Static");
		 object oMyRoof = GetObjectByTag(GetName(oMyDoorTrig) + "_Roof");
		 object oMyRoofWP = GetObjectByTag(GetName(oMyDoorTrig) + "_Roof_WP");
	     object oCurtainClosed = GetObjectByTag(GetName(oMyDoorTrig) + "_Curtain_Closed");
	     object oCurtainOpen = GetObjectByTag(GetName(oMyDoorTrig) + "_Curtain_Open");
    	 object oMyWood = GetObjectByTag(GetName(oMyDoorTrig) + "_Wood");
    	 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Armoire_Static", oMyArmoireStatic);
		 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Chest_Static", oMyChestStatic);
		 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Roof", oMyRoof);
		 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Curtain_Closed", oCurtainClosed);
		 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Curtain_Open", oCurtainOpen);
		 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Wood", oMyWood);
		 object oWaypoint = GetFirstObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(oMyRoofWP), FALSE, OBJECT_TYPE_WAYPOINT);
		 while (GetIsObjectValid(oWaypoint))
			{SetLocalObject(oMyDoorTrig, GetName(oWaypoint), oWaypoint);
			 if(GetName(oWaypoint) == GetName(oMyDoorTrig) + "_Armoire_WP")
				{object oMasterSpawn = oWaypoint;
				 SetLocalObject(oMyDoorTrig, "MasterSpawn", oMasterSpawn);
				 }
				 {}
			 oWaypoint = GetNextObjectInShape(SHAPE_SPHERE, 10.0, GetLocation(oMyRoofWP), FALSE, OBJECT_TYPE_WAYPOINT);
			 } 	
	 	  object oFirestarterWP = GetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF) + "_Firestarter_WP");
		  SetLocalObject(oFirestarterWP, "oMyTrig", oMyDoorTrig);
		  SetLocalInt(oMyDoorTrig, "Localized", 1);
		}
	 	{}	
	  	 
		object oMyArmoire=GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Armoire");
	    if(GetIsObjectValid(oMyArmoire)== FALSE) 
			{DestroyObject(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Armoire_Static"), 1.0);
			 DestroyObject(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Chest_Static"), 1.0);
			 ACR_SetIsSpawnPointEnabled(GetLocalObject(oMyDoorTrig, "MasterSpawn"), TRUE, TRUE);
			 }
			{}
			
	    object oMyRoof=GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Roof");
	    DestroyObject(oMyRoof);
		
		if(GetName(OBJECT_SELF) == "Abj_dorm_1_in")
			{object oAbjRoof=GetObjectByTag("Abj_Dorm_1_Roof");
	    	 DestroyObject(oAbjRoof);
			}
	
			 
	}
	
//Silvy Uni trigger the spawn of placeables in masters' housing. Creating/destroying placeables this way means no popup names of usable placeables through placeable walls.
if((GetTag(OBJECT_SELF) == "slv_dorm_master_in") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	{object oMyDoorTrig=GetNearestObjectByTag("slv_dorm", oStudent, 1);
	 if(GetLocalInt(oMyDoorTrig, "Localized") != 1)
	    {object oMyArmoireStatic = GetObjectByTag(GetName(oMyDoorTrig) + "_Armoire_Static");
		 object oMyWood = GetObjectByTag(GetName(oMyDoorTrig) + "_Wood");
    	 object oMyCenterWP=GetWaypointByTag(GetName(oMyDoorTrig) + "_Center_WP");
	     SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Armoire_Static", oMyArmoireStatic);
		 SetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Wood", oMyWood);
		 float fDistance = 12.0;
		 if((GetName(OBJECT_SELF) == "MH4_in") || (GetName(OBJECT_SELF) == "MH5_in"))
		 	{fDistance = 15.0;}
		 object oWaypoint = GetFirstObjectInShape(SHAPE_SPHERE, fDistance, GetLocation(oMyCenterWP), FALSE, OBJECT_TYPE_WAYPOINT);
		 while (GetIsObjectValid(oWaypoint))
			{SetLocalObject(oMyDoorTrig, GetName(oWaypoint), oWaypoint);
			 if(GetName(oWaypoint) == GetName(oMyDoorTrig) + "_Armoire_WP")
				{object oMasterSpawn = oWaypoint;
				 SetLocalObject(oMyDoorTrig, "MasterSpawn", oMasterSpawn);
				 }
			
			 oWaypoint = GetNextObjectInShape(SHAPE_SPHERE, fDistance, GetLocation(oMyCenterWP), FALSE, OBJECT_TYPE_WAYPOINT);
			 } 	
	 	  object oFirestarterWP = GetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF) + "_Firestarter_WP");
		  SetLocalObject(oFirestarterWP, "oMyTrig", oMyDoorTrig);
		  SetLocalInt(oMyDoorTrig, "Localized", 1);
		}
	 	{}	
	  	 
		object oMyArmoire=GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Armoire");
	    if(GetIsObjectValid(oMyArmoire)== FALSE) 
		DestroyObject(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Armoire_Static"), 1.0);
		DestroyObject(GetLocalObject(oMyDoorTrig, GetName(oMyDoorTrig) + "_Chest_Static"), 1.0);
		ACR_SetIsSpawnPointEnabled(GetLocalObject(oMyDoorTrig, "MasterSpawn"), TRUE, TRUE);
				 
		  
	}
			 
}