#include "inc_cool"
#include "dep_inc_function"
//:::::::::::::::::::::::::::::::::::::::::::::
//Constants
//:::::::::::::::::::::::::::::::::::::::::::::

//Constants determining a specialattack
//There are more just undocumented so far
const int COOL_SPECIAL_ATTACK_IMPROVED_DISARM = 16;
const int COOL_SPECIAL_ATTACK_IMPROVED_KNOCKDOWN = 17;
const int COOL_SPECIAL_ATTACK_CALLED_SHOT_ARM = 65001; //No idea whats with these numbers
const int COOL_SPECIAL_ATTACK_CALLED_SHOT_LEG = 65000;
const int COOL_SPECIAL_ATTACK_SAP = 31;
const int COOL_SPECIAL_ATTACK_STUNNING_FIST = 39;

//for the damage_types in GetCurrentCombatData
const int NO_DAMAGE_IS_NO_DAMAGE_AT_ALL_NO_HURTS = 65535;

//:::::::::::::::::::::::::::::::::::::::::::::
//Prototype
//:::::::::::::::::::::::::::::::::::::::::::::

//Aborts the event
//nReturnVal is passed back to the engien functions
//Events:
//1: 0
//2: 0
//3: 0
//4: 0
//5: 0
//6: 0
//7: 0
//8: 1/0 (1: a devcrit attempt will be made by the game)
//9: 0 Cancels the melee special attack
//10: 0 Cancels the ranged special attack
//11: 0 thwart pause attempt
//12: 0 Stop the pvp attitude change
//13: 0 don't remove invisibility effects?
//14: 0 Event is not sent to the client (unstable)
void ByPass( int nReturnVal=0 );

//Gets the event that is running
//0: Nothing
//1: Cast spell
//2: item use
//3: Polymorph
//4: UnPolymorph
//5: UseSkill
//6: UseFeat
//7: Toggle Mode
//8: Critical hit (Devastating critical check)
//9: Special attack onhit melee (knockdown, smite, etc)
//10: Ranged special attack onhit
//11: Pause
//12: PvP attitude change
//13: Remove Combat Invisibility
//14: Timingbar Event
//15: Attack
int GetEvent( );

//Get event target location
location GetEventLocation( );

//Get the target
//Event:
//1: SpellTarget
//2: Item target
//3: EffectCreator for the poly effect
//4: EffectCreator for the poly effect
//5: skill target
//6: feat target
//7: nothing
//8: Item performing the critical hit
//9: Target for the special attack
//10: Target for the special attack
//11: nothing
//12: target of the attitude change
//13: nothing
//14: nothing
//15: Attack target
object GetEventTarget( );

//Get the secondary target
//Event:
//1: nothing
//2: item used
//3: nothing
//4: nothing
//5: area(?) used in
//6: area(?) used in
//7: nothing
//8: Target of the critical hit
//9: nothing
//10: nothing
//11: nothing
//12: nothing
//13: nothing
//14: nothing
//15: nothing
object GetEventTargetSecond( );

//Get the event data
//events:
//1 (spellcast): spell id (if nType = 1 the class position will be returned instead. 256=feat or ability)
//2: item use spellid
//3: polymorph (POLYMORPH_*)
//4: effect spellID
//5: skill used (SKILL_*)
//6: feat used (FEAT_*)
//7: mode about to be toggled (ACTION_MODE_*)
//8: baseitem type of the item doing the critical hit
//9: The special attack used (COOL_SPECIAL_ATTACK_* for the onces I know)
//10: The special attack used (COOL_SPECIAL_ATTACK_* for the onces I know)
//11: pause type (1 is timestop)
//12: not entirely sure (like/dislike?)
//13: -1
//14: timingbar label (ntype = 1: 1=started, 0=stopped)
//15: 0
int GetEventData( int nType = 0 );

//This will feed nwn another parameter reguarding data
//This will set and pass the parameter GetEventData returns
void OverrideEventData( int nData );

void DebugString( string sMess ){

    if( !GetIsPC( OBJECT_SELF ) )
        SpeakString( sMess );

    SendMessageToPC( OBJECT_SELF, "dgb: "+sMess );
}

int AllowedToUseFlurryOfBlows( object oPC ){

    object oRight = GetItemInSlot( INVENTORY_SLOT_RIGHTHAND, oPC );
    object oLeft  = GetItemInSlot( INVENTORY_SLOT_LEFTHAND, oPC );
    int nRightWield = GetCached2DAInt("baseitems", "WeaponWield", GetBaseItemType(oRight));
    int nLeftWield = GetCached2DAInt("baseitems", "WeaponWield", GetBaseItemType(oLeft));

    int nMonk = GetLevelByClass( CLASS_TYPE_MONK, oPC );

	// Fackeln und Schilder 
    if( GetIsObjectValid( oRight ) && nRightWield != 1 && nRightWield != 7 && !GetLocalInt( oRight, "ubab"))
        return FALSE;

    if( GetIsObjectValid( oLeft ) && nLeftWield != 1 && nLeftWield != 7 && !GetLocalInt( oLeft, "ubab" ))
        return FALSE;

    return TRUE;
}

//:::::::::::::::::::::::::::::::::::::::::::::
//Main
//:::::::::::::::::::::::::::::::::::::::::::::

void main(){

    object oPC = OBJECT_SELF;
    int nEvent = GetEvent();
    int nData = GetEventData();

    if(nEvent == NWNX_EVENT_TOGGLE_MODE)
    {
        //DebugString("ToggleMode: "+IntToString(nData));
        int nStatus = !GetActionMode(OBJECT_SELF, nData);
        //DebugString("Status: "+IntToString(nStatus));

        if(nData == ACTION_MODE_FLURRY_OF_BLOWS)
        {
            if(nStatus && !AllowedToUseFlurryOfBlows(oPC))
            {
                SendMessageToPC(oPC, "Ihr könnt das Talent 'Schlaghagel' nicht mit euren ausgerüsteten Waffen benutzen!");
                ByPass();
            }
        }
    }
    else if(nEvent == NWNX_EVENT_CRITICAL_HIT)
    {
        object oItem = GetEventTarget();
        object oPC = GetItemPossessor(oItem);
        object oTarget = GetEventTargetSecond();
        //SendMessageToPC(oPC, "Threat Roll oTarget: "+GetCurrentCombatData(oTarget, 33));

        int iFeat = GetCached2daInt("weapondata", "Crit_Devastating", GetWeaponDataEntry(GetBaseItemType(oItem)));
        if(iFeat > 0 && GetHasFeat(iFeat, oPC) && DEP_GetDevastatingCriticalImmunity(oTarget))
        {
            DelayCommand(0.35, FloatingTextStringOnCreature("* Das Ziel ist immun gegen Verheerende Kritische Treffer *", oPC, FALSE));
            ByPass();
        }

        if(GetIsPC(oPC) && GetIsAreaDamageWeapon(oItem))
        {
            //SendMessageToPC(oPC, "Signalizing damage store");
            DEP_SignalDamageStore(oPC, oTarget);

            DelayCommand(0.5, DEP_DoAreaWeaponDamage(oPC, oItem, oTarget));
        }
    }
}

//:::::::::::::::::::::::::::::::::::::::::::::
//Definition
//:::::::::::::::::::::::::::::::::::::::::::::


void OverrideEventData( int nData ){

    SetLocalString( GetModule(), "NWNX!COOL!SETDATA", IntToString( nData ) );
    DeleteLocalString( GetModule(), "NWNX!COOL!SETDATA" );
}

int GetEventData( int nType = 0 ){

    SetLocalString( GetModule(), "NWNX!COOL!DATA", IntToString( nType )+"...." );
    int nRet = StringToInt( GetLocalString( GetModule(), "NWNX!COOL!DATA" ) );
    DeleteLocalString( GetModule(), "NWNX!COOL!DATA" );
    return nRet;
}

object GetEventTarget( ){

    return GetLocalObject( OBJECT_SELF, "NWNX!COOL!TARGET" );
}

object GetEventTargetSecond( ){

    return GetLocalObject( OBJECT_SELF, "NWNX!COOL!SECOND" );
}
location GetEventLocation( ){

    SetLocalString( GetModule(), "NWNX!COOL!LOCATION", "................................" );
    string sLoc = GetLocalString( GetModule(), "NWNX!COOL!LOCATION" );
    DeleteLocalString( GetModule(), "NWNX!COOL!LOCATION" );

    vector vVec;
    vVec.x=StringToFloat(GetInDelmitedList( sLoc, 0 ));
    vVec.y=StringToFloat(GetInDelmitedList( sLoc, 1 ));
    vVec.z=StringToFloat(GetInDelmitedList( sLoc, 2 ));

    return Location( GetArea( OBJECT_SELF ), vVec, GetFacing( OBJECT_SELF ) );
}

void ByPass( int nReturnVal=0 ){

    SetLocalString( GetModule(), "NWNX!COOL!BYPASS", IntToString( nReturnVal ) );
    DeleteLocalString( GetModule(), "NWNX!COOL!BYPASS" );
}

int GetEvent( ){

    SetLocalString( GetModule(), "NWNX!COOL!EVENT", "...." );
    int nRet = StringToInt( GetLocalString( GetModule(), "NWNX!COOL!EVENT" ) );
    DeleteLocalString( GetModule(), "NWNX!COOL!EVENT" );
    return nRet;
}




