/*
//::///////////////////////////////////////////////
//:: Called by default onEnter module event: x3_mod_def_enter
//:: x3_mod_pre_enter
//:://////////////////////////////////////////////

     This script verify if the entering player have his creature skin equipied (tag: player_state),
     If not, spawns it, equips it and assigns necessary starting variables,
     If the player is already stated correctly, execute the application

//:://////////////////////////////////////////////
//:: Created By: J.nosmas
//:: Created On: Dec 01st, 2019
//:: Last Update: Dec 01st, 2019
//:://////////////////////////////////////////////
*/

#include "coreb_inc_plst"

void main()
{
    object oPC=GetEnteringObject();

    DelayCommand(0.5,checkHasSkin(oPC));

}
