//
// NESS V8.1.3
//
// Spawn Global Defaults
//
//

// Global Constants

// SPnOn
    const int dfProcessFrequency      = 1;
    const int dfProcessOffset         = 0;
// SF
//Spawn Facing
    const int dfSpawnFacing           = 0;
// ISnDn
// InitialState
    const int dfInitialState          = 1;
    const int dfInitialDelay          = -1;
// FTn
// FlagTable
    const int dfFlagTableNumber       = 0;
// SDn|Mn
// SpawnDelay
    const int dfSpawnDelay            = 0;
    const int dfDelayMinimum          = 0;
// SNn|Mn SA|n|Mn
// SpawnNumber
    const int dfSpawnNumber           = 1;
    const int dfSpawnNumberMin        = -1;
    const int dfSpawnNumberAtOnce     = 0;
    const int dfSpawnNumberAtOnceMin  = 0;
// DYn|Tn
// SpawnDay
    const int dfSpawnDayStart         = -1;
    const int dfSpawnDayEnd           = -1;
// HRn|Tn
// SpawnHour
    const int dfSpawnHourStart        = -1;
    const int dfSpawnHourEnd          = -1;
// RW|Rn
// RandomWalk
    const int dfWanderRange           = 0;
// RH|Dn
// ReturnHome
    const int dfReturnHomeRange       = 1;
// PC|n|R
// PCCheck
    const int dfPCCheckDelay          = 0;
// RGn|Mn|Cn
// RandomGold
    const int dfRandomGold            = 0;
    const int dfRandomGoldMin         = 0;
    const int dfGoldChance            = 100;
// FXn|Dn
// SpawnEffects
    const int dfSpawnEffect           = 0;
    const int dfDespawnEffect         = 0;
// PRn|Tn
// PatrolRoutes
    const int dfPatrolRoute           = -1;
    const int dfRouteType             = 0;
// PLn|Tn|Pn
// Placeables
    const int dfPlaceableType         = 0;
    const int dfTrapDisabled          = 100;
    const int dfPlaceableRefreshPeriod= 60;
// LTn|An|Bn|Cn
// LootTable
    const int dfLootTable             = -1;
    const int dfLootTable1ItemChance  = 50;
    const int dfLootTable2ItemChance  = 15;
    const int dfLootTable3ItemChance  = 5;
// DSn|Sn
// SpawnDeactivation
    const int dfDeactivateSpawn       = -1;
    const int dfDeactivateScript      = -1;
// DIn
// DeactivationInfo
    const int dfDeactivationInfo      = -1;
// CLn|Mn
// ChildLifespan
    const int dfChildLifespanMax      = -1;
    const int dfChildLifespanMin      = -1;
// SRn|Mn|P
// SpawnRadius
    const int dfSpawnRadius           = 0;
    const int dfSpawnRadiusMin        = 0;
// SUn|In
// SpawnUnseen
    const int dfSpawnUnseen           = 0;
    const int dfUnseenRetryCount      = -1;
// CDn|Tn|Rn|D
// CorpseDecay
    const int dfCorpseDecay           = 0;
    const int dfCorpseDecayType       = 0;
    const int dfCorpseRemainsType     = 0;
// CM|Dn
// SpawnCamp
    const int dfCampDecay             = 0;
// SSn|Dn
// SpawnScript
    const int dfSpawnScript           = -1;
    const int dfDespawnScript         = -1;
// DTn
// DeathScript
    const int dfDeathScript           = -1;
// CCn
// SpawnCheckCustom
    const int dfSpawnCheckCustom      = -1;
// CPn|Rn
// SpawnCheckPCs
    const int dfSpawnCheckPCs         = -1;
    const int dfCheckPCsRadius        = -1;
// TRn|Dn
// SpawnTrigger
    const int dfSpawnTrigger          = 0;
    const int dfDespawnTrigger        = 0;
// AEn|Dn
// AreaEffect
    const int dfSpawnAreaEffect       = 0;
    const int dfAreaEffectDuration    = 5;
// OEn|Dn
// ObjectEffect
    const int dfObjectEffect          = 0;
    const int dfObjectEffectDuration  = -1;
// RSn
// RandomSpawn
    const int dfRandomSpawn           = 100;
// FCn
// SpawnFaction
    const int dfSpawnFaction          = -1;
// ALn|Sn
    const int dfSpawnAlignment        = -1;
    const int dfAlignmentShift        = 10;
// HBn
// HeartbeatScript
    const int dfHeartbeatScript       = -1;
// SLn|Rn
// SpawnLocation
    const int dfSpawnLocation         = -1;
    const int dfSpawnLocationMin      = -1;
// EEn|Rn
// EntranceExit
    const int dfEntranceExit          = -1;
    const int dfEntranceExitMin       = -1;
    const int dfExit                  = -1;
    const int dfExitMin               = -1;
// HL|n|E
// HealChildren
    const int dfHealChildren          = 0;
// SXn
// Set this value to 1 to have dim returns suppression be the default
// when no SX flag is present.
    const int dfGlobalSuppressDR      = 0;
// This is the default value for the SX flag when no value is specified.
// Set to 0 to make SX (without a value) enable dim returns.
    const int dfSuppressDR            = 1;
    const int dfEncounterLevel        = 0;

// Global Vars
int bLeftoversForceProcessing = 1;
int bCheckForStuckPatrols = 1;
int bAlwaysDestroyCorpses = 1;

// Sittable Tag
string sSeatTag = "chair";

void SetUserGlobalDefaults();

// [File: spawn_defaults]
void SetGlobalDefaults();
void SetGlobalDefaults()
{
    SetUserGlobalDefaults();

    // Record Values
    object oModule = GetModule();

/*
    SetLocalInt(oModule, "df_GlobalSuppressDR", nGlobalSuppressDR);
    SetLocalInt(oModule, "df_SuppressDR", nSuppressDR);
    SetLocalInt(oModule, "df_processFrequency", nProcessFrequency);
    SetLocalInt(oModule, "df_processOffset", nProcessOffset);
    SetLocalInt(oModule, "df_InitialState", nInitialState);
    SetLocalInt(oModule, "df_InitialDelay", nInitialDelay);
    SetLocalInt(oModule, "df_FlagTableNumber", nFlagTableNumber);
    SetLocalInt(oModule, "df_SpawnDelay", nSpawnDelay);
    SetLocalInt(oModule, "df_DelayMinimum", nDelayMinimum);
    SetLocalInt(oModule, "df_SpawnNumber", nSpawnNumber);
    SetLocalInt(oModule, "df_SpawnNumberMin", nSpawnNumberMin);
    SetLocalInt(oModule, "df_SpawnNumberAtOnce", nSpawnNumberAtOnce);
    SetLocalInt(oModule, "df_SpawnNumberAtOnceMin", nSpawnNumberAtOnceMin);
    SetLocalInt(oModule, "df_SpawnDayStart", nSpawnDayStart);
    SetLocalInt(oModule, "df_SpawnDayEnd", nSpawnDayEnd);
    SetLocalInt(oModule, "df_SpawnHourStart", nSpawnHourStart);
    SetLocalInt(oModule, "df_SpawnHourEnd", nSpawnHourEnd);
    SetLocalInt(oModule, "df_WanderRange", nWanderRange);
    SetLocalInt(oModule, "df_ReturnHomeRange", nReturnHomeRange);
    SetLocalInt(oModule, "df_PCCheckDelay", nPCCheckDelay);
    SetLocalInt(oModule, "df_RandomGold", nRandomGold);
    SetLocalInt(oModule, "df_RandomGoldMin", nRandomGoldMin);
    SetLocalInt(oModule, "df_GoldChance", nGoldChance);
    SetLocalInt(oModule, "df_SpawnEffect", nSpawnEffect);
    SetLocalInt(oModule, "df_DespawnEffect", nDespawnEffect);
    SetLocalInt(oModule, "df_PatrolRoute", nPatrolRoute);
    SetLocalInt(oModule, "df_RouteType", nRouteType);
    SetLocalInt(oModule, "df_PlaceableType", nPlaceableType);
    SetLocalInt(oModule, "df_PlaceableRefreshPeriod", nPlaceableRefreshPeriod);
    SetLocalInt(oModule, "df_TrapDisabled", nTrapDisabled);
    SetLocalInt(oModule, "df_LootTable", nLootTable);
    SetLocalInt(oModule, "df_LootTable1ItemChance", nLootTable1ItemChance);
    SetLocalInt(oModule, "df_LootTable2ItemChance", nLootTable2ItemChance);
    SetLocalInt(oModule, "df_LootTable3ItemChance", nLootTable3ItemChance);
    SetLocalInt(oModule, "df_DeactivateSpawn", nDeactivateSpawn);
    SetLocalInt(oModule, "df_DeactivateScript", nDeactivateScript);
    SetLocalInt(oModule, "df_DeactivationInfo", nDeactivationInfo);
    SetLocalInt(oModule, "df_ChildLifespanMax", nChildLifespanMax);
    SetLocalInt(oModule, "df_ChildLifespanMin", nChildLifespanMin);
    SetLocalInt(oModule, "df_SpawnRadius", nSpawnRadius);
    SetLocalInt(oModule, "df_SpawnRadiusMin", nSpawnRadiusMin);
    SetLocalInt(oModule, "df_SpawnUnseen", nSpawnUnseen);
    SetLocalInt(oModule, "df_UnseenRetryCount", nUnseenRetryCount);
    SetLocalInt(oModule, "df_CorpseDecay", nCorpseDecay);
    SetLocalInt(oModule, "df_CorpseDecayType", nCorpseDecayType);
    SetLocalInt(oModule, "df_CampDecay", nCampDecay);
    SetLocalInt(oModule, "df_SpawnScript", nSpawnScript);
    SetLocalInt(oModule, "df_DespawnScript", nDespawnScript);
    SetLocalInt(oModule, "df_DeathScript", nDeathScript);
    SetLocalInt(oModule, "df_SpawnCheckCustom", nSpawnCheckCustom);
    SetLocalInt(oModule, "df_SpawnCheckPCs", nSpawnCheckPCs);
    SetLocalInt(oModule, "f_CheckPCsRadius", nCheckPCsRadius);
    SetLocalInt(oModule, "df_SpawnTrigger", nSpawnTrigger);
    SetLocalInt(oModule, "df_DespawnTrigger", nDespawnTrigger);
    SetLocalInt(oModule, "df_SpawnAreaEffect", nSpawnAreaEffect);
    SetLocalInt(oModule, "df_AreaEffectDuration", nAreaEffectDuration);
    SetLocalInt(oModule, "df_ObjectEffect", nObjectEffect);
    SetLocalInt(oModule, "df_ObjectEffectDuration", nObjectEffectDuration);
    SetLocalInt(oModule, "df_RandomSpawn", nRandomSpawn);
    SetLocalInt(oModule, "df_SpawnFaction", nSpawnFaction);
    SetLocalInt(oModule, "df_SpawnAlignment", nSpawnAlignment);
    SetLocalInt(oModule, "df_AlignmentShift", nAlignmentShift);
    SetLocalInt(oModule, "df_HeartbeatScript", nHeartbeatScript);
    SetLocalInt(oModule, "df_SpawnLocation", nSpawnLocation);
    SetLocalInt(oModule, "df_SpawnLocationMin", nSpawnLocationMin);
    SetLocalInt(oModule, "df_EntranceExit", nEntranceExit);
    SetLocalInt(oModule, "df_EntranceExitMin", nEntranceExitMin);
    SetLocalInt(oModule, "df_Exit", nExit);
    SetLocalInt(oModule, "df_ExitMin", nExitMin);
    SetLocalInt(oModule, "df_HealChildren", nHealChildren);
    SetLocalInt(oModule, "df_EncounterLevel", nEncounterLevel);
    SetLocalInt(oModule, "df_CorpseRemainsType", nCorpseRemainsType);
*/

    SetLocalInt(oModule, "ModuleSpawnCount", 0);

    SetLocalString(oModule, "SEAT_TAG", sSeatTag);
    SetLocalInt(oModule, "LeftoversForceProcessing", bLeftoversForceProcessing);
    SetLocalInt(oModule, "CheckForStuckPatrols", bCheckForStuckPatrols);
    SetLocalInt(oModule, "AlwaysDestroyCorpses", bAlwaysDestroyCorpses);

    // Record Initialization
    SetLocalInt(oModule, "GlobalDefaultsInitialized", TRUE);
}
