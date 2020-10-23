//originally Uncle FB's control
// Credit to Kamal too!



/*

    Script:			This script contains all the systems directly specific to the spawn system plugin.  Functions 
					here are NOT used by other plugins but only called by the spawn system itself.  Though this may
					be included with other plugins, it would only be done when the plugin requires facets of the
					spawn system.  Most functions used by other plugins for spawning related are in the Master
					Functions include.
	Version:		1.1
	Plugin Version: 1.93
	Author:			Marshall Vyper
	Parameters:		None

	Change Log:		11/01/2012 - MV 1.2 - Added support for Bartender TAG for Barmaids
*/



//NPC_Barmaid include
//npc_bminc
//Uncle FB 05/2009
//This script uses 2 NPCs 
//1 barmaid npc with the "npc_barmaid" script on the "on heartbeat" slot
//1 bartender with the "npc_bartender" script in the "on heartbeat" slot
//the bartender tag should be filled out at the beginning of the "npc_barmaid" script SEE NOTES in npc_barmaid
//the bar maid will refer to the bartender by name (listed in properties of bartender in toolset)
//1 generic waypoint with the tag "WP_BAR" for the bar maid to order from and rest at
//1 generic waypoint with the tag "WP_BARTENDER" for the bartender to stand at
//1 generic waypoint with the tag "WP_KEG" for the bartender to go to and fill drink orders
//the bar maid will randomly choose a customer and take an order
//the drink list can be customized and will be used throughout the bar maid conversation
//you can set up to 10 exclusions (other NPCs that the bar maid will not serve)
//among the exclusions should be the bar maid, and the bartender (maybe the innkeeper and/or musicians)
//exclusions should be filled out at the beginning of the "npc_barmaid" script SEE NOTES in npc_barmaid

void  TakeOrder(object oNpc)
{
object oBartender = GetObjectByTag (GetLocalString (oNpc, "bartender"));
string sBartender = GetName (oBartender);
int nMultiple;
string sOrder1;
string sOrder2;
//Set these conversation strings for the bar maid to speak to the customer
//when asking if they want to order anything
    {switch (Random (6))//Bar Maid to customer first question
        {
        case 1: SetLocalString (oNpc, "query", "What can I get for you?"); break; 
        case 2: SetLocalString (oNpc, "query", "What'll you have?"); break;
        case 3: SetLocalString (oNpc, "query", "Do you need anything?"); break; 
        case 4: SetLocalString (oNpc, "query", "Another round?"); break; 
        case 5: SetLocalString (oNpc, "query", "Will you have the usual?"); break; 
        default: SetLocalString (oNpc, "query", "We have Thaylian red, black beer, golden mead, fruit wine, and Moorish whiskey"); break;
        } 
    }
//This is the random drink list part 1
//change this to whatever you want your custom drink list to contain
    {switch (Random (5))//Roll order part 1
        {
        case 1: sOrder1 = "Thaylian Red"; SetLocalString (oNpc, "order1", sOrder1);break;  
        case 2: sOrder1 = "Black Beer"; SetLocalString (oNpc, "order1", sOrder1);break; 
        case 3: sOrder1 = "Golden Mead"; SetLocalString (oNpc, "order1", sOrder1);break; 
        case 4: sOrder1 = "Fruit Wine"; SetLocalString (oNpc, "order1", sOrder1);break;  
        default: sOrder1 = "Moorish Whiskey"; SetLocalString (oNpc, "order1", sOrder1);break; 
        }
    }
//This is the random drink list part 2
//change this to whatever you want your custom drink list to contain
    {switch (Random(5))//Roll order part 2
        {
        case 4: sOrder2 = "Thaylian Red"; SetLocalString (oNpc, "order2", sOrder2);break;  
        case 3: sOrder2 = "Black Beer"; SetLocalString (oNpc, "order2", sOrder2);break; 
        case 2: sOrder2 = "Golden Mead"; SetLocalString (oNpc, "order2", sOrder2);break; 
        case 1: sOrder2 = "Fruit Wine"; SetLocalString (oNpc, "order2", sOrder2);break;  
        default: sOrder2 = "Moorish Whiskey"; SetLocalString (oNpc, "order2", sOrder2);break; 
        }  
    }
//customer order response concatenated with drink list order
    {switch (Random (6))//customer order to barmaid
        {
        case 1: 
        SetLocalInt (oNpc, "multiple", 1);
        if (sOrder1 == sOrder2)
            {SetLocalString (oNpc, "response1", " I'll have 2 "+sOrder1+"s");}
            else {SetLocalString (oNpc, "response1", "I'll have "+sOrder1+" and bring my friend some "+sOrder2);}
        break;    
        case 2: 		
        SetLocalInt (oNpc, "multiple", 1);
        if (sOrder1 == sOrder2)
            {SetLocalString (oNpc, "response1", " How about a couple of tankards of "+sOrder1);}
            else {SetLocalString (oNpc, "response1", "One "+sOrder1+" and one "+sOrder2);}
        break; 
        case 3: 		
        SetLocalInt (oNpc, "multiple", 1);
        if (sOrder1 == sOrder2)
            {SetLocalString (oNpc, "response1", " 2 orders of "+sOrder1);}
            else {SetLocalString (oNpc, "response1", "I'll have "+sOrder1+" and "+sOrder2+" for my partner");}
        break; 
        case 4:
        SetLocalInt (oNpc, "multiple", 0);
        SetLocalString (oNpc, "response1", "I'll take the "+sOrder1);
        break;
        case 5:
        SetLocalInt (oNpc, "multiple", 0);
        SetLocalString (oNpc, "response1", "I'd like "+sOrder1);
        break; 
        default:
        SetLocalInt (oNpc, "multiple", 0);
        SetLocalString (oNpc, "response1", "Bring me the "+sOrder1);
        break;               
        }
    }
//bar maid confirming order with customer
nMultiple = GetLocalInt (oNpc, "multiple");
    {switch (nMultiple) //Bar maid to customer on way to get order from bartender
        {
        default: //single order
            {switch (Random (3))
                {
                case 1:
                SetLocalString (oNpc, "response2", "One "+sOrder1+" coming right up");
                break;
                case 2:
                SetLocalString (oNpc, "response2", "I'll be right back with your "+sOrder1);
                break;
                default:
                SetLocalString (oNpc, "response2", sOrder1+" it is, give me just one minute to get it");
                break;
                }
            }
		break;	
        case 1: //multiple order
            {switch (Random (3))
                {
                case 1:
                if (sOrder1 == sOrder2) 
                    {SetLocalString (oNpc, "response2", "Two "+sOrder1+"s coming right up");}
                else {SetLocalString (oNpc, "response2", "One "+sOrder1+" and one "+sOrder2+" coming right up");} 
                break;    
                case 2:
                if (sOrder1 == sOrder2) 
                    {SetLocalString (oNpc, "response2", "It'll be just a minute for those "+sOrder1+"s");}
                    else {SetLocalString (oNpc, "response2", sOrder1+" and "+sOrder2+", I'll be right back");} 
                break;
                default:
                if (sOrder1 == sOrder2) 
                    {SetLocalString (oNpc, "response2", "Let me go get those "+sOrder1+"s for you");}
                    else {SetLocalString (oNpc, "response2", "I'll be just a minute");} 
                break;                                          
                }
            }
		break;	
        }
    }
//bar maid issuing order to bartender to be filled
    {switch (nMultiple)//Bar maid to Bartender
        {
        default: //single order
            {switch (Random (3))
                {
                case 1:
                SetLocalString (oNpc, "response3", "One "+sOrder1+" "+sBartender);
                break;
                case 2:
                SetLocalString (oNpc, "response3", sOrder1+" please");
                break;
                default:
                SetLocalString (oNpc, "response3", sOrder1+", and shake a leg");
                break;
                }
            }
		break;	
        case 1: //multiple order
            {switch (Random (3))
                {
                case 1:
                if (sOrder1 == sOrder2) 
                    {SetLocalString (oNpc, "response3", "Two "+sOrder1+"s "+sBartender);}
                    else {SetLocalString (oNpc, "response3", "One "+sOrder1+" and one "+sOrder2);} 
                break;    
                case 2:
                if (sOrder1 == sOrder2) 
                    {SetLocalString (oNpc, "response3", sBartender+", get me two "+sOrder1+"s");}
                    else {SetLocalString (oNpc, "response3", sOrder1+" and "+sOrder2);} 
                break;
                default:
                if (sOrder1 == sOrder2) 
                    {SetLocalString (oNpc, "response3", "Some thirsty people tonight, two "+sOrder1+"s");}
                    else {SetLocalString (oNpc, "response3", "One "+sOrder1+" and one "+sOrder2+" for the big spenders over there");} 
                break;                                          
                }
            }
		break;	
        }
    }
//bartender confirming order to be filled
	{switch (Random (3))//bartender to bar maid
		{
		case 1:
		SetLocalString (oNpc, "response4", "Got it!");
		break;
		case 2:
		SetLocalString (oNpc, "response4", "I'm on it");
		break;
		default:
		SetLocalString (oNpc, "response4", "Coming right up");
		}
	}
//bar maid delivering drinks to customer and assessing drink charges
	{switch (nMultiple)// bar maid to customer delivering drinks
		{
		case 1:
		if (sOrder1 == sOrder2) 
        	{SetLocalString (oNpc, "response5", "Two "+sOrder1+"s, that will be 8 coppers");}
			else
			{SetLocalString (oNpc, "response5", "One "+sOrder1+" and one "+sOrder2+" enjoy!  That will be 8 coppers");}
		break;
		default:
		SetLocalString (oNpc, "response5", "One "+sOrder1+", that will run 4 coppers today.");
		break;
		}
	}
//customer to bar maid after receiving drinks
	{switch (Random(4))//customer to bar maid
		{
		case 1:
		SetLocalString (oNpc, "response6", "Ahhh... that hits the spot thank you");
		break;
		case 2: 
		SetLocalString (oNpc, "response6", "Here you go, and a little extra for your speed");
		break;
		case 3:
		SetLocalString (oNpc, "response6", "MMM... this is good");	
		break;
		default:
		SetLocalString (oNpc, "response6", "If you see my cup starting to get empty, come on back OK?");
		break;
		}
	}
//bartender to bar maid after filling drink order from bar maid
	{switch (nMultiple)//bartender to bar maid after getting drinks
		{
		case 1:
		if (sOrder1 == sOrder2) 
        	{SetLocalString (oNpc, "response7", "Two "+sOrder1+"s");}
			else
			{SetLocalString (oNpc, "response7", "One "+sOrder1+" and one "+sOrder2);}
		break;
		default:
		SetLocalString (oNpc, "response7", "One "+sOrder1);
		break;
		}
	}
//random chatter from bar maid to bartender at rest
	{switch (Random (4))//Bar maid to bartender at rest
		{
		case 1: SetLocalString (oNpc, "response8", "That guy in the corner is about to get sick, he has had quite a bit of "+sOrder1);break;
		case 2: SetLocalString (oNpc, "response8", "The tips have been all right today");break;
		case 3: SetLocalString (oNpc, "response8", "OH, he's turning green. That "+sOrder1+" will get you every time.");break;	
		default: SetLocalString (oNpc, "response8", "This is a thirsty crowd");break;
		}
	}
//random chatter from bartender to bar maid at rest
	{switch (Random (4))//Bartender to bar maid at rest
		{
		case 1: SetLocalString (oNpc, "response9", "We are running a bit low on the "+sOrder2);break;
		case 2: SetLocalString (oNpc, "response9", "See if you can push the "+sOrder2);break;
		case 3: SetLocalString (oNpc, "response9", "Does this "+sOrder2+" smell all right to you?  It looks a little cloudy.");break;
		default: SetLocalString (oNpc, "response9", "If I have to listen to one more sob story from some guy liquored up on "+sOrder2+"...");break;
		}
	}			
}

//this function counts the current number of creatures in the area where the bar maid is operating
int GetCreatureCount(object oNpc)
{
object oNpc = OBJECT_SELF;
int nCount;
int nResult;
object oCount;
int nPatrons = GetLocalInt (oNpc,"patrons");
if (nPatrons != 0){return nPatrons;}
	else 
	{
	oCount = GetNearestCreature (CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, oNpc, nCount);
	while (oCount != OBJECT_INVALID)
		{
		nCount++;
		oCount = GetNearestCreature (CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, oNpc, nCount);
		nResult = nCount;
		}
	SetLocalInt (oNpc, "patrons", nResult);
	return nResult;	
	}
}

//this function targets a customer that is not on the exclusion list
//it will try to target four times before returning an invalid object
object GetCustomer(object oNpc, int nPatrons)
{
object oExclude1 = GetObjectByTag (GetLocalString (oNpc, "exclude1"));
object oExclude2 = GetObjectByTag (GetLocalString (oNpc, "exclude2"));
object oExclude3 = GetObjectByTag (GetLocalString (oNpc, "exclude3"));
object oExclude4 = GetObjectByTag (GetLocalString (oNpc, "exclude4"));
object oExclude5 = GetObjectByTag (GetLocalString (oNpc, "exclude5"));
object oExclude6 = GetObjectByTag (GetLocalString (oNpc, "exclude6"));
object oExclude7 = GetObjectByTag (GetLocalString (oNpc, "exclude7"));
object oExclude8 = GetObjectByTag (GetLocalString (oNpc, "exclude8"));
object oExclude9 = GetObjectByTag (GetLocalString (oNpc, "exclude9"));
object oExclude10 = GetObjectByTag (GetLocalString (oNpc, "exclude10"));
int nRandom = Random(nPatrons);
object oCustomer = GetNearestCreature (CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, OBJECT_SELF, nRandom);
    if (oCustomer !=  OBJECT_SELF && oCustomer != oExclude1 && oCustomer != oExclude2 && oCustomer != oExclude3 && oCustomer != oExclude4 && oCustomer != oExclude5
	&& oCustomer != oExclude6 && oCustomer != oExclude7 && oCustomer != oExclude8 && oCustomer != oExclude9 && oCustomer != oExclude10)
		{if (GetIsObjectValid (oCustomer) == TRUE)
			{return oCustomer;}}
nRandom = Random(nPatrons);	
    if (oCustomer !=  OBJECT_SELF && oCustomer != oExclude1 && oCustomer != oExclude2 && oCustomer != oExclude3 && oCustomer != oExclude4 && oCustomer != oExclude5
	&& oCustomer != oExclude6 && oCustomer != oExclude7 && oCustomer != oExclude8 && oCustomer != oExclude9 && oCustomer != oExclude10)
		{if (GetIsObjectValid (oCustomer) == TRUE)
			{return oCustomer;}}	
nRandom = Random(nPatrons);	
oCustomer = GetNearestCreature (CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, OBJECT_SELF, nRandom);
    if (oCustomer !=  OBJECT_SELF && oCustomer != oExclude1 && oCustomer != oExclude2 && oCustomer != oExclude3 && oCustomer != oExclude4 && oCustomer != oExclude5
	&& oCustomer != oExclude6 && oCustomer != oExclude7 && oCustomer != oExclude8 && oCustomer != oExclude9 && oCustomer != oExclude10)
		{if (GetIsObjectValid (oCustomer) == TRUE)
			{return oCustomer;}}	
nRandom = Random(nPatrons);	
oCustomer = GetNearestCreature (CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC, OBJECT_SELF, nRandom);
    if (oCustomer !=  OBJECT_SELF && oCustomer != oExclude1 && oCustomer != oExclude2 && oCustomer != oExclude3 && oCustomer != oExclude4 && oCustomer != oExclude5
	&& oCustomer != oExclude6 && oCustomer != oExclude7 && oCustomer != oExclude8 && oCustomer != oExclude9 && oCustomer != oExclude10)
		{if (GetIsObjectValid (oCustomer) == TRUE)
			{return oCustomer;}}
SetLocalInt (oNpc, "barmaid", 7);							
return OBJECT_INVALID;
}

void AreaCheck (object oCustomer, object oNpc)
{
if (GetArea (oCustomer) != GetArea (oNpc))
	{
	DeleteLocalInt (oNpc, "barmaid");
	DeleteLocalObject (oNpc, "customer");
	SetLocalInt (oNpc,"patrons", 0);
	}
}

//Action wrapper for PlayCustomAnimation to allow delay and assign
void ActionPlayCustomAnimation(object oNpc, string sAnimationName, int nLooping, float fSpeed = 1.0f)
{
    PlayCustomAnimation(oNpc, sAnimationName, nLooping, fSpeed);	
}

//npc_barmaid script
//Uncle FB
//05/2009
//fill in appropriate bartender tag
//fill in exclusion tags (NPCs NOT to be served by the bar maid)

void main ()
{
object oNpc = OBJECT_SELF;
//fill in the tag of your bartender NPC below where it currently says "BARTENDER"
string sBartender = GetLocalString(oNpc, "LEG_AI_Bartender");
string sBarmaid = GetTag(oNpc);
string sExclude1 = GetLocalString(oNpc, "LEG_AI_BarExclude1");
string sExclude2 = GetLocalString(oNpc, "LEG_AI_BarExclude2");
string sExclude3 = GetLocalString(oNpc, "LEG_AI_BarExclude3");
string sExclude4 = GetLocalString(oNpc, "LEG_AI_BarExclude4");
SetLocalString (oNpc, "bartender", sBartender);

//fill in the tags of NPCs you do NOT want the NPC bar maid to serve below
//be sure to include the bartender and the bar maid (also the innkeeper and musicians perhaps)
//simply un-comment any extra SetLocalString lines you need to  (up to 10 exclusions allowed)
SetLocalString (oNpc, "exclude1", sBarmaid);
SetLocalString (oNpc, "exclude2", sBartender);
SetLocalString (oNpc, "exclude3", "BARD011");
SetLocalString (oNpc, "exclude4", "BARD012");
SetLocalString (oNpc, "exclude5", "BARDM013");
SetLocalString (oNpc, "exclude6", "DANCER014");
SetLocalString (oNpc, "exclude7", sExclude1);
SetLocalString (oNpc, "exclude8", sExclude2);
SetLocalString (oNpc, "exclude9", sExclude3);
SetLocalString (oNpc, "exclude10", sExclude4);

int nPatrons = GetCreatureCount (oNpc);
int nRandom = Random(nPatrons);
int nMaidState = GetLocalInt (oNpc, "barmaid");
object oCustomer = GetLocalObject (oNpc, "customer");
float fCustomer = GetDistanceToObject (oCustomer);
string sQuery;	string sResponse1;	string sResponse2;	string sResponse3; string sResponse4;
string sResponse5;	string sResponse6;	string sResponse7; string sResponse8; string sResponse9;
string scust;
object oBar = GetWaypointByTag("WP_BAR");
float fBar = GetDistanceToObject (oBar);
object oRest = GetWaypointByTag("WP_REST");
object oBartender = GetObjectByTag (GetLocalString (oNpc, "bartender"));
int nBusy = GetLocalInt (oBartender, "busy");
	{switch (nMaidState)
		{
//default = bar maid has no target and is searching for new target to serve
//once target acquired move to within 2.1 of taget before proceeding		  
		default:		
		if (oCustomer == OBJECT_INVALID)
		oCustomer = GetCustomer (oNpc,nPatrons);
        SetLocalInt (oNpc, "barmaid", 1);
        SetLocalObject (oNpc, "customer", oCustomer);	
		ActionMoveToObject(oCustomer);
		if	(fCustomer >= 1.1){ActionMoveToObject (oCustomer,0,1.0);return;}
			else
			{SetLocalInt (oNpc, "barmaid",1);}
		break;
//1. check distance to customer and make sure is less then 1.1 proceed		
		case 1:
		AreaCheck (oCustomer, oNpc);
		if (fCustomer >= 1.1) {ActionMoveToObject (oCustomer,0,1.0); return;}
			else
			TakeOrder(oNpc);
			sQuery = GetLocalString (oNpc, "query");
			ActionSpeakString (sQuery);
			SetLocalInt (oNpc, "barmaid", 2);
		break;		
//2. take order = set random strings on barmaid for future conversation
//take order from npc and have short conversation and then move towards wp marked WP_BAR	
		case 2:	
			AreaCheck (oCustomer, oNpc);
			sResponse1 = GetLocalString (oNpc, "response1");
			sResponse2 = GetLocalString (oNpc, "response2");
			ClearAllActions();
			AssignCommand (oCustomer, ClearAllActions());
			ActionDoCommand (DelayCommand(0.5, AssignCommand (oCustomer, SpeakString (sResponse1))));
			DelayCommand (4.0, ActionSpeakString (sResponse2));
			DelayCommand (5.0, ActionMoveToObject (oBar));
			SetLocalInt (oNpc, "barmaid", 3);		
		break;
//3. check distance to wp marked WP_BAR if not within 1.0 keep moving to bar and return
//if within 1.0 of bar converse with bartender to order drinks and them proceed		
		case 3:
		AreaCheck (oCustomer, oNpc);
		if (fBar >= 1.0) {ActionMoveToObject (oBar,0,0.0); return;}
			else
			{
			sResponse3 = GetLocalString (oNpc, "response3");
			sResponse4 = GetLocalString (oNpc, "response4");
			ActionSpeakString (sResponse3);
			AssignCommand (oBartender, ClearAllActions());
			DelayCommand (1.5, AssignCommand (oBartender, ActionSpeakString (sResponse4)));
			SetLocalInt (oBartender, "busy", 1);
			SetLocalInt (oNpc, "barmaid", 4);
			}
		break;
//4. wait for bartender to get drinks and check the bartender status
//once the bartender is done getting the drinks proceed		
		case 4:	
		AreaCheck (oCustomer, oNpc);
		if (nBusy != 0){return;}
			else
			{
			sResponse7 = GetLocalString (oNpc, "response7");
			AssignCommand (oBartender, ClearAllActions());
			AssignCommand (oBartender, ActionSpeakString (sResponse7));
			SetLocalInt (oNpc, "barmaid", 5);
			}
		break;
//5. move to customer, check distance if less then or equal to 2.0 proceed		
		case 5:
		AreaCheck (oCustomer, oNpc);
		ActionMoveToObject (oCustomer);
		if (fCustomer <=2.0) 
			{
			sResponse5 = GetLocalString (oNpc, "response5");
			ActionSpeakString (sResponse5);
			SetLocalInt (oNpc, "barmaid", 6);}
		break;
//6. deliver drinks to customer and converse, wait, then proceed		
		case 6:
		AreaCheck (oCustomer, oNpc);
			sResponse6 = GetLocalString (oNpc, "response6");

			DelayCommand (1.5,AssignCommand (oCustomer, ActionSpeakString (sResponse6)));
			ActionWait (3.0);
			SetLocalInt (oNpc, "barmaid", 7);
		break;
//7. move back to wp tagged WP_BAR
//once within 1.0 of bar converse with bartender
//delete local object customer and local integer barmaid (start over)		
		case 7:
		ActionMoveToObject (oBar,0,0.0);
		if (fBar <= 1.0) 
			{
			sResponse8 = GetLocalString (oNpc, "response8");
			sResponse9 = GetLocalString (oNpc, "response9");	
			ActionSpeakString (sResponse8);
			DelayCommand (1.5,AssignCommand (oBartender, ActionSpeakString (sResponse9)));		
			DeleteLocalInt (oNpc, "barmaid");
			DeleteLocalObject (oNpc, "customer");
			SetLocalInt (oNpc,"patrons", 0);}
		break;			
		}
	}		
}