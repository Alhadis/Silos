#include "inc_d20"
void main()
{
// D20 Modern Track script
// Search for creatures and inform user

object oPC = OBJECT_SELF;
location lPC = GetLocation(oPC);

int nCheck = 0;
float fRange = 100.0;
int nAnimals = 0;
int nCreatures = 0;
int nHumans = 0;
int nDC = 15;
int nPenalty;
object oArea = GetArea(oPC);
if (GetIsAreaInterior(oArea)==TRUE)
    nDC =nDC + 5;
if (GetWeather(oArea)==WEATHER_RAIN)
    nDC =nDC + 5;
if (GetIsDay()==FALSE)
    nDC = nDC + 3;
if (GetWeather(oArea)==WEATHER_SNOW)
    nDC = nDC - 5;
object oTarg = GetFirstObjectInShape(SHAPE_SPHERE, fRange, lPC, FALSE, OBJECT_TYPE_CREATURE);
while (GetIsObjectValid(oTarg))
{
    if (GetStealthMode(oTarg)==STEALTH_MODE_ACTIVATED)
        nPenalty = 5;
    else
        nPenalty = 0;
    nCheck = d20()+GetSkillRank(SKILL_SURVIVAL, oPC);
    if (nCheck > (nDC + nPenalty) && oTarg != oPC)
    {
        if (GetRacialType(oTarg) == RACIAL_TYPE_ANIMAL)
            nAnimals ++;
        else if (GetRacialType(oTarg) == RACIAL_TYPE_HUMAN)

            nHumans ++;
        else nCreatures ++;
    }
    oTarg = GetNextObjectInShape(SHAPE_SPHERE, fRange, lPC);
}
AssignCommand(oPC, ClearAllActions());
AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 6.0));
if (nAnimals > 0 || nHumans > 0 || nCreatures > 0)
    FloatingTextStringOnCreature(GetName(oPC)+" points out the recent tracks of "+IntToString(nAnimals)+" animals, "+IntToString(nHumans)+" humans, and "+IntToString(nCreatures)+" others in the area.", oPC);
else
    FloatingTextStringOnCreature(GetName(oPC)+" points out that there are no recent tracks in the area.", oPC);
}
