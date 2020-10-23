#include "nwk_ball"

void main()
{
object oTarget = GetEnteringObject();
object oHenchMan = GetHenchman (oTarget);
if (GetTag(oHenchMan) == "LightBall")
{

object oGeneral = GetNearestCreature (CREATURE_TYPE_RACIAL_TYPE, RACIAL_TYPE_SHAPECHANGER, oTarget, 1, CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_NOT_PC);
string sTag = GetTag(oGeneral);

if (GetStringLeft(sTag,1)=="G")
{
SetLocalString (oGeneral, "team", "GOLD" );
}
else if (GetStringLeft(sTag,1)=="S")
{
SetLocalString (oGeneral, "team", "SILVER" );
}

string sTargetTeam =GetLocalString(oTarget, "team");
string sTeamself = GetLocalString(oGeneral, "team");

if (sTargetTeam == sTeamself)
{


RemoveHenchman(oTarget, oHenchMan);
AssignCommand (oHenchMan, (ClearAllActions()));
AssignCommand(oHenchMan,ActionJumpToObject(GetObjectByTag(mapFullTagName("WP_LIGHTBALL"))) );
SendMessageToPC (oTarget, "You cannot enter your base with the Light Ball");

object  oBroadcast = GetFirstPC();
while(GetIsObjectValid(oBroadcast) == TRUE)
{
     SendMessageToPC(oBroadcast,"The Light Ball is now FREE!.");
     oBroadcast=GetNextPC();
}

//remove all bad effects
 effect eEffect = GetFirstEffect(oTarget);

  while ( GetIsEffectValid(eEffect) == TRUE )
    {

        if (GetEffectSubType(eEffect)==SUBTYPE_EXTRAORDINARY)
               RemoveEffect(oTarget,eEffect);

        eEffect = GetNextEffect(oTarget);
    }
}
}

}
