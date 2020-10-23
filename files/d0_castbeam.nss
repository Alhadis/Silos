void main()
{
 object oPC = GetEnteringObject();
 object olCaster1 = GetNearestObjectByTag("d0_lcaster_1", oPC);//Left Caster 1
 object olCaster2 = GetNearestObjectByTag("d0_lcaster_2", oPC);//Left Caster 2
 object orCaster1 = GetNearestObjectByTag("d0_rcaster_1", oPC);//Right Caster 1
 object orCaster2 = GetNearestObjectByTag("d0_rcaster_2", oPC);//Right Caster 2

 if(GetLocalInt(GetModule(), "D0_SECRET_ROOM_ENTERED") == 0)
 {

   ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_EVIL, olCaster1, BODY_NODE_CHEST), orCaster1);
   //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_EVIL, olCaster2, BODY_NODE_CHEST), orCaster2);
   //ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_EVIL, orCaster1, BODY_NODE_CHEST), olCaster1);
   ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_EVIL, orCaster2, BODY_NODE_CHEST), olCaster2);
   /*
   AssignCommand(olCaster1, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_BEAM_EVIL), orCaster1));
   AssignCommand(olCaster2, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_BEAM_EVIL), orCaster2));
   AssignCommand(orCaster1, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_BEAM_EVIL), olCaster1));
   AssignCommand(orCaster2, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_BEAM_EVIL), olCaster2));
   */
   SetLocalInt(GetModule(), "D0_SECRET_ROOM_ENTERED", 1);
 }
}
