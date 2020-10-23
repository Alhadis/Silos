//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT6
//:: Default OnDamaged handler
/*
    If already fighting then ignore, else determine
    combat round
 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

/*
    Modified to allow a chance of splitting into smaller variants if slashed
*/

#include "nw_i0_generic"
#include "_mdrn_inc_sound"
void main()
{
    // Sound scheme additions
    object oBully = GetLastHostileActor();
    object oGun = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oBully);
    int iType = GetBaseItemType(oGun);
    if ( iType == BASE_ITEM_SHORTBOW
         || iType == BASE_ITEM_LONGBOW
         || iType == BASE_ITEM_LIGHTCROSSBOW
         || iType == BASE_ITEM_HEAVYCROSSBOW || iType == BASE_ITEM_SLING || GetLocalInt(oGun, "nMdrnChainsaw")==1)
    {
       // PlayHitSound(oBully,OBJECT_SELF,GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oBully));
    }
    //end of soundscheme additions

    // D20 Modern addition to store damage dealt for Harm's Way feat, to rearrange spawn condition, and to handle vehicles.
    SetLocalInt(OBJECT_SELF, "nd20_Hurt", GetTotalDamageDealt());
    if(GetSpawnInCondition(NW_FLAG_DAMAGED_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_DAMAGED));
    }
    if (GetLocalInt(OBJECT_SELF, "nMdrnVehicle")==1)
        return;

    // Check if slashed in two
    if (GetDamageDealtByType(DAMAGE_TYPE_SLASHING)>0)
    {
        string sSplit = GetLocalString(OBJECT_SELF,"Split");
        if  (sSplit != "")
        {
            object oSplit = CreateObject(OBJECT_TYPE_CREATURE,sSplit,GetLocation(OBJECT_SELF));
            if (GetIsObjectValid(oSplit))
            {
                oSplit = CreateObject(OBJECT_TYPE_CREATURE,sSplit,GetLocation(OBJECT_SELF));
                DestroyObject(OBJECT_SELF);
                return;
            }
        }
    }


    if(GetFleeToExit()) {
        // We're supposed to run away, do nothing
    } else if (GetSpawnInCondition(NW_FLAG_SET_WARNINGS)) {
        // don't do anything?
    } else {
        object oDamager = GetLastDamager();
        if (!GetIsObjectValid(oDamager)) {
            // don't do anything, we don't have a valid damager
        } else if (!GetIsFighting(OBJECT_SELF)) {
            // If we're not fighting, determine combat round
            if(GetBehaviorState(NW_FLAG_BEHAVIOR_SPECIAL)) {
                DetermineSpecialBehavior(oDamager);
            } else {
                if(!GetObjectSeen(oDamager)
                   && GetArea(OBJECT_SELF) == GetArea(oDamager)) {
                    // We don't see our attacker, go find them
                    ActionMoveToLocation(GetLocation(oDamager), TRUE);
                    ActionDoCommand(DetermineCombatRound());
                } else {
                    DetermineCombatRound();
                }
            }
        } else {
            // We are fighting already -- consider switching if we've been
            // attacked by a more powerful enemy
            object oTarget = GetAttackTarget();
            if (!GetIsObjectValid(oTarget))
                oTarget = GetAttemptedAttackTarget();
            if (!GetIsObjectValid(oTarget))
                oTarget = GetAttemptedSpellTarget();

            // If our target isn't valid
            // or our damager has just dealt us 25% or more
            //    of our hp in damager
            // or our damager is more than 2HD more powerful than our target
            // switch to attack the damager.
            if (!GetIsObjectValid(oTarget)
                || (
                    oTarget != oDamager
                    &&  (
                         GetTotalDamageDealt() > (GetMaxHitPoints(OBJECT_SELF) / 4)
                         || (GetHitDice(oDamager) - 2) > GetHitDice(oTarget)
                         )
                    )
                )
            {
                // Switch targets
                DetermineCombatRound(oDamager);
            }
        }
    }

    // Send the user-defined event signal

}
