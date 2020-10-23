////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Configuration File
//     Filename : acf_trg_onenter.nss
//    $Revision:: 236        $ current version of the file
//        $Date:: 2007-01-21#$ date the file was created or modified
//       Author : Cipher
//
//    Var Prefix:
//  Dependencies:
//
//  Description
//  This script calls the ACR's OnEnter code for triggers, and any
//  custom code a server may need. It is not updated in ACR updates.
//
//  Revision History
//  2007/01/20  Cipher  Inception
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
#include "acr_creature_i"
#include "acr_spawn_i"



void main()
{ 
   
    // Custom code goes here.
			object oDM = GetItemActivator();
			int iRadius = GetLocalInt(oDM, "iRadiusFlocking");
			int iArea = GetLocalInt(oDM, "iAreaFlocking");
			object oFlocker = GetItemActivatedTarget();
			object oOwner = OBJECT_SELF;
			int iFlocking = GetLocalInt(oFlocker, "ACR_FLOCKING");
			if((iFlocking==0) && (GetIsDM(oOwner)))
				{SetLocalInt(oFlocker, "ACR_FLOCKING", 1);
				//SendMessageToAllDMs("iFlocking was 0 is 1");
				}
			else if((iFlocking==1)  && (GetIsDM(oOwner)))
				{SetLocalInt(oFlocker, "ACR_FLOCKING", 0);
				//SendMessageToAllDMs("iFlocking was 1 is 0");
				}
					
			
			//Toggle off functions for Omega Wand
							if(GetLocalInt(oFlocker, "ACR_FLOCKING") == 0)
										{ClearAllActions(TRUE);
										 //SendMessageToAllDMs(GetTag(oFlocker) + " flocking off");
										 if(iRadius != 0)
											{object oChild = GetFirstObjectInShape(SHAPE_SPHERE, 25.0, GetLocation(oFlocker), FALSE, OBJECT_TYPE_CREATURE); 
					 						 while(oChild != OBJECT_INVALID) 
												{if((GetIsPC(oChild) == FALSE) && (GetIsDM(oChild) == FALSE) && (GetLocalInt(oChild, "Flocked") != 0))
													{//SendMessageToAllDMs(GetTag(oChild) + " flocking off");
								 					 ClearAllActions(TRUE);
													 SetLocalInt(oChild, "ACR_FLOCKING", 0);
				 									 }
											 	oChild = GetNextObjectInShape(SHAPE_SPHERE, 25.0, GetLocation(oFlocker), FALSE, OBJECT_TYPE_CREATURE);
												}
											 SetLocalInt(oDM, "iRadiusFlocking", 0);
											 }
										else if(iArea != 0)
											{object oChild = GetFirstObjectInArea(GetArea(oFlocker)); 
					 						 while(oChild != OBJECT_INVALID) 
												{if((GetObjectType(oChild) == OBJECT_TYPE_CREATURE) && (GetIsPC(oChild) == FALSE) && (GetLocalInt(oChild, "Flocked") != 0))
													{//SendMessageToAllDMs(GetTag(oChild) + " flocking off");
								 					 ClearAllActions(TRUE);
													 SetLocalInt(oChild, "ACR_FLOCKING", 0);
				 									 }
											 	oChild = GetNextObjectInArea(GetArea(oFlocker));
												}
											 SetLocalInt(oDM, "iAreaFlocking", 0);
											 }
										return;
									 	}
			
			
			//Toggle on functions for spawn event and Omega Wand
			
			if(GetLocalInt(oFlocker, "ACR_FLOCKING") == 1) 
					{object oMobDestination = GetNearestObject(OBJECT_TYPE_PLACEABLE, oFlocker, 1);
					 SendMessageToAllDMs("oMobDestination = " + GetTag(oMobDestination) + "/" +GetName(oMobDestination));
					 string sArea = GetName(GetArea(oFlocker));
					 //Set the flocking destinations and execute the flocking script	
					 object oRandom1 = GetNearestObject(OBJECT_TYPE_WAYPOINT | OBJECT_TYPE_PLACED_EFFECT | OBJECT_TYPE_PLACEABLE | OBJECT_TYPE_CREATURE, oFlocker, Random(10));
					 SendMessageToAllDMs("oRandom1a = " + GetTag(oRandom1) + "/" +GetName(oRandom1));
					 if((FindSubString(GetName(oRandom1), "Sky") != -1) || (FindSubString(GetName(oRandom1), "Walkmesh") != -1) || (FindSubString(GetName(oRandom1), "Boat") != -1))
							{oRandom1 = oMobDestination;
							SendMessageToAllDMs("oRandom1b = " + GetTag(oRandom1) + "/" +GetName(oRandom1));
					         }
					 
					 if((GetObjectType(oRandom1) == OBJECT_TYPE_WAYPOINT) && (FindSubString(GetTag(oRandom1), "SPAWN") == -1))
								{oRandom1 = oMobDestination;}
								
					SendMessageToAllDMs("oRandom1c = " + GetTag(oRandom1) + "/" +GetName(oRandom1));
					if(oRandom1==OBJECT_INVALID)
						{SendMessageToAllDMs("oRandom1=OBJECT_INVALID");} 				
						SendMessageToAllDMs(GetTag(oFlocker) + " flocking");
						SetLocalInt(oFlocker, "ACR_FLOCKING", 1);
									 
						if(iRadius != 0)
							{object oChild = GetFirstObjectInShape(SHAPE_SPHERE, 25.0, GetLocation(oFlocker), FALSE, OBJECT_TYPE_CREATURE); 
					    	 while(oChild != OBJECT_INVALID) 
								{if((GetIsPC(oChild) == FALSE) && (GetIsDM(oChild) == FALSE) && (GetLocalInt(oChild, "Flocked") != 1))
									{SendMessageToAllDMs(GetTag(oChild) + " flocking");
									 SetLocalInt(oChild, "ACR_FLOCKING", 1);
							 		 DelayCommand(5.0, ExecuteScript("acf_cre_flocking", oChild));
									 }
								 oChild = GetNextObjectInShape(SHAPE_SPHERE, 25.0, GetLocation(oFlocker), FALSE, OBJECT_TYPE_CREATURE);
								}
								
								SetLocalInt(oDM, "iRadiusFlocking", 0);
							}
							
							if(iArea != 0)
								{object oChild = GetFirstObjectInArea(GetArea(oFlocker)); 
		 						 while(oChild != OBJECT_INVALID) 
									{if((GetIsPC(oChild) == FALSE) && (GetIsDM(oChild) == FALSE) && (GetLocalInt(oChild, "Flocked") != 1))
										{ SetLocalInt(oChild, "ACR_FLOCKING", 1);
					 		 			  DelayCommand(5.0, ExecuteScript("acf_cre_flocking", oChild));
										}
								 	oChild = GetNextObjectInArea(GetArea(oFlocker));
									}
								 SetLocalInt(oDM, "iAreaFlocking", 0);
								  }
							
							
							if((GetIsInCombat(oFlocker) == FALSE) && (!GetIsPC(oFlocker)) && (!GetIsDM(oFlocker)) && (GetLocalInt(oFlocker, "ACR_FLOCKING") == 1))
								{ClearAllActions(FALSE);
								 SendMessageToAllDMs(GetTag(oFlocker) + " moving to " + GetTag(oRandom1)  + "/" + GetName(oRandom1));
								 AssignCommand(oFlocker, ActionMoveToObject(oRandom1, FALSE, 1.0f));
								 DelayCommand(IntToFloat(Random(60) + 60), ExecuteScript("acf_cre_flocking", oFlocker));
								 }
					}
					
						
}