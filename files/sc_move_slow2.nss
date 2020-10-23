//:://////////////////////////////////////////////
//:: Created By: Oraweb
//:: Created On: 2003
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Modified By: JayAre
//:: Modified On: May 15, 2003
//:://////////////////////////////////////////////
object PC;
effect slow;
effect attack_decrease;
int slowed;

void main() {
    ExecuteScript("sc_float_text",OBJECT_SELF);
    PC = GetEnteringObject();
    if (GetIsPC(PC)) {
        slow = EffectMovementSpeedDecrease(25);
        attack_decrease = EffectAttackDecrease(1);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,slow,PC);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,attack_decrease,PC);
    }
}
