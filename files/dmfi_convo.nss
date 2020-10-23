//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT4
/*
  Default OnConversation event handler for NPCs.

 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 12/22/2002
//:://////////////////////////////////////////////////

#include "nw_i0_generic"

void main()
{
    ExecuteScript("dmfi_voice_exe", OBJECT_SELF);
    // * if petrified, jump out
    if (GetHasEffect(EFFECT_TYPE_PETRIFY, OBJECT_SELF) == TRUE)
    {
        return;
    }

    // * If dead, exit directly.
    if (GetIsDead(OBJECT_SELF) == TRUE)
    {
        return;
    }

    // See if what we just 'heard' matches any of our
    // predefined patterns
    int nMatch = GetListenPatternNumber();
    object oShouter = GetLastSpeaker();
    object oIntruder;
    if (nMatch == -1 && GetIsPC(oShouter) &&(GetLocalInt(GetModule(), "dmfi_AllMute") || GetLocalInt(OBJECT_SELF, "dmfi_Mute")))
    {
        SendMessageToAllDMs(GetName(oShouter) + " is trying to speak to a muted NPC, " + GetName(OBJECT_SELF) + ", in area " + GetName(GetArea(OBJECT_SELF)));
        SendMessageToPC(oShouter, "This NPC is muted. A DM will be here shortly.");
    }
    else if (nMatch == -1 && GetCommandable(OBJECT_SELF) && !GetLocalInt(GetModule(), "dmfi_AllMute") && !GetLocalInt(OBJECT_SELF, "dmfi_Mute"))
    {
        SetLocalObject(oShouter, "hls_MyNPCSpeaker", OBJECT_SELF);
        ClearAllActions();
        BeginConversation();
        if (GetStringLeft(GetTag(OBJECT_SELF), 5)=="ship_")
        {
            object oPilot = GetLocalObject(OBJECT_SELF, "oPilot");
            object oChair = GetObjectByTag(GetStringRight(GetTag(OBJECT_SELF), GetStringLength(GetTag(OBJECT_SELF))-5));
            if (GetIsObjectValid(oPilot))
                oChair = GetLocalObject(oPilot, "oChair");

            location lDoor = GetLocation(GetNearestObject(OBJECT_TYPE_DOOR, oChair));
            AssignCommand(GetLastSpeaker(), ClearAllActions());
            AssignCommand(GetLastSpeaker(), ActionJumpToLocation(lDoor));



        }
    }

    else if (nMatch == -1)
    {
        // Not a match -- start an ordinary conversation
        if (GetStringLeft(GetTag(OBJECT_SELF), 5)=="ship_")
        {
            object oPilot = GetLocalObject(OBJECT_SELF, "oPilot");
            object oChair = GetObjectByTag(GetStringRight(GetTag(OBJECT_SELF), GetStringLength(GetTag(OBJECT_SELF))-5));
            if (GetIsObjectValid(oPilot))
                oChair = GetLocalObject(oPilot, "oChair");

            location lDoor = GetLocation(GetNearestObject(OBJECT_TYPE_DOOR, oChair));
            AssignCommand(GetLastSpeaker(), ClearAllActions());
            AssignCommand(GetLastSpeaker(), ActionJumpToLocation(lDoor));



        }
        else if (GetCommandable(OBJECT_SELF))
        {
            ClearActions(CLEAR_NW_C2_DEFAULT4_29);
            BeginConversation();
        }


        // * July 31 2004
        // * If only charmed then allow conversation
        // * so you can have a better chance of convincing
        // * people of lowering prices
        if (GetHasEffect(EFFECT_TYPE_CHARMED) == TRUE)
        {
            ClearActions(CLEAR_NW_C2_DEFAULT4_29);
            BeginConversation();
        }
    }
    // Respond to shouts from friendly non-PCs only
    else if (GetIsObjectValid(oShouter)
               && !GetIsPC(oShouter)
               && GetIsFriend(oShouter))
    {
        object oIntruder = OBJECT_INVALID;
        // Determine the intruder if any
        if(nMatch == 4)
        {
            oIntruder = GetLocalObject(oShouter, "NW_BLOCKER_INTRUDER");
        }
        else if (nMatch == 5)
        {
            oIntruder = GetLastHostileActor(oShouter);
            if(!GetIsObjectValid(oIntruder))
            {
                oIntruder = GetAttemptedAttackTarget();
                if(!GetIsObjectValid(oIntruder))
                {
                    oIntruder = GetAttemptedSpellTarget();
                    if(!GetIsObjectValid(oIntruder))
                    {
                        oIntruder = OBJECT_INVALID;
                    }
                }
            }
        }

        // Actually respond to the shout
        RespondToShout(oShouter, nMatch, oIntruder);
    }

    // Send the user-defined event if appropriate
    if(GetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT))
    {
        SignalEvent(OBJECT_SELF, EventUserDefined(EVENT_DIALOGUE));
    }
}
