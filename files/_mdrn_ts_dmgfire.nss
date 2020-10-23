//::///////////////////////////////////////////
//:: trig_firedam
//:: 30/11/05
//::///////////////////////////////////////////
//:: delivers fire damage to creatures inside trigger
//::///////////////////////////////////////////

int GetIsInTrigger(object oTrigger,object oCreature)
// function to determine if creature is still in trigger
{
    object oTarget = GetFirstInPersistentObject(oTrigger,OBJECT_TYPE_CREATURE);

    while (GetIsObjectValid(oTarget))
    {
        if ( oTarget == oCreature ) return TRUE;
        oTarget = GetNextInPersistentObject(oTrigger,OBJECT_TYPE_CREATURE);
    }
    return FALSE;
}

void Damage(object oCreature,object oTrigger,effect eEffect, float fWait)
// recursive subroutine for delay in damage
{
    while (GetIsInTrigger(oTrigger,oCreature))
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,oCreature);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_COM_HIT_FIRE),GetLocation(oCreature));
        DelayCommand(fWait,Damage(oCreature,oTrigger,eEffect,fWait));
        return;
    }
}

void main( )
{
    object oTrigger = OBJECT_SELF;
    object oCreature = GetEnteringObject();
    int nDamage = GetLocalInt(oTrigger,"Damage");
    string sMessage = GetLocalString(oTrigger,"Comment");
    float fWait = GetLocalFloat(oTrigger,"Wait");
    effect eEffect = EffectDamage(nDamage,DAMAGE_TYPE_FIRE,DAMAGE_POWER_NORMAL);

    FloatingTextStringOnCreature(sMessage,oCreature,FALSE);
    DelayCommand(1.0,ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,oCreature));
    DelayCommand(1.1,ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_FLAME_M),GetLocation(oCreature)));
    DelayCommand(fWait+1.0,Damage(oCreature,oTrigger,eEffect,fWait));
}

