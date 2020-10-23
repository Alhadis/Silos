/*
    Delivers fire damage to creatures inside area, set as the variable Enter on the area to action it
    plus set the variable Damage as the amount per repetition, Wait as the time between repetitions
    and Comment as any message to send to the creature taking damage. Ends when creature is no longer
    in area.
*/

void Damage(object oCreature,object oArea,effect eEffect, float fWait)
// recursive subroutine for delay in damage
{
    if(GetArea(oCreature) == oArea)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,eEffect,oCreature);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_COM_HIT_FIRE),GetLocation(oCreature));
        DelayCommand(fWait,Damage(oCreature,oArea,eEffect,fWait));
    }
}

void main( )
{
    object oArea = OBJECT_SELF;
    object oCreature = GetEnteringObject();
    int nDamage = GetLocalInt(oArea,"Damage");
    string sMessage = GetLocalString(oArea,"Comment");
    float fWait = GetLocalFloat(oArea,"Wait");

    // stop the script if the delay is very small to prevent massive looping
    if (fWait < 1.0) return;
    effect eEffect = EffectDamage(nDamage,DAMAGE_TYPE_FIRE,DAMAGE_POWER_NORMAL);

    //start the damage loop
    DelayCommand(fWait+1.0,Damage(oCreature,oArea,eEffect,fWait));
}

