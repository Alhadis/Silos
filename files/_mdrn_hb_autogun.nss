// on_heartbeat script to cause a placeable to fire at objects within an automatic gun turret trigger
// placeable must have the same tag as the trigger

#include "nw_i0_spells"

void main()
{
    //Make sure should be firing and if not end
    if (GetLocalInt(OBJECT_SELF,"Targets")<=0)
        return;
    int nDice = GetLocalInt(OBJECT_SELF,"NoDice");

    effect eBeam = EffectBeam(VFX_BEAM_FIRE,OBJECT_SELF,BODY_NODE_CHEST,TRUE);
    int nFired = 0;
    int nAttack;
    object oTarget = GetFirstObjectInArea(GetArea(OBJECT_SELF));

    // find a target
    while ((GetIsObjectValid(oTarget)) && (nFired<2))
    {
        if ((GetObjectType(oTarget)==OBJECT_TYPE_CREATURE)&&(GetCurrentHitPoints(oTarget)>0))
        {
            if ((GetLocalInt(oTarget,GetTag(OBJECT_SELF))==1)&&(GetReputation(OBJECT_SELF,oTarget)<=10))
            {
                // found a valid taget in range so do roll and fire beam
                nAttack = d20(1);
                if (GetIsPC(oTarget))
                    SendMessageToPC(oTarget,GetName(OBJECT_SELF)+" fires: "+IntToString(nAttack)+"+20="+IntToString(nAttack+20));
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,eBeam,oTarget,0.5);
                // if it's a hit then damage the target
                if ((nAttack!=1) && ((nAttack==20)||(nAttack+20>GetAC(oTarget))))
                {
                    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(d6(nDice),DAMAGE_TYPE_FIRE,DAMAGE_POWER_NORMAL),oTarget);
                }
                nFired = nFired + 1;
            }
        }
        oTarget = GetNextObjectInArea(GetArea(OBJECT_SELF));
    }
}
