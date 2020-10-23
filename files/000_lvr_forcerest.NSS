#include "acr_resting_i"

void main() {
	object oUser = GetLastUsedBy();
	DeleteLocalInt( oUser, ACR_REST_NOT_TIRED );
	SetLocalInt( oUser, ACR_REST_HP, GetCurrentHitPoints( oUser ) );
	SetLocalInt( oUser, ACR_REST_STRENGTH, GetAbilityScore( oUser, ABILITY_STRENGTH ) );
	SetLocalInt( oUser, ACR_REST_DEXTERITY, GetAbilityScore( oUser, ABILITY_DEXTERITY ) );
	SetLocalInt( oUser, ACR_REST_CONSTITUTION, GetAbilityScore( oUser, ABILITY_CONSTITUTION ) );
	SetLocalInt( oUser, ACR_REST_INTELLIGENCE, GetAbilityScore( oUser, ABILITY_INTELLIGENCE ) );
	SetLocalInt( oUser, ACR_REST_WISDOM, GetAbilityScore( oUser, ABILITY_WISDOM ) );
	SetLocalInt( oUser, ACR_REST_CHARISMA, GetAbilityScore( oUser, ABILITY_CHARISMA ) );
	ForceRest( oUser );
	_playerRestFinish( oUser );
}