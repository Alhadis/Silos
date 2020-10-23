////////////////////////////////////////////////////////////////////////////////
//
//  System Name : ACR Configuration File
//     Filename : abr_golem_i
//        $Date:: 2013-01-31
//       Author : FoamBats4All
//
//  Description:
//  This script libraries holds functions common to golem creature types.
//
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Includes ////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Constants ///////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

const string LVAR_IS_BERSERK = "GOLEM_IS_BERSERK";
const string LVAR_BERSERK_CHANCE = "GOLEM_BERSERK_CHANCE";
const string LVAR_BERSERK_CAN_REVERT = "GOLEM_BERSERK_CAN_REVERT";
const string LVAR_ROUNDS_SINCE_COMBAT = "GOLEM_ROUNDS_SINCE_COMBAT";

////////////////////////////////////////////////////////////////////////////////
// Structures //////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Global Variables ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
// Function Prototypes /////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

int GetGolemIsBerserk( object oCreature );

void SetGolemIsBerserk( object oCreature, int bValue );

int GetGolemCanRegainControl( object oCreature );

void SetGolemCanRegainControl( object oCreature, int bValue );

int GetGolemBerserkChance( object oCreature );

void SetGolemBerserkChance( object oCreature, int nValue );

void IncrementGolemBerserkChance( object oCreature );

void HandleGolemBerserkCheck( object oCreature );

////////////////////////////////////////////////////////////////////////////////
// Function Definitions ////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

int GetGolemIsBerserk( object oCreature ) {
	return GetLocalInt( oCreature, LVAR_IS_BERSERK );
}

void SetGolemIsBerserk( object oCreature, int bValue ) {
	if ( bValue < 0 ) bValue = 0;
	if ( bValue > 1 ) bValue = 1;
	SetLocalInt( oCreature, LVAR_IS_BERSERK, bValue );
	
	// If we're turning berserk, attack the nearest thing.
	if ( bValue == TRUE ) {
		AssignCommand( oCreature, ClearAllActions() );
		object oTarget = GetNearestCreature( CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN_AND_HEARD, oCreature );
		SetIsTemporaryEnemy( oTarget, oCreature );
		SetIsTemporaryEnemy( oCreature, oTarget );
		AssignCommand( oCreature, ActionAttack( oTarget ) );
	}
}

int GetGolemCanRegainControl( object oCreature ) {
	return GetLocalInt( oCreature, LVAR_BERSERK_CAN_REVERT );
}


void SetGolemCanRegainControl( object oCreature, int bValue ) {
	if ( bValue < 0 ) bValue = 0;
	if ( bValue > 1 ) bValue = 1;
	SetLocalInt( oCreature, LVAR_BERSERK_CAN_REVERT, bValue );
}


int GetGolemBerserkChance( object oCreature ) {
	return GetLocalInt( oCreature, LVAR_BERSERK_CHANCE );
}


void SetGolemBerserkChance( object oCreature, int nValue ) {
	if ( nValue > 100 ) nValue = 100;
	if ( nValue < 0 ) nValue = 0;
	SetLocalInt( oCreature, LVAR_BERSERK_CHANCE, nValue );
}


void IncrementGolemBerserkChance( object oCreature ) {
	int nChance = GetGolemBerserkChance( oCreature );
	nChance++;
	SetGolemBerserkChance( oCreature, nChance );
}


void HandleGolemBerserkCheck( object oCreature ) {
	// We handle this differently, depending on if we're in combat or not.
	if ( GetIsInCombat( oCreature ) ) {
		// If we're already berserk, we don't care.
		if ( GetGolemIsBerserk( oCreature ) ) return;
	
		// Increment our berserk chance.
		IncrementGolemBerserkChance( oCreature );
		
		// Make a check.
		int nChance = GetGolemBerserkChance( oCreature );
		if ( Random(100) < nChance ) {
			SetGolemIsBerserk( oCreature, TRUE );
		}
	} else {
		// Here we only care if we actually have berserk chance stored, and if the creature can regain control.
		if ( GetGolemCanRegainControl( oCreature ) && GetGolemBerserkChance( oCreature ) > 0 ) {
			// Increment our rounds since combat ended.
			int nRoundsSinceCombatEnded = GetLocalInt( oCreature, LVAR_ROUNDS_SINCE_COMBAT ) + 1;
			
			// If our rounds is greater than 10 (1 minute), we clear everything.
			if ( nRoundsSinceCombatEnded >= 10 ) {
				DeleteLocalInt( oCreature, LVAR_BERSERK_CHANCE );
				DeleteLocalInt( oCreature, LVAR_ROUNDS_SINCE_COMBAT );
			} else {
				// Otherwise, increment our number of rounds.
				SetLocalInt( oCreature, LVAR_ROUNDS_SINCE_COMBAT, nRoundsSinceCombatEnded );
			}
		}
	}
}