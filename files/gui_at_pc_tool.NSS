// script_name: gui_at_pc_tool
// Date: 03-09-2007
/*

Description:

Script called from PC Tools GUI element.  This one script handles all of the
functionality for Adlertal PC Tools

Base on Heed´s PC Tools
	
*/



#include "x0_i0_position"


/*  Constants  */

const int AT_PC_TOOLS_DIE_STANDARD = 100;
const int AT_PC_TOOLS_DIE_SAVE = 200;
const int AT_PC_TOOLS_DIE_ABILITY = 300;
const int AT_PC_TOOLS_DIE_SKILL = 400;
const int AT_PC_TOOLS_EMOTE = 500;

const string SCREEN_AT_PC_TOOLS = "SCREEN_AT_PC_TOOLS";
const string AT_PC_TOOLS_XML = "at_tools.xml";




/*     Configuration    */
//Enter the string tag of the required items here if you want to require
//the PC to be in possession of a particular item before he/she can create
//the object (tent or campfire).
//If empty string (""), then that object can always be created.


//Enter the string tag of the required items here if you want to require
//the PC to be in possession of a particular item before he/she can use a
//VFX prop.
//If empty string (""), then that VFX prop can always be used.
const string AT_PCTOOLS_VFX_DRINKBEER_ITEM = "";
const string AT_PCTOOLS_VFX_DRUMA_ITEM = "";
const string AT_PCTOOLS_VFX_DRUMB_ITEM = "";
const string AT_PCTOOLS_VFX_FLUTEA_ITEM = "";
const string AT_PCTOOLS_VFX_FLUTEB_ITEM = "";
const string AT_PCTOOLS_VFX_MANDOLINA_ITEM = "";
const string AT_PCTOOLS_VFX_MANDOLINB_ITEM = "";
const string AT_PCTOOLS_VFX_MANDOLINC_ITEM = "";
const string AT_PCTOOLS_VFX_PAN_ITEM = "";
const string AT_PCTOOLS_VFX_RAKE_ITEM = "";
const string AT_PCTOOLS_VFX_SHOVEL_ITEM = "";
const string AT_PCTOOLS_VFX_SMITHYHAMMER_ITEM = "";
const string AT_PCTOOLS_VFX_SPOON_ITEM = "";
const string AT_PCTOOLS_VFX_WINE_ITEM = "";




//Enter the text that will be displayed for the corresponding custom buttons.
const string AT_PCTOOLS_CUSTOM1_TEXT = "Custom 1";
const string AT_PCTOOLS_CUSTOM2_TEXT = "Custom 2";
const string AT_PCTOOLS_CUSTOM3_TEXT = "Custom 3";
const string AT_PCTOOLS_CUSTOM4_TEXT = "Custom 4";
const string AT_PCTOOLS_CUSTOM5_TEXT = "Custom 5";
const string AT_PCTOOLS_CUSTOM6_TEXT = "Custom 6";
const string AT_PCTOOLS_CUSTOM7_TEXT = "Custom 7";
const string AT_PCTOOLS_CUSTOM8_TEXT = "Custom 8";
const string AT_PCTOOLS_CUSTOM9_TEXT = "Custom 9";

//Item/Prop failure text.
const string AT_NO_ITEM_MESSAGE = "You need to possess a specific item to do this.";


//Colour strings for feedback messages.
const string AT_PCTOOLS_COLOUR1 = "<color=#C1AB89>";
const string AT_PCTOOLS_COLOUR2 = "<color=#EFD4AC>";
const string AT_PCTOOLS_COLOUR_END = "</c>";



/*  End Configuration  */


/*  Function Prototypes  */

//removes all local variables on oPC associated with PC Tools functionality
//nbroadcast = TRUE will clear the broadcast mode int, FALSE will not
void AT_PCTools_CleanPCLocals(object oPC, int nBroadcast = TRUE);

//called from the oncreate event -- setup custom buttons, etc.
void AT_PCTools_OnGUICreate(object oPC);


//displays the date/time for the PC
void AT_PCTools_GetTime(object oPC);


//toggle AFK vfx on oPC
void AT_PCTools_ToggleAFK(object oPC);


//Do an emote
void AT_PCTools_DoEmote(object oPC);

//applies/removes the vfx props Typ 1
void AT_PCTools_ApplyVFX1(object oPC, string sVFX);

//applies/removes the vfx props Typ 2
void AT_PCTools_ApplyVFX2(object oPC, string sVFX);

//applies/removes the vfx props Typ 3
void AT_PCTools_ApplyVFX3(object oPC, string sVFX);

//applies the vfx props non Remove other
void AT_PCTools_ApplyVFX4(object oPC, string sVFX);







//Function handles the execution of code for the 9 custom buttons.
//See the function implementation to add your own code for the behaviour
//of these buttons.  Set their display name via the constants above.
void AT_PCTools_CustomButton(object oPC, int nButton);
		   
//wrapper function for PlayCustomAnimation() so it is a void function
//can be called via DelayCommand or queued.
void AT_PCTools_PlayCustomAnim(object oObject, string sAnimationName, int nLooping, float fSpeed = 1.0);

//destroys all objects in  oObject's inventory (not slots)
void AT_DestroyAllInventory(object oObject);

//Converts an integer to a string.  If the integer is 1-9 it will convert it to
//a string with a leading zero. i.e. 7 will be returned "07".  Otherwise, it
//just performs a regular Int to String conversion.
string AT_IntToLeadingZeroString(int nNumber);

//Returns item possessed by oCreature.  If found, it will cache that object
//as a local on oCreature and any subsequent call by this function will
//use the local to reference the object instead of doing an inventory
//iteration search via GetItemPossessedBy().
object AT_GetItemPossessedBy_Cached(object oCreature, string sItemTag);

//called from a delaycommand when an object is created.  Will only destroy
//and decrement the count of object instances if the object actually exists.
void AT_PCTools_DestroyAndDecrement(object oPC, object oObject, string sObject);


void main(string sParamString1, int nParamInt, float fParamFloat, string sParamString2)
{
   object oPC = OBJECT_SELF;
   int nEventType = FloatToInt(fParamFloat);
   int nEventSub = nParamInt;
   int nString1 = StringToInt(sParamString1);

   //workaround code for the fact that the GUI call to execute the server
   //script is fired on the DM when he is possessing an NPC.  In short, all
   //commands get run on the DM object instead of the possessed creature.
   //DM's must select the creature they want to control and do any PC Tools
   //commands before possessing it (i.e. emotes, vfx's will be done on
   //the creature if it's selected and a DM is using PC Tools). For a DM
   //to use the tools on himself he just needs to have himself selected.
   object oTarget = GetPlayerCurrentTarget(oPC);   
   
   if (GetIsDM(oPC) && GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
      {
      oPC = oTarget;
      }
   
  
   switch (nEventType)
       {
	   //init events
	   case 1:
       switch (nEventSub)
	       {
		   //gui popup
		   case 1:
		   DisplayGuiScreen(OBJECT_SELF, SCREEN_AT_PC_TOOLS, FALSE, AT_PC_TOOLS_XML);
		   break;
		   //on add
		   case 2:
		   AT_PCTools_CleanPCLocals(oPC, FALSE);
		   break;
		   //on remove
		   case 3:
		   AT_PCTools_CleanPCLocals(oPC, FALSE);		   
		   break;
		   //on create
		   case 4:
           AT_PCTools_OnGUICreate(oPC);			   
		   break;		   		   		   
		   }	   
	   break;
	   
	   //quick button events
	   case 2:
       switch (nEventSub)
	       {
		   //save character
		   case 1:
           //AT_PCTools_SaveCharacter(oPC);
		   break;
		   //get time
		   case 2:
           AT_PCTools_GetTime(oPC);
		   break;
		   //make location safe
		   case 3:
		   // AT_PCTools_MakSafeLocation(oPC);
		   break;
		   //make campfire
		   case 4:
           // AT_PCTools_Create(oPC, "Campfire");
		   break;
		   //pitch tent
		   case 5:
           // AT_PCTools_Create(oPC, "Tent");
		   break;
		   //toggle AFK
		   case 6:
		   AT_PCTools_ToggleAFK(oPC);
		   break;		   		   		   
		   }		   
	   break;
	   
	   //die roll events
	   case 3:
       switch (nEventSub)
	       {
		   case 100:
		   
		   break;
		   
		   
		   case 101:
		   break;
		   
		   
		   case 102:
		   break;
		   
		   
		   case 103:
		   break;
		   case 104:
		   break;

		   case 998:
           DeleteLocalInt(oPC, "AT_PCTOOLS_BROADCAST_TYPE");		   
		   break;
		   
		   //private button chosen
		   case 999:
           SetLocalInt(oPC, "AT_PCTOOLS_BROADCAST_TYPE", 1);
		   break;
	   

		   case 1000:
		   break;		   		   		   
		   }		   	   
	   break;
	   
	   //emote events
	   case 4:
	   //emote type chosen
	   if (nEventSub < 100 && nEventSub > 0)
	      {
		  SetLocalString(oPC, "AT_PC_TOOLS_ANIM_TYPE", sParamString1);
		  SetLocalString(oPC, "AT_PC_TOOLS_ANIM_TYPE_2", sParamString2);
		  //using nEventSub as delay for second animation call if
		  //a second animation is given (workaround since the float param
		  //is used for the main event types -- second animation was an
		  //afterthought -- delays must be entered in xml as 10x actual
		  //value [i.e. delay of 2.5 is entered as 25] ).
		  if (sParamString2 != "")
		     {
			 SetLocalFloat(oPC, "AT_PC_TOOLS_ANIM_DELAY", IntToFloat(nEventSub)/10.0);
			 }		  
		  return;
		  }
	   //do emote or clear emote choice	  
       switch (nEventSub)
	       {   
		   //clear emote
		   case 100:
		   DeleteLocalString(oPC, "AT_PC_TOOLS_ANIM_TYPE");
		   break;
		   
		   //cease emote
		   case 101:
		   SetLocalString(oPC, "AT_PC_TOOLS_ANIM_TYPE", sParamString1);
           AT_PCTools_DoEmote(oPC);
     	   break;
		   
		   //one-shot emote
		   case 102:
           DeleteLocalInt(oPC, "AT_PC_TOOLS_ANIM_LOOP");
		   break;
		   
		   //looping emote
		   case 103:
           SetLocalInt(oPC, "AT_PC_TOOLS_ANIM_LOOP", 1);
		   break;
		   		   		   		   		   		   		   
		   //do emote
		   case 1000:
		   AT_PCTools_DoEmote(oPC);
		   break;		   
		   }	   
	   break;
       
	   //vfx request event	  default for right Hands
	   case 5:
       AT_PCTools_ApplyVFX1(oPC, sParamString1);
	   break;
	   
	   //vfx request event default Back Part   
	   case 6:
       AT_PCTools_ApplyVFX2(oPC, sParamString1);
	   break;
	   
	   //vfx request event default Belt Part  
	   case 7:
       AT_PCTools_ApplyVFX3(oPC, sParamString1);
	   break;	   
	   
	   //vfx request event no delete other	   
	   case 8:
       AT_PCTools_ApplyVFX4(oPC, sParamString1);
	   break;	   
	   

	   }
   
 
}

void AT_PCTools_CleanPCLocals(object oPC, int nBroadcast = TRUE)
{
   DeleteLocalString(oPC, "AT_PC_TOOLS_ANIM_TYPE"); 
   DeleteLocalString(oPC, "AT_PC_TOOLS_ANIM_TYPE_2");      
   DeleteLocalFloat(oPC, "AT_PC_TOOLS_ANIM_DELAY");
   
   if (nBroadcast)
      {	     
      DeleteLocalInt(oPC, "AT_PCTOOLS_BROADCAST_TYPE");
      DeleteLocalInt(oPC, "AT_PC_TOOLS_ANIM_LOOP");	  
      }
}

void AT_PCTools_OnGUICreate(object oPC)
{
   //big ass string -- help text -- easier to edit if present in script
   //rather than the xml.
   string sHelp = AT_PCTOOLS_COLOUR2+"<b><i>Help:</i></b>                               "+
   AT_PCTOOLS_COLOUR_END+
   ""+   
   "Helptext come here.....";
   
   
   // Default Text aus XML ersetzenn 
      
   SetGUIObjectText(oPC, SCREEN_AT_PC_TOOLS, "PC_TOOLS_CUSTOM1_BUTTON", -1,
				   AT_PCTOOLS_CUSTOM1_TEXT);
   SetGUIObjectText(oPC, SCREEN_AT_PC_TOOLS, "PC_TOOLS_CUSTOM2_BUTTON", -1,
				   AT_PCTOOLS_CUSTOM2_TEXT);
   SetGUIObjectText(oPC, SCREEN_AT_PC_TOOLS, "PC_TOOLS_CUSTOM3_BUTTON", -1,
				   AT_PCTOOLS_CUSTOM3_TEXT);
   SetGUIObjectText(oPC, SCREEN_AT_PC_TOOLS, "PC_TOOLS_CUSTOM4_BUTTON", -1,
				   AT_PCTOOLS_CUSTOM4_TEXT);
   SetGUIObjectText(oPC, SCREEN_AT_PC_TOOLS, "PC_TOOLS_CUSTOM5_BUTTON", -1,
				   AT_PCTOOLS_CUSTOM5_TEXT);
   SetGUIObjectText(oPC, SCREEN_AT_PC_TOOLS, "PC_TOOLS_CUSTOM6_BUTTON", -1,
				   AT_PCTOOLS_CUSTOM6_TEXT);
   SetGUIObjectText(oPC, SCREEN_AT_PC_TOOLS, "PC_TOOLS_CUSTOM7_BUTTON", -1,
				   AT_PCTOOLS_CUSTOM7_TEXT);
   SetGUIObjectText(oPC, SCREEN_AT_PC_TOOLS, "PC_TOOLS_CUSTOM8_BUTTON", -1,
				   AT_PCTOOLS_CUSTOM8_TEXT);
   SetGUIObjectText(oPC, SCREEN_AT_PC_TOOLS, "PC_TOOLS_CUSTOM9_BUTTON", -1,
				   AT_PCTOOLS_CUSTOM9_TEXT);

   SetGUIObjectText(oPC, SCREEN_AT_PC_TOOLS, "PC_TOOLS_HELP_TEXT", -1,
				   sHelp);
        /*                                 
   if (AT_PCTOOLS_DMFI_PLUGIN_PC == 1)
      {
      SetLocalGUIVariable(oPC, SCREEN_AT_PC_TOOLS, 600, "true");
      }
      else
      {
      SetLocalGUIVariable(oPC, SCREEN_AT_PC_TOOLS, 600, "false");      
      }
	  
	  */
      
}



void AT_PCTools_GetTime(object oPC)
{
   int nHour = GetTimeHour();
   int nMinute = GetTimeMinute();
   int nDay = GetCalendarDay();
   int nMonth = GetCalendarMonth();
   int nYear = GetCalendarYear();
   string sDay;
   string sMonth;
   string sAm;
   string sMsg;

/* GreyHawk Calendar   	  
   switch (nDay)
       {
       case 1:
       case 8:
       case 15:
       case 22:
       sDay = "Starday";
       break;
	   
       case 2:
       case 9:
       case 16:
       case 23:
       sDay = "Sunday";
       break;
	   
       case 3:
       case 10:
       case 17:
       case 24:
       sDay = "Moonday";
       break;
	   
       case 4:
       case 11:
       case 18:
       case 25:
       sDay = "Godsday";
       break;
	   
       case 5:
       case 12:
       case 19:
       case 26:
       sDay = "Waterday";
       break;
	   
       case 6:
       case 13:
       case 20:
       case 27:
       sDay = "Earthday";
       break;
	   
       case 7:
       case 14:
       case 21:
       case 28:
       sDay = "Freeday";
       break;	   	   	   	   	  	   	   
       }
   
   switch (nMonth)
       {
       case 1:
       sMonth = "Fireseek";
       break;
	   
       case 2:
       sMonth = "Readying";
       break;
	   
       case 3:
       sMonth = "Coldeven";
       break;
	   
       case 4:
       sMonth = "Planting";
       break;
	   
       case 5:
       sMonth = "Flocktime";
       break;
	   
       case 6:
       sMonth = "Wealsun";
       break;
	   
       case 7:
       sMonth = "Reaping";
       break;
	   
       case 8:
       sMonth = "Goodmonth";
       break;
	   
       case 9:
       sMonth = "Harvester";
       break;
	   
       case 10:
       sMonth = "Patchwall";
       break;
	   
       case 11:
       sMonth = "Ready'reat";
       break;
	   
       case 12:
       sMonth = "Sunsebb";
       break;	   	   	   	   	   	   	   	   	   	  	   	   
       }
*/	   
   //Gregorian(ish) Calendar   	  
   switch (nDay)
       {
       case 1:
       case 8:
       case 15:
       case 22:
       sDay = "Sunday";
       break;
	   
       case 2:
       case 9:
       case 16:
       case 23:
       sDay = "Monday";
       break;
	   
       case 3:
       case 10:
       case 17:
       case 24:
       sDay = "Tuesday";
       break;
	   
       case 4:
       case 11:
       case 18:
       case 25:
       sDay = "Wednesday";
       break;
	   
       case 5:
       case 12:
       case 19:
       case 26:
       sDay = "Thursday";
       break;
	   
       case 6:
       case 13:
       case 20:
       case 27:
       sDay = "Friday";
       break;
	   
       case 7:
       case 14:
       case 21:
       case 28:
       sDay = "Saturday";
       break;	   	   	   	   	  	   	   
       }
   
   switch (nMonth)
       {
       case 1:
       sMonth = "January";
       break;
	   
       case 2:
       sMonth = "February";
       break;
	   
       case 3:
       sMonth = "March";
       break;
	   
       case 4:
       sMonth = "April";
       break;
	   
       case 5:
       sMonth = "May";
       break;
	   
       case 6:
       sMonth = "June";
       break;
	   
       case 7:
       sMonth = "July";
       break;
	   
       case 8:
       sMonth = "August";
       break;
	   
       case 9:
       sMonth = "September";
       break;
	   
       case 10:
       sMonth = "October";
       break;
	   
       case 11:
       sMonth = "November";
       break;
	   
       case 12:
       sMonth = "December";
       break;	   	   	   	   	   	   	   	   	   	  	   	   
       }
	   
   if (nHour > 12)
      {
      nHour = nHour - 12;
      sAm = "pm";
      }
      else
      {
      sAm = "am";
      }	

   //GetTimeMinute() is whacked -- best we can do is hour level precision.
   //Remove if the function ever gets fixed.   	  
   nMinute = 0; 	  
     
   sMsg = sDay + ", " + sMonth + " " + AT_IntToLeadingZeroString(nDay) + 
          ", " + IntToString(nYear) + "." + "   " + IntToString(nHour) +
     	  " : " + AT_IntToLeadingZeroString(nMinute) + " " + sAm;


   SendMessageToPC(oPC, AT_PCTOOLS_COLOUR1 + "Date/Time is:  " + sMsg);

}




void AT_PCTools_ToggleAFK(object oPC)
{
   effect eAFK = SupernaturalEffect(SetEffectSpellId(EffectNWN2SpecialEffectFile("fx_at_afk"), -1999));
   
   effect eFirst = GetFirstEffect(oPC);
   
   while (GetIsEffectValid(eFirst))
       {
	   if (GetEffectSpellId(eFirst) == -1999)
	      {
		  RemoveEffect(oPC, eFirst);
		  return;
		  }
	   eFirst = GetNextEffect(oPC);	  
	   }
   
   ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAFK, oPC);   
}



void AT_PCTools_DoEmote(object oPC)
{
   string sEmote = GetLocalString(oPC, "AT_PC_TOOLS_ANIM_TYPE");
   string sEmote2 = GetLocalString(oPC, "AT_PC_TOOLS_ANIM_TYPE_2");   
   int nLoop = GetLocalInt(oPC, "AT_PC_TOOLS_ANIM_LOOP");
   float fDelay = GetLocalFloat(oPC, "AT_PC_TOOLS_ANIM_DELAY");


   if (sEmote != "")
      {
	  if (sEmote == "%" || sEmote2 != "")
	     {
		 nLoop = 0;		 
		 }
      AT_PCTools_PlayCustomAnim(oPC, sEmote, nLoop);

	  if (sEmote2 != "")
	     {
		 nLoop = 1;
		 DelayCommand(fDelay, AT_PCTools_PlayCustomAnim(oPC, sEmote2, nLoop));
		 }
      }
	  
   AT_PCTools_CleanPCLocals(oPC, FALSE);
      
   SetLocalGUIVariable(oPC, SCREEN_AT_PC_TOOLS, AT_PC_TOOLS_EMOTE, "TRUE");   
   DelayCommand(0.2, SetLocalGUIVariable(oPC, SCREEN_AT_PC_TOOLS, AT_PC_TOOLS_EMOTE, "FALSE"));      
}

// add new and remove an other default right Hand
void AT_PCTools_ApplyVFX1(object oPC, string sVFX)
{
   string sEffect = sVFX;
   effect eProp = SupernaturalEffect(SetEffectSpellId(EffectNWN2SpecialEffectFile(sEffect), 1991));
   effect eFirst = GetFirstEffect(oPC);
   object oItem;
   string sItem;
    
    
   
   if (sVFX == "drinkbeer")
      {
      sItem = AT_PCTOOLS_VFX_DRINKBEER_ITEM;
      }
      else
      if (sVFX == "druma")
      {
      sItem = AT_PCTOOLS_VFX_DRUMA_ITEM;
      }
      else
      if (sVFX == "drumb")
      {
      sItem = AT_PCTOOLS_VFX_DRUMB_ITEM;
      }
      else
      if (sVFX == "flutea")
      {
      sItem = AT_PCTOOLS_VFX_FLUTEA_ITEM;
      }
      else
      if (sVFX == "fluteb")
      {
      sItem = AT_PCTOOLS_VFX_FLUTEB_ITEM;
      }            
      else
      if (sVFX == "mandolina")
      {
      sItem = AT_PCTOOLS_VFX_MANDOLINA_ITEM;
      }
      else
      if (sVFX == "mandolinb")
      {
      sItem = AT_PCTOOLS_VFX_MANDOLINB_ITEM;
      }
      else
      if (sVFX == "mandolinc")
      {
      sItem = AT_PCTOOLS_VFX_MANDOLINC_ITEM;
      }      
      else
      if (sVFX == "pan")
      {
      sItem = AT_PCTOOLS_VFX_PAN_ITEM;
      }      
      else
      if (sVFX == "rake")
      {
      sItem = AT_PCTOOLS_VFX_RAKE_ITEM;
      }             
      else
      if (sVFX == "shovel")
      {
      sItem = AT_PCTOOLS_VFX_SHOVEL_ITEM;
      } 
      else
      if (sVFX == "smithyhammer")
      {
      sItem = AT_PCTOOLS_VFX_SMITHYHAMMER_ITEM;
      } 
      else
      if (sVFX == "spoon")
      {
      sItem = AT_PCTOOLS_VFX_SPOON_ITEM;
      }      
      else
      if (sVFX == "wine")
      {
      sItem = AT_PCTOOLS_VFX_WINE_ITEM;
      }
       
                              
   if (sItem != "" && GetIsPC(oPC) && !GetIsDM(oPC))
      {
      oItem = AT_GetItemPossessedBy_Cached(oPC, sItem);
         
      if (!GetIsObjectValid(oItem))
         {
         SendMessageToPC(oPC, AT_PCTOOLS_COLOUR1 + AT_NO_ITEM_MESSAGE);
         return;
         }
      }
         
   while (GetIsEffectValid(eFirst))
       {
	   if (GetEffectSpellId(eFirst) == 1991)
	      {
		  RemoveEffect(oPC, eFirst);
		  break;
		  }
	   eFirst = GetNextEffect(oPC);	  
	   }   
   
   if (sVFX == "%")
      {
	  return;	     	  
	  }


    object objInHand = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);

    if(objInHand != OBJECT_INVALID)
    {
      ActionUnequipItem(objInHand);;
    }

	  
	  
	  
   ApplyEffectToObject(DURATION_TYPE_PERMANENT, eProp, oPC);
   
}


// add new and remove an other default Backpart
void AT_PCTools_ApplyVFX2(object oPC, string sVFX)
{
   string sEffect = sVFX;
   effect eProp = SupernaturalEffect(SetEffectSpellId(EffectNWN2SpecialEffectFile(sEffect), 1992));
   effect eFirst = GetFirstEffect(oPC);
   object oItem;
   string sItem;
    
   
   if (sVFX == "drinkbeer")
      {
      sItem = AT_PCTOOLS_VFX_DRINKBEER_ITEM;
      }
      else
      if (sVFX == "druma")
      {
      sItem = AT_PCTOOLS_VFX_DRUMA_ITEM;
      }
      else
      if (sVFX == "drumb")
      {
      sItem = AT_PCTOOLS_VFX_DRUMB_ITEM;
      }
      else
      if (sVFX == "flutea")
      {
      sItem = AT_PCTOOLS_VFX_FLUTEA_ITEM;
      }
      else
      if (sVFX == "fluteb")
      {
      sItem = AT_PCTOOLS_VFX_FLUTEB_ITEM;
      }            
      else
      if (sVFX == "mandolina")
      {
      sItem = AT_PCTOOLS_VFX_MANDOLINA_ITEM;
      }
      else
      if (sVFX == "mandolinb")
      {
      sItem = AT_PCTOOLS_VFX_MANDOLINB_ITEM;
      }
      else
      if (sVFX == "mandolinc")
      {
      sItem = AT_PCTOOLS_VFX_MANDOLINC_ITEM;
      }      
      else
      if (sVFX == "pan")
      {
      sItem = AT_PCTOOLS_VFX_PAN_ITEM;
      }      
      else
      if (sVFX == "rake")
      {
      sItem = AT_PCTOOLS_VFX_RAKE_ITEM;
      }             
      else
      if (sVFX == "shovel")
      {
      sItem = AT_PCTOOLS_VFX_SHOVEL_ITEM;
      } 
      else
      if (sVFX == "smithyhammer")
      {
      sItem = AT_PCTOOLS_VFX_SMITHYHAMMER_ITEM;
      } 
      else
      if (sVFX == "spoon")
      {
      sItem = AT_PCTOOLS_VFX_SPOON_ITEM;
      }      
      else
      if (sVFX == "wine")
      {
      sItem = AT_PCTOOLS_VFX_WINE_ITEM;
      }
       
                              
   if (sItem != "" && GetIsPC(oPC) && !GetIsDM(oPC))
      {
      oItem = AT_GetItemPossessedBy_Cached(oPC, sItem);
         
      if (!GetIsObjectValid(oItem))
         {
         SendMessageToPC(oPC, AT_PCTOOLS_COLOUR1 + AT_NO_ITEM_MESSAGE);
         return;
         }
      }
         
   while (GetIsEffectValid(eFirst))
       {
	   if (GetEffectSpellId(eFirst) == 1992)
	      {
		  RemoveEffect(oPC, eFirst);
		  break;
		  }
	   eFirst = GetNextEffect(oPC);	  
	   }   
   
   if (sVFX == "%")
      {
	  return;	     	  
	  }
	     
   ApplyEffectToObject(DURATION_TYPE_PERMANENT, eProp, oPC);
   
}


// add new and remove an other default Beltpart
void AT_PCTools_ApplyVFX3(object oPC, string sVFX)
{
   string sEffect = sVFX;
   effect eProp = SupernaturalEffect(SetEffectSpellId(EffectNWN2SpecialEffectFile(sEffect), 1993));
   effect eFirst = GetFirstEffect(oPC);
   object oItem;
   string sItem;
    
   
   if (sVFX == "drinkbeer")
      {
      sItem = AT_PCTOOLS_VFX_DRINKBEER_ITEM;
      }
      else
      if (sVFX == "druma")
      {
      sItem = AT_PCTOOLS_VFX_DRUMA_ITEM;
      }
      else
      if (sVFX == "drumb")
      {
      sItem = AT_PCTOOLS_VFX_DRUMB_ITEM;
      }
      else
      if (sVFX == "flutea")
      {
      sItem = AT_PCTOOLS_VFX_FLUTEA_ITEM;
      }
      else
      if (sVFX == "fluteb")
      {
      sItem = AT_PCTOOLS_VFX_FLUTEB_ITEM;
      }            
      else
      if (sVFX == "mandolina")
      {
      sItem = AT_PCTOOLS_VFX_MANDOLINA_ITEM;
      }
      else
      if (sVFX == "mandolinb")
      {
      sItem = AT_PCTOOLS_VFX_MANDOLINB_ITEM;
      }
      else
      if (sVFX == "mandolinc")
      {
      sItem = AT_PCTOOLS_VFX_MANDOLINC_ITEM;
      }      
      else
      if (sVFX == "pan")
      {
      sItem = AT_PCTOOLS_VFX_PAN_ITEM;
      }      
      else
      if (sVFX == "rake")
      {
      sItem = AT_PCTOOLS_VFX_RAKE_ITEM;
      }             
      else
      if (sVFX == "shovel")
      {
      sItem = AT_PCTOOLS_VFX_SHOVEL_ITEM;
      } 
      else
      if (sVFX == "smithyhammer")
      {
      sItem = AT_PCTOOLS_VFX_SMITHYHAMMER_ITEM;
      } 
      else
      if (sVFX == "spoon")
      {
      sItem = AT_PCTOOLS_VFX_SPOON_ITEM;
      }      
      else
      if (sVFX == "wine")
      {
      sItem = AT_PCTOOLS_VFX_WINE_ITEM;
      }
       
                              
   if (sItem != "" && GetIsPC(oPC) && !GetIsDM(oPC))
      {
      oItem = AT_GetItemPossessedBy_Cached(oPC, sItem);
         
      if (!GetIsObjectValid(oItem))
         {
         SendMessageToPC(oPC, AT_PCTOOLS_COLOUR1 + AT_NO_ITEM_MESSAGE);
         return;
         }
      }
         
   while (GetIsEffectValid(eFirst))
       {
	   if (GetEffectSpellId(eFirst) == 1993)
	      {
		  RemoveEffect(oPC, eFirst);
		  break;
		  }
	   eFirst = GetNextEffect(oPC);	  
	   }   
   
   if (sVFX == "%")
      {
	  return;	     	  
	  }
	     
   ApplyEffectToObject(DURATION_TYPE_PERMANENT, eProp, oPC);
   
}




// add new and remove an other
void AT_PCTools_ApplyVFX4(object oPC, string sVFX)
{
   string sEffect = sVFX;
   effect eProp = SupernaturalEffect(SetEffectSpellId(EffectNWN2SpecialEffectFile(sEffect), 1994));
   effect eFirst = GetFirstEffect(oPC);
   object oItem;
   string sItem;

   
   if (sVFX == "%")
      {
   		while (GetIsEffectValid(eFirst))
       {
	   if (GetEffectSpellId(eFirst) == 1994)
	      {
		  RemoveEffect(oPC, eFirst);
		  break;
		  }
	   eFirst = GetNextEffect(oPC);	  
	   }  	  
	  
	  
	  return;	     	  
	  }
	     
   ApplyEffectToObject(DURATION_TYPE_PERMANENT, eProp, oPC);
   
}

void AT_PCTools_CustomButton(object oPC, int nButton)
{
   switch (nButton)
       {
    	   //custom button 1
		   case 1:
		   {
		   string sEffect = "fx_at_drinkmet01";
   		   effect eProp = SupernaturalEffect(SetEffectSpellId(EffectNWN2SpecialEffectFile(sEffect), -1899));
           effect eFirst = GetFirstEffect(oPC);
			 
		   while (GetIsEffectValid(eFirst))
       			{
	  		 if (GetEffectSpellId(eFirst) == -1899)
	     		 {
		  		RemoveEffect(oPC, eFirst);
		 	 break;
		  		  }
	   			eFirst = GetNextEffect(oPC);	  
	  			 } 
				 
			ApplyEffectToObject(DURATION_TYPE_PERMANENT, eProp, oPC);	 
			}
     	   break;
		   
		   //custom button 2
		   case 2:
		   {
		   string sEffect = "fx_at_backmandolin01";
   		   effect eProp = SupernaturalEffect(SetEffectSpellId(EffectNWN2SpecialEffectFile(sEffect), -1899));
           effect eFirst = GetFirstEffect(oPC);
			 
		   while (GetIsEffectValid(eFirst))
       			{
	  		 if (GetEffectSpellId(eFirst) == -1899)
	     		 {
		  		RemoveEffect(oPC, eFirst);
		 	 break;
		  		  }
	   			eFirst = GetNextEffect(oPC);	  
	  			 } 
			ApplyEffectToObject(DURATION_TYPE_PERMANENT, eProp, oPC);	 
			}		   
		   break;
		   
		   //custom button 3
		   case 3:
           //your custom button code goes here
		   SendMessageToPC(oPC, AT_PCTOOLS_COLOUR1 + "Button number " +
		                  IntToString(nButton) + " has no custom code enabled.");	   
		   break;
		   		   		   		   		   		   		   
		   //custom button 4
		   case 4:
           //your custom button code goes here
		   SendMessageToPC(oPC, AT_PCTOOLS_COLOUR1 + "Button number " +
		                  IntToString(nButton) + " has no custom code enabled.");		   
		   break;
		   
		   //custom button 5
		   case 5:
           //your custom button code goes here
		   SendMessageToPC(oPC, AT_PCTOOLS_COLOUR1 + "Button number " +
		                  IntToString(nButton) + " has no custom code enabled.");		   
     	   break;
		   
		   //custom button 6
		   case 6:
           //your custom button code goes here
		   SendMessageToPC(oPC, AT_PCTOOLS_COLOUR1 + "Button number " +
		                  IntToString(nButton) + " has no custom code enabled.");		   
		   break;
		   
		   //custom button 7
		   case 7:
           //your custom button code goes here
		   SendMessageToPC(oPC, AT_PCTOOLS_COLOUR1 + "Button number " +
		                  IntToString(nButton) + " has no custom code enabled.");		   
		   break;
		   		   		   		   		   		   		   
		   //custom button 8
		   case 8:
           //your custom button code goes here
		   SendMessageToPC(oPC, AT_PCTOOLS_COLOUR1 + "Button number " +
		                  IntToString(nButton) + " has no custom code enabled.");		   
		   break;
		   
		   //custom button 9
		   case 9:
           //your custom button code goes here
		   SendMessageToPC(oPC, AT_PCTOOLS_COLOUR1 + "Button number " +
		                  IntToString(nButton) + " has no custom code enabled.");		   
		   break;	   
	   }
}

void AT_PCTools_PlayCustomAnim(object oObject, string sAnimationName, int nLooping, float fSpeed = 1.0)
{
   PlayCustomAnimation(oObject, sAnimationName, nLooping, fSpeed);
}

void AT_DestroyAllInventory(object oObject)
{
    if (!GetHasInventory(oObject))
	   {
	   return;
	   }
	   
    object oItem = GetFirstItemInInventory(oObject);

    while (GetIsObjectValid(oItem))
        {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oObject);
        }
}

string AT_IntToLeadingZeroString(int nNumber)
{
string sResult = IntToString(nNumber);

   if (nNumber < 10 && nNumber >= 0)
      {
      sResult = "0"+IntToString(nNumber);
      return sResult;
      }

return sResult;
}

object AT_GetItemPossessedBy_Cached(object oCreature, string sItemTag)
{
   object oItem = GetLocalObject(oCreature, "AT_CACHED_ITEM_" + sItemTag);

   //not sure if GetItemPossessor()is more efficient than GetItemPossessedBy()   
   if (GetIsObjectValid(oItem) && GetItemPossessor(oItem) == oCreature)
      {
      return oItem;
      }
      
   oItem = GetItemPossessedBy(oCreature, sItemTag);
   
   if (GetIsObjectValid(oItem))
      {
      SetLocalObject(oCreature, "AT_CACHED_ITEM_" + sItemTag, oItem);
      return oItem;
      }

   return oItem;            
}

void AT_PCTools_DestroyAndDecrement(object oPC, object oObject, string sVar)
{

   //might have been destroyed manually, so check for validity first since
   //this can be called via a delay.  Only destroy and decrement if the object
   //exists first.
   if (GetIsObjectValid(oObject))
      {
      DestroyObject(oObject);
      SetLocalInt(oPC, sVar, GetLocalInt(oPC, sVar) - 1);
      }
}