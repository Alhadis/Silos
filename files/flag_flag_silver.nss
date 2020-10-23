// NWTACTICS by Jhenne  (tallonzek@hotmail.com)
// 07/07/02
// Blue Flag script, red team takes it...
//changed by PENTAGON

/** silver-flag takeout ( by gold players).
 * in-order to change it to gold-falg , change only
 * the first variables in main -in the "changee sector"
 */
#include "nwk_nerf_pc"
#include "nwk_flag"

void main()
{
/////CHANGE SECTOR ON SILVER TO GOLD FLAG////////////////
string takers_color="SILVER";  //which group can take the flag.
string global_flag_taken="silverflagtaken";
string local_player_has_flag="hassilverflag";
int takers_color_int = TEAM_SILVER;
/////////////END OF CHANGE SECTOR///////////////////////////


object oPC = GetLastUsedBy();// get the PC that uses the flag
string sTeam = GetLocalString(oPC, "team"); // get the PC's team
int nTaken = GetLocalInt(GetModule(), global_flag_taken); // get the flag taken variable


// if the player is able to take it (he is for takers_color)
//and no one else is carrying the flag let him have it
if (sTeam == takers_color && nTaken != 1 && ! GetPlotFlag ( oPC ) && ! GetIsDead ( oPC ) )
{
      takeFlagByPC( oPC , takers_color_int);
    // set the flag taken variables
    SetLocalInt(GetModule(), global_flag_taken, 1);
    SetLocalInt(oPC, local_player_has_flag, 1);

    nerfPc(oPC);



    // define flag effect variables
    int nVisEffect;
    effect eFlagEffect;

    // set the visual effects
    nVisEffect = VFX_DUR_FLAG_PURPLE;
    eFlagEffect = EffectVisualEffect(nVisEffect);
    eFlagEffect = ExtraordinaryEffect(eFlagEffect);

    // put the flag visual on the PC
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,eFlagEffect,oPC);
    PlaySound("as_mg_telepout1");


    //destroy the flag
   DestroyObject(OBJECT_SELF,0.0);

} //of if

}






