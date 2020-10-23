//Will return latest combatdata for oCreature
//nType:
//0: ammo item (object ID)
//1: Animation Length
//2: Attack Debugtext
//3: Attack Deflected
//4: Attack Group
//5: Attack Mode
//6: Attack Resault
//7: Attack Type
//8: Base Damage
//9: Concealment
//10: GoupDeGrace
//11: Critical Threat
//12: Damage Acid (65535 indicates no damage from this type)
//13: Damage Bludgeonoing (65535 indicates no damage from this type)
//14: Damage Cold (65535 indicates no damage from this type)
//15: Damage Divine (65535 indicates no damage from this type)
//16: Damage Electrical (65535 indicates no damage from this type)
//17: Damage Fire (65535 indicates no damage from this type)
//18: Damage Magical (65535 indicates no damage from this type)
//19: Damage Negative (65535 indicates no damage from this type)
//20: Damage Piercing (65535 indicates no damage from this type)
//21: Damage Positive (65535 indicates no damage from this type)
//22: Damage Slashing (65535 indicates no damage from this type)
//23: Damage Sonic (65535 indicates no damage from this type)
//24: Damage Debug Text
//25: Killing blow
//26: Missed by
//27: Ranged attack
//28: Ranged target X
//29: Ranged target y
//30: Ranged target z
//31: React Object (object ID)
//32: SneakAttack
//33: Threatroll
//34: Tohitmod
//35: Tohitroll
//36: Weapon attack type
string GetCurrentCombatData( object oCreature, int nType );

//Gets the object of sID
//sID is a hexadecimal number
object GetObject( string sID );

//Function used to split arguments from strings
string GetInDelmitedList( string sList, int nSlot, string sDelmitorSymbol = "|" );

//Function used to create spacers
//spacer is returned as dots
string AllocateMemory( int nBytes );

//Get the firstname from a creature
string GetFirstName( object oCreature );

//Get the lastname from a creature
string GetLastName( object oCreature );

//Set the last name on a creatures (PCs needs to relog for this to take effect)
void SetLastName( object oCreature, string sLastName );

//Set the last name on a creatures (PCs needs to relog for this to take effect)
void SetFirstName( object oCreature, string sFirstName );

//Prints sText to the console
void PrintToConsole( string sText );

//Generates a random number from the nwnx plugin itself
int CoolRandom( int nSeed );

//Get current timestamp
int Time( );

//Returns the maxalloed level for the sever
//If nLevel is higher then 0 the max level is set aswell
int GetSetServerMaxLevel( int nLevel = 0 );

//Get the AB vs oTarget, only works between creatures
int GetAttackBonusVs( object oPC, object oTarget );

//Get the AC vs oTarget, only works between creatures
int GetArmorClassVs( object oPC, object oTarget );

int GetArmorClassVs( object oPC, object oTarget ){

    if( GetObjectType( oPC ) == OBJECT_TYPE_CREATURE && GetObjectType( oTarget ) == OBJECT_TYPE_CREATURE ){

        SetLocalString( oPC, "NWNX!COOL!ACVS", ObjectToString( oTarget ) );
        int nInt = StringToInt( GetLocalString( oPC, "NWNX!COOL!ACVS" ) );
        DeleteLocalString( oPC, "NWNX!COOL!ACVS" );
        return nInt;
    }
    return -1;
}

int GetAttackBonusVs( object oPC, object oTarget ){

    if( GetObjectType( oPC ) == OBJECT_TYPE_CREATURE && GetObjectType( oTarget ) == OBJECT_TYPE_CREATURE ){

        SetLocalString( oPC, "NWNX!COOL!ABVS", ObjectToString( oTarget ) );
        int nInt = StringToInt( GetLocalString( oPC, "NWNX!COOL!ABVS" ) );
        DeleteLocalString( oPC, "NWNX!COOL!ABVS" );
        return nInt;
    }
    return -1;
}

int GetSetServerMaxLevel( int nLevel = 0 ){

    SetLocalString( OBJECT_SELF, "NWNX!COOL!SETGETMAXLEVEL", IntToString( nLevel ) );
    int nInt = StringToInt( GetLocalString( OBJECT_SELF, "NWNX!COOL!SETGETMAXLEVEL" ) );
    DeleteLocalString( OBJECT_SELF, "NWNX!COOL!SETGETMAXLEVEL" );
    return nInt;
}

int CoolRandom( int nSeed ){

    SetLocalString( OBJECT_SELF, "NWNX!COOL!RANDOM", IntToString( nSeed ) );
    int nInt = StringToInt( GetLocalString( OBJECT_SELF, "NWNX!COOL!RANDOM" ) );
    DeleteLocalString( OBJECT_SELF, "NWNX!COOL!RANDOM" );
    if( nInt < 0 )
        nInt = nInt*-1;
    return nInt;
}

int Time( ){

    SetLocalString( OBJECT_SELF, "NWNX!COOL!TIME", "..............." );
    int nInt = StringToInt( GetLocalString( OBJECT_SELF, "NWNX!COOL!TIME" ) );
    DeleteLocalString( OBJECT_SELF, "NWNX!COOL!TIME" );
    return nInt;
}

void PrintToConsole( string sText ){

    SetLocalString( OBJECT_SELF, "NWNX!COOL!PUTS", sText );
    DeleteLocalString( OBJECT_SELF, "NWNX!COOL!PUTS" );
}

void SetLastName( object oCreature, string sLastName ){

    if( GetObjectType( oCreature ) == OBJECT_TYPE_CREATURE ){

        //Don't do this if the pointer is invalid
        if( GetLastName( oCreature ) == "(null)" )
            return;

        SetLocalString( oCreature, "NWNX!COOL!SETLASTNAME", sLastName );
        DeleteLocalString( oCreature, "NWNX!COOL!SETLASTNAME" );
    }
}

void SetFirstName( object oCreature, string sFirstName ){

    if( GetObjectType( oCreature ) == OBJECT_TYPE_CREATURE ){

         //Don't do this if the pointer is invalid
        if( GetFirstName( oCreature ) == "(null)" )
            return;

        SetLocalString( oCreature, "NWNX!COOL!SETFIRSTNAME", sFirstName );
        DeleteLocalString( oCreature, "NWNX!COOL!SETFIRSTNAME" );
    }
}

string GetLastName( object oCreature ){

    if( GetObjectType( oCreature ) == OBJECT_TYPE_CREATURE ){

        SetLocalString( oCreature, "NWNX!COOL!GETLASTNAME", "................................" );
        string sCatch = GetLocalString( oCreature, "NWNX!COOL!GETLASTNAME" );
        DeleteLocalString( oCreature, "NWNX!COOL!GETLASTNAME" );
        return sCatch;
    }
    return "";
}

string GetFirstName( object oCreature ){

    if( GetObjectType( oCreature ) == OBJECT_TYPE_CREATURE ){

        SetLocalString( oCreature, "NWNX!COOL!GETFIRSTNAME", "................................" );
        string sCatch = GetLocalString( oCreature, "NWNX!COOL!GETFIRSTNAME" );
        DeleteLocalString( oCreature, "NWNX!COOL!GETFIRSTNAME" );
        return sCatch;
    }
    return "";
}

string GetCurrentCombatData( object oCreature, int nType ){

    string sCatch = GetLocalString( oCreature, "combat_data" );
    if( sCatch == "" ){

        SetLocalString( oCreature, "NWNX!COOL!COMBATDATA", AllocateMemory( 1024 ) );
        sCatch = GetLocalString( oCreature, "NWNX!COOL!COMBATDATA" );
        DeleteLocalString( oCreature, "NWNX!COOL!COMBATDATA" );
        SetLocalString( oCreature, "combat_data", sCatch );
    }

    if( sCatch == "invalid" )
        return "";

    return GetInDelmitedList( sCatch, nType );
}

object GetObject( string sID ){

    SetLocalString( GetModule(), "NWNX!COOL!OBJ_ID", GetStringLowerCase( sID ) );
    DeleteLocalString( GetModule(), "NWNX!COOL!OBJ_ID" );
    return GetLocalObject( OBJECT_SELF, "NWNX!COOL!OBJ" );
}

string AllocateMemory( int nBytes ){

    int nLoop = 0;
    string sMemory = "";
    for( ;nLoop < nBytes; nLoop++ ){

        sMemory+=".";
    }
    return sMemory;
}

string GetInDelmitedList( string sList, int nSlot, string sDelmitorSymbol = "|" ){

    if( GetStringLeft( sList, 1 ) != sDelmitorSymbol )
        sList = sDelmitorSymbol+sList;

    if( GetStringRight( sList, 1 ) != sDelmitorSymbol )
        sList = sList+sDelmitorSymbol;

    if( GetStringLength( sList ) < 2 )
        return "";

    int nLoop   = 0;
    int nStart  = FindSubString( sList, sDelmitorSymbol );
    int nEnd    = FindSubString( sList, sDelmitorSymbol, nStart+1 );

    while( nLoop < nSlot ){

        nStart  = nEnd;
        nEnd    = FindSubString( sList, sDelmitorSymbol, nStart+1 );

        nLoop++;
        if( nEnd == -1 || nStart == -1 )
            return "";
    }
    if( nEnd == -1 || nStart == -1 )
        return "";

    return GetSubString( sList, nStart+1, (nEnd-nStart)-1 );
}
