/*Author 	Sticky: Post Working Scripts Here
Elhimac 	Posted: Sunday, 21 July 12:12PM
1. Script name: Children Playing Tag 1.1

2. What it does: A little update to Ralf Schemmann's excellent script for tag playing children. With the additions of a couple of waypoints
 and a bit of extra code it ensures that the children stays within a defined area and don't run off into the woods.

3. Notes: First create the children that you want to be playing tag and set their Tag's to TAGCHILD.

Then, in the OnSpawn script you need to make sure that the SetSpawnInCondition (NW_FLAG_HEARTBEAT_EVENT); line is uncommented.

You also need to place an extra line just below that says
SetLocalInt(OBJECT_SELF, "nChasing", 0); for the children that you want to start as being chased, and
SetLocalInt(OBJECT_SELF, "nChasing", 1); for the one child that you want to start out as the chaser.

You then need to place 5 waypoints, one that has the tag KidTagCenter, and the other four that have the tags TagArea0, TagArea1, TagArea2 and TagArea3.

The following script then goes into the OnUserDefined for all of the children.

NOTE: I've uncommented the lines regarding the haste effect that the chaser would apply to himself because I had problems getting it removed once it was in place,
 I've included it as a comment out of completness. If you want to use it then you might also want to have a line with in the OnSpawn spript that applies the haste 
 effect to the predefined chaser.


4. The Script:*/

    //tag-playing children by Ralf Schemmann
    //July 17th, 2002
    //
    //Minor additions by Elhimac
    //Updated 22 July 2002
    //
    //if owner is chasing
	
//tag_spawn_chaser.nss
#include "x0_i0_anims"
#include "x0_i0_treasure"
#include "x2_inc_switches"

	
    void main()
    {
	SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);        // Fire User Defined Event 1001
    	SetLocalInt(OBJECT_SELF, "nChasing", 1);
        int nUser = GetUserDefinedEventNumber();
        if(nUser == 1001) //HEARTBEAT EVENT
        {
           object oPlayground = GetWaypointByTag("KidTagCenter");
           object oTagArea = GetWaypointByTag("TagArea"+IntToString(Random(4)));
           if (GetDistanceToObject(oPlayground) > 6.0f)
           {
               ClearAllActions();
               ActionForceMoveToObject(oTagArea,TRUE, 0.0f);
           }
           if (GetDistanceToObject(oPlayground) < 6.0f)
           {
                if (GetLocalInt(OBJECT_SELF, "nChasing") == 1)
                {
                    //Find kid to chase
                    object oChased = GetNearestObjectByTag("TAGCHILD");
                    //Is owner close enough to tag?
                    if (GetDistanceToObject(oChased) < 2.0f )
                    {
                        //Tag and switch roles
                        SpeakString("Tag!", TALKVOLUME_TALK);
                        AssignCommand(oChased, ClearAllActions());
                        SetLocalInt(OBJECT_SELF, "nChasing", 0);
                        SetLocalInt(oChased, "nTagged", 1);
                        //RemoveEffect(OBJECT_SELF, EffectHaste());
                        ClearAllActions();
                        ActionMoveAwayFromObject(oChased, TRUE);
                    }
                    //if still too far away, move after target
                    else
                    {
                        ActionForceMoveToObject(oChased, TRUE, 0.0f);
                    }
                }
                //owner is being chased
                else
                {
                    //If kid has been tagged, wait a hearbeat then start chasing
                    if (GetLocalInt(OBJECT_SELF, "nTagged") == 1)
                    {
                        SetLocalInt(OBJECT_SELF, "nTagged", 0);
                        SetLocalInt(OBJECT_SELF, "nChasing", 1);
                        //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHaste(), OBJECT_SELF);
                    }
                    //if not been tagged, run away from chaser or move closer to other kids
                    else
                    {
                        //Find Nearest tag-playing child
                        object oChaser = GetNearestObjectByTag("TAGCHILD");
                        //if this is the chaser
                        if (GetLocalInt(oChaser, "nChasing") == 1)
                        //run away from chaser
                        ActionMoveAwayFromObject(oChaser, TRUE);
                        else
                        //run after other kid
                        ActionForceMoveToObject(oChaser, TRUE, 4.0f);
                    }
                }
            }
        }
    }