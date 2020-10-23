#include "nw_i0_tool"
void Curse(object oPC)
{
if(GetIsPC(oPC) && !HasItem(oPC, "AmuletderBeschwrer"))
{
ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(66, DAMAGE_TYPE_NEGATIVE), oPC);
DelayCommand(10.0, Curse(oPC));
}
}

void main()
{
object oPC = GetEnteringObject();
Curse(oPC);
}
