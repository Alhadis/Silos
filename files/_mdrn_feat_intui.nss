#include "inc_d20"
void main()
{
// D20 Modern Intuition script
// Search for creatures and traps that are hostile and inform user

object oPC = OBJECT_SELF;
location lPC = GetLocation(oPC);


float fRange = 100.0;
int nCheck = 0;

if (WillSave(oPC, 15)==0)
{
    SendMessageToPC(oPC, "You're not sure about the situation.");
    return;
}
SendMessageToAllDMs(GetName(oPC)+ " successfully uses Intuition, and should be informed if they're in a bad situation.");
object oTarg = GetFirstObjectInShape(SHAPE_SPHERE, fRange, lPC, FALSE, OBJECT_TYPE_CREATURE);
while (GetIsObjectValid(oTarg))
{
    if (GetIsEnemy(oPC, oTarg) || GetIsEnemy(oTarg, oPC))
        nCheck = 1;
    oTarg = GetNextObjectInShape(SHAPE_SPHERE, fRange, lPC);
}
oTarg = GetNearestTrapToObject(oPC);
if (GetTrapActive(oTarg)==TRUE && GetDistanceToObject(oTarg) < 100.0 && GetDistanceToObject(oTarg) > 0.0)
    nCheck = 1;

if (nCheck == 1)

    SendMessageToPC(oPC, "You get a bad feeling about the situation.");

else
     SendMessageToPC(oPC, "You get a hunch that everything is all right.");

}
