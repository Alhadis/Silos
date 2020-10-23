/** @file
* @brief Include file for Dynamic Conversations created entirely via script
*
* 
* 
*
* @ingroup scinclude
* @author Brian T. Meyer and others
*/

/////////////////////////////////////////////////////
//////////////// Notes /////////////////////////////
////////////////////////////////////////////////////





/**
 *  $Id: zdlg_include_i.nss,v 1.2 2005/08/07 04:38:30 pspeed Exp $
 *  $Id: pg_lists_i.nss,v 1.2 2005/08/07 04:38:30 pspeed Exp $
 *
 *  Include file for using the Z-Dialog runtime conversation
 *  system and some list APIs that work with local object variables.
 *
 *  Copyright (c) 2004 Paul Speed - BSD licensed.
 *  NWN Tools - http://nwntools.sf.net/
 */
 
 
 /////////////////////////////////////////////////////
///////////////// Constants /////////////////////////
/////////////////////////////////////////////////////

const int DLG_CONV_NUM = 27;    // plus NEXT and PREVIOUS and END gets to 30


// Constants defined for dialog events
const int DLG_INIT = 0; // new dialog is started
const int DLG_PAGE_INIT = 1; // a new page is started
const int DLG_SELECTION = 2; // item is selected
const int DLG_ABORT = 3; // dialog was aborted
const int DLG_END = 4; // dialog ended normally

const string DLG_CURRENT_HANDLER = "currentDialog";
const string DLG_HANDLER = "dialog";
const string DLG_PROMPT = "zdlgPrompt";
const string DLG_RESPONSE_LIST = "zdlgResponseList";
const string DLG_RESPONSE_LIST_HOLDER = "zdlgResponseHolder";
const string DLG_EVENT_TYPE = "zdlgEventType";
const string DLG_EVENT_SELECTION = "zdlgEventSelection";
const string DLG_PAGE_ID = "zdlgPageId";
const string DLG_ITEM = "zdlgItem";
const string DLG_ITEM_CONVERSER = "zdlgConverser";
const string DLG_STATE = "zdlgState";

const string DLG_START_ENTRY = "zdlgStartEntry";
const string DLG_HAS_PREV = "zdlgHasPrevious";
const string DLG_HAS_NEXT = "zdlgHasNext";
const string DLG_HAS_END = "zdlgHasEnd";

// Some state constants that the zdlg_page_init check
// can use to determine current conversation state.
const int DLG_STATE_INIT = 0;
const int DLG_STATE_RUNNING = 1;
const int DLG_STATE_ENDED = -1;



// **************************************** 01/15/06
// Seed's changes to support multi dialogs to avoid token conflicts
// basically just changes the DLG_CONVO_BASE from a constant to a var stored on the Convo Speaker
const int    DLG_CONVO_COUNT  = 1; // NUMBER OF DYNAMIC Z-CONVOS AVAILABLE (Not Using the Default conv)
const int    DLG_CONVO_NOFAIL = 1;  // SET 1 = NEVER FAIL TO START A CONVO. THIS CAN LEAD TO 2 PEOPLE SHARING A CONVO, BUT WITH 10 IT MAY NOT BE A PROBLEM
const string DLG_CONVO_BASE   = "DLG_CONVO_BASE";
const string DLG_CONVO_SLOT   = "DLG_CONVO_SLOT";
const string DLG_CONVO_LIST   = "DLG_CONVO_LIST"; // LIST TO TRACK THE OBJECTS USING EACH CONVO (IF NOFAIL ONLY)


// The base token for the dialog inserts.  +0 is the
// prompt.  +1 - +13 is the item text.  These values
// must match the .dlg file exactly.
const int DLG_BASE_TOKEN = 4200;




/////////////////////////////////////////////////////
//////////////// Includes ///////////////////////////
/////////////////////////////////////////////////////

#include "_CSLCore_Messages"
#include "_CSLCore_ObjectArray"


/////////////////////////////////////////////////////
//////////////// Prototypes /////////////////////////
/////////////////////////////////////////////////////



/////////////////////////////////////////////////////
//////////////// Implementation /////////////////////
/////////////////////////////////////////////////////

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
void DMFI_AddConversationElement(object oHolder, string sPage, string sResponse, string sCommand="", int nColor=-1)
{  //Purpose: Function used to set up the DMFI conversation
	//Original Scripter: Demetrious
	//Last Modified By: Demetrious 9/20/6
	if (nColor!=-1)
	{
		sResponse = CSLColorText(sResponse, nColor);
	}
		// CODE currently removed because of bug with color coding in conversations.

	//int nCount = CSLDataArray_LengthString( oHolder, sPage );
	//SetLocalString(oHolder, DEPRECATE_CSLIndexToString(nCount, sPage, LIST_PREFIX ), sResponse);
	
	int nCount = CSLDataArray_PushString(oHolder, sPage, sResponse);
	
	if (sCommand != "")
	{
		//SetLocalString(oHolder, DEPRECATE_CSLIndexToString(nCount, sPage + "COM", LIST_PREFIX), sCommand);
		
		CSLDataArray_SetString(oHolder, sPage + "COM", nCount, sCommand );
		
		//const string CSLDATAARRAY_PFX_STRING = "S_"; 
		//CSLDataArray_UpdateLength(oHolder, sPage+"COM", CSLDATAARRAY_TYPE_STRING, nCount);
		//SetLocalString(oHolder, "S_"+sPage+"COM"+"_"+IntToString(nCount), sCommand);



		//SetLocalInt(oHolder, LIST_PREFIX + sPage + "COM", nCount+1);
	}
	//nCount++;
	//SetLocalInt( oHolder, LIST_PREFIX + sPage, nCount);
	//return nCount;
}


/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
int DMFI_AddPage(object oHolder, string sPage)
{  //Purpose: Adds a new page to the DMFI Conversation
	//Original Scripter: Demetrious
	//Last Modified By: Demetrious 6/21/6
	int n = GetLocalInt(oHolder, DMFI_PAGES);
	SetLocalString(oHolder, DMFI_PAGE + IntToString(n), sPage);
	SetLocalInt(oHolder, DMFI_PAGES, n+1);
	return n+1;
}



/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns the current PC speaker for this dialog.
// This has some enhanced features to work around bioware
// limitations with item dialogs.
object CSLGetPcDlgSpeaker()
{
	object oPC = GetPCSpeaker();
	if( oPC == OBJECT_INVALID )
	{
		// See if we're an item and if we're connected to a PC already.
		// Note: GetItemActivator won't work in multiplayer because other
		//       players will be trouncing on its state.
		oPC = GetLocalObject( OBJECT_SELF, DLG_ITEM_CONVERSER );
	}
	
	if( oPC == OBJECT_INVALID )
	{
		PrintString( "WARNING: Unable to retrieve a PC speaker." );
	}
	return( oPC );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Sets the new current dialog handler script for the current conversation.
// This allows on the fly conversation changes and linking.  This must
// be called within a conversation related event.
void CSLSetCurrentDlgHandlerScript( string script )
{
	SetLocalString( CSLGetPcDlgSpeaker(), DLG_CURRENT_HANDLER, script );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns the current dialog handler script for the current conversation.
string CSLGetCurrentDlgHandlerScript()
{
	return( GetLocalString( CSLGetPcDlgSpeaker(), DLG_CURRENT_HANDLER ) );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns the current conversation's default dialog handler script if
// it has one defined.  This is used when there is otherwise
// not a current handler script set.
string CSLGetDefaultDlgHandlerScript( object oNPC = OBJECT_SELF )
{
	return( GetLocalString( oNPC, DLG_HANDLER ) );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Sets the prompt that will be displayed in the dialog
// when talking to the current speaker.
void CSLSetDlgPrompt( string prompt )
{
	SetLocalString( CSLGetPcDlgSpeaker(), DLG_PROMPT, prompt );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns the current prompt that will be displayed in the
// dialog when talking to the current speaker.
string CSLGetDlgPrompt()
{
	return( GetLocalString( CSLGetPcDlgSpeaker(), DLG_PROMPT ) );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Set to TRUE if the end dialog selection should be shown
// on every page.  FALSE if not.
void CSLSetShowEndSelection( int flag )
{
	SetLocalInt( CSLGetPcDlgSpeaker(), DLG_HAS_END, flag );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns TRUE if the end dialog selection should be shown
// on every page.  FALSE if not.
int CSLGetShowEndSelection()
{
	return( GetLocalInt( CSLGetPcDlgSpeaker(), DLG_HAS_END ) );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Sets the list of responses that will be displayed in the
// dialog when talking to the current speaker.
void CSLSetDlgResponseList( string listId, object oListHolder )
{
	object oSpeaker = CSLGetPcDlgSpeaker();
	SetLocalObject( oSpeaker, DLG_RESPONSE_LIST_HOLDER, oListHolder );
	SetLocalString( oSpeaker, DLG_RESPONSE_LIST, listId );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns the list id for the list of responses that will be
// displayed in the dialog when talking to the current speaker.
string CSLGetDlgResponseList()
{
	return( GetLocalString( CSLGetPcDlgSpeaker(), DLG_RESPONSE_LIST ) );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns the dialog type of event that caused the handler
// script to be executed.
int CSLGetDlgEventType()
{
	return( GetLocalInt( CSLGetPcDlgSpeaker(), DLG_EVENT_TYPE ) );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns the selected item in a DLG_SELECTION event.
int CSLGetDlgSelection()
{
	return( GetLocalInt( CSLGetPcDlgSpeaker(), DLG_EVENT_SELECTION ) );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Sets a page string that the scripts can use to track
// progress through the conversation.
void CSLSetDlgPageString( string page )
{
	SetLocalString( CSLGetPcDlgSpeaker(), DLG_PAGE_ID, page );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns a page string that the scripts can use to track
// progress through the conversation.
string CSLGetDlgPageString()
{
	return( GetLocalString( CSLGetPcDlgSpeaker(), DLG_PAGE_ID ) );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Sets a page string that the scripts can use to track
// progress through the conversation.
void CSLSetDlgPageInt( int page )
{
	SetLocalInt( CSLGetPcDlgSpeaker(), DLG_PAGE_ID, page );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns a page string that the scripts can use to track
// progress through the conversation.
int CSLGetDlgPageInt()
{
	return( GetLocalInt( CSLGetPcDlgSpeaker(), DLG_PAGE_ID ) );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Called to initiate a conversation programmatically between
// the dialog source and the object to converse with.  If
// dlgHandler is "" then the object's default script will be used.
// EDIT BY Demetrious:  Changed bZoom to NWN1 or NWN2 style because
// zoom has no effect anyway on a NWN2 style conversation.
void CSLStartDlg( object oPC, object oObjectToConverseWith, string dlgHandler = "",
					int bPrivate = FALSE, int bPlayHello = TRUE, int bNWN2Style = FALSE )
{
	string dlg;
	// Setup the conversation
	if( dlgHandler != "" )
	{
		SetLocalString( oPC, DLG_CURRENT_HANDLER, dlgHandler );
	}
	
	if( GetObjectType( oObjectToConverseWith ) == OBJECT_TYPE_ITEM )
	{
		// We presume that only one player can talk to an item at
		// a time... we could check, but we don't.
		SetLocalObject( oObjectToConverseWith, DLG_ITEM_CONVERSER, oPC );
	
		// We can't actually talk to items so we fudge it.
		SetLocalObject( oPC, DLG_ITEM, oObjectToConverseWith );
		oObjectToConverseWith = oPC;
	}
	
	if( bNWN2Style )
	{
		dlg = "dmfi_conv2";
	}
	else
	{
		dlg = "dmfi_conv";	
	}
	
	AssignCommand( oObjectToConverseWith, ActionStartConversation( oPC, dlg, bPrivate, bPlayHello ) );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Ends the current conversation and will fire the DLG_END event.
void CSLEndDlg()
{
	object oSpeaker = CSLGetPcDlgSpeaker();
	SetLocalInt( oSpeaker, DLG_STATE, DLG_STATE_ENDED );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns the number of responses that will be displayed
// in the dialog when talking to the specified speaker.
// The speaker can be specified for looping optimization
// so that the functions don't have to retrieve it every time.
int CSLGetDlgResponseCount( object oSpeaker )
{
	object oHolder = GetLocalObject( oSpeaker, DLG_RESPONSE_LIST_HOLDER );
	string listId = GetLocalString( oSpeaker, DLG_RESPONSE_LIST );
	return CSLDataArray_LengthString( oHolder, listId );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns the response string for the specified entry.
// The speaker can be specified for looping optimization
// so that the functions don't have to retrieve it every time.
string CSLGetDlgResponse( int num, object oSpeaker )
{
	object oHolder = GetLocalObject( oSpeaker, DLG_RESPONSE_LIST_HOLDER );
	string listId = GetLocalString( oSpeaker, DLG_RESPONSE_LIST );
	return CSLDataArray_GetString( oHolder, listId, num );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Sets up the previous/next buttons
void _SetDlgPreviousNext( object oSpeaker, int hasPrevious, int hasNext )
{
	SetLocalInt( oSpeaker, DLG_HAS_PREV, hasPrevious );
	SetLocalInt( oSpeaker, DLG_HAS_NEXT, hasNext );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns true if the "previous" entry is turned on in the
// response list
int _HasDlgPrevious( object oSpeaker )
{
	return GetLocalInt( oSpeaker, DLG_HAS_PREV );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns true if the "next" entry is turned on in the
// response list
int _HasDlgNext( object oSpeaker )
{
	return GetLocalInt( oSpeaker, DLG_HAS_NEXT );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns true if the "end" entry is turned on in the
// response list
int _HasDlgEnd( object oSpeaker )
{
	return GetLocalInt( oSpeaker, DLG_HAS_END );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Sets the starting entry for when a response list is
// broken into multiple pages.
void _SetDlgFirstResponse( object oSpeaker, int start )
{
	SetLocalInt( oSpeaker, DLG_START_ENTRY, start );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns the starting entry for when a response list is
// broken into multiple pages.
int _GetDlgFirstResponse( object oSpeaker )
{
	return GetLocalInt( oSpeaker, DLG_START_ENTRY );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Sets the token for the response string and returns true
// if there is a valid response entry for the specified num.
int _SetupDlgResponse( int num, object oSpeaker )
{
	int nPage = GetLocalInt(oSpeaker, "dlg_num");
	if (nPage==0)
	{
		nPage = DLG_CONV_NUM;
	}
	int hasNext = _HasDlgNext( oSpeaker );
	int hasPrev = _HasDlgPrevious( oSpeaker );
	int hasEnd = _HasDlgEnd( oSpeaker );
	if( (hasNext || hasPrev || hasEnd) && num >= nPage )
	{
		if( hasNext && num == nPage )
		{
			SetCustomToken( DLG_BASE_TOKEN + nPage+1, "Next" );
			return TRUE;
		}
		if( hasPrev && num == nPage+1 )
		{
			SetCustomToken( DLG_BASE_TOKEN + nPage+2, "Previous" );
			return TRUE;
		}
		if( hasEnd && num == nPage+2 )
		{
			SetCustomToken( DLG_BASE_TOKEN + nPage+3, "End" );
			return TRUE;
		}
		return FALSE;
	}

	int i = _GetDlgFirstResponse( oSpeaker ) + num;
	int count = CSLGetDlgResponseCount( oSpeaker );
	if( i < count )
	{
		string response = CSLGetDlgResponse( i, oSpeaker );
		SetCustomToken( DLG_BASE_TOKEN + num + 1, response );
		return TRUE;
	}
	return FALSE;
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Called to clean-up the current conversation related
// resources.
void _CleanupDlg( object oSpeaker )
{
	// See if the PC was associated with an item
	object oItem = GetLocalObject( oSpeaker, DLG_ITEM );
	if( oItem != OBJECT_INVALID )
	{
		DeleteLocalObject( oItem, DLG_ITEM_CONVERSER );
	}

	DeleteLocalInt( oSpeaker, DLG_STATE );
	DeleteLocalObject( oSpeaker, DLG_RESPONSE_LIST_HOLDER );
	DeleteLocalString( oSpeaker, DLG_RESPONSE_LIST );
	DeleteLocalString( oSpeaker, DLG_PROMPT );
	DeleteLocalString( oSpeaker, DLG_CURRENT_HANDLER );
	DeleteLocalInt( oSpeaker, DLG_PAGE_ID );
	DeleteLocalString( oSpeaker, DLG_PAGE_ID );
	DeleteLocalObject( oSpeaker, DLG_ITEM );
	DeleteLocalInt( oSpeaker, DLG_HAS_PREV );
	DeleteLocalInt( oSpeaker, DLG_HAS_NEXT );
	DeleteLocalInt( oSpeaker, DLG_HAS_END );
	DeleteLocalInt( oSpeaker, DLG_START_ENTRY );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Sends the specified dialog event to the specified NPC
// using the current script handler.  The selection parameter
// is used for select events.  The speaker is provided for
// event specific paramaters to be stored onto.
void _SendDlgEvent( object oSpeaker, int dlgEvent, int selection = -1, object oNPC = OBJECT_SELF )
{
	string dlg = CSLGetCurrentDlgHandlerScript();
	if( oNPC == oSpeaker )
	{
		oNPC = GetLocalObject( oSpeaker, DLG_ITEM );
	}
	
	SetLocalInt( oSpeaker, DLG_EVENT_TYPE, dlgEvent );
	SetLocalInt( oSpeaker, DLG_EVENT_SELECTION, selection );
	ExecuteScript( dlg, oNPC );
	DeleteLocalInt( oSpeaker, DLG_EVENT_TYPE );
	DeleteLocalInt( oSpeaker, DLG_EVENT_SELECTION );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
void _DoDlgSelection( object oSpeaker, int selection, object oNPC = OBJECT_SELF )
{
	int nPage = GetLocalInt(oSpeaker, "dlg_num");
	if (nPage==0)
	{
		nPage = DLG_CONV_NUM;
	}
	
	// Check to see if this is one or our internal events
	int first = _GetDlgFirstResponse( oSpeaker );

	if (selection==nPage)
	{
		if (_HasDlgNext(oSpeaker))
		{
			_SetDlgFirstResponse(oSpeaker, first + nPage);
			return;
		}
	}
	else if (selection==nPage+1)
	{	
		if( _HasDlgPrevious( oSpeaker ) )
		{
			_SetDlgFirstResponse( oSpeaker, first - nPage );
			return;
		}
	}					
	else if (selection==nPage+2)
	{
		if( _HasDlgEnd( oSpeaker ) )
		{
			CSLEndDlg();
			return;
		}
	}

	selection += first;
	_SendDlgEvent( oSpeaker, DLG_SELECTION, selection, oNPC );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Returns the current conversation state.
int _GetDlgState( object oSpeaker )
{
	return( GetLocalInt( oSpeaker, DLG_STATE ) );
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// Called by the dialog internals to initialize the page
// and possibly the conversation
void _InitializePage( object oSpeaker, object oNPC = OBJECT_SELF )
{
	int state = GetLocalInt( oSpeaker, DLG_STATE );
	string dlg = CSLGetCurrentDlgHandlerScript();
	if( oNPC == oSpeaker )
	{
		oNPC = GetLocalObject( oSpeaker, DLG_ITEM );
	}
	
	// See if the NPC has a dialog file defined
	if( dlg == "" )
	{
		// Try to see if they have a default defined
		dlg = CSLGetDefaultDlgHandlerScript( oNPC );
		CSLSetCurrentDlgHandlerScript( dlg );
		state = 0;
	}

	// If we aren't initialized
	if( state == DLG_STATE_INIT )
	{
		// Then we'll send the conversation init event
		_SendDlgEvent( oSpeaker, DLG_INIT, -1, oNPC );
		SetLocalInt( oSpeaker, DLG_STATE, DLG_STATE_RUNNING );
	}

	// Send the page initialization event
	_SendDlgEvent( oSpeaker, DLG_PAGE_INIT, -1, oNPC );
}


/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// CSLConfigureConv				FILE: dmfi_inc_conv
// Purpose:  Configures basic conversation data for Custom Token Dialog System.
// sStartPage is the name of the page where the conversation begins - it does NOT create this page.
// oHolder is where the conversation data is held - OBJECT_SELF or oSpeaker are most common.  If
// you are holding oSpeaker information (ie PCs inventory), oSpeaker is a good place to store the datat.
// nNum is the maximun number of entries to show per page - NOTE: Will NOT limit sStartPage - affects
// all other pages.  nShowEnd - Should every page show an option to END the conversation.  sAbort and 
// sGoodbye are the strings spoken by OBJECT_SELF if the conversation is ABORTED or ENEDED.
void CSLConfigureConv(string sStartPage, object oHolder, int nNum=0, int nShowEnd=FALSE, string sAbort="", string sGoodbye="")
{
	string sTest = CSLGetDlgPageString();
	if (sTest=="")
	{
		CSLSetDlgPageString(sStartPage);
	}
	object oSpeaker = CSLGetPcDlgSpeaker();
	SetLocalObject(OBJECT_SELF, "DLG_HOLDER", oHolder);
	
	if ( nNum==0 ) { nNum = DLG_CONV_NUM; }
	if ( nNum>27 ) { nNum = 27; }
	
	SetLocalInt(oSpeaker, "dlg_num", nNum);
	
	CSLSetShowEndSelection(nShowEnd);
	SetLocalString(OBJECT_SELF, "DLG_ABORT", sAbort);
	SetLocalString(OBJECT_SELF, "DLG_END", sGoodbye);
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// CSLStaticPage					FILE: dmfi_inc_conv
// PURPOSE: Creates a static page with name sPage.  sPrompt is the OBJECT_SELF (NPC) line.  nColor  
// is a COLOR constant.
void CSLStaticPage(string sPage, string sPrompt, int nColor= COLOR_NONE )
{
	if (nColor!=COLOR_NONE)
	{
		sPrompt = CSLColorText(sPrompt, nColor);
	}
	
	SetLocalString(OBJECT_SELF, sPage + "PROMPT", sPrompt);
	SetLocalString(OBJECT_SELF, "DLG_CURRENT_PAGE", sPage);
}	

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// CSLDynamicPage					FILE: dmfi_inc_conv
// PURPOSE: Creates a dynamic page with name sPage.  sPrompt is the OBJECT_SELF (NPC) line.  nColor 
// is a COLOR constant.
void CSLDynamicPage(string sPage, string sPrompt, int nColor=COLOR_NONE)
{
	object oHolder = GetLocalObject(OBJECT_SELF, "DLG_HOLDER");
	SetLocalInt(oHolder, "DLG_REFRESH" + sPage, 1);
	CSLDataArray_DeleteEntire(oHolder, sPage);
	
	if (nColor != COLOR_NONE) 
	{
		sPrompt = CSLColorText(sPrompt, nColor);
	}
	
	SetLocalString(OBJECT_SELF, sPage + "PROMPT", sPrompt);
	SetLocalString(OBJECT_SELF, "DLG_CURRENT_PAGE", sPage);
}

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// CSLAddReply						FILE: dmfi_inc_conv
// PURPOSE: Adds a reply to the last CSLStaticPage or CSLDynamicPage.  sTargetPage is the
// page where selecting this reply will take you.  nColor is a COLOR constant.
void CSLAddReply(string sReply, string sTargetPage="", int nColor=COLOR_NONE)
{
	string sPage;
	object oHolder = GetLocalObject(OBJECT_SELF, "DLG_HOLDER");
	
	if ( nColor != COLOR_NONE )
	{
		sReply = CSLColorText(sReply, nColor);
	}
	
	sPage = GetLocalString(OBJECT_SELF, "DLG_CURRENT_PAGE");
	CSLDataArray_PushString( oHolder, sPage, sReply );
	CSLDataArray_PushString( oHolder, sPage+"TARGET_PAGE", sTargetPage );
}	

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// CSLAddReplyLinkInt				FILE: dmfi_inc_conv
// PURPOSE: Adds a reply to the last CSLStaticPage or CSLDynamicPage and links an integer
// to that particular entries that can be accessed via GetElementInt().  sTargetPage is the
// page where selecting this reply will take you.  nColor is a COLOR constant.
void CSLAddReplyLinkInt(string sReply, string sTargetPage="", int nColor=COLOR_NONE, int nLink=0)
{
	int n;
	string sPage;
	object oHolder = GetLocalObject(OBJECT_SELF, "DLG_HOLDER");
	if ( nColor != COLOR_NONE )
	{
		sReply = CSLColorText(sReply, nColor);
	}
	
	sPage = GetLocalString(OBJECT_SELF, "DLG_CURRENT_PAGE");
	n = CSLDataArray_PushString( oHolder, sPage, sReply );
	CSLDataArray_SetInt(oHolder, sPage, n, nLink );
	CSLDataArray_PushString(oHolder, sPage+"TARGET_PAGE", sTargetPage );
}

/*
void CSLAddReplyLinkInt(string sReply, string sTargetPage="", int nColor=-1, int nLink=0)
{
	int n;
	string sPage;
	object oHolder = GetLocalObject(OBJECT_SELF, "DLG_HOLDER");
	if (nColor!=-1)
	{
		sReply = CSLColorText(sReply, nColor);
	}
	
	sPage = GetLocalString(OBJECT_SELF, "DLG_CURRENT_PAGE");
	n = CSLAddStringElement(sReply, sPage, LIST_PREFIX, oHolder);
	CSLReplaceIntElement(n-1, nLink, sPage, LIST_PREFIX, oHolder);
	CSLAddStringElement(sTargetPage, sPage +"TARGET_PAGE", LIST_PREFIX, oHolder);
}	

*/

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// CSLAddReplyLinkObject			FILE: dmfi_inc_conv
// PURPOSE: Adds a reply to the last CSLStaticPage or CSLDynamicPage and links an object
// to that particular entries that can be accessed via GetElementObject().  sTargetPage is the
// page where selecting this reply will take you.  nColor is a COLOR constant.
void CSLAddReplyLinkObject(string sReply, string sTargetPage="", int nColor=COLOR_NONE, object oLink=OBJECT_INVALID)
{
	int n;
	string sPage;
	object oHolder = GetLocalObject(OBJECT_SELF, "DLG_HOLDER");
	if (nColor!=COLOR_NONE)
	{
		sReply = CSLColorText(sReply, nColor);
	}
	
	sPage = GetLocalString(OBJECT_SELF, "DLG_CURRENT_PAGE");
	n = CSLDataArray_PushString( oHolder, sPage, sReply );
	CSLDataArray_SetObject(oHolder, sPage, n, oLink );
	CSLDataArray_PushString( oHolder, sPage + "TARGET_PAGE", sTargetPage );
}	

/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
// CSLUseReplyPage					FILE: dmfi_inc_conv
// PURPOSE: Rather than adding individual replies, this function assigns a page to use a set of replies
// from another page.  Prevents you from duplicating responses if they are common.
// USE:  Will assign last created page to use sString page's replies.
void CSLUseReplyPage(string sString)
{
	string sPage = GetLocalString(OBJECT_SELF, "DLG_CURRENT_PAGE");
	SetLocalString(OBJECT_SELF, sPage + "DLG_REPLY_PAGE", sString);
}	



/**  
* Description
* @author
* @param 
* @see 
* @return 
*/
void CSLOpenNextDlg( object oPC, object oObjectToConverseWith, string dlgHandler, int bPrivate = FALSE, int bPlayHello = TRUE, int bZoom = TRUE )
{
	object oModule = GetModule();
	object oConvo;
	int i;
	
	//SpeakString("Opening CSLOpenNextDlg Working on this, as it's a known bug");
	
	if (GetObjectType(oObjectToConverseWith)==OBJECT_TYPE_ITEM)
	{
		SetLocalObject( oObjectToConverseWith, DLG_ITEM_CONVERSER, oPC );
		// We can't actually talk to items so we fudge it.
		SetLocalObject( oPC, DLG_ITEM, oObjectToConverseWith );
		oObjectToConverseWith = oPC;
	}
	
	if ( DLG_CONVO_NOFAIL) // USE A ROTATING CONVO COUNTER SO EVERY 10 CONVOS START OVER
	{
		i = (GetLocalInt(oModule, DLG_CONVO_SLOT) % DLG_CONVO_COUNT) + 1;
		SetLocalInt(oModule, DLG_CONVO_SLOT, i);
	}
	else  // USE AN OBJECT LIST TO TRACK WHICH CONVO'S BEING USED
	{
		i = CSLDataArray_LengthObject( oModule, DLG_CONVO_LIST );
		if (i==0) // INITIALIZE THE LIST
		{
			for ( i=1; i<= DLG_CONVO_COUNT; i++)
			{
				CSLDataArray_PushObject(oModule, DLG_CONVO_LIST, OBJECT_INVALID ); // PLACEHOLDERS
			}
		}
		for( i=1; i<=DLG_CONVO_COUNT; i++ ) // FIND AN OPEN CONVO
		{
			oConvo = CSLDataArray_GetObject(oModule, DLG_CONVO_LIST, i-1);
			if ( oConvo==OBJECT_INVALID ) 
			{
				SendMessageToPC(oPC, "Slot " + IntToString(i) + " is open.");
				break;  // THIS SLOT IS OPEN
			}
			if ( !IsInConversation(oConvo) ) // THE LIST THINKS THIS SLOT IS TAKEN, BUT IT'S OBJECT SAYS NOT SO, CLEAR IT AND USE THIS SLOT
			{
				CSLDataArray_SetObject(GetModule(), DLG_CONVO_LIST, i-1, OBJECT_INVALID );
				break;
			}
		}
		if (i>DLG_CONVO_COUNT)
		{
			SendMessageToPC(oPC, "Sorry, all Dynamic Convos full. Try again in a few seconds.");
			return;
		}
		CSLDataArray_SetObject(oModule, DLG_CONVO_LIST, i-1, oPC );
		SetLocalInt(oPC, DLG_CONVO_SLOT, i);
	}
	SetLocalInt(oPC, DLG_CONVO_BASE, 4200);//  SetLocalInt(oPC, DLG_CONVO_BASE, 4200 + i * 100);
	SetLocalInt(oModule, DLG_CONVO_SLOT, 0);
	string dlg = "dmfi_conv_" + IntToString(i);
	// Setup the conversation
	dlg = "dmfi_conv";   
	SetLocalString(oPC, DLG_CURRENT_HANDLER, dlgHandler);
	AssignCommand(oPC, ClearAllActions()); // SO THEY DON'T START TWO IN A ROW AND CONFUSE THE COUNTER ON THEM
	// SpeakString("Opening "+dlg);
	AssignCommand(oObjectToConverseWith, ActionStartConversation(oPC, dlg, bPrivate, bPlayHello));
}