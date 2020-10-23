//Silvy Uni Trigger OnEnter. All triggers.
//Wynna September 2007


#include "silvy_univ_inc"
#include "silvy_univ_func"
#include "acr_trigger_i"
#include "acr_spawn_i"
#include "acr_tools_i"
#include "bbs_include"
#include "acr_quest_i"

void main()
{	
	ACR_TriggerOnEnter();
	object oStudent = GetEnteringObject();
    object oMod = GetModule();
	effect eKnockdown = EffectKnockdown();
	effect eParalyze = EffectParalyze();
	string sAlignment;
	if(GetAlignmentGoodEvil(oStudent) == ALIGNMENT_GOOD)
		{sAlignment = "Good";}
		 else if(GetAlignmentGoodEvil(oStudent) == ALIGNMENT_EVIL)
			{sAlignment = "Evil";}
			else
			{sAlignment = "Neutral to the struggle of good and evil";}
	


//AT failsafe

if(FindSubString(GetTag(OBJECT_SELF), "_AT") != -1)
	{
	object oTraveller = GetEnteringObject();
    object oMyWaypoint = GetLocalObject(OBJECT_SELF, GetTag(OBJECT_SELF) + "_WP");
	
	if (oMyWaypoint == OBJECT_INVALID)
		{oMyWaypoint = GetObjectByTag(GetTag(OBJECT_SELF) + "_WP");
		 SetLocalObject(OBJECT_SELF, GetTag(OBJECT_SELF) + "_WP", oMyWaypoint);
		 AssignCommand(oTraveller, ActionJumpToObject(oMyWaypoint));
		 }
	
	}	
	
//Destroys undead on enter 
		
    if((FindSubString(GetTag(OBJECT_SELF), "slv_prot") != -1) && ((GetRacialType(oStudent) == IP_CONST_RACIALTYPE_UNDEAD) || (FindSubString(GetTag(oStudent), "Mephit") != -1)|| (FindSubString(GetTag(oStudent), "Dire ") != -1)))
        {effect ePositiveEnergy = EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE, FALSE);
         effect ePulse = EffectVisualEffect(VFX_IMP_PULSE_HOLY, FALSE);
         effect eSun = EffectVisualEffect(VFX_FNF_SUNBEAM, FALSE);
         effect eDeath = EffectDeath(TRUE);
         DelayCommand(1.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, eSun, GetLocation(oStudent), 2.0));
         DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oStudent));
         DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, ePulse, GetLocation(oStudent), 2.0));
         DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, ePositiveEnergy, oStudent));
         DelayCommand(4.0, ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, ePulse, GetLocation(oStudent), 2.0));
         DelayCommand(4.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, ePositiveEnergy, oStudent));
         }
              

		

//Silvy Uni trigger the spawn of placeables in rooms other than dormitories. Creating/destroying placeables this way means no popup names of usable placeables through placeable walls.
if((GetStringLeft(GetTag(OBJECT_SELF), 6) == "slv_in") && (GetTag(oStudent) != "slv_bookwyrm") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	{float fDistance;
	 int iD1 = StringToInt(GetSubString(GetTag(OBJECT_SELF), 6, 1));
	 int iD2 = StringToInt(GetSubString(GetTag(OBJECT_SELF), 7, 1));
	 int iD3 = StringToInt(GetSubString(GetTag(OBJECT_SELF), 8, 1));
	 int iD4 = StringToInt(GetSubString(GetTag(OBJECT_SELF), 9, 1));
	 int iWhole = iD1*10 + iD2;
	 int iFraction;
	 
	if ((iD3 == 2) && (iD4 == 5))
	 	{fDistance = (IntToFloat(iWhole) + 0.25);
		}
	else if ((iD3 == 5) && (iD4 == 0))
	 	{fDistance = (IntToFloat(iWhole) + 0.5);
		}
	else if ((iD3 == 7) && (iD4 == 5))
	 	{fDistance = (IntToFloat(iWhole) + 0.75);
		}		
	else {fDistance = IntToFloat(iWhole);
		 }
	 string sUsable;
	 string sUsable2;
	 string sUsable3;
	 string sUsable4;
	  if(GetName(OBJECT_SELF) == "Entry_NE")
	  	{sUsable = "_Armoire";
		 }
	  if(GetName(OBJECT_SELF) == "Entry_NW")
	  	{sUsable = "_Bench";
		 } 
	  if(GetName(OBJECT_SELF) == "Dean")
	 	{sUsable = "_Box";
		 }
	  if(GetName(OBJECT_SELF) == "Registrar")
	  	{sUsable = "_Desk";
		 sUsable2 = "_Armoire";
		}
	  if(GetName(OBJECT_SELF) == "Records")
	  	{sUsable = "_Treant";
		}
	  if(GetName(OBJECT_SELF) == "Scribery_All")
	  	{sUsable = "_Scribe";
		 }
	  if(GetName(OBJECT_SELF) == "Scribery_Center")
	  	{sUsable = "_Bookshelf2";
		 }
	  if(GetName(OBJECT_SELF) == "Scribery_S")
	  	{sUsable = "_Archive";
		 }
 	if(GetName(OBJECT_SELF) == "Scribery_E")
	  	{sUsable = "_Chest";
		 }	
	if(GetName(OBJECT_SELF) == "Aerasume")
	  	{sUsable = "_Chair1";
		 }
	if(GetName(OBJECT_SELF) == "Library_All")
	  	{sUsable = "_Librarian";
		 }
	if(GetName(OBJECT_SELF) == "Library_SW")
	  	{sUsable = "_Chair1";
		 }
	if(GetName(OBJECT_SELF) == "Library_NW")
	  	{sUsable = "_Chair1";
		 }
	if(GetName(OBJECT_SELF) == "Library_NE")
	  	{sUsable = "_Low_Chair1";
		 }
	if(GetName(OBJECT_SELF) == "Library_SE")
	  	{sUsable = "_Chair1";
		 }	 	 	 	 			
	if(GetName(OBJECT_SELF) == "Library_Stairs")
	  	{sUsable = "_BookOrders";
		 }
	if(GetName(OBJECT_SELF) == "Kitchen")
	  	{sUsable = "_Belad";
		 }
	if(GetName(OBJECT_SELF) == "Kitchen_Table_1")
	  	{sUsable = "_Bench";
		 }
	if(GetName(OBJECT_SELF) == "Kitchen_Table_2")
	  	{sUsable = "_Low_Bench";
		 }
	if(GetName(OBJECT_SELF) == "Kitchen_Table_3")
	  	{sUsable = "_Bench";
		 }
	if(GetName(OBJECT_SELF) == "Kitchen_Stools_1")
	  	{sUsable = "_Stool";
		 }
	if(GetName(OBJECT_SELF) == "Kitchen_Stools_2")
	  	{sUsable = "_Low_Stool";
		 }		 	 	 	 		
	if(GetName(OBJECT_SELF) == "LadyHall")
	  	{sUsable = "_Chair1";
		 }
	if(GetName(OBJECT_SELF) == "Hornblade_Table1")
	  	{sUsable = "_Chair1";
		 }	 
	if(GetName(OBJECT_SELF) == "Hornblade_Table2")
	  	{sUsable = "_Chair1";
		 }	 
	if(GetName(OBJECT_SELF) == "Valamaradace")
	  	{sUsable = "_Chair1";
		 }	 
	if(GetName(OBJECT_SELF) == "Supplies")
	  	{sUsable = "_Cabinet";
		 }
	if(GetName(OBJECT_SELF) == "Restricted")
	  	{sUsable = "_Cabinet";
		 }
	if(GetName(OBJECT_SELF) == "Entry_SW")
	  	{sUsable = "_Bench_1";
		 }
	if(GetName(OBJECT_SELF) == "Entry_SE")
	  	{sUsable = "_Bench_1";
		 }	
	if(GetName(OBJECT_SELF) == "ComW_Set1")
	  	{sUsable = "_Chair1";
		 }	  	 	 	 	 
	if(GetName(OBJECT_SELF) == "ComW_Set2")
	  	{sUsable = "_Chair1";
		 }	  	 	 	 	 
	if(GetName(OBJECT_SELF) == "ComW_Set3")
	  	{sUsable = "_Sofa1";
		 }
	if(GetName(OBJECT_SELF) == "ComW_Set4")
	  	{sUsable = "_Chair1";
		 }	 	  	 	 	 	 
	if(GetName(OBJECT_SELF) == "ComW_Fireplace1")
	  	{sUsable = "_Firestarter";
		 }	 	  	 	 	 	 
	if(GetName(OBJECT_SELF) == "ComW_Fireplace2")
	  	{sUsable = "_Firestarter";
		 }
	if(GetName(OBJECT_SELF) == "ComW_Sundial")
	  	{sUsable = "_Sundial";
		 }
	if(GetName(OBJECT_SELF) == "ComE_Set1")
	  	{sUsable = "_Chair1";
		 }	  	 	 	 	 
	if(GetName(OBJECT_SELF) == "ComE_Set2")
	  	{sUsable = "_Chair1";
		 }	  	 	 	 	 
	if(GetName(OBJECT_SELF) == "ComE_Set3")
	  	{sUsable = "_Cushion";
		 }
	if(GetName(OBJECT_SELF) == "ComE_Set4")
	  	{sUsable = "_Chair1";
		 }	 	  	 	 	 	 
	if(GetName(OBJECT_SELF) == "ComE_Fireplace1")
	  	{sUsable = "_Firestarter";
		 }	 	  	 	 	 	 
	if(GetName(OBJECT_SELF) == "ComE_Fireplace2")
	  	{sUsable = "_Firestarter";
		 }
	if(GetName(OBJECT_SELF) == "Entry_BBS1")
	  	{sUsable = "_Book";
		 } 
   
 	if((GetName(OBJECT_SELF) == "Lobby_BBS2") || (GetName(OBJECT_SELF) == "Entry_BBS2"))
 	  	{sUsable = "_Class_Schedule";
 		//To reinitialize a BBS after changing some of the message information below
		//or adding or removing messages requires a new tag on the BBS to create a new 
		//database entry for it. Wiping the entire bbs database works, too, but that 
		//wipes every bbs in the module
		 object oMyBBS = GetObjectByTag(GetName(OBJECT_SELF) + "_plc_3");
		 object oSpeaker = GetNearestObject(OBJECT_TYPE_ALL, OBJECT_SELF, 1);
	     if(GetCampaignInt("SLV_UNI", "Initialize", OBJECT_SELF) != 1)
				 {  SetCampaignInt("SLV_UNI", "Initialize", 1, OBJECT_SELF);
				    string sSchool;
					string sMaster;
					string sTime100;
					string sTime200;
					string sTime300;
					string sTime400;
		
				      sSchool = "Abjuration";
					  sMaster = "Mistress Melindia";
					  sTime100 = "0900";
					  sTime200 = "1300";
					  sTime300 = "1700";
					  sTime400 = "2400";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
				      
					  sSchool = "Conjuration";
					  sMaster = "Master Gasen";
					  sTime100 = "0600";
					  sTime200 = "0800";
					  sTime300 = "1000";
					  sTime400 = "1200";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					 		  
					  sSchool = "Divination";
					  sMaster = "Master Clarvue";
					  sTime100 = "1000";
					  sTime200 = "1200";
					  sTime300 = "1400";
					  sTime400 = "2400";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					 
					  sSchool = "Enchantment";
					  sMaster = "Master Elestari";
					  sTime100 = "1900";
					  sTime200 = "0900";
					  sTime300 = "0600";
					  sTime400 = "0300";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					  
					  sSchool = "Evocation";
					  sMaster = "Mistress Gertrun";
					  sTime100 = "When there's time to burn";
					  sTime200 = "Moments of truth";
					  sTime300 = "Seasonally in discontent";
					  sTime400 = "Blue moons";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					  
					  sSchool = "Illusion";
					  sMaster = "Master Volebane";
					  sTime100 = "2000";
					  sTime200 = "1600";
					  sTime300 = "1400";
					  sTime400 = "1200";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					  
					  sSchool = "Necromancy";
				      sMaster = "Mistress Ostelle";
				 	  sTime100 = "Noon";
					  sTime200 = "Sunrise";
					  sTime300 = "Sunset";
					  sTime400 = "Midnight";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
					  
					  sSchool = "Transmutation";
					  sMaster = "Master Auroneous";
					  sTime100 = "1300";
					  sTime200 = "1400";
					  sTime300 = "1500";
					  sTime400 = "1600";
					  bbs_add_notice(oMyBBS, sMaster, sSchool + " Classes", "Elementary " +sSchool + "--" + sTime100 + "; Standard " +sSchool + "--" + sTime200 + "; Advanced " +sSchool + "--" +sTime300 + "; Senior " +sSchool + "--" +sTime400, "", GetTag(oMyBBS));
			   		  } 
		 }
	if(GetName(OBJECT_SELF) == "Lobby_BBS1")
	  	{sUsable = "_Book";
		 } 
	if(GetName(OBJECT_SELF) == "Lobby1")
	  	{sUsable = "_Low_Chair1";
		 }
	if(GetName(OBJECT_SELF) == "Lobby2")
	  	{sUsable = "_Low_Chair1";
		 }
	if(GetName(OBJECT_SELF) == "Lobby3")
	  	{sUsable = "_Low_Chair1";
		}
	if((GetName(OBJECT_SELF) == "MT4_Dorm_1") || (GetName(OBJECT_SELF) == "MT3_Dorm_1") || (GetName(OBJECT_SELF) == "MT4_Dorm_2") || (GetName(OBJECT_SELF) == "MT3_Dorm_2"))
	  	{sUsable = "_Armoire1";
		 sUsable2 = "_Armoire2";
		 sUsable2 = "_Chest1";
		 sUsable2 = "_Chest2";
		 object oMyRoof1 = GetLocalObject(OBJECT_SELF, "oMyRoof1");
		 if(oMyRoof1 == OBJECT_INVALID)
			 {oMyRoof1 = GetObjectByTag(GetName(OBJECT_SELF) + "_Roof1");
			}
	     object oMyRoof2 = GetLocalObject(OBJECT_SELF, "oMyRoof2");
		 if(oMyRoof2 == OBJECT_INVALID)
			{oMyRoof2 = GetObjectByTag(GetName(OBJECT_SELF) + "_Roof2");
		    }
		 DestroyObject(oMyRoof1);
		 SetLocalObject(OBJECT_SELF, "oMyRoof1", OBJECT_INVALID);
		 DestroyObject(oMyRoof2);
		 SetLocalObject(OBJECT_SELF, "oMyRoof2", OBJECT_INVALID);
		 	 } 
 	
	 	 
	string sStatic = sUsable + "_Static";
	string sStatic2 = sUsable2 + "_Static";
	string sStatic3 = sUsable3 + "_Static";
	string sStatic4 = sUsable4 + "_Static";
		 		
	if(GetLocalInt(OBJECT_SELF, "Localized") != 1)
		{string sMasterspawn = sUsable + "_WP";
	     object oMyCenterWP = GetWaypointByTag(GetName(OBJECT_SELF) + "_Center_WP");
		 object oMyWood = GetObjectByTag(GetName(OBJECT_SELF) + "_Wood");
    	 SetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF) + "_Wood", oMyWood);
		 object oWaypoint = GetFirstObjectInShape(SHAPE_CUBE, fDistance, GetLocation(oMyCenterWP), FALSE, OBJECT_TYPE_WAYPOINT);
		 
		 while (GetIsObjectValid(oWaypoint))
			{//SendMessageToPC(oStudent, GetName(OBJECT_SELF) + " " + GetName(oWaypoint) + " = oWaypoint.");
		     SetLocalObject(OBJECT_SELF, GetName(oWaypoint), oWaypoint);
			 if(GetName(oWaypoint) == GetName(OBJECT_SELF) + sMasterspawn)
				{object oMasterSpawn = oWaypoint;
				 SetLocalObject(OBJECT_SELF, "MasterSpawn", oMasterSpawn);
				 SetLocalObject(oMasterSpawn, "MyTrig", OBJECT_SELF);
		 		 }
				 {}
			if(FindSubString(GetName(oWaypoint), "Random") != -1) 
				{ACR_SetIsSpawnPointEnabled(oWaypoint, TRUE, TRUE);
			     SetLocalInt(OBJECT_SELF, "Randomized", 2);
		  		 DelayCommand(600.00, SetLocalInt(OBJECT_SELF, "Randomized", 1));
		  		 }
				{}
			oWaypoint = GetNextObjectInShape(SHAPE_CUBE, fDistance, GetLocation(oMyCenterWP), FALSE, OBJECT_TYPE_WAYPOINT);
			 } 	
	 	  object oFirestarterWP = GetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF) + "_Firestarter_WP");
		  SetLocalObject(oFirestarterWP, "oMyTrig", OBJECT_SELF);
		  SetLocalInt(OBJECT_SELF, "Localized", 1);
		  ACR_SetIsSpawnPointEnabled(GetLocalObject(OBJECT_SELF, "MasterSpawn"), TRUE, TRUE);
		}

     else if(GetLocalInt(OBJECT_SELF, "Localized") == 1)		
		   {object oMyCenterWP = GetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF) + "_Center_WP");
			object oMyUsable=GetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF) + sUsable);
		    if(GetIsObjectValid(oMyUsable)== FALSE) 
				{DestroyObject(GetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF) + sStatic));
				 DestroyObject(GetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF) + sStatic2));
			     DestroyObject(GetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF) + sStatic3));
			     DestroyObject(GetLocalObject(OBJECT_SELF, GetName(OBJECT_SELF) + sStatic4));
			     ACR_SetIsSpawnPointEnabled(GetLocalObject(OBJECT_SELF, "MasterSpawn"), TRUE, TRUE);
				 }
				{}
			if((GetLocalInt(OBJECT_SELF, "Randomized") == 1) && (FindSubString(GetName(OBJECT_SELF), "Random") != -1)) 
				{object oWaypoint = GetFirstObjectInShape(SHAPE_CUBE, fDistance, GetLocation(oMyCenterWP), FALSE, OBJECT_TYPE_WAYPOINT);
				 while (GetIsObjectValid(oWaypoint))
					{if(GetStringLeft(GetName(oWaypoint), 6) == "Random")
					 	{ACR_SetIsSpawnPointEnabled(oWaypoint, TRUE, TRUE);
					 	 SetLocalInt(OBJECT_SELF, "Randomized", 2);
		  			 	 DelayCommand(600.00, SetLocalInt(OBJECT_SELF, "Randomized", 1));
		  			 	 }
					}	
				oWaypoint = GetNextObjectInShape(SHAPE_CUBE, fDistance, GetLocation(oMyCenterWP), FALSE, OBJECT_TYPE_WAYPOINT);
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
	 if(GetCampaignString("SLV_UNI", "DeanSphinxGreeted" + GetName(oStudent), oStudent) != "Yes")
	    {SetLocalString(oStudent, "DeanSphinxGreeted" + GetName(oStudent), "Yes");
		}
	
	}   	 
} 
	
//Creates Dean's Secret Bookshelf to those with the dragon key

	if((GetTag(OBJECT_SELF) == "slv_vala_secret") && ((GetIsPC(oStudent)) || (GetIsDMPossessed(oStudent))))
			{object oBookcase = GetLocalObject(OBJECT_SELF, "oBookcase");
		 if(oBookcase == OBJECT_INVALID)
		 	{oBookcase = GetObjectByTag("slv_vala_bookcase");
			 SetLocalObject(OBJECT_SELF, "oBookcase", oBookcase);
			 }
		int nUseable = GetUseableFlag(oBookcase);
		if(nUseable == FALSE)
			{if(GetItemPossessedBy(oStudent, "slv_deandragon") != OBJECT_INVALID)
				{SetUseableFlag(oBookcase, TRUE);
				 }
			}
		}

	if((GetTag(OBJECT_SELF) == "slv_vala_secret_phoenix") && ((GetIsPC(oStudent)) || (GetIsDMPossessed(oStudent))))
			{object oBookcase = GetLocalObject(OBJECT_SELF, "oBookcase");
		 if(oBookcase == OBJECT_INVALID)
		 	{oBookcase = GetObjectByTag("slv_vala_bookcase_phoenix");
			 SetLocalObject(OBJECT_SELF, "oBookcase", oBookcase);
			 }
		int nUseable = GetUseableFlag(oBookcase);
		if(nUseable == FALSE)
			{if(GetItemPossessedBy(oStudent, "slv_deanphoenix") != OBJECT_INVALID)
				{SetUseableFlag(oBookcase, TRUE);
				 }
			}
		}
		
		if((GetTag(OBJECT_SELF) == "slv_vala_secret_sphinx") && ((GetIsPC(oStudent)) || (GetIsDMPossessed(oStudent))))
			{object oBookcase = GetLocalObject(OBJECT_SELF, "oBookcase");
			 if(oBookcase == OBJECT_INVALID)
			 	{oBookcase = GetObjectByTag("slv_vala_bookcase_sphinx");
				 SetLocalObject(OBJECT_SELF, "oBookcase", oBookcase);
				 }
			object oSphinxBust = GetLocalObject(OBJECT_SELF, "oSphinxBust");
			 if(oSphinxBust == OBJECT_INVALID)
			 	{oSphinxBust = GetObjectByTag("vala_sphinx");
				 SetLocalObject(OBJECT_SELF, "oSphinxBust", oSphinxBust);
				 }
		int nUseable = GetUseableFlag(oBookcase);
		if(nUseable == FALSE)
			{if(GetItemPossessedBy(oStudent, "slv_deansphinx") != OBJECT_INVALID)
				{SetUseableFlag(oBookcase, TRUE);
				 SetUseableFlag(oSphinxBust, TRUE);
				 }
			}
		}

//Opens Dean's Secret Door only to Dean & Registrar Serapheena & DM
		
	if((GetTag(OBJECT_SELF) == "dean_secret") && ((FindSubString(GetTag(GetEnteringObject()), "_dean") != -1) ||(FindSubString(GetTag(GetEnteringObject()), "_registrar") != -1) || (FindSubString(GetTag(GetEnteringObject()), "_magus") != -1) || GetIsDMPossessed(GetEnteringObject())|| GetIsDM(GetEnteringObject())))
			{object oDoor = GetLocalObject(OBJECT_SELF, "oDoor");
			 if(oDoor == OBJECT_INVALID)
			 	{oDoor = GetObjectByTag("Dean_Secret_Door");}
				{}
			object oDoorOpenWP = GetLocalObject(OBJECT_SELF, "oDoorOpenWP");
			 if(oDoorOpenWP == OBJECT_INVALID)
			 	{oDoorOpenWP = GetObjectByTag("dean_secret_open_WP");
				 SetLocalObject(OBJECT_SELF, "oDoorOpenWP", oDoorOpenWP);
			    } 
				{} 
			object oCollBox = GetLocalObject(OBJECT_SELF, "oCollBox");
			 if(oCollBox == OBJECT_INVALID)
			 	{oCollBox = GetObjectByTag("dean_CollBox");}
				{}
			 
			 DestroyObject(oCollBox);
			 DestroyObject(oDoor);
			 object oDoorOpen = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_bookshelf_estate_narrow", GetLocation(oDoorOpenWP), FALSE, "Dean_Secret_Door");
			 SetLocalObject(OBJECT_SELF, "oDoor", oDoorOpen);
			 }
	else if(GetTag(OBJECT_SELF) == "dean_secret")
			{if(d20(1) + GetSkillRank(SKILL_SEARCH, oStudent, FALSE) > 25)
				{SendMessageToPC(oStudent, "A breeze brushes against your skin, seemingly coming through the bookshelves.");
				}
			}	
//Creates useable cabinet/secret door to exit secret stairwell and destroys collision box
	if((GetTag(OBJECT_SELF) == "secret_stairwell") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
			{object oCabinetStatic = GetLocalObject(OBJECT_SELF, "oStatic");
			 DestroyObject(oCabinetStatic);
			 if(oCabinetStatic == OBJECT_INVALID)
			 	{object oCabinetStatic = GetObjectByTag("vala_cabinet_static");
				 DestroyObject(oCabinetStatic);
			     }
				{}		 
		  	 object oCollBox = GetLocalObject(OBJECT_SELF, "oCollBox");
			 DestroyObject(oCollBox); 
		  	 if(oCollBox == OBJECT_INVALID)
			 	{object oCollBox = GetObjectByTag("vala_CollBox");
		    	 DestroyObject(oCollBox); 
		  	    }
				{}
			   
			  object oCabinetWP = GetWaypointByTag("Valamaradace_Cabinet_WP");
			  location lCabinet = GetLocation(oCabinetWP);
			  object oCabinet = GetObjectByTag("vala_cabinet");
			  if(GetIsObjectValid(oCabinet) == FALSE)
				{object oCabinetNew = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_wardrobe_large", lCabinet, FALSE, "vala_cabinet");
				 }
				 {}
			 }
		
//Jumps back and forth through secret door in wall between Valamaradace and secret stairwell
		
	if(((GetTag(OBJECT_SELF) == "secret_stairwell_vala_at") || (GetTag(OBJECT_SELF) == "vala_secret_stairwell_at"))&& ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
		{if(GetLocalInt(OBJECT_SELF, "Localized") != 1)
			{object oCabinet = GetObjectByTag("vala_cabinet");
			 location lJump = GetLocation(GetWaypointByTag(GetTag(OBJECT_SELF) + "_exit"));
			 SetLocalLocation(OBJECT_SELF, "lJump", lJump);
	         AssignCommand(oStudent, ActionJumpToLocation(lJump));
		     SetLocalInt(OBJECT_SELF, "Localized", 1);
			 SetLocked(oCabinet, FALSE);
			 DelayCommand(15.0, ExecuteScript("slv_plc_onclose", oCabinet));
			 }
		 else
		 	{location lJump = GetLocalLocation(OBJECT_SELF, "lJump");
			 object oCabinet = GetObjectByTag("vala_cabinet");
			 AssignCommand(oStudent, ActionJumpToLocation(lJump));
		     SetLocked(oCabinet, FALSE);
			 DelayCommand(15.0, ExecuteScript("slv_plc_onclose", oCabinet));
			 }	
		  }
		  
	//Lights/snuffs torches on approach	
/*	if((GetTag(OBJECT_SELF) == "slv_light") && (GetLocalInt(OBJECT_SELF, "Lit") != 1) && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
		{SendMessageToPC(oStudent, "A candle begins to glow.");
		 object oFlame = GetNearestObjectByTag("slv_flame", OBJECT_SELF, 1);
		 object oCandleLit = CreateObject(OBJECT_TYPE_LIGHT, "lt_slv_candle", GetLocation(oFlame), FALSE);
		 object oCandleFlame = CreateObject(OBJECT_TYPE_PLACED_EFFECT, "n2_fx_candle", GetLocation(oFlame), FALSE);
		 SetLocalObject(OBJECT_SELF, "CandleLit", oCandleLit);
 		 SetLocalObject(OBJECT_SELF, "CandleFlame", oCandleFlame);
 		 SetLocalInt(OBJECT_SELF, "Lit", 1);
		 }
	 else if((GetTag(OBJECT_SELF) == "slv_light") && (GetLocalInt(OBJECT_SELF, "Lit") == 1))
		{SendMessageToPC(oStudent, "A candle snuffs.");
		 object oCandleLit = GetLocalObject(OBJECT_SELF, "CandleLit");
 		 object oCandleFlame = GetLocalObject(OBJECT_SELF, "CandleFlame");
 		 DestroyObject(oCandleLit);
		 DestroyObject(oCandleFlame);
		 SetLocalInt(OBJECT_SELF, "Lit", 0);
		 }	 
*/	
	//Enables usable bookorder quill on approach	
		 
	if((GetTag(OBJECT_SELF) == "slv_bookorder_quill") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	  	{object oQuill = GetLocalObject(OBJECT_SELF, "oQuill");
		 if(oQuill == OBJECT_INVALID)
				{oQuill = GetNearestObjectByTag("slv_bookorder_quill", OBJECT_SELF, 1);
				 SetLocalObject(OBJECT_SELF, "oQuill", oQuill);
				 }
		  SetUseableFlag(oQuill, TRUE);
		  }	
//Enables usable scribing station quill on approach	
		 
	if((GetTag(OBJECT_SELF) == "slv_scribing_station") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	  	{object oQuill = GetLocalObject(OBJECT_SELF, "oQuill");
		 if(oQuill == OBJECT_INVALID)
				{oQuill = GetNearestObjectByTag("slv_station_quill", OBJECT_SELF, 1);
				 SetLocalObject(OBJECT_SELF, "oQuill", oQuill);
				 }
		  SetUseableFlag(oQuill, TRUE);
		 }	
	//Creates usable trashcans on approach	
		 
	if((GetTag(OBJECT_SELF) == "slv_trashcan") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	  	{object oTrashcanWP = GetNearestObjectByTag("slv_trashcan_WP", OBJECT_SELF, 1);
		 object oTrashcan = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_trashcan", GetLocation(oTrashcanWP), FALSE);
		 SetLocalObject(OBJECT_SELF, "Trashcan", oTrashcan);
 		 }	
	//Creates usable sundials on approach	
		 
	if((GetTag(OBJECT_SELF) == "slv_sundial") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	  	{object oSundialWP = GetNearestObjectByTag("slv_sundial_WP", OBJECT_SELF, 1);
		 object oSundial = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_sundial", GetLocation(oSundialWP), FALSE);
		 SetLocalObject(OBJECT_SELF, "Sundial", oSundial);
 		 }	
//Creates usable maps on approach	
			 
		if((GetTag(OBJECT_SELF) == "slv_map") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	  	{object oMapWP = GetNearestObjectByTag("slv_map_WP", OBJECT_SELF, 1);
		 object oMap = CreateObject(OBJECT_TYPE_PLACEABLE, "slv_map", GetLocation(oMapWP), FALSE);
		 SetLocalObject(OBJECT_SELF, "Map", oMap);
 		 }	  		       	
//initializes local Dragonquest variables from p-variables
if((GetTag(OBJECT_SELF) == "slv_dragonquest_init")  && (GetLocalInt(oStudent, "DragonQ_Init") != 1) && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	  	{
 if(GetLocalString(oStudent, "DragonQuestA") == "Open") 
		{SetLocalString(oStudent, "DragonquestA", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestB") == "Open") 
		{SetLocalString(oStudent, "DragonquestB", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestC") == "Open") 
		{SetLocalString(oStudent, "DragonquestC", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestD") == "Open") 
		{SetLocalString(oStudent, "DragonquestD", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestE") == "Open")
	 	{SetLocalString(oStudent, "DragonquestE", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestF") == "Open") 
		{SetLocalString(oStudent, "DragonquestF", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestF") == "Open") 
		{SetLocalString(oStudent, "DragonquestF", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestG") == "Open") 
		{SetLocalString(oStudent, "DragonquestG", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestH") == "Open") 
		{SetLocalString(oStudent, "DragonquestH", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestI") == "Open") 
		{SetLocalString(oStudent, "DragonquestI", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestJ") == "Open") 
		{SetLocalString(oStudent, "DragonquestJ", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestK") == "Open") 
		{SetLocalString(oStudent, "DragonquestK", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestL") == "Open") 
		{SetLocalString(oStudent, "DragonquestL", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestM") == "Open") 
		{SetLocalString(oStudent, "DragonquestM", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestN") == "Open") 
		{SetLocalString(oStudent, "DragonquestN", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestO") == "Open")
	 	{SetLocalString(oStudent, "DragonquestO", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestP") == "Open") 
		{SetLocalString(oStudent, "DragonquestP", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestQ") == "Open") 
		{SetLocalString(oStudent, "DragonquestQ", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestR") == "Open") 
		{SetLocalString(oStudent, "DragonquestR", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestS") == "Open") 
		{SetLocalString(oStudent, "DragonquestS", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestT") == "Open")
	 	{SetLocalString(oStudent, "DragonquestT", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestU") == "Open") 
		{SetLocalString(oStudent, "DragonquestU", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestV") == "Open")
	 	{SetLocalString(oStudent, "DragonquestV", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestW") == "Open") 
		{SetLocalString(oStudent, "DragonquestW", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestX") == "Open") 
		{SetLocalString(oStudent, "DragonquestX", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestY") == "Open")
	 	{SetLocalString(oStudent, "DragonquestY", "Open");
		}
	 if(GetLocalString(oStudent, "DragonQuestZ") == "Open")
		{SetLocalString(oStudent, "DragonquestZ", "Open");
		}
	}
	

	
	if((GetTag(OBJECT_SELF) == "MH_Grove") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	  	{int nHour = GetTimeHour();
			if((nHour >= 1) && (nHour <= 5))
				{SendMessageToPC(oStudent, "Stars sparkle in a black velvet sky through what appears to be a glass dome over the grove. Mysterious rustlings of night creatures move amid the ferns.");
			 	}
			else if(nHour == 6) 
				{SendMessageToPC(oStudent, "A glorious pink dawn is breaking in the sky, seen through what appears to be a glass dome over the grove. Unseen birds twitter sleepily.");
			 	}
			else if((nHour >= 7) && (nHour <= 8))
				{SendMessageToPC(oStudent, "Early morning light tints the grove, pouring down through what appears to be a glass dome overhead.");
			 	}
			else if((nHour >= 9) && (nHour <= 17))
				{SendMessageToPC(oStudent, "Light pours down through what appears to be a glass dome over the grove. The air is sweet and leaves rustle in a soft breeze.");
			 	}
			else if((nHour >= 18) && (nHour <= 19))
				{SendMessageToPC(oStudent, "Late afternoon light cast long shadows through the grove. The glass dome overhead is shot with refracted sparkles that seem to crackle with energy.");
			 	}
			else if(nHour == 20) 
				{SendMessageToPC(oStudent, "Through the glass dome above, twilight fades from orange to dusky blue overhead, the few clouds glowing at their edges long after the light has gone from the rest of the sky.");
			 	}
			else if((nHour >= 21) && (nHour <= 23))
				{SendMessageToPC(oStudent, "Stars sparkle in a black velvet sky through what appears to be a glass dome over the grove. Mysterious rustlings of night creatures move amid the ferns.");
			 	}
			
		}		 	
		
		if((GetTag(OBJECT_SELF) == "MH_Earth") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	  		{object oTeleport = GetLocalObject(OBJECT_SELF, "oTeleport");
			 if(oTeleport == OBJECT_INVALID)
			 	{oTeleport = GetObjectByTag("slv_el_earth");
				 SetLocalObject(OBJECT_SELF, "oTeleport", oTeleport);
				 }
			 SendMessageToPC(oStudent, "The simple mound of dirt sits heaped upon itself, rich and potent with the very essence of Earth.");
			 if((ACR_RetrieveQuestState("slv_deandragon_e", oStudent) > 0) && (ACR_RetrieveQuestState("slv_deandragon_e_earth", oStudent) < 3))
			 	{SetUseableFlag(oTeleport, TRUE);
				}
			 if((ACR_RetrieveQuestState("slv_deansphinx_e_earth", oStudent) > 0) && (ACR_RetrieveQuestState("slv_deansphinx_e_earth", oStudent) < 3))
			 	{SetUseableFlag(oTeleport, TRUE);
				}
			 }
			
		if((GetTag(OBJECT_SELF) == "MH_Air") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	  		{object oTeleport = GetLocalObject(OBJECT_SELF, "oTeleport");
			 if(oTeleport == OBJECT_INVALID)
			 	{oTeleport = GetObjectByTag("slv_el_air");
				 SetLocalObject(OBJECT_SELF, "oTeleport", oTeleport);
				 }
			 SendMessageToPC(oStudent, "Mysterious gusts of wind tug at your hair and garments. They seem to whisper in your ear of the mighty power of Air.");
			 if((ACR_RetrieveQuestState("slv_deandragon_e", oStudent) > 0) && (ACR_RetrieveQuestState("slv_deandragon_e_air", oStudent) < 3))
			 	{SetUseableFlag(oTeleport, TRUE);
				}
		 	if((ACR_RetrieveQuestState("slv_deansphinx_e_air", oStudent) > 0) && (ACR_RetrieveQuestState("slv_deansphinx_e_air", oStudent) < 3))
			 	{SetUseableFlag(oTeleport, TRUE);
				}
			  }
			
		if((GetTag(OBJECT_SELF) == "MH_Fire") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	  		{object oTeleport = GetLocalObject(OBJECT_SELF, "oTeleport");
			 if(oTeleport == OBJECT_INVALID)
			 	{oTeleport = GetObjectByTag("slv_el_fire");
				 SetLocalObject(OBJECT_SELF, "oTeleport", oTeleport);
				 }
			 SendMessageToPC(oStudent, "These flames exhude neither heat nor even light beyond their own flickering tendrils. Their mesmerizing dance, however, takes on more and more meaning the longer you watch. It would be easy to become lost in the elemental power of pure, rarified Fire.");
			 if((ACR_RetrieveQuestState("slv_deandragon_e", oStudent) > 0) && (ACR_RetrieveQuestState("slv_deandragon_e_fire", oStudent) < 4))
			 	{SetUseableFlag(oTeleport, TRUE);
				}
			 if((ACR_RetrieveQuestState("slv_deansphinx_e_fire", oStudent) > 0) && (ACR_RetrieveQuestState("slv_deansphinx_e_fire", oStudent) < 3))
			 	{SetUseableFlag(oTeleport, TRUE);
				}
			 }
			
		if((GetTag(OBJECT_SELF) == "MH_Water") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	  		{object oTeleport = GetLocalObject(OBJECT_SELF, "oTeleport");
			 if(oTeleport == OBJECT_INVALID)
			 	{oTeleport = GetObjectByTag("slv_el_water");
				 SetLocalObject(OBJECT_SELF, "oTeleport", oTeleport);
				 }
			 SendMessageToPC(oStudent, "Rippling, ephemeral and never still, this Water pours from nowhere to splash upon the floor. It makes no pool, however, and though it seems to bead on your skin and run in rivulets over your scalp and into your mouth, the moment you step away you are again dry.");
			 if((ACR_RetrieveQuestState("slv_deandragon_e", oStudent) > 0) && (ACR_RetrieveQuestState("slv_deandragon_e_water", oStudent) < 3))
			 	{SetUseableFlag(oTeleport, TRUE);
				}
			 if((ACR_RetrieveQuestState("slv_deansphinx_e_water", oStudent) > 0) && (ACR_RetrieveQuestState("slv_deansphinx_e_water", oStudent) < 3))
			 	{SetUseableFlag(oTeleport, TRUE);
				}
			 }
			
		if((GetTag(OBJECT_SELF) == "MH_Weave") && ((GetIsPC(oStudent))|| (GetIsDMPossessed(oStudent))))
	  		{SendMessageToPC(oStudent, "Glorious rainbow lights shift within your mind. While you stand here, they seem to take on meaning, as does your life and any mastery of the art you may claim through blood or book, as part of the Weave.");
			 }
			
		if(GetTag(OBJECT_SELF) == "GL3_Up_AT")
		{object oDestination = GetWaypointByTag(GetName(OBJECT_SELF) + "_WP");
		 if ((FindSubString(GetTag(oStudent), "Spellguard") != -1) && (GetLocalInt(oStudent, "Home") == 0)) 
		 	{}
			else
		 	{DelayCommand(3.0, AssignCommand(oStudent, ActionJumpToObject(oDestination, TRUE)));
			}
		 		
		}
		
	//Stacks jump into foyer leading down into Protected Area
	if(FindSubString(GetTag(OBJECT_SELF), "slv_prot_foyer") != -1)
		{object oJumpTo = GetLocalObject(OBJECT_SELF, "oJumpTo");
		 if(oJumpTo == OBJECT_INVALID)
		 	{oJumpTo = GetWaypointByTag(GetTag(OBJECT_SELF) + "_wp");
			 SetLocalObject(OBJECT_SELF, "oJumpTo", oJumpTo);
			 }
		 AssignCommand(oStudent, ActionJumpToObject(oJumpTo));
		 effect eProtectEvil = EffectVisualEffect(VFX_DUR_PROTECTION_EVIL_MAJOR, FALSE);
		 effect eProtectNeg = EffectVisualEffect(SPELL_NEGATIVE_ENERGY_PROTECTION, FALSE);
		 DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eProtectEvil, oStudent, 2.0));
		 DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eProtectNeg, oStudent, 2.0));
		 if(ACR_RetrieveQuestState("slv_deandragon_u", oStudent) == 3) 	
		 	{ACR_AddPersistentJournalQuestEntry("slv_deandragon_u", 4, oStudent);} 			 
			 
		}
		
}