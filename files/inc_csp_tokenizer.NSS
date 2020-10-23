/*
These are the basic Utitlities
*/
/////////////////////////////////////////////////////
//////////////// Notes /////////////////////////////
////////////////////////////////////////////////////
/*
Not sure on authorship of this, might be seed based on others work, or it might be a well know set of functions.

*/

/////////////////////////////////////////////////////
///////////////// DESCRIPTION ///////////////////////
/////////////////////////////////////////////////////


/////////////////////////////////////////////////////
///////////////// Constants /////////////////////////
/////////////////////////////////////////////////////

struct sCSLStringTokenizer {
    int nRemainingLen;
    string sOrig;
    string sRemaining;
    string sDelim;
    string sLastTok;
};



struct rCSLNameValuePair {
    string sName;
    int iValue;
};

// this might be needed , was causing a conflict


/////////////////////////////////////////////////////
//////////////// Includes ///////////////////////////
/////////////////////////////////////////////////////

// need to review these
#include "_SCUtility_Magic"
// not sure on this one, but might be useful
//#include "_SCSpell_Include_MetaConstants"

/////////////////////////////////////////////////////
//////////////// Prototypes /////////////////////////
/////////////////////////////////////////////////////

struct rCSLNameValuePair CSLGetFirstAlpha(string sArray, string sDelimiter=",");


///// Core prototypes

// Returns the number of items in the specified list.
//int CSLGetElementCount( string list, object holder = OBJECT_SELF );

// Removes the list element at the specified index.  Returns
// the new item count.
//int CSLRemoveElement( int index, string list, object holder = OBJECT_SELF );

// Removes the list elements from start to end-1 inclusive at the
// specified index.  Returns the new item count.
//int CSLRemoveElements( int start, int end, string list, object holder = OBJECT_SELF );

// Inserts a blank entry into the specified index.  Returns
// the new item count.
//int CSLInsertElement( int index, string list, object holder = OBJECT_SELF );

// Deletes the list and all contents.  Returns the number
// of elements deleted in the process.
//int CSLDeleteList( string list, object holder = OBJECT_SELF );

///// STRING Prototypes

// Adds a string item to the list and return the new item count.
//int CSLAddStringElement( string item, string list, object holder = OBJECT_SELF );

// Returns the string item at the specified index.
//string CSLGetStringElement( int index, string list, object holder = OBJECT_SELF );

// Removes the string item from the end of the list and returns
// it.  Note: this will orphan any other types the might be stored
// at the same list location.
//string CSLPopStringElement( string list, object holder = OBJECT_SELF );

// Replaces the string at the specified index.  Returns the old
// string.
//string CSLReplaceStringElement( int index, string value, string list, object holder = OBJECT_SELF );

// Begins a list iteration for string values
//string CSLGetFirstStringElement( string list, object holder = OBJECT_SELF );

// Returns the next item in a list iteration
//string CSLGetNextStringElement();

//// OBJECT Prototypes

// Adds an object item to the list and return the new item count.
//int CSLAddObjectElement( object item, string list, object holder = OBJECT_SELF );

// Returns the object item at the specified index.
//object CSLGetObjectElement( int index, string list, object holder = OBJECT_SELF );

// Removes the object item from the end of the list and returns
// it.  Note: this will orphan any other types the might be stored
// at the same list location.
//object CSLPopObjectElement( string list, object holder = OBJECT_SELF );

// Replaces the object at the specified index.  Returns the old
// string.
//object CSLReplaceObjectElement( int index, object value, string list, object holder = OBJECT_SELF );

// Begins a list iteration for object values
//object CSLGetFirstObjectElement( string list, object holder = OBJECT_SELF );

// Returns the next item in an object list iteration
//object CSLGetNextObjectElement();

//// INT Prototypes

// Adds an int item to the list and return the new item count.
//int CSLAddIntElement( int item, string list, object holder = OBJECT_SELF );

// Returns the int item at the specified index.
//int CSLGetIntElement( int index, string list, object holder = OBJECT_SELF );

// Removes the int item from the end of the list and returns
// it.  Note: this will orphan any other types the might be stored
// at the same list location.
//int CSLPopIntElement( string list, object holder = OBJECT_SELF );

// Replaces the int at the specified index.  Returns the old
// int.
//int CSLReplaceIntElement( int index, int value, string list, object holder = OBJECT_SELF );

// Begins a list iteration for int values
//int CSLGetFirstIntElement( string list, object holder = OBJECT_SELF );

// Returns the next item in a list iteration
//int CSLGetNextIntElement();




//----------------------- Tokens ------------------//
// Get a string tokenizer for sString. sDelim may be multiple
// characters in length.
struct sCSLStringTokenizer CSLGetStringTokenizer(string sString, string sDelim);

// Check to see if any more tokens remain. Returns 0 if not, 1 if so.
int CSLHasMoreTokens(struct sCSLStringTokenizer stTok);

// Get next token
struct sCSLStringTokenizer CSLAdvanceToNextToken(struct sCSLStringTokenizer stTok);

// Get the last token retrieved
string CSLGetNextToken(struct sCSLStringTokenizer stTok);

// Get the number of tokens in the string, by delimeter.
int CSLGetNumberTokens(string sString, string sDelim);

// Get the specified token in the string, by delimiter.
// The first string is position 0, the second is position 1, etc.
string CSLGetTokenByPosition(string sString, string sDelim, int nPos);
//-----------------------End Tokens ------------------//


//----------------------- Lists ------------------//
string CSLListGetCurrent();
void CSLListSetCurrent(string sValue);
int CSLListGetCount(string sList, string sDelim = ",");
string CSLListGetElement(string sList, int nElement, string sDelim = ",");
void CSLListSetCurrent(string sValue);
string CSLPickOneFromList(string sList);
//----------------------- End Lists ------------------//

// return index and value of the first string in alphabetical order
// return -1 if empty string
struct rCSLNameValuePair CSLGetFirstAlpha(string sArray, string sDelimiter=",")
{
    struct rCSLNameValuePair rAlpha;

    rAlpha.iValue       = -1;
    rAlpha.sName        = "~";

    int iCurrent        = 0;
    string sCurrentElement  = "";
    struct sCSLStringTokenizer stTestTok = CSLGetStringTokenizer(sArray, sDelimiter);

    while (CSLHasMoreTokens(stTestTok))
    {
        stTestTok = CSLAdvanceToNextToken(stTestTok);
        sCurrentElement = CSLGetNextToken(stTestTok);
        //if (StringCompareLT(sCurrentElement, rAlpha.sName))
        if (StringCompare(sCurrentElement, rAlpha.sName, TRUE) < 0)
        {
            rAlpha.iValue   = iCurrent;
            rAlpha.sName    = sCurrentElement;
        }
        iCurrent++;
        CSLGetNextToken(stTestTok);
    }
    return (rAlpha);
}
	


/////////////////////////////////////////////////////
//////////////// Implementation /////////////////////
/////////////////////////////////////////////////////

//----------------DMFI Array Functions---------------// <-- planning on merging these so they work similar to the other array functions

string currentList = "";
object currentHolder = OBJECT_INVALID;
int currentCount = 0;
int currentIndex = -1;

// Internal function to get the string for a given
// index
string CSLIndexToString( int index, string list, string sListPrefix  )
{
    return( sListPrefix + list + "." + IntToString(index) );
}

// Returns the number of items in the specified list.
int CSLGetElementCount( string list, string sListPrefix, object holder = OBJECT_SELF )
{
    return( GetLocalInt( holder, sListPrefix + list ) );
}

// Removes the list element at the specified index.  Returns
// the new item count.
int CSLRemoveElement( int index, string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    if( count == 0 )
        return( count );

    // Shift all of the other elements forward
    int i;
    string next;
    for( i = index; i < count - 1; i++ )
        {
        // We don't know what type the list elements are
        // (and they could be any), so we shift them all.
        // This function is already expensive enough anyway.
        string current = CSLIndexToString( i, list, sListPrefix );
        next = CSLIndexToString( i + 1, list, sListPrefix  );

        SetLocalFloat( holder, current, GetLocalFloat( holder, next ) );
        SetLocalInt( holder, current, GetLocalInt( holder, next ) );
        SetLocalLocation( holder, current, GetLocalLocation( holder, next ) );
        SetLocalObject( holder, current, GetLocalObject( holder, next ) );
        SetLocalString( holder, current, GetLocalString( holder, next ) );
        }

    // Delete the top item
    DeleteLocalFloat( holder, next );
    DeleteLocalInt( holder, next );
    DeleteLocalLocation( holder, next );
    DeleteLocalObject( holder, next );
    DeleteLocalString( holder, next );

    count--;
    SetLocalInt( holder, sListPrefix + list, count );

    return( count );
}

// Removes the list elements from start to end-1 inclusive at the
// specified index.  Returns the new item count.
int CSLRemoveElements( int start, int end, string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    if( count == 0 )
        return( count );

    // Shift all of the other elements forward
    int i;
    string next;
    int removeCount = end - start;
    for( i = start; i < count - removeCount; i++ )
        {
        // We don't know what type the list elements are
        // (and they could be any), so we shift them all.
        // This function is already expensive enough anyway.
        string current = CSLIndexToString( i, list, sListPrefix );
        next = CSLIndexToString( i + removeCount, list, sListPrefix );

        SetLocalFloat( holder, current, GetLocalFloat( holder, next ) );
        SetLocalInt( holder, current, GetLocalInt( holder, next ) );
        SetLocalLocation( holder, current, GetLocalLocation( holder, next ) );
        SetLocalObject( holder, current, GetLocalObject( holder, next ) );
        SetLocalString( holder, current, GetLocalString( holder, next ) );
        }

    // Delete the top items
    for( i = count - removeCount; i < count; i++ )
        {
        next = CSLIndexToString( i, list, sListPrefix );
        DeleteLocalFloat( holder, next );
        DeleteLocalInt( holder, next );
        DeleteLocalLocation( holder, next );
        DeleteLocalObject( holder, next );
        DeleteLocalString( holder, next );
        }

    count -= removeCount;
    SetLocalInt( holder, sListPrefix + list, count );

    return( count );
}


// Inserts a blank entry into the specified index.  Returns
// the new item count.
int CSLInsertElement( int index, string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list,  sListPrefix, holder );

    // Shift all of the other elements backwards
    int i;
    string next;
    for( i = count - 1; i >= index; i-- )
        {
        // We don't know what type the list elements are
        // (and they could be any), so we shift them all.
        // This function is already expensive enough anyway.
        string current = CSLIndexToString( i, list, sListPrefix );
        next = CSLIndexToString( i + 1, list, sListPrefix );

        SetLocalFloat( holder, next, GetLocalFloat( holder, current ) );
        SetLocalInt( holder, next, GetLocalInt( holder, current ) );
        SetLocalLocation( holder, next, GetLocalLocation( holder, current ) );
        SetLocalObject( holder, next, GetLocalObject( holder, current ) );
        SetLocalString( holder, next, GetLocalString( holder, current ) );
        }

    // Delete the old values from the index since
    // it should be empty now
    string current = CSLIndexToString( index, list, sListPrefix );
    DeleteLocalFloat( holder, current );
    DeleteLocalInt( holder, current );
    DeleteLocalLocation( holder, current );
    DeleteLocalObject( holder, current );
    DeleteLocalString( holder, current );

    count++;
    SetLocalInt( holder, sListPrefix + list, count );

    return( count );
}

// Deletes the list and all contents.  Returns the number
// of elements deleted in the process.
int CSLDeleteList( string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    if( count == 0 )
        return( count );

    // Delete all elements
    int i;
    for( i = 0; i < count; i++ )
        {
        string current = CSLIndexToString( i, list, sListPrefix );
        DeleteLocalFloat( holder, current );
        DeleteLocalInt( holder, current );
        DeleteLocalLocation( holder, current );
        DeleteLocalObject( holder, current );
        DeleteLocalString( holder, current );
        }

    // Delete the main list info
    DeleteLocalInt( holder, sListPrefix + list );

    return( count );
}




///// STRING FUNCTIONS

// Adds a string item to the list and return the new item count.
int CSLAddStringElement( string item, string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    SetLocalString( holder, CSLIndexToString( count, list, sListPrefix ), item );
    count++;
    SetLocalInt( holder, sListPrefix + list, count );

    return( count );
}

// Returns the string item at the specified index.
string CSLGetStringElement( int index, string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    if( index >= count )
        {
        PrintString( "Error: (GetStringItem) index out of bounds["
                     + IntToString(index) + "] in list:" + list );
        return( "" );
        }
    return( GetLocalString( holder, CSLIndexToString( index, list, sListPrefix ) ) );
}

// Removes the string item from the end of the list and returns
// it.  Note: this will orphan any other types the might be stored
// at the same list location.
string CSLPopStringElement( string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    string index = CSLIndexToString( count - 1, list, sListPrefix );
    string value = GetLocalString( holder, index );

    // Delete the values
    DeleteLocalString( holder, index );

    SetLocalInt( holder, sListPrefix + list, count - 1 );

    return( value );
}

// Replaces the string at the specified index.  Returns the old
// string.
string CSLReplaceStringElement( int index, string value, string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    if( index >= count )
        {
        PrintString( "Error: (ReplaceStringItem) index out of bounds[" + IntToString(index)
                     + "] in list:" + list );
        return( "" );
        }

    string original = GetLocalString( holder, CSLIndexToString( index, list, sListPrefix ) );
    SetLocalString( holder, CSLIndexToString( index, list, sListPrefix ), value );

    return( original );
}

// Begins a list iteration for string values
string CSLGetFirstStringElement( string list, string sListPrefix, object holder = OBJECT_SELF )
{
    currentCount = CSLGetElementCount( list, sListPrefix, holder );
    currentIndex = 0;
    return( GetLocalString( holder, CSLIndexToString( currentIndex++, list, sListPrefix ) ) );
}

// Returns the next item in a list iteration
string CSLGetNextStringElement( string sListPrefix )
{
    if( currentIndex >= currentCount )
        return( "" );
    return( GetLocalString( currentHolder, CSLIndexToString( currentIndex++, currentList, sListPrefix ) ) );
}

//// OBJECT FUNCTIONS

// Adds an object item to the list and return the new item count.
int CSLAddObjectElement( object item, string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    SetLocalObject( holder, CSLIndexToString( count, list, sListPrefix ), item );
    count++;
    SetLocalInt( holder, sListPrefix + list, count );

    return( count );
}

// Returns the object item at the specified index.
object CSLGetObjectElement( int index, string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix,  holder );
    if( index >= count )
        {
        PrintString( "Error: (GetObjectItem) index out of bounds[" + IntToString(index)
                     + "] in list:" + list );
        return( OBJECT_INVALID );
        }
    return( GetLocalObject( holder, CSLIndexToString( index, list, sListPrefix ) ) );
}

// Removes the object item from the end of the list and returns
// it.  Note: this will orphan any other types the might be stored
// at the same list location.
object CSLPopObjectElement( string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    string index = CSLIndexToString( count - 1, list, sListPrefix );
    object value = GetLocalObject( holder, index );

    // Delete the values
    DeleteLocalObject( holder, index );

    SetLocalInt( holder, sListPrefix + list, count - 1 );

    return( value );
}

// Replaces the object at the specified index.  Returns the old
// string.
object CSLReplaceObjectElement( int index, object value, string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    if( index >= count )
        {
        PrintString( "Error: (ReplaceObjectItem) index out of bounds[" + IntToString(index)
                     + "] in list:" + list );
        return( OBJECT_INVALID );
        }

    object original = GetLocalObject( holder, CSLIndexToString( index, list, sListPrefix ) );
    SetLocalObject( holder, CSLIndexToString( index, list, sListPrefix ), value );

    return( original );
}

// Begins a list iteration for object values
object CSLGetFirstObjectElement( string list, string sListPrefix, object holder = OBJECT_SELF )
{
    currentList = list;
    currentHolder = holder;
    currentCount = CSLGetElementCount( list, sListPrefix, holder );
    currentIndex = 0;
    return( GetLocalObject( holder, CSLIndexToString( currentIndex++, list, sListPrefix ) ) );
}

// Returns the next item in an object list iteration
object CSLGetNextObjectElement( string sListPrefix )
{
    if( currentIndex >= currentCount )
        return( OBJECT_INVALID );
    return( GetLocalObject( currentHolder, CSLIndexToString( currentIndex++, currentList, sListPrefix ) ) );
}

//// INT FUNCTIONS

// Adds an int item to the list and return the new item count.
int CSLAddIntElement( int item, string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    SetLocalInt( holder, CSLIndexToString( count, list, sListPrefix ), item );
    count++;
    SetLocalInt( holder, sListPrefix + list, count );

    return( count );
}

// Returns the int item at the specified index.
int CSLGetIntElement( int index, string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    if( index >= count )
        {
        PrintString( "Error: (GetIntItem) index out of bounds[" + IntToString(index)
                     + "] in list:" + list );
        return( -1 );
        }
    return( GetLocalInt( holder, CSLIndexToString( index, list, sListPrefix ) ) );
}

// Removes the int item from the end of the list and returns
// it.  Note: this will orphan any other types the might be stored
// at the same list location.
int CSLPopIntElement( string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    string index = CSLIndexToString( count - 1, list, sListPrefix );
    int value = GetLocalInt( holder, index );

    // Delete the values
    DeleteLocalInt( holder, index );

    SetLocalInt( holder, sListPrefix + list, count - 1 );

    return( value );
}

// Replaces the int at the specified index.  Returns the old
// int.
int CSLReplaceIntElement( int index, int value, string list, string sListPrefix, object holder = OBJECT_SELF )
{
    int count = CSLGetElementCount( list, sListPrefix, holder );
    if( index >= count )
        {
        PrintString( "Error: (ReplaceIntItem) index out of bounds[" + IntToString(index)
                     + "] in list:" + list );
        return( -1 );
        }

    int original = GetLocalInt( holder, CSLIndexToString( index, list, sListPrefix ) );
    SetLocalInt( holder, CSLIndexToString( index, list, sListPrefix ), value );

    return( original );
}

// Begins a list iteration for int values
//int CSLGetFirstIntElement( string list, string sListPrefix, object holder = OBJECT_SELF )
//{
//    currentCount = CSLGetElementCount( list, holder );
//    currentIndex = 0;
//    return( GetLocalInt( holder, CSLIndexToString( currentIndex++, list, sListPrefix ) ) );
//}

// Returns the next item in a list iteration
//int CSLGetNextIntElement( string sListPrefix )
//{
//    if( currentIndex >= currentCount )
//        return( -1 );
//    return( GetLocalInt( currentHolder, CSLIndexToString( currentIndex++, currentList, sListPrefix ) ) );
//}




//----------------------- Tokens ------------------//
// Get a string tokenizer for sString. sDelim may be multiple
// characters in length.
struct sCSLStringTokenizer CSLGetStringTokenizer(string sString, string sDelim)
{
    struct sCSLStringTokenizer sNew;

    sNew.sOrig = sString;
    sNew.sRemaining = sString;
    sNew.sDelim = sDelim;
    sNew.sLastTok = "";
    sNew.nRemainingLen = GetStringLength(sString);

    return sNew;
}

// Check to see if any more tokens remain. Returns 0 if not, 1 if so.
int CSLHasMoreTokens(struct sCSLStringTokenizer stTok)
{
    if (stTok.nRemainingLen > 0) {
        return TRUE;
    }
    return FALSE;
}

// Move tokenizer to next token
struct sCSLStringTokenizer CSLAdvanceToNextToken(struct sCSLStringTokenizer stTok)
{
    int nDelimPos = FindSubString(stTok.sRemaining, stTok.sDelim);
    if ( nDelimPos == SC_DELIM_NOT_FOUND)
	{
        // no delimiters in the string
        stTok.sLastTok = stTok.sRemaining;
        stTok.sRemaining = "";
        stTok.nRemainingLen = 0;
    } else {
        stTok.sLastTok = GetSubString(stTok.sRemaining, 0, nDelimPos);
        stTok.sRemaining = GetSubString(stTok.sRemaining,
                                        nDelimPos+1,
                                        stTok.nRemainingLen - (nDelimPos+1));
        stTok.nRemainingLen = GetStringLength(stTok.sRemaining);
    }

    return stTok;
}

// Get the next token
string CSLGetNextToken(struct sCSLStringTokenizer stTok)
{
    return stTok.sLastTok;
}

// Get the number of tokens in the string, by delimeter.
int CSLGetNumberTokens(string sString, string sDelim)
{
    struct sCSLStringTokenizer stTok = CSLGetStringTokenizer(sString, sDelim);
    int nElements = 0;
    while (CSLHasMoreTokens(stTok)) {
        stTok = CSLAdvanceToNextToken(stTok);
        nElements++;
    }
    return nElements;
}

// Get the specified token in the string, by delimiter.
// The first string is position 0, the second is position 1, etc.
string CSLGetTokenByPosition(string sString, string sDelim, int nPos)
{
    struct sCSLStringTokenizer stTok = CSLGetStringTokenizer(sString, sDelim);
    int i=0;
    while (CSLHasMoreTokens(stTok) && i <= nPos) {
        stTok = CSLAdvanceToNextToken(stTok);
        i++;
    }
    if (i != nPos + 1) 
        return "";

    return CSLGetNextToken(stTok);
}
//-----------------------End Tokens ------------------//


string CSLListGetCurrent()
{
   return GetLocalString( GetModule(), "LISTLAST");
}

void CSLListSetCurrent(string sValue)
{
   SetLocalString(GetModule(), "LISTLAST", sValue);
}


string CSLListGetRemaining()
{
   return GetLocalString( GetModule(), "LISTREST");
}

void CSLListSetRemaining(string sValue)
{
   SetLocalString( GetModule(), "LISTREST", sValue);
}

// TAKES THE FIRST VALUE OFF LIST AND RETURNS TRUNCATED LIST
// STORE THE POPPED ELEMENT IN ListGetCurrent();
string CSLListPopElement(string sList, string sDelim = ",") 
{
   int nLength = GetStringLength(sList);
   if (!nLength) { // NO LENGTH, NO ELEMENTS
      CSLListSetCurrent("");
      return ""; // LIST IS NOW EMPTY
   }
   int nPos = FindSubString(sList, sDelim); // GET FIRST DELIM IN LIST

   if (nPos==-1) // LIST NOT EMPTY BUT CONTAINS NO DELIMITERS SO CONTAINS 1 ELEMENT
   { 
      CSLListSetCurrent(sList);
      return ""; // LIST IS NOW EMPTY
   }
   if (nPos==0) // THERE IS A DELIM IN FIRST POSITION OF THE LIST
   { 
      CSLListSetCurrent(""); // EMPTY ELEMENT
      return GetStringRight(sList, nLength - 1); // SHORTEN THE LIST BY 1 AND EXIT
   }
   string sElement = GetStringLeft(sList, nPos);
   CSLListSetCurrent(sElement); // SAVE THE CURRENT ELEMENT
   sList = GetStringRight(sList, nLength - (nPos+1));
   return sList; // RETURN THE REMAINING LIST STARTING AFTER THE DELIM POSITION
}

int CSLListGetCount(string sList, string sDelim = ",")
{
   if (sList=="") return 0; // LIST IS EMPTY
   int nCount = 1;
   sList = CSLListPopElement(sList, sDelim);
   while (sList!="" && nCount<20)
   {
      nCount++;
      sList = CSLListPopElement(sList, sDelim);
   }
   return nCount;
}

string CSLListGetElement(string sList, int nElement, string sDelim = ",")
{
   int i;
   for (i=1; i <= nElement; i++)
   {
      sList = CSLListPopElement(sList, sDelim);
      if (i==nElement) return CSLListGetCurrent(); // AT THE DESIRED ELEMENT, RETURN IT
      if (sList=="") return ""; // THE LIST IS NOW EMPTY, SO RETURN EMPTY ELEMENT
   }
   return ""; // DEFAULT RETURN SHOULD NEVER BE REACHED
}


string CSLPickOneFromList(string sList)
{
   if (sList=="") return "";
   int nCnt = CSLListGetCount(sList);
   if (nCnt==1) return sList;
   return CSLListGetElement(sList, Random(nCnt)+1);
}



///////////////
/*
// remove first occurence of substring from string along with delimiter
// test,test2,test3,
// 01234567890123456
// len = 16
// iSubStrCount = 6
// index1 = 5

// len = 16
// iSubStrCount =  6
// index1 = 11
*/

// RemoveListElement
string CSLListRemoveElement(string sString, string sSubString, string sDelimiter=",")
{
    int iIndex1      	= FindSubString (sString, sSubString);
	int iDelimiterLength = GetStringLength(sDelimiter);
    int iSubStrCount	= GetStringLength(sSubString) + iDelimiterLength;

    int iIndex2     = iSubStrCount + iIndex1;
    int iRightCount = GetStringLength(sString) - iIndex2;
    string sRet;

	sRet 	= GetSubString(sString, 0, iIndex1); // first part
	// if this was last element and there was no delimiter on the right,
	// iIndex2 will be off the edge, but that's ok, it still returns ""
    sRet    += GetSubString(sString, iIndex2, iRightCount); // last part

	// remove any delimiter on the right (mostly for when we took the last element
	// off the list, leaving a dangling comma)
    if (GetStringRight(sRet, iDelimiterLength) == sDelimiter)
    {
        sRet = GetStringLeft(sRet, GetStringLength(sRet) - iDelimiterLength) ;
	}
    return (sRet);
}

	
// Case-sensitive, alphabetical sort of a delimited list. 
// Sort
string CSLListSort(string sList, string sDelimiter=",")
{
    int i = 1;
    string sSortedList  = "";
    struct rCSLNameValuePair rAlpha = CSLGetFirstAlpha(sList, sDelimiter);

    //PrintString(IntToString(i) + " - rAlpha.sName = " + rAlpha.sName);

    while (rAlpha.iValue != -1)
    {
        if (i > 1)
            sSortedList += sDelimiter;
        sSortedList += rAlpha.sName;	// add string to sorted list
        //PrintString(IntToString(i) + " - sSortedList = " + sSortedList);
        sList = CSLListRemoveElement(sList, rAlpha.sName); // Remove the string from the list
        //PrintString(IntToString(i) + " - sArray = " + sArray);
        i++;
        rAlpha = CSLGetFirstAlpha(sList);
        //PrintString(IntToString(i) + " - rAlpha.sName = " + rAlpha.sName);
    }
//        sSortedList = rAlpha.sName;
//        PrintString(IntToString(i) + " - sSortedList = " + sSortedList);

    return (sSortedList);
}

// Create a list element.  Returns sElement w/ prepended delimiter (unless empty string)
// doesn't work for 
// FormListElement
string CSLListFormElement(string sElement, string sDelimiter=",")
{
    if (sElement != "")
       sElement = sDelimiter + sElement;
    return(sElement);
}

// Add an element to a list.  Will not add empty string Elements.
// AppendToList
string CSLListAppend(string sList, string sElement, string sDelimiter=",")
{
	// don't preceed with delimiter if this is the first element
	if (sList == "")
		sDelimiter = "";

	sList += CSLListFormElement(sElement, sDelimiter);
    return(sList);
}

// returns token index of first occurence of sElement in sList
// return -1 if not found
// FindListElementIndex
int CSLListFindElementIndex(string sList, string sElement, string sDelimiter=",")
{
	int bTokenFound 	= FALSE;
    int iValue       	= -1;
    int iCurrent        = 0;
    string sCurrentElement  = "";
    struct sCSLStringTokenizer stTok = CSLGetStringTokenizer(sList, sDelimiter);

    while ( CSLHasMoreTokens(stTok) && !bTokenFound)
    {
        stTok = CSLAdvanceToNextToken(stTok);
        sCurrentElement = CSLGetNextToken(stTok);
        if (sCurrentElement == sElement)
        {
            iValue   = iCurrent;
			bTokenFound = TRUE;
        }
        iCurrent++;
        CSLGetNextToken(stTok);
    }
    return (iValue);
}

// returns true if element found in list
// GetIsInList
int CSLListIsIn(string sList, string sElement, string sDelimiter=",")
{
	int iIndex = CSLListFindElementIndex(sList, sElement, sDelimiter);
    return (iIndex != -1);
}	


// Appends sElement to sList only if it does not already exist.  
// Returns the complete list
// AppendUniqueToList
string CSLListAppendUnique(string sList, string sElement, string sDelimiter=",")
{
	if (!CSLListIsIn(sList, sElement, sDelimiter))
		sList = CSLListAppend(sList, sElement, sDelimiter);

	return (sList);
}

// append sElement to global string (treated as a list)
// CSLListAppendGlobal
string CSLListAppendGlobal(string sVarName, string sElement, int bUnique=FALSE, string sDelimiter=",")
{
	string sList = GetGlobalString(sVarName);
	if (bUnique)
		sList = CSLListAppendUnique(sList, sElement, sDelimiter);
	else
		sList = CSLListAppend(sList, sElement, sDelimiter);

	SetGlobalString(sVarName, sList);
	return (sList);
}


// Count the number of sub-strings in a string, split by the specified separator.
// - sSource String to split
// - sSeparator Characters used to split the string
// * Returns the number of sub-strings
// JXStringSplitCount -- i need to merge this into my code base
int CSLListCountElements(string sSource, string sSeparator)
{
	int iCount = 1;
	string sTemp = sSource;

	int iPos = FindSubString(sTemp, sSeparator);
	while (iPos != -1)
	{
		iCount++;
		sTemp = GetStringRight(sTemp, GetStringLength(sTemp) - iPos - GetStringLength(sSeparator));
		iPos = FindSubString(sTemp, sSeparator);
	}

	return iCount;
}


// Split a string using the specified separator, and returns the sub-string at the specified position.
// Use in conjunction with JXStringSplitCount() to get the number of available sub-strings.
// - sSource String to split
// - sSeparator Characters used to split the string
// - iRank Rank of the sub-string to get (starting at 0)
// * Returns the desired sub-string
// JXStringSplit -- i need to merge this into my code base
string CSLListSplit(string sSource, string sSeparator, int iRank)
{
	int iCount = 0;
	string sTemp = sSource;

	int iPos = FindSubString(sTemp, sSeparator);
	while (iPos != -1)
	{
		if (iCount == iRank)
			return GetStringLeft(sTemp, iPos);

		iCount++;
		sTemp = GetStringRight(sTemp, GetStringLength(sTemp) - iPos - GetStringLength(sSeparator));
		iPos = FindSubString(sTemp, sSeparator);
	}

	return sTemp;
}