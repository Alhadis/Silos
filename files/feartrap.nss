void main()
{
object oPC = GetEnteringObject();
int save = GetWillSavingThrow(oPC);
save = save + d20();
ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_DUR_DARKNESS),GetObjectByTag("darktomb"),25.0);
if (save < 5)
{
effect eEffect1 = EffectLinkEffects(EffectFrightened(),EffectVisualEffect(VFX_DUR_MIND_AFFECTING_FEAR));
ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eEffect1,oPC,25.0);
ActionMoveAwayFromObject(GetObjectByTag("coffin"),TRUE,40.0);
}}
