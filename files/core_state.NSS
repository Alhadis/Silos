/******************************************************************
 * Name: core_state
 * Type: CORE Modules Include File
 * ---
 * Author: Cereborn
 * Date: 1/25/04
 * ---
 * Contains CORE include files.
 * IMPORTANT: THIS FILE IS A CORE SCRIPT AND MUST NOT BE
 * MODIFIED EXCEPT THROUGH OFFICIAL CORE PATCHES!
 ******************************************************************/

int PWS_PLAYER_STATE_ALIVE = 0;
int PWS_PLAYER_STATE_DYING = 1;
int PWS_PLAYER_STATE_DEAD = 2;
int PWS_PLAYER_STATE_STABLE = 3;
int PWS_PLAYER_STATE_DISABLED = 4;
int PWS_PLAYER_STATE_RECOVERY = 5;
int PWS_PLAYER_STATE_STABLEHEAL = 6;
int PWS_PLAYER_STATE_SUBDUED = 7;
int PWS_PLAYER_STATE_STAGGERED = 8;

#include "core_persist"

int GPS(object oPC)
{
  //return GetLocalInt(GetModule(),"PlayerState"+GetName(oPC)+GetPCPublicCDKey(oPC));
  return CoreGetSharedPersistentInt( "PlayerState", oPC );
}

void SPS(object oPC, int nPS)
{
  //SetLocalInt(GetModule(),"PlayerState"+GetName(oPC)+GetPCPublicCDKey(oPC), nPS);
  CoreSetSharedPersistentInt( "PlayerState", nPS, oPC );
}

