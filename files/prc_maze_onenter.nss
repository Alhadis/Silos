//::///////////////////////////////////////////////
//:: Maze area OnEnter
//:: prc_maze_onenter
//:://////////////////////////////////////////////
/** @file
    This script is the Maze spell's maze area
    OnEnter script. It will set the creature
    into commandable cutscene mode.


    @author Ornedan
    @date   Created - 2005.10.6
*/
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////

#include "spinc_maze"


void main()
{if(DEBUG) DoDebug("prc_maze_onenter running");

    object oCreature = GetEnteringObject();

    /* Seems like the trigger gets run first
    // Store old commandability and set it to true
    SetLocalInt(oCreature, "PRC_Maze_EnteringCommandability", GetCommandable(oCreature));
    SetCommandable(TRUE, oCreature);


    // Nuke the creature's current command queue
    AssignCommand(oCreature, ClearAllActions(TRUE));

    // Enter cutscene mode
    SetCutsceneMode(oCreature, TRUE);
    */
}
