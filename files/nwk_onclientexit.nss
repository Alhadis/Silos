/** onClientLeave event
1.  if it was capture-the-flag type battle , check if player was flag carrier.
    in that case we must create the flag on the last place of the player
    and change the local variables of the falg from "carried" to "on-ground"

*/
/*
REPLACED BY "nwk_onclientleav"


#include "nwk_constants"

void main()
{
object oPC = GetExitingObject();
int nHasGold=GetLocalInt(oPC, "hasgoldflag");
int nHasSilver=GetLocalInt(oPC,"hassilverflag");

   if (nHasGold == 1)
    {
        CreateObject(OBJECT_TYPE_PLACEABLE,
                     nwk_gold_flag_resref(),
                     GetLocation(oPC),
                     FALSE);
        SetLocalInt(GetModule(), "goldflagtaken",2);
        SetLocalInt(GetModule(), "gold_flag_stopper",nwk_stopper_upper_limit());
    }
    else if (nHasSilver == 1)
    {
        CreateObject(OBJECT_TYPE_PLACEABLE,
                     nwk_silver_flag_resref(),
                     GetLocation(oPC),
                     FALSE);
        SetLocalInt(GetModule(), "silverflagtaken",2);
        SetLocalInt(GetModule(), "silver_flag_stopper",nwk_stopper_upper_limit());
    }





}
*/
