//:://////////////////////////////////////////////
//:: Created By: JayAre
//:: Created On: May 18, 2003
//:://////////////////////////////////////////////
object PC;

void main()
{
    object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

int nInt;
nInt=GetLocalInt(GetArea(oPC), "madman");

if (!(nInt <= 2))
   return;

    ExecuteScript("sc_float_text",OBJECT_SELF);

}
