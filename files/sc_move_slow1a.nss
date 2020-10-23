//:://////////////////////////////////////////////
//:: Created By: Oraweb
//:: Created On: 2003
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Modified By: JayAre
//:: Modified On: Nov 09, 2003
//:://////////////////////////////////////////////
object PC;
effect slow;
int slowed;

void main() {
    ExecuteScript("sc_float_text",OBJECT_SELF);
    PC = GetEnteringObject();
    if (GetIsPC(PC)) {
        slow = EffectMovementSpeedDecrease(75);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,slow,PC);
    }
}
