void main()
{
object oPC=GetEnteringObject();
int zufall=Random(10);

if (zufall==0)
{



effect vine=EffectEntangle();
  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, vine, oPC, 3.0);
 // ActionCastFakeSpellAtObject(SPELL_ENTANGLE, oPC);
 effect visvine=EffectVisualEffect(VFX_DUR_ENTANGLE, FALSE);
 ApplyEffectToObject(DURATION_TYPE_TEMPORARY, visvine, oPC, 3.0);
  //bei 1234 den Effekt auswaehlen (VFX_*)
    }
   return;

}
