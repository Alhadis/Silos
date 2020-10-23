void main(){


	object oC = GetEnteringObject();
		
	if( !GetIsPC( oC ) ) 
		return;

	// Add the teleporter item to entering pc
	object 	oItem 			= GetFirstItemInInventory( oC );
	string 	sTeleporter 	= "it_teleporter";
	int		HasItem 		= FALSE;
	while( GetIsObjectValid( oItem ) ){
		if( sTeleporter == GetTag(oItem) ){
			HasItem = TRUE;
		}
	}
	if( !HasItem ){
	   CreateItemOnObject( sTeleporter, oC );
	}
	
	// This is for... supernatural fun 
	SetCreatureAppearanceType( oC, APPEARANCE_TYPE_IMP );
	effect eEff = SupernaturalEffect( EffectMovementSpeedIncrease( 99 ) );
	ApplyEffectToObject( DURATION_TYPE_PERMANENT, eEff, oC );  

	
	// Some Info
	string sMessage;
	sMessage = 	"I should speak to this old man and have him run to whatever area I want.";
	DelayCommand( 6.0, AssignCommand( oC, ActionSpeakString(sMessage) ) ); 
	sMessage = "Maybe I should follow him then.";
	DelayCommand( 10.0, AssignCommand( oC, ActionSpeakString(sMessage) ) ); 
	sMessage = "And if I ever lose track of the damned old man...";
	DelayCommand( 14.0, AssignCommand( oC, ActionSpeakString(sMessage) ) ); 
	sMessage = "I can activate this stone object I received in my inventory.";
	DelayCommand( 18.0, AssignCommand( oC, ActionSpeakString(sMessage) ) ); 
	sMessage = "It has Unlimited Uses which and will teleport me back to him.";
	DelayCommand( 22.0, AssignCommand( oC, ActionSpeakString(sMessage) ) ); 
	
}