void main()
{
object oPC = GetLastUsedBy();
location lLoc = GetLocation(GetNearestObjectByTag("kz_sew_holewp"));

AssignCommand(oPC, ActionJumpToLocation(lLoc));
ApplyEffectToObject(EFFECT_TYPE_INSTANT, EffectDamage(d6(2), DAMAGE_TYPE_BLUDGEONING), oPC);

if(GetCurrentHitPoints(oPC) >= 0)
	SendMessageToPC(oPC, "You are dropped into the hole, and fall a good 30 feet. You land painfully, and everything is quiet for a moment. Then, you hear the squeaking...");
else
	SendMessageToPC(oPC, "You are dropped into the hole, and fall a good 30 feet. When you land, there is a painful crunch sound as you feel bones breaking in various places, and then everything goes black...");
}