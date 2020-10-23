//:://////////////////////////////////////////////
//:: Created By: Scott Milliorn
//:: Created On: 02-02-2019
//:://////////////////////////////////////////////

#include "x3_inc_string"
void main()
{
    object oPC = GetEnteringObject(),
           oNPC = GetWaypointByTag("WP_BattleMaster");

    string sW = StringToRGBString("W", IntToString(Random(777))),
           sE = StringToRGBString("e", IntToString(Random(777))),
           sL = StringToRGBString("l", IntToString(Random(777))),
           sC = StringToRGBString("c", IntToString(Random(777))),
           sO = StringToRGBString("o", IntToString(Random(777))),
           sM = StringToRGBString("m", IntToString(Random(777)));

    //  Automated visual upon PC entering the module casted on the starting location.
    //DelayCommand(1.9, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), GetStartingLocation()));

    //  Advertise the server
    DelayCommand(7.0, FloatingTextStringOnCreature(sW + sE + sL + sC + sO + sM + sE + "!", oPC, FALSE));
    DelayCommand(8.0, FloatingTextStringOnCreature(StringToRGBString("Join us on our Discord Channel!", STRING_COLOR_GREEN), oPC, FALSE));
    DelayCommand(9.0, FloatingTextStringOnCreature(StringToRGBString("https://discord.gg/jG7JUN4", STRING_COLOR_WHITE), oPC, FALSE));
    DelayCommand(10.0, FloatingTextStringOnCreature(StringToRGBString("Press 'J' to read your journal for important information!", STRING_COLOR_ROSE), oPC, FALSE));

    if (!GetIsObjectValid(GetNearestObjectByTag("BattleMaster", oNPC)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "battlemaster", GetLocation(oNPC));
    }
}
