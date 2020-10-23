//Put this script OnEnter



void main()
{

  
   effect eVFX;
   effect eDamage;
  
object oPC = GetEnteringObject();
 
 // Only fire for (real) PCs.
    if ( !GetIsPC(oPC)  ||  GetIsDMPossessed(oPC) )
        return;
 
object oTarget;
oTarget = GetObjectByTag("skpt_drowlair_walltrap");
//string oTrap = GetLocalString((OBJECT_SELF),"oTrap");

// Cause damage.
    eDamage = EffectDamage(d6(9), DAMAGE_TYPE_BLUDGEONING);
	eDamage = EffectDamage(d6(9), DAMAGE_TYPE_PIERCING);
    eVFX = EffectVisualEffect(VFX_IMP_DUST_EXPLOSION);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVFX   , oPC);

 
// Assumes initial state is deactivated.
// If initial state is activated, apply variable set "ActivatedState" to placeable
    ExecuteScript("x2_plc_used_act", oTarget);
int bActivated = GetLocalInt(oTarget,"X2_L_PLC_ACTIVATED_STATE");
 
{
PlayAnimation(ANIMATION_PLACEABLE_OPEN,0.5,0.0);
oTarget = GetObjectByTag("skpt_drowlair_walltrap");
DelayCommand(5.0,PlayAnimation(ANIMATION_PLACEABLE_CLOSE));
// MAKE A ACTIVATE SCRAPE SOUND 
AssignCommand(GetEnteringObject(), PlaySound("as_sw_stonelk1", TRUE));
}
 
 
} 