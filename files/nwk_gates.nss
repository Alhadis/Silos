//nwk_gates
//utility methods to help the scripts of gate damage , close ,lock etc
//nice chunks of codes taken from jhenna NWTactics.
//game "open" variable flow:
//  when bashed , open = -1
//  30 seconds later it becomes 0 again , after getting hit it goes up and up
//  above 149 it is bashed and turns to ... -1 again

#include "nwk_const_teams"
#include "nwk_flag"


//important constants to change
const float TIME_TO_STAY_OPEN_AFTER_BASH_BASE = 35.0 ;
const float TIME_TO_STAY_OPEN_AFTER_BASH_NEUTRAL_FAST = 15.0 ;

const int SKILL_DECREASE_AMOUNT_ON_UNLOCKING = 60;
const float SKILL_DECREASE_TIME = 20.0;


//these values serves as flag only.
const int GATE_TYPE_BASE = 934;
const int GATE_TYPE_NEUTRAL_FAST = 935;

const int GATE_DAMAGE_BASE = 150;
const int GATE_DAMAGE_NEUTRAL_FAST = 70;

// reset a base Gate
// - close and locked
// - max HP
void ResetBaseGate ( object oGate );

int getGateDamageByGateType(int gateType)
{
    if  (GATE_TYPE_BASE ==gateType)
        return GATE_DAMAGE_BASE;
    else if(GATE_TYPE_NEUTRAL_FAST ==gateType)
        return GATE_DAMAGE_NEUTRAL_FAST;
    else
    {
        SpeakString("nwk_gates.getGateDamageByGateType error . gateType parameter"+
                    "nurecognised. recieved:"+IntToString(gateType)
                    , TALKVOLUME_SHOUT);
        return 0;
    }
}


float getTimeByGateType(int gateType)
{
    if  (GATE_TYPE_BASE ==gateType)
        return TIME_TO_STAY_OPEN_AFTER_BASH_BASE;
    else if(GATE_TYPE_NEUTRAL_FAST ==gateType)
        return TIME_TO_STAY_OPEN_AFTER_BASH_NEUTRAL_FAST;
    else
    {
        SpeakString("nwk_gates.getTimeByGateType error . gateType parameter"+
                    "nurecognised. recieved:"+IntToString(gateType)
                    , TALKVOLUME_SHOUT);
        return 0.0;
    }
}





/**
 * This method should be used on the onClosed event of a gate.
 * The PC already closed the gate (the event is called AFTER the closing)
 * so this method can only try to reOpen it if the closure is not legal.
 * Meaning : if the door should stay open , cause it was recently bashed
 * then reOpen it. if it wasn`t bashed , the player must have opened it , got
 * out and now tries to close after , so do not do anything.
 * if you are not of the owner team , you may never close it (think of an enemy
 * inside the base that close the door when friendlies try to retreat).
 */
void onPcTryToCloseGate(object oDoor , int doorOwnerTeam , object oCloser)
{
    int gateShouldReallyBeClosed = FALSE;

    //if door closed itself , let it stay closed
    if (!GetIsPC(oCloser))
        gateShouldReallyBeClosed = TRUE;
    else if (   (doorOwnerTeam != TEAM_NONE)
        && ( (GetLocalString(oCloser, "team")) == (getTeamNameByInt(doorOwnerTeam)) )
        && (GetLocalInt(oDoor,"open") >= 0)   //door is not bashed
       )
    {
        gateShouldReallyBeClosed = TRUE;
    }


    if (gateShouldReallyBeClosed)
    {
        DelayCommand(3.0, SetLocked (oDoor, TRUE));//so lock it too.
    }
    else    //door is bashed . so reOpen it immidietly
    {
        AssignCommand(oDoor, ActionOpenDoor(oDoor));
    }


}


/**
 * put it on the onDamage event of a door. owner of the door does not matter.
 */
void onDamageToTheGate( object oDoor , int doorOwnerTeam
                        ,int gateType , object oDamager    )

{
    int nDoorOpened = GetAbilityModifier(ABILITY_STRENGTH, oDamager)*3/4;
    if (nDoorOpened < 1)
        nDoorOpened = 1;
    if (GetLocalInt(oDoor, "open") >= 0)
    {
        nDoorOpened = nDoorOpened + GetLocalInt(oDoor, "open");
        int maxDamage = getGateDamageByGateType( gateType);
        string sDamage = IntToString(maxDamage-nDoorOpened);
        SpeakString(sDamage);
        if (nDoorOpened >= maxDamage)
        {
            SetLocked(oDoor, FALSE);

            PlaySound("as_cu_claybreak3");
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_GREASE),oDoor, 5.0);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE),oDoor, 5.0);
            PlaySound("as_cu_woodbreak2");
            AssignCommand(oDoor, ActionOpenDoor(oDoor));

            float timeToStayOpen = getTimeByGateType(gateType);

            DelayCommand(timeToStayOpen, AssignCommand(oDoor, ActionCloseDoor(oDoor)));
            DelayCommand (timeToStayOpen, SetLocked(oDoor, TRUE));
            nDoorOpened = -1;
            SetLocalInt(oDoor, "open", nDoorOpened);
            nDoorOpened = 0;
            DelayCommand(timeToStayOpen - 5.0, SetLocalInt(oDoor, "open", nDoorOpened));
        }
        else
            SetLocalInt(oDoor, "open", nDoorOpened);
    }

}


/**         NOT USED IN THE RIGHT MANNER , RIGHT NOW , CAUSE THE CRRENT DOORS HAVE ONLY ONE SCRIPT
            FOR ALL UNLCOKS (except war_ntrl_gateunl)
            so REMEBER , that base silver/gold use both TEAM_NONE value!!!!!
 * on unlock , decrease sneak skills of the unlocker .
 * only opposite team may unlock
 */
void onUnlockGate(object oDoor  , int doorOwnerTeam,int gateType , object oUnlocker)
{
    //if it is the owner team ( asshole that helps the other group)
    // lock it right away.
    if ( (GetLocalString(oUnlocker, "team")) == (getTeamNameByInt(doorOwnerTeam)) )
    {
        DelayCommand (1.0, ActionCloseDoor(oDoor));
        DelayCommand (1.0, SetLocked(oDoor, TRUE));
        return;
    }


    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillDecrease(SKILL_HIDE, SKILL_DECREASE_AMOUNT_ON_UNLOCKING)
                        ,oUnlocker, SKILL_DECREASE_TIME);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillDecrease(SKILL_MOVE_SILENTLY, SKILL_DECREASE_AMOUNT_ON_UNLOCKING)
                        ,oUnlocker, SKILL_DECREASE_TIME);
    ActionOpenDoor(oDoor);
    float timeToStayOpen = getTimeByGateType(gateType);
    //after open time is over , close and lock it.
    DelayCommand (timeToStayOpen, ActionCloseDoor(oDoor));
    DelayCommand (timeToStayOpen, SetLocked(oDoor, TRUE));
    // check for flag and apply hide nerfs
    DelayCommand ( SKILL_DECREASE_TIME + 0.5, AssignCommand ( oUnlocker, ApplySDMalus ( oUnlocker ) ) );
}


void ResetBaseGate ( object oGate )
{
    AssignCommand ( oGate, ActionCloseDoor ( oGate ));
    SetLocked ( oGate, TRUE );
    SetLocalInt ( oGate, "open", 0 );
    WriteTimestampedLogEntry ( "nwk_gate.ResetBaseGate | gate = " + GetTag ( oGate ) );

}
