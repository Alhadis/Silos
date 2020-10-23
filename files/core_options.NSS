/*******************************************************************************
 * Name: core_options
 * Type: ACR Include File
 * ---
 * Author: Cereborn
 * Date: 11/11/03
 *      
 * ---
 * Contains option flags used for CORE.  Users may configure optional
 * components of the ACR by changing flag values in this file.
 *
 ******************************************************************************/

#include "core_constants"

// Global Weather System
//
// Set to TRUE if you want this system on (not yet implemented in ACR)
const int gCORE_USE_GLOBAL_WEATHER = FALSE;

// Danmar's Puppet Master
//
// Set to TRUE if you want to use the puppet master functionality
const int gCORE_USE_PUPPET_MASTER = TRUE;

const int gCORE_DO_WEAPON_BREAKAGE = FALSE;

const int gCORE_AREA_SWEEPER = TRUE;


const int gCORE_USE_PD_PERSISTENCE = TRUE;

// Persistent Location System Constants
//
// Auto Char Location Save On or Off
const int gCORE_LOCATION_SAVE_TIMER = TRUE;  

// Auto Char Location Save Interval (seconds)
const float gCORE_LOCATION_SAVE_INTERVAL  = 45.0; 

// Display text to the PC that their location has been saved.
const int gCORE_LOCATION_SAVE_DISPLAYTEXT = FALSE; 

const int gCORE_SAVE_DM_LOC = FALSE;

const int gCORE_MODULE_HAS_UNIQUE_AREA_TAGS = TRUE;

// The default environment when an environment flag cannot be found;
// AC_ENVIRO_NONE will result in no animal companions being summoned if there
// is not an environment flag found.  Other options can be found in 
// core_constants
const int gAC_DEFAULT_ENVIRONMENT = AC_ENVIRO_NONE;

// Turn the extreme environment script on/off with this flag.
const int gCORE_USE_XTREME_ENVIRONMENT = TRUE;

// Use the PD system for persistence (as opposed to campaign databases
const int gCORE_PD_PERSISTENCE = FALSE;


// Set DMRESERVE to a number of players you want to be online, then when you
// start your server, set the max number of players to a number higher than
// DMRESERVE and you will always be able to log on.  This defaults to disabled.
int DMRESERVE=0;

// Setting BLEEDSYSTEM to 0 will remove the bleed to death system.
int BLEEDSYSTEM=1;

// Setting RESTSYSTEM to 0 will remove rest restrictions from play.
// (You may also just not put hc_resting in OnPlayerResting
int RESTSYSTEM=1;

// Setting BEDROLLSYSTEM to 0 will turn off the functioning of bedrolls and
// the requirement to have them to rest.
int BEDROLLSYSTEM=1;

// Setting LIMITEDRESTHEAL to 0 will allow full healing on each rest (but
// then why need clerics?
int LIMITEDRESTHEAL=1;

// Setting BURNTORCH to 0 will restore torch durations to normal BW settings.
// Otherwise torches will last 1 hour per BURNTORCH) PER PHB pg 144
int BURNTORCH=1;

// RESTBREAK - Controls how long between rests if RESTSYSTEM is used
int RESTBREAK=8;

// GIVELEVEL - Sets the level that players start at in your world.
int GIVELEVEL=1;


