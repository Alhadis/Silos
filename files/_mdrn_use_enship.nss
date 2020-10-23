/*
    On use the door will play the open animation and will jump the user only when that is done.
    This allows for locks and traps to be set on a placeable.

    When open and used jump the PC to a waypoint LOC_<tag of placeable> and at the same time convert to
    a ship appearance for space.
*/

#include "x0_i0_secret"
#include "inc_d20"

void main()
{
    object oUser = GetLastUsedBy();

    // Allow for traps and locks
    if (GetIsTrapped(OBJECT_SELF)) {return;}

    if (GetLocked(OBJECT_SELF))
    {
        // See if we have the key and unlock if so
        string sKey = GetTrapKeyTag(OBJECT_SELF);
        object oKey = GetItemPossessedBy(oUser, sKey);
        if (sKey != "" && GetIsObjectValid(oKey))
        {
            SendMessageToPC(oUser, GetStringByStrRef(7945));
            SetLocked(OBJECT_SELF, FALSE);
        }
        else
        {
            // Print '*locked*' message and play sound
            DelayCommand(0.1, PlaySound("as_dr_locked2"));
            FloatingTextStringOnCreature("*"
                                         + GetStringByStrRef(8307)
                                         + "*",
                                         oUser);
            SendMessageToPC(oUser, GetStringByStrRef(8296));
            return;
        }
    }

    // Handle opening/closing
    if (!GetIsSecretItemOpen(OBJECT_SELF))
    {
        // play animation of user opening it
        AssignCommand(oUser, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW));
        DelayCommand(1.0, ActionPlayAnimation(ANIMATION_PLACEABLE_OPEN));
        SetIsSecretItemOpen(OBJECT_SELF, TRUE);
    }
    else
    {
        // it's open -- go through and then close
        object oDestination = GetObjectByTag("LOC_"+GetTag(OBJECT_SELF));
        int iShip = GetLocalInt(OBJECT_SELF,"Appearance");

        AssignCommand(oUser,ClearAllActions());
        DelayCommand(0.5,AssignCommand(oUser,ActionJumpToObject(oDestination)));

        //set ship appearance
        switch (iShip)
        {
            case 1:
                iShip=APPEARANCE_TYPE_MDRN_AWING_SMALL;
            break;
            case 2:
                iShip=APPEARANCE_TYPE_MDRN_BWING_SMALL;
            break;
            case 3:
                iShip=APPEARANCE_TYPE_MDRN_CORVETTE_SMALL;
            break;
            case 4:
                iShip=APPEARANCE_TYPE_MDRN_FREIGHTER_SMALL;
            break;
            case 5:
                iShip=APPEARANCE_TYPE_MDRN_XWING_SMALL;
            break;
            case 6:
                iShip=APPEARANCE_TYPE_MDRN_EWING_SMALL;
            break;
            default:
                //if nothing is set then error and return
                FloatingTextStringOnCreature("No ship in launch bay.",oUser);
                return;
            break;
        }
        //convert to ship appearance and set movement speed according to pilot skill
        SetCreatureAppearanceType(oUser,iShip);
        int oPilot = GetSkillRank(SKILL_PILOT,oUser);
        if (oPilot<10)
        {
            ApplyEffectToObject(DURATION_TYPE_PERMANENT,EffectMovementSpeedDecrease((10 - oPilot)*10),oUser);
        }

        //allocate items
        CreateItemOnObject(GetLocalString(OBJECT_SELF,"Repair"),oUser);
        CreateItemOnObject(GetLocalString(OBJECT_SELF,"Weapon"),oUser);
        SetLocalString(oUser,"Repair",GetLocalString(OBJECT_SELF,"Repair"));
        SetLocalString(oUser,"Weapon",GetLocalString(OBJECT_SELF,"Weapon"));

        ActionPlayAnimation(ANIMATION_PLACEABLE_CLOSE);
        SetIsSecretItemOpen(OBJECT_SELF, FALSE);
    }
}
