/** nwk_backtoenter
*/

#include "nwk_constants"
#include "nwk_flag"
 /*
void backToEnterance(object oPC)
{
    int nGold = GetGold(oPC);

    //for 2.9 spell cut scene change(Shadow-in-the-dark suggestion)
    //verifying that cut scene mode is off , so pc is not invounrable
        SetCutsceneMode ( oPC, FALSE );
    ///////////////////////////////////////////////////
    SendMessageToPC(oPC,"You were moved to the Entry zone. "
        +"probably , because you were AFK for a long time and caused imbalance to your team"
        +"Your score and kills remains the same".);

    emptyPc(oPC);

SetXP(oPC, xp_limit);

AssignCommand(oPC, TakeGoldFromCreature ( nGold, oPC, TRUE));
SetPlotFlag ( oPC, FALSE);


    SetLocalInt(oPC, "kills", FALSE);
    SetLocalInt(oPC, "dyingss", FALSE);
    SetLocalInt(oPC, "personalscore", FALSE);
    SetLocalInt(oPC, "HasGoal", FALSE);
    SetLocalInt(oPC, "BonusHP", 0);

    SetLocalString(oPC, "team", "EMPTY");

    //empty throwings weapons
    SetLocalInt(oPC,"darts",0);
    SetLocalInt(oPC,"throwing_axes",0);
    SetLocalInt(oPC,"shurikens",0);
    //empty ranged ammo
    SetLocalInt(oPC,"arrows",0);
    SetLocalInt(oPC,"bolts",0);
    SetLocalInt(oPC,"bullets",0);

    SetLocalInt(oPC,"king_score",0);
    SetLocalInt(oPC,"pc_registered",0);

    SetLocalInt(oPC,VARNAME_FLAG_CARRIER_NAME_SILVER,FALSE);
    SetLocalInt(oPC,VARNAME_FLAG_CARRIER_NAME_GOLD  ,FALSE);


//execute a clearAllActions script that will clean the queue of the pc
//ExecuteScript(oPC,"nwk_clear_action");
AssignCommand(oPC,ActionJumpToObject(GetObjectByTag("ENTRY_POINT")));





//update the going-in flag , so player will not automaticly go to map
SetLocalInt(oPC,"pc_area",0);



}*/

