/**     this script is called after stopper time has passed.
        it checks if someone picked it up already , if not it destroy it.
        check OBJECT_SELF to know what flag to create
*/

#include "nwk_constants"
#include "nwk_flag"
void main()
{


string messageSuffix = " : Flag countdown finished.\n Flag moved back to Start Position";
string fullMessage;

//check if it is the silver flag
if (GetTag(OBJECT_SELF)==nwk_silver_flag_tag() )
{
    if (GetLocalInt(GetModule(), "silverflagtaken")==2)
    {
      //destroy the flag and create new on base
        DestroyObject(GetObjectByTag(nwk_silver_flag_tag() ),0.0);


        CreateObject(OBJECT_TYPE_PLACEABLE,
                     nwk_silver_flag_resref(),
                     GetLocation(GetObjectByTag(nwk_silver_base_flag_location_tag() )),
                     FALSE);
        //change status back to zero (flag in base)
        SetLocalInt(GetModule(), "silverflagtaken",0);
        fullMessage= longTeamName(TEAM_NAME_SILVER)+ messageSuffix;
    }
    //else do nothing , the flag was already destroyed long ago.
}
else if (GetTag(OBJECT_SELF)==nwk_gold_flag_tag() )
{
    if (GetLocalInt(GetModule(), "goldflagtaken")==2)
    {
      //destroy the flag and create new on base
        DestroyObject(GetObjectByTag(nwk_gold_flag_tag() ),0.0);


        CreateObject(OBJECT_TYPE_PLACEABLE,
                     nwk_gold_flag_resref(),
                     GetLocation(GetObjectByTag(nwk_gold_base_flag_location_tag() )),
                     FALSE);
        //change status back to zero (flag in base)
        SetLocalInt(GetModule(), "goldflagtaken",0);
        fullMessage= longTeamName(TEAM_NAME_GOLD)+ messageSuffix;
    }
else
{    //else do nothing , the flag was already destroyed long ago.
    return;
}

    sendMessageToAllPlayer("",ColorString(fullMessage,COLOR_BLUE));
}













}

