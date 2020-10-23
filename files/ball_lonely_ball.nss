#include "nwk_constants"

/** used on fallen ball.
 * count loudly fallen time. when we reach 0 , jump the ball
 */
void main()
{
    object oBall=OBJECT_SELF;
    int timer = GetLocalInt(GetModule(), "ball_fallen_timer");

    if (timer>0) //show timer
    {
        AssignCommand(oBall,ActionSpeakString(IntToString(timer)  ));
        SetLocalInt(GetModule(), "ball_fallen_timer",--timer);
    }
    else if (timer==0) //jump ball
    {
        SpeakString("Ball jumps to starting point");
        AssignCommand(oBall,ActionSpeakString("Ball jumps to starting point" ));
        AssignCommand(oBall,ActionJumpToObject(GetObjectByTag(mapFullTagName("WP_LIGHTBALL"))) );
        SetLocalInt(GetModule(), "ball_fallen_timer",-5); //init the value
    }
    else
        return;  //ball is back in place , if it`s negative
}

