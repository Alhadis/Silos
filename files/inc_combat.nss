const int MINIMUM_PLAYERS = 1;

const string BARROWS = "";
const string BEHOLDER = "";
const string CASTLE_EXTERIOR = "";
const string CASTLE_INTERIOR_1 = "";
const string CASTLE_INTERIOR_2 = "";
const string CITY_EXTERIOR = "";
const string CITY_INTERIOR = "";
const string CITY_INTERIOR_2 = "";
const string CRYPT = "";
const string DESERT = "";
const string DROW_INTERIOR = "";
const string DUNGEON = "";
const string FOREST = "";
const string FORT_INTERIOR = "";
const string FROZEN_WASTES = "";
const string ILLITHID_INTERIOR = "";
const string MINES_CAVERNS = "";
const string RUINS = "";
const string RURAL = "";
const string RURAL_WINTER = "";
const string SEA_CAVES = "";
const string SEWER = "";
const string STEAMWORKS = "";
const string TROPICAL = "";
const string UNDERDARK = "";


//  Do a PC count   GetFirstObjectInArea
int PCCount();

//  Check if we have enough players to start combat
int CheckCombatReady();

//  Port Players to Combat Map
void PortToCombatMap();

//  Select a random map for combat
void SelectCombatMap();


int PCCount()
{
    object oArea = OBJECT_SELF,
           oObject = GetFirstObjectInArea(oArea),
           oModule = GetModule();

    int iPCTotal = 0;

    while(GetIsObjectValid(oObject))
    {
        if (GetIsPC(oObject) && !GetIsDM(oObject))
        {
            iPCTotal++;
        }

        oObject = GetNextObjectInArea(oArea);
    }

    SetLocalInt(oModule, "PLAYER_COUNT", iPCTotal);

    return iPCTotal;
}

int CheckCombatReady()
{
    if (PCCount() > MINIMUM_PLAYERS) return TRUE;
    else return FALSE;
}

//  Needs work
void PortToCombatMap()
{
    object oArea = OBJECT_SELF,
           oObject = GetFirstObjectInArea(oArea);

    location loc;

    while(GetIsObjectValid(oObject))
    {
        if (GetIsPC(oObject) && !GetIsDM(oObject))
        {
            JumpToLocation(loc);
        }

        oObject = GetNextObjectInArea(oArea);
    }
}

//  Needs work
void SelectCombatMap()
{
    object oModule = GetModule();

    string sMap = "MAP";

    switch (Random(23))
    {
        case 0: SetLocalString(oModule, sMap, BARROWS); break;
        case 1: SetLocalString(oModule, sMap, BEHOLDER); break;
        case 2: SetLocalString(oModule, sMap, CASTLE_EXTERIOR); break;
        case 3: SetLocalString(oModule, sMap, CASTLE_INTERIOR_1); break;
        case 4: SetLocalString(oModule, sMap, CASTLE_INTERIOR_2); break;
        case 5: SetLocalString(oModule, sMap, CITY_EXTERIOR); break;
        case 6: SetLocalString(oModule, sMap, CITY_INTERIOR); break;
        case 7: SetLocalString(oModule, sMap, CITY_INTERIOR_2); break;
        case 8: SetLocalString(oModule, sMap, CRYPT); break;
        case 9: SetLocalString(oModule, sMap, DESERT); break;
        case 10: SetLocalString(oModule, sMap, DROW_INTERIOR); break;
        case 11: SetLocalString(oModule, sMap, DUNGEON); break;
        case 12: SetLocalString(oModule, sMap, FOREST); break;
        case 13: SetLocalString(oModule, sMap, FORT_INTERIOR); break;
        case 14: SetLocalString(oModule, sMap, FROZEN_WASTES); break;
        case 15: SetLocalString(oModule, sMap, ILLITHID_INTERIOR); break;
        case 16: SetLocalString(oModule, sMap, MINES_CAVERNS); break;
        case 17: SetLocalString(oModule, sMap, RUINS); break;
        case 18: SetLocalString(oModule, sMap, RURAL_WINTER); break;
        case 19: SetLocalString(oModule, sMap, SEA_CAVES); break;
        case 20: SetLocalString(oModule, sMap, SEWER); break;
        case 21: SetLocalString(oModule, sMap, STEAMWORKS); break;
        case 22: SetLocalString(oModule, sMap, TROPICAL); break;
        case 23: SetLocalString(oModule, sMap, UNDERDARK); break;
        default: SendMessageToAllDMs("ERROR - Script: inc_combat - Function: SelectCombatMap()");
                 WriteTimestampedLogEntry("ERROR - Script: inc_combat - Function: SelectCombatMap()"); break;
    }
}

/*
void main()
{

}
