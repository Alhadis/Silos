// e_mod_pcloaded
/*
   Module on pc loaded event
   Saved characters might be riding a horse, which breaks the system
   
*/
// 120501 Alban 

#include "inc_rws_horses"

int GetHasMountedAppearance( object oCreature )
{
	int nAppearance = GetAppearanceType(oCreature);
	
	if( nAppearance >= MOUNT_MIN && nAppearance <= MOUNT_MAX ){
		return TRUE;
	}
	
	return FALSE;
	
}

void main(){

	object oCreature = GetEnteringObject();

	if( !GetIsPC(oCreature) && !GetIsOwnedByPlayer( oCreature ) )
	{
		return;
	}
	
	if( GetHasMountedAppearance( oCreature ) )
	{
		SetUnmountedAppearance( oCreature );
	}
}