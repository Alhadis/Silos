void main()
{

object oPC = GetEnteringObject();

if (!GetIsPC(oPC)) return;

//if (GetItemPossessedBy(oPC, "SOME_ITEM")== OBJECT_INVALID)
//   return;

object oTarget, oTarget2;
oTarget = GetObjectByTag("EFFECT_LOCATION");

effect e1st,e2nd,e3rd,e4th,e5th;

e1st = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
e2nd = EffectVisualEffect(VFX_FNF_WEIRD);
e3rd = EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE);
e4th = EffectVisualEffect(VFX_FNF_PWKILL);
e5th = EffectVisualEffect(VFX_DUR_DARKNESS);

DelayCommand(0.3f,DestroyObject(GetObjectByTag("SUMMON1"),1.0));

ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e1st, GetLocation(oTarget));

ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e4th, GetLocation(oTarget));
DelayCommand(0.5f,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e1st, GetLocation(oTarget)));
DelayCommand(0.25f,ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, e2nd, GetLocation(oTarget)));
DelayCommand(0.1f,ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, e5th, GetLocation(oTarget)));
DelayCommand(1.0f,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e1st, GetLocation(oTarget)));
DelayCommand(0.1f,ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, e5th, GetLocation(oTarget)));
DelayCommand(2.0f,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e1st, GetLocation(oTarget)));
DelayCommand(3.0f,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, e1st, GetLocation(oTarget)));
DelayCommand(3.1f,ApplyEffectAtLocation(DURATION_TYPE_PERMANENT, e5th, GetLocation(oTarget)));

CreateObject(OBJECT_TYPE_PLACEABLE, "X2_PLC_SCIRCLE", GetLocation(oTarget), TRUE, "SUMMON1");
}
