//:://////////////////////////////////////////////
//:: Created By: Oraweb
//:: Created On: 2003
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Modified By: JayAre
//:: Modified On: Sep 20, 2004
//:://////////////////////////////////////////////
object PC;
effect slow;
int slowed;

void main() {

    PC = GetEnteringObject();
    slow = EffectMovementSpeedDecrease(75);

    ApplyEffectToObject(DURATION_TYPE_PERMANENT,slow,PC);

    if (GetIsPC(PC))
    {
        string sMud = ("As you step into the muddy sludge, your feet sink about 1', considerably slowing your movement.");
        SpeakString(sMud, TALKVOLUME_TALK);
    }

}

