// Put this script OnEnter.

#include "acr_trigger_i"

void main()
{
ACR_TriggerOnEnter();

    object oSelf = OBJECT_SELF;

    // Get the creature who triggered this event.
    object oPC = GetEnteringObject();

    // Only fire for (real) PCs.
    if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
        return;

    // Abort if a skill check (search) is failed.
   // if ( !GetIsSkillSuccessful(oPC, SKILL_SEARCH, 18) )
        //return;
     if ( d20() + GetSkillRank(SKILL_SPOT, oPC) < 24 )
        return;
    // Destroy objects (not fully effective until this script ends).
   // DestroyObject(GetNearestObjectByTag("Secret Door"));
    DestroyObject(GetNearestObjectByTag("Collision Box"));
    

    // Send a message to the player's chat window.
    SendMessageToPC(oPC, "*You have found a secret door*");
	DestroyObject(oSelf);
}