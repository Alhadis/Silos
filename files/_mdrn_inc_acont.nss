//CRP MASTER CONTROL FILE - v2.08
// Adopted for D20 Modern by Forrestwolf
// D20 Modern ONLY uses the jumping and climbing routines; I've left the rest just in case we need it sometime.

/****************************************************************

This is the master control file for the C.R.A.P. Base Module
Read the comments for each control line and adjust as needed.

****************************************************************/


// Debug Messages:  set to 0 to deactivate; set to 1 to activate
const int CRP_DEBUG = 0;

//--- JUMP CONTROL ---
//Controls whether players are allowed or disallowed from jumping by 'default'.
//Set to 0 to make jumping disallowed by default - Set to 1 to allow by default.
//Use the Toggle Jumping Trigger to change the player's jump state.
//If you allow jumping by default, a player inside a jumping toggle trigger will
//be disallowed from jumping.  If you disallow by default, a player inside a
//toggle trigger will be allowed to jump.
const int CRP_ALLOW_JUMPING_BY_DEFAULT = 1;


//Enable/Disable Racial Jumping Distance Modifiers
//I strongly recommend NOT disabling this when large pits need to be crossed by
//halflings or other small races.  The animation is scaled by the game engine
//to the model size and therefore makes the animations "off" distance-wise when
//appearing to jump a pit.  The PC will "land" in the pit but actually make the
//jump.
const int CRP_DISABLE_RACIAL_JUMPING = 0;

const int ANIMATION_JUMP = ANIMATION_LOOPING_CUSTOM5;
const int ANIMATION_REST = ANIMATION_LOOPING_CUSTOM10;
const int ANIMATION_SPIKE_LOW = ANIMATION_LOOPING_CUSTOM4;
const int ANIMATION_LISTEN = ANIMATION_LOOPING_CUSTOM1;
