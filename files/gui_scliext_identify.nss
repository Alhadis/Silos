//#include "_SCUtility"
#include "_CSLCore_Math"
#include "_CSLCore_Player"

void main( string sProtocal, int iVersion  )
{	
	string sVersion = CSLIntegerToDotDecimal( iVersion );
	SetLocalInt(OBJECT_SELF,"SCLIENTEXTENDER", TRUE );
	SetLocalString(OBJECT_SELF,"SCLIENTEXTENDERPROTOCAL", sProtocal );
	SetLocalString(OBJECT_SELF,"SCLIENTEXTENDERVERSION", sVersion );

	// put any default settings here
	// using these constants CLIENTEXT_NONE, CLIENTEXT_PER_AREA_MAP_CONTROLS, 
	// CLIENTEXT_NO_MAP_ENVIRON, CLIENTEXT_NO_MAP_DOORS, CLIENTEXT_NO_MAP_TRAPS, CLIENTEXT_NO_MAP_CREATURES, CLIENTEXT_NO_MAP_PATHING
	if ( GetIsDM( OBJECT_SELF) )
	{
		CSLClientExtProperties( GetLocalInt( GetModule(), "SCLIENTEXTENDERPROPSDM" ), OBJECT_SELF ); // CLIENTEXT_NO_MAP_DOORS | CLIENTEXT_NO_MAP_TRAPS | CLIENTEXT_NO_MAP_CREATURES
	}
	else
	{
		CSLClientExtProperties( GetLocalInt( GetModule(), "SCLIENTEXTENDERPROPS" ), OBJECT_SELF ); // CLIENTEXT_NO_MAP_DOORS | CLIENTEXT_NO_MAP_TRAPS | CLIENTEXT_NO_MAP_CREATURES
	}
}