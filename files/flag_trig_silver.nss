// NWTACTICS by Jhenne (tallonzek@hotmail.com)
// 07/07/02
// Capture point trigger script.
// to create gold trigger , just change the first section.
#include "nwk_constants"
#include "nwk_flag"

void main()
{
/* to be changed when switching the teams scripts */
string flag_resref= nwk_silver_flag_resref();
string local_flag_var= "hassilverflag";
string global_flag_var="silverflagtaken";
string base_flag_location_tag=nwk_silver_base_flag_location_tag();
/////////////////////////////////////////////////

// get the PC entering the trigger area
object oPlayer = GetEnteringObject();


// if the flag variable is there, perform winning actions
int ngoldscore =GetLocalInt(GetModule(), "goldscore");
int nsilverscore = GetLocalInt(GetModule(), "silverscore");

/*int nVisEffect = VFX_DUR_FLAG_BLUE;
effect eFlagEffect = EffectVisualEffect(nVisEffect);
eFlagEffect = SupernaturalEffect(eFlagEffect); */

effect eEffect;
int nHasFlag = GetLocalInt (oPlayer, local_flag_var);
if (nHasFlag == 1)
{
  // turn off his flag variables
  SetLocalInt(GetModule(), global_flag_var, 0);
  SetLocalInt(oPlayer, local_flag_var, 0);
// remove the flag effect from the pc
   eEffect = GetFirstEffect(oPlayer);
   int type;

   while ( GetIsEffectValid(eEffect) == TRUE )
    {

      if ((GetEffectSubType(eEffect)==SUBTYPE_EXTRAORDINARY)&&
            (GetEffectType(eEffect)!=EFFECT_TYPE_ULTRAVISION)) //for MVP effect
                                                                //linked with Ultra
               RemoveEffect(oPlayer,eEffect);

        eEffect = GetNextEffect(oPlayer);
    }


  location flag_place = GetLocation(GetObjectByTag(base_flag_location_tag));
  CreateObject(OBJECT_TYPE_PLACEABLE,flag_resref,flag_place,FALSE);


  sendVictoryMessagesToAllPlayers(TEAM_SILVER,oPlayer);
   //send sounds , update points and check victory
    ExecuteScript("war_winbroadcast", oPlayer);



} //end of: if (nHasFlag == 1)

}  //of function





