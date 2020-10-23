//Silvy Uni Trigger OnClientEnter.  
//Wynna March 2008

 

#include "acr_area_i"
#include "acr_db_persist_i"
#include "acr_spawn_i"
#include "bbs_include"
#include "silvy_univ_func"
#include "silvy_univ_inc"


void main()
{	
	ACR_AreaOnClientEnter();
	object oArea = OBJECT_SELF;
	object oStudent = GetEnteringObject();
	
		    
	 //Query persistent variables to set locals on entering student
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
	
 //Set the names on dorm doors, both for PC owners and stock NPC owners. 
	 if((GetTag(oArea) == "6d_int_silvy_ladycol_grd_lvl") && (GetLocalInt(oArea, "Initialize") != 1))
			{string sDoor = "_Dorm_1_Door";
			 string sDoorTrig = "_Dorm_1";
			 int nLoop = 1;
			 string sPrefix;
			 string sSchool;
			 while (nLoop < 9)
			 	{if (nLoop == 1)
				 	{sPrefix = "Abj";
					 sSchool = "Abjuration";
					 }
				 else if (nLoop == 2)
				 	{sPrefix = "Con";
					  sSchool = "Conjuration";
					 }
				else if (nLoop == 3)
				 	{sPrefix = "Div";
					  sSchool = "Divination";
					 }
				else if (nLoop == 4)
				 	{sPrefix = "Enc";
					  sSchool = "Enchantment";
					 }
				else if (nLoop == 5)
				 	{sPrefix = "Evo";
					  sSchool = "Evocation";
					 }
				else if (nLoop == 6)
				 	{sPrefix = "Ill";
					  sSchool = "Illusion";
					 }
				else if (nLoop == 7)
				 	{sPrefix = "Nec";
					 sSchool = "Necromancy";
					 }
				else if (nLoop == 8)
				 	{sPrefix = "Tra";
					  sSchool = "Transmutation";
					 }
				 string sPName = GetCampaignString("SLV_UNI", sPrefix + "_Dorm_1_Owner", oArea);
			 	 SetLocalString(oArea, sPrefix + "_Dorm_1_Owner", sPName); 
				 string sPVisitors = GetCampaignString("SLV_UNI", sPrefix + "_Dorm_1_Visitors", oArea);
				 SetLocalString(oArea, sPrefix + "_Dorm_1_Visitors", sPVisitors); 
				 object oDoor = GetObjectByTag(sPrefix + sDoor);
			 	 string sDescription = "This room is assigned to " + sPName + ".";
				 if((sPName != "") && (sPName != "Empty"))
					 	{SetLocalString(oDoor, "Owner", sPName);
						 SetFirstName(oDoor, "Dormitory: " + sPName);
						 if((sPVisitors != "") && (sPVisitors != "None"))
						 	{SetDescription(oDoor, sDescription + "Visitors:  " + sPVisitors);  
							 SetLocalString(oDoor, "Visitors", sPVisitors);
							 }
						 else 
						 	{SetDescription(oDoor, sDescription);  
							 }
						}
					else if((sPName == "") || (sPName == "Empty"))
						{SetFirstName(oDoor, sSchool + " Dormitory #1");
						 }
				
				 nLoop ++;
				  		
				 }
				 
			     
			
			SetLocalInt(oArea, "Initialize", 1);
			}
		 
	if((GetTag(oArea) == "6d_int_silvy_ladycol_class_lvl")&& (GetLocalInt(oArea, "Initialize") != 1))
	   {object oInitialize2 = GetObjectByTag("6d_int_silvy_ladycol_class_lvl_plc");
		object oArea2 = GetArea(oInitialize2);
		object oDoorProc;
		string sPrefix;
		string sProc;
		object oMyDoorTrig = GetFirstObjectInShape(SHAPE_CUBE, 80.0, GetLocation(oInitialize2), FALSE, OBJECT_TYPE_TRIGGER);
		while (oMyDoorTrig != OBJECT_INVALID)
		{if(GetTag(oMyDoorTrig) == "slv_dorm")
			{oDoorProc = GetObjectByTag(GetName(oMyDoorTrig) + "_Door");
			 sPrefix = GetStringLeft(GetTag(oDoorProc), 3);
			 if(sPrefix == "Abj")
			 	{sProc = "Abjuration Proctor, Jillian Jeriat" ;
			    }
			 if(sPrefix == "Con")
			 	{sProc = "Conjuration Proctor, Yellowclaw" ;
			    }
			 //if(sPrefix == "Div")
			 //	{sProc = "Divination Proctor, Imogene Glasswright" ;
			  //  }
			 if(sPrefix == "Enc")
			 	{sProc = "Enchantment Proctor, Nailo Solisel" ;
			    }
			 if(sPrefix == "Evo")
			 	{sProc = "Evocation Proctor, Ringswallow Roondar" ;
			    }
			 if(sPrefix == "Ill")
			 	{sProc = "Illusion Proctor, Heironymus Nimblequick" ;
			    }
			 if(sPrefix == "Nec")
			 	{sProc = "Necromancy Proctor, Brun Neblus" ;
			    }
			 if(sPrefix == "Tra")
			 	{sProc = "Transmutation Proctor, Norain Delving" ;
			    }
			 	
			 if(sPrefix != "Div")
				 {
				 SetFirstName(oDoorProc, sProc);
			     SetCampaignString("SLV_UNI", GetName(oMyDoorTrig) + "_Owner", sProc, oArea2);
			     SetDescription(oDoorProc, "This room is assigned to " + sProc + ".");
			     }
			 }
		 oMyDoorTrig = GetNextObjectInShape(SHAPE_CUBE, 80.0, GetLocation(oInitialize2), FALSE, OBJECT_TYPE_TRIGGER);
		}
	SetLocalInt(oArea2, "Initialize", 1);
	}
		



	 

}