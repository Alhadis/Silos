/******************************************************************
 * Name: core_persist
 * Type: CORE Modules Include File
 * ---
 * Author: Cereborn
 * Date: 9/8/03
 * ---
 * Contains wrappers for campaign database calls
 *
 * IMPORTANT: THIS FILE IS A CORE SCRIPT AND MUST NOT BE
 * MODIFIED EXCEPT THROUGH OFFICIAL CORE PATCHES!
 ******************************************************************/

#include "core_options"
#include "pd_var_h"


// My, but wouldn't templates be nice!

// Forward References:
//    These are for internal use only!!  External users use
//    CoreSetPersistentLocation() and CoreGetPersistentLocation()


location lAlfaReturnLocation;

void CoreSetCampaignLocation( string sDatabase, string psVarName,
  location plValue, object oPlayer = OBJECT_INVALID );

location CoreGetCampaignLocation( string sDatabase, string psVarName,
  object oPlayer = OBJECT_INVALID );

// Set a persistent string
//
//  ARGUMENTS:
//      sDatabase    = the name of the database to write to
//      psVarName    = the name of the string variable
//      psValue      = the string value to write
//      poPlayer     = OPTIONAL - Player to associate this string with
//      bPartyInArea = OPTIONAL - Write variable for each player in
//                     poPlayer's party that's also in poPlayer's current
//                     area
//
void CoreSetPersistentString( string sDatabase, string psVarName,
  string psValue, object poPlayer=OBJECT_INVALID, int bPartyInArea=FALSE )
{
  if ( bPartyInArea && GetIsObjectValid( poPlayer ) )
  {
    object oPC = GetFirstFactionMember( poPlayer );
    object oArea = GetArea( poPlayer );

    while( GetIsObjectValid( oPC ) )
    {
      if( !GetIsDM( oPC ) && ( oArea == GetArea( oPC ) ) )
      {
        SetCampaignString( sDatabase, psVarName, psValue, oPC );
      }

      oPC = GetNextFactionMember( poPlayer, TRUE );
    }
  }

  else
  {
    SetCampaignString( sDatabase, psVarName, psValue, poPlayer );
  }
}

// Set a persistent integer
//
//  ARGUMENTS:
//      sDatabase    = the name of the database to write to
//      psVarName    = the name of the integer variable
//      pnValue      = the integer value to write
//      poPlayer     = OPTIONAL - Player to associate this integer with
//      bPartyInArea = OPTIONAL - Write variable for each player in
//                     poPlayer's party that's also in poPlayer's current
//                     area
//
void CoreSetPersistentInt( string sDatabase, string psVarName, int pnValue,
  object poPlayer=OBJECT_INVALID, int bPartyInArea=FALSE )
{
  if ( bPartyInArea && GetIsObjectValid( poPlayer ) )
  {
    object oPC = GetFirstFactionMember( poPlayer );
    object oArea = GetArea( poPlayer );

    while( GetIsObjectValid( oPC ) )
    {
      if( !GetIsDM( oPC ) && ( oArea == GetArea( oPC ) ) )
      {
        SetCampaignInt( sDatabase, psVarName, pnValue, oPC );
      }

      oPC = GetNextFactionMember( poPlayer, TRUE );
    }
  }

  else
  {
    SetCampaignInt( sDatabase, psVarName, pnValue, poPlayer );
  }
}

// Set a persistent float
//
//  ARGUMENTS:
//      sDatabase    = the name of the database to write to
//      psVarName    = the name of the float variable
//      pfValue      = the float value to write
//      poPlayer     = OPTIONAL - Player to associate this float with
//      bPartyInArea = OPTIONAL - Write variable for each player in
//                     poPlayer's party that's also in poPlayer's current
//                     area
//
void CoreSetPersistentFloat( string sDatabase, string psVarName, float pfValue,
  object poPlayer=OBJECT_INVALID, int bPartyInArea=FALSE )
{
  if ( bPartyInArea && GetIsObjectValid( poPlayer ) )
  {
    object oPC = GetFirstFactionMember( poPlayer );
    object oArea = GetArea( poPlayer );

    while( GetIsObjectValid( oPC ) )
    {
      if( !GetIsDM( oPC ) && ( oArea == GetArea( oPC ) ) )
      {
        SetCampaignFloat( sDatabase, psVarName, pfValue, oPC );
      }

      oPC = GetNextFactionMember( poPlayer, TRUE );
    }
  }

  else
  {
    SetCampaignFloat( sDatabase, psVarName, pfValue, poPlayer );
  }
}

// Set a persistent location - Note Well: Setting persistent locations is
// essentially broken in the current Bioware database implementation.
// Use of this function is not currently recommended.
//
//  ARGUMENTS:
//      sDatabase    = the name of the database to write to
//      psVarName    = the name of the location variable
//      plValue      = the location value to write
//      poPlayer     = OPTIONAL - Player to associate this location with
//      bPartyInArea = OPTIONAL - Write variable for each player in
//                     poPlayer's party that's also in poPlayer's current
//                     area
//
void CoreSetPersistentLocation( string sDatabase, string psVarName,
  location plValue, object poPlayer=OBJECT_INVALID, int bPartyInArea=FALSE )
{
  if ( bPartyInArea && GetIsObjectValid( poPlayer ) )
  {
    object oPC = GetFirstFactionMember( poPlayer );
    object oArea = GetArea( poPlayer );

    while( GetIsObjectValid( oPC ) )
    {
      if( !GetIsDM( oPC ) && ( oArea == GetArea( oPC ) ) )
      {
        CoreSetCampaignLocation( sDatabase, psVarName, plValue, oPC );
      }

      oPC = GetNextFactionMember( poPlayer, TRUE );
    }
  }

  else
  {
    CoreSetCampaignLocation( sDatabase, psVarName, plValue, poPlayer );
  }
}

// Set a persistent vector
//
//  ARGUMENTS:
//      sDatabase    = the name of the database to write to
//      psVarName    = the name of the vector variable
//      pvValue      = the vector value to write
//      poPlayer     = OPTIONAL - Player to associate this vector with
//      bPartyInArea = OPTIONAL - Write variable for each player in
//                     poPlayer's party that's also in poPlayer's current
//                     area
//
void CoreSetPersistentVector( string sDatabase, string psVarName,
  vector pvValue, object poPlayer=OBJECT_INVALID, int bPartyInArea=FALSE )
{
  if ( bPartyInArea && GetIsObjectValid( poPlayer ) )
  {
    object oPC = GetFirstFactionMember( poPlayer );
    object oArea = GetArea( poPlayer );

    while( GetIsObjectValid( oPC ) )
    {
      if( !GetIsDM( oPC ) && ( oArea == GetArea( oPC ) ) )
      {
        SetCampaignVector( sDatabase, psVarName, pvValue, oPC );
      }

      oPC = GetNextFactionMember( poPlayer, TRUE );
    }
  }

  else
  {
    SetCampaignVector( sDatabase, psVarName, pvValue, poPlayer );
  }
}

// Set a persistent object
//
//  ARGUMENTS:
//      sDatabase    = the name of the database to write to
//      psVarName    = the name of the object variable
//      poObject     = the object to write
//      poPlayer     = OPTIONAL - Player to associate this object with
//      bPartyInArea = OPTIONAL - Write variable for each player in
//                     poPlayer's party that's also in poPlayer's current
//                     area
//
void CoreSetPersistentObject( string sDatabase, string psVarName,
  object poObject, object poPlayer=OBJECT_INVALID, int bPartyInArea=FALSE )
{
  if ( bPartyInArea && GetIsObjectValid( poPlayer ) )
  {
    object oPC = GetFirstFactionMember( poPlayer );
    object oArea = GetArea( poPlayer );

    while( GetIsObjectValid( oPC ) )
    {
      if( !GetIsDM( oPC ) && ( oArea == GetArea( oPC ) ) )
      {
        StoreCampaignObject(sDatabase, psVarName, poObject, poPlayer);
      }

      oPC = GetNextFactionMember( poPlayer, TRUE );
    }
  }

  else
  {
    StoreCampaignObject(sDatabase, psVarName, poObject, poPlayer);
  }

  StoreCampaignObject(sDatabase, psVarName, poObject, poPlayer);
}


// Get a persistent string
//
//  ARGUMENTS:
//      sDatabase    = the name of the database to get the string from
//      psVarName    = the name of the string variable
//      poPlayer     = OPTIONAL - Player associated with this string
//
string CoreGetPersistentString( string sDatabase, string psVarName,
  object poPlayer=OBJECT_INVALID )
{
  return GetCampaignString( sDatabase, psVarName, poPlayer );
}

// Get a persistent integer
//
//  ARGUMENTS:
//      sDatabase    = the name of the database to get the integer from
//      psVarName    = the name of the integer variable
//      poPlayer     = OPTIONAL - Player associated with this integer
//
int CoreGetPersistentInt(string sDatabase, string psVarName,
  object poPlayer=OBJECT_INVALID)
{
  return GetCampaignInt( sDatabase, psVarName, poPlayer );
}

// Get a persistent float
//
//  ARGUMENTS:
//      sDatabase    = the name of the database to get the float from
//      psVarName    = the name of the float variable
//      poPlayer     = OPTIONAL - Player associated with this float
//
float CoreGetPersistentFloat( string sDatabase, string psVarName,
  object poPlayer=OBJECT_INVALID )
{
  return GetCampaignFloat( sDatabase, psVarName, poPlayer );
}

// Get a persistent location
//
//  ARGUMENTS:
//      sDatabase    = the name of the database to get the location from
//      psVarName    = the name of the location variable
//      poPlayer     = OPTIONAL - Player associated with this location
//
location CoreGetPersistentLocation( string sDatabase, string psVarName,
  object poPlayer=OBJECT_INVALID )
{
  return CoreGetCampaignLocation( sDatabase, psVarName, poPlayer );
}

// Get a persistent vector
//
//  ARGUMENTS:
//      sDatabase    = the name of the database to get the vector from
//      psVarName    = the name of the vector variable
//      poPlayer     = OPTIONAL - Player associated with this vector
//
vector CoreGetPersistentVector( string sDatabase, string psVarName,
  object poPlayer=OBJECT_INVALID )
{
  return GetCampaignVector( sDatabase, psVarName, poPlayer );
}

// Get a persistent object
//
//  ARGUMENTS:
//      sDatabase         = the name of the database to get the object from
//      psVarName         = the name of the object variable
//      lCreateAtLocation = create the object at this location
//      oCreateOnOwner    = OPTIONAL - create the object on this owner
//      poPlayer          = OPTIONAL - Player associated with this object
//
object CoreGetPersistentObject( string sDatabase, string psVarName,
  location lCreateAtLocation, object oCreateOnOwner = OBJECT_INVALID,
  object poPlayer = OBJECT_INVALID )
{
  return RetrieveCampaignObject( sDatabase, psVarName, lCreateAtLocation,
    oCreateOnOwner, poPlayer );
}

// Delete a persistent variable - Note that variables are not actually deleted,
// but rather marked for deletion.  When possible, variable reuse is preferred.
// 3rd party tools (such as DBFNavigator) may be used to 'pack' the database
// (which does the actual deletion).
//
//  ARGUMENTS:
//      sDatabase         = the name of the database to delete the variable from
//      psVarName         = the name of the variable to delete
//      poPlayer          = OPTIONAL - Player associated with this variable
//
void CoreDeletePersistentVariable( string sDatabase, string psVarName,
  object poPlayer=OBJECT_INVALID )
{
  DeleteCampaignVariable( sDatabase, psVarName, poPlayer );
}

// The Set/Get Campaign Location functions are broken, because they store the
// OBJECT ID of the area portion of the location, which can change across server
// resets (especially if the module is modified).  These versions store and
// retrieve the tag of the area, a vector and the facing.  This works only if
// the module has unique area tags.  A flag is used to indicate if this is so; if
// not, we fall back to the somewhat less broken Bioware versions.

void CoreSetCampaignLocation( string sDatabase, string psVarName,
  location plValue, object oPlayer = OBJECT_INVALID )
{
  if ( gCORE_MODULE_HAS_UNIQUE_AREA_TAGS )
  {
    string sTagVarName;
    string sAreaTag;
    object oArea;

    // Set up the variable names
    sTagVarName = psVarName + "_tag";

    // Get the data we need to store from the location passed in
    oArea = GetAreaFromLocation( plValue );
    sAreaTag = GetTag( oArea );

    // Store the data
    SetCampaignString( sDatabase, sTagVarName, sAreaTag, oPlayer );
  }

  SetCampaignLocation( sDatabase, psVarName, plValue, oPlayer );

}

location CoreGetCampaignLocation( string sDatabase, string psVarName,
  object oPlayer = OBJECT_INVALID )
{
  location lReturnLoc;

  if ( gCORE_MODULE_HAS_UNIQUE_AREA_TAGS )
  {
    string sTagVarName;
    string sAreaTag;
    vector vAreaVec;
    float fFacing;
    object oArea;
    location oStoredLocation;

    sTagVarName = psVarName + "_tag";

    // Retrieve the data from the database
    sAreaTag = GetCampaignString( sDatabase, sTagVarName, oPlayer );
    oStoredLocation = GetCampaignLocation( sDatabase, psVarName, oPlayer );

    oArea = GetObjectByTag( sAreaTag );

    if ( GetIsObjectValid( oArea ) )
    {
      vAreaVec = GetPositionFromLocation( oStoredLocation );
      fFacing = GetFacingFromLocation( oStoredLocation );
      lReturnLoc = Location( oArea, vAreaVec, fFacing );
    }

    else
    {
      lReturnLoc = oStoredLocation;
    }
  }

  else
  {
    // If the module doesn't have unique area tags, use the old Bioware forms
    lReturnLoc = GetCampaignLocation( sDatabase, psVarName, oPlayer );
  }

  return lReturnLoc;
}

//
// Shared versions use the Central Server (PD)

const string CORE_TEMP_SHARED_DB = "TempSharedDB";

void CoreSetSharedPersistentString( string psVarName, string psValue,
  object poPlayer=OBJECT_INVALID, int bPartyInArea=FALSE )
{
  if ( bPartyInArea && GetIsObjectValid( poPlayer ) )
  {
    object oPC = GetFirstFactionMember( poPlayer );
    object oArea = GetArea( poPlayer );

    while( GetIsObjectValid( oPC ) )
    {
      if( !GetIsDM( oPC ) && ( oArea == GetArea( oPC ) ) )
      {
        if (gCORE_USE_PD_PERSISTENCE)
        {
          pd_set_str( psVarName, psValue, oPC );
        }

        else
        {
          CoreSetPersistentString( CORE_TEMP_SHARED_DB, psVarName, psValue, oPC );
        }
      }

      oPC = GetNextFactionMember( poPlayer, TRUE );
    }
  }

  else
  {
    if (gCORE_USE_PD_PERSISTENCE)
    {
      pd_set_str( psVarName, psValue, poPlayer );
    }

    else
    {
      CoreSetPersistentString( CORE_TEMP_SHARED_DB, psVarName, psValue, poPlayer );
    }
  }
}

string CoreGetSharedPersistentString( string psVarName,
  object poPlayer=OBJECT_INVALID )
{
  if (gCORE_USE_PD_PERSISTENCE)
  {
    return pd_get_str( psVarName, poPlayer );
  }

  else
  {
    return CoreGetPersistentString( CORE_TEMP_SHARED_DB, psVarName, poPlayer );
  }
}

void CoreSetSharedPersistentInt( string psVarName, int pnValue,
  object poPlayer=OBJECT_INVALID, int bPartyInArea=FALSE )
{
  if ( bPartyInArea && GetIsObjectValid( poPlayer ) )
  {
    object oPC = GetFirstFactionMember( poPlayer );
    object oArea = GetArea( poPlayer );

    while( GetIsObjectValid( oPC ) )
    {
      if( !GetIsDM( oPC ) && ( oArea == GetArea( oPC ) ) )
      {
        if (gCORE_USE_PD_PERSISTENCE)
        {
          pd_set_int( psVarName, pnValue, oPC );
        }

        else
        {
          CoreSetPersistentInt( CORE_TEMP_SHARED_DB, psVarName, pnValue, oPC );
        }
      }

      oPC = GetNextFactionMember( poPlayer, TRUE );
    }
  }

  else
  {
    if (gCORE_USE_PD_PERSISTENCE)
    {
      pd_set_int( psVarName, pnValue, poPlayer );
    }

    else
    {
      CoreSetPersistentInt( CORE_TEMP_SHARED_DB, psVarName, pnValue, poPlayer );
    }
  }
}

int CoreGetSharedPersistentInt( string psVarName,
  object poPlayer=OBJECT_INVALID )
{
  if (gCORE_USE_PD_PERSISTENCE)
  {
    return pd_get_int( psVarName, poPlayer );
  }

  else
  {
    return CoreGetPersistentInt( CORE_TEMP_SHARED_DB, psVarName, poPlayer );
  }
}

void CoreSetSharedPersistentFloat( string psVarName, float pfValue,
  object poPlayer=OBJECT_INVALID, int bPartyInArea=FALSE )
{
  if ( bPartyInArea && GetIsObjectValid( poPlayer ) )
  {
    object oPC = GetFirstFactionMember( poPlayer );
    object oArea = GetArea( poPlayer );

    while( GetIsObjectValid( oPC ) )
    {
      if( !GetIsDM( oPC ) && ( oArea == GetArea( oPC ) ) )
      {
        if (gCORE_USE_PD_PERSISTENCE)
        {
          pd_set_dec( psVarName, pfValue, oPC );
        }

        else
        {
          CoreSetPersistentFloat( CORE_TEMP_SHARED_DB, psVarName, pfValue, oPC );
        }
      }

      oPC = GetNextFactionMember( poPlayer, TRUE );
    }
  }

  else
  {
    if (gCORE_USE_PD_PERSISTENCE)
    {
      pd_set_dec( psVarName, pfValue, poPlayer );
    }

    else
    {
      CoreSetPersistentFloat( CORE_TEMP_SHARED_DB, psVarName, pfValue, poPlayer );
    }
  }
}

float CoreGetSharedPersistentFloat( string psVarName,
  object poPlayer=OBJECT_INVALID )
{
  if (gCORE_USE_PD_PERSISTENCE)
  {
    return pd_get_dec( psVarName, poPlayer );
  }

  else
  {
    return CoreGetPersistentFloat( CORE_TEMP_SHARED_DB, psVarName, poPlayer );
  }
}


void CoreSetSharedPersistentVector( string psVarName, vector pvValue,
  object poPlayer=OBJECT_INVALID, int bPartyInArea=FALSE )
{
  if ( bPartyInArea && GetIsObjectValid( poPlayer ) )
  {
    object oPC = GetFirstFactionMember( poPlayer );
    object oArea = GetArea( poPlayer );

    while( GetIsObjectValid( oPC ) )
    {
      if( !GetIsDM( oPC ) && ( oArea == GetArea( oPC ) ) )
      {
        if (gCORE_USE_PD_PERSISTENCE)
        {
          pd_set_vec( psVarName, pvValue, oPC );
        }

        else
        {
          CoreSetPersistentVector( CORE_TEMP_SHARED_DB, psVarName, pvValue, oPC );
        }
      }

      oPC = GetNextFactionMember( poPlayer, TRUE );
    }
  }

  else
  {
    if (gCORE_USE_PD_PERSISTENCE)
    {
      pd_set_vec( psVarName, pvValue, poPlayer );
    }

    else
    {
      CoreSetPersistentVector( CORE_TEMP_SHARED_DB, psVarName, pvValue, poPlayer );
    }
  }
}

vector CoreGetSharedPersistentVector( string psVarName,
  object poPlayer=OBJECT_INVALID )
{
  if (gCORE_USE_PD_PERSISTENCE)
  {
    return pd_get_vec( psVarName, poPlayer );
  }

  else
  {
    return CoreGetPersistentVector( CORE_TEMP_SHARED_DB, psVarName, poPlayer );
  }
}

void CoreSetSharedPersistentLocation( string psVarName, location plValue,
  object poPlayer=OBJECT_INVALID, int bPartyInArea=FALSE)
{
  if ( bPartyInArea && GetIsObjectValid( poPlayer ) )
  {
    object oPC = GetFirstFactionMember( poPlayer );
    object oArea = GetArea( poPlayer );

    while( GetIsObjectValid( oPC ) )
    {
      if( !GetIsDM( oPC ) && ( oArea == GetArea( oPC ) ) )
      {
        if (gCORE_USE_PD_PERSISTENCE)
        {
          pd_set_loc( psVarName, plValue, oPC);
        }

        else
        {
          CoreSetPersistentLocation( CORE_TEMP_SHARED_DB, psVarName, plValue, oPC);
        }
      }

      oPC = GetNextFactionMember( poPlayer, TRUE );
    }
  }

  else
  {
    if (gCORE_USE_PD_PERSISTENCE)
    {
      pd_set_loc( psVarName, plValue, poPlayer );
    }

    else
    {
      CoreSetPersistentLocation( CORE_TEMP_SHARED_DB, psVarName, plValue, poPlayer);
    }
  }
}

location CoreGetSharedPersistentLocation( string psVarName,
  object poPlayer=OBJECT_INVALID )
{
  if (gCORE_USE_PD_PERSISTENCE)
  {
    return pd_get_loc( psVarName, poPlayer );
  }

  else
  {
    return CoreGetPersistentLocation( CORE_TEMP_SHARED_DB, psVarName, poPlayer );
  }
}