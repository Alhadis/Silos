///put the script on a Generic Trigger's onEnter 
//Causes the nearest object with a tag of 'BeamStatue' to
// fire a cold beam at the PC that walks in front of it. 
//It currently does 1d10 points of damage. 



void main()
{
object oPC = GetEnteringObject();
object oStatue0 = GetNearestObjectByTag("BeamStatue0");
object oStatue1 = GetNearestObjectByTag("BeamStatue1");
object oStatue2 = GetNearestObjectByTag("BeamStatue2");
object oStatue3 = GetNearestObjectByTag("BeamStatue3");
effect eBeam0 = EffectBeam(VFX_BEAM_COLD,oStatue0,BODY_NODE_HAND,FALSE);
effect eBeam1 = EffectBeam(VFX_BEAM_COLD,oStatue1,BODY_NODE_HAND,FALSE);
effect eBeam2 = EffectBeam(VFX_BEAM_COLD,oStatue2,BODY_NODE_HAND,FALSE);
effect eBeam3 = EffectBeam(VFX_BEAM_COLD,oStatue3,BODY_NODE_HAND,FALSE);
effect eDMG = EffectDamage(d10(1) ,DAMAGE_TYPE_COLD);
ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam0,oPC,1.0);
ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam1,oPC,1.0);
ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam2,oPC,1.0);
ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam3,oPC,1.0);
ApplyEffectToObject(DURATION_TYPE_INSTANT,eDMG,oPC,0.0);
}