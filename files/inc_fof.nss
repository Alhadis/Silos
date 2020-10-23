float getCR(object oCreature);
float getTheirCR(object oEnemy, float f_TheirCR, float fRange, object oTheirs);
float getOurCR(float f_OurCR, float fRange, object oMine);
void signalFlee(object oEnemy, float fRange);

const string VAR_COURAGE_MODIFIER = "COURAGE";
const string VAR_I_AM_LEADER = "I_AM_A_LEADER";
const string TAG_RALLY_POINT = "RallyingPoint";

#include "inc_debug_dac"
#include "inc_lair"

// Gets enemy's HD or CR as appropriate.
float getCR(object oCreature)
{
   if (GetIsPC(oCreature))
   {
      return IntToFloat(GetHitDice(oCreature));
   }
   else
   {
      return GetChallengeRating(oCreature);
   }
}

// Adds up all the HD or CRs from enemies within fRange.
float getTheirCR(object oEnemy, float f_TheirCR, float fRange, object oTheirs)
{
   oTheirs = GetFirstObjectInShape(SHAPE_SPHERE, fRange,
      GetLocation(OBJECT_SELF));
   while (GetIsObjectValid(oTheirs))
   {
      if (GetObjectType(oTheirs) == OBJECT_TYPE_CREATURE &&
          GetIsEnemy(oTheirs,OBJECT_SELF))
      {
         if (GetIsPC(oTheirs))
         {
            f_TheirCR = f_TheirCR + IntToFloat(GetHitDice(oTheirs));
         }
         else
         {
            f_TheirCR = f_TheirCR + GetChallengeRating(oTheirs);
         }
      }
      oTheirs = GetNextObjectInShape(SHAPE_SPHERE, fRange,
         GetLocation(OBJECT_SELF));
   }
   return f_TheirCR;
}

// Determines CR of caller's party by scanning for all
// friends within fRange. Does NOT include any friends that
// have retreated.
float getOurCR(float f_OurCR, float fRange, object oMine)
{
   f_OurCR = GetChallengeRating(OBJECT_SELF);
   oMine = GetFirstObjectInShape(SHAPE_SPHERE, fRange,
      GetLocation(OBJECT_SELF));

   while (GetIsObjectValid(oMine))
   {
      if (GetObjectType(oMine) == OBJECT_TYPE_CREATURE &&
          GetIsFriend(oMine,OBJECT_SELF) &&
          GetLocalInt(oMine,"RETREATED") != 1 &&
          GetLocalInt(OBJECT_SELF,"FOF_DEAD") != 1)
      {
         f_OurCR = f_OurCR + GetChallengeRating(oMine);
      }
      oMine = GetNextObjectInShape(SHAPE_SPHERE, fRange,
         GetLocation(OBJECT_SELF));
   }
   return f_OurCR;
}

// The act of retreating.
// Looks for leaders or rallying points and makes for those,
// when present. Otherwise, they run all over the place.
void signalFlee(object oEnemy, float fRange)
{
   object oTest;

   // Is there a leader within fRange + 20.0?
   // looks only for creatures now
   oTest = GetFirstObjectInShape(SHAPE_SPHERE, fRange + 20.0,
      GetLocation(OBJECT_SELF), OBJECT_TYPE_CREATURE);
   while (GetIsObjectValid(oTest))
   {
      if (GetLocalInt(oTest, VAR_I_AM_LEADER) == 1)
      {
         //when we have found a leader we break
         //out of the loop to "save" the leader object.
         break;
      }
      oTest = GetNextObjectInShape(SHAPE_SPHERE, fRange + 20.0,
         GetLocation(OBJECT_SELF), OBJECT_TYPE_CREATURE);
   }

   //if we found no leader (the oTest is still a invalid object)
   //then we check if there is a rallying point sowehere in the area.
   //Requires a waypoint or object with the tag "RallyingPoint".
   if (GetIsObjectValid(oTest) == FALSE)
   {
      //because GetNearestObjectByTag checks
      //for objects only in the same area, it's useful here
      oTest = GetNearestObjectByTag(TAG_RALLY_POINT, OBJECT_SELF);
   }

   //Retreat to leader or rallying point, or scatter.

   //we don't need to check if the object oTest is valid
   //here because GetLocalInt always returns 0 on error
   if (GetLocalInt(oTest, VAR_I_AM_LEADER) == 1 &&
       GetDistanceToObject(oTest) >= 10.0)
   {
      ClearAllActions();
      if (GetAbilityScore(oTest, ABILITY_INTELLIGENCE) >= 5)
      {
         SpeakString("Boss! Help me!");
      }
      SetLocalInt(OBJECT_SELF, "RETREATED",1);
      ActionMoveToObject(oTest, TRUE, 2.0);
      ActionDoCommand(SetLocalInt(OBJECT_SELF, "RETREATED", 0));
      ActionDoCommand(SetCommandable(TRUE, OBJECT_SELF));
      SetCommandable(FALSE, OBJECT_SELF);
   }
   else
   {
      //is oTest a valid object?
      //(if there wasn't a leader, maybe there is a rally point?)
      //Are we meaningfully far away from it?
      if (GetIsObjectValid(oTest) == TRUE && GetDistanceToObject(oTest) >= 10.0)
      {
         ClearAllActions();
         if (GetAbilityScore(oTest, ABILITY_INTELLIGENCE) >= 5)
         {
            SpeakString("Fall back and regroup!");
         }
         SetLocalInt(OBJECT_SELF, "RETREATED", 1);
         ActionMoveToObject(oTest, TRUE, 2.0);
         ActionDoCommand(SetLocalInt(OBJECT_SELF, "RETREATED", 0));
         ActionDoCommand(SetCommandable(TRUE, OBJECT_SELF));
         SetCommandable(FALSE, OBJECT_SELF);
      }
      else
      {
         //Destroys the caller, provided it can put some
         //distance behind it and simply "melt away."
         ClearAllActions();
         if (GetAbilityScore(oTest, ABILITY_INTELLIGENCE) >= 5)
         {
            SpeakString("Run away!  Hide!");
         }
         SetLocalInt(OBJECT_SELF, "RETREATED", 1);
         ActionMoveAwayFromObject(oEnemy, TRUE, fRange + 20.0);
         ActionDoCommand(SetLocalInt(OBJECT_SELF, "RETREATED", 0));
         // If a lair exists, go to it; otherwise, melt away
         object oLair = getLair(OBJECT_SELF);
         if (oLair != OBJECT_INVALID)
         {
            //debug(GetName(OBJECT_SELF) + " returning to lair");
            // Return to lair by running if nearby or jumping if in another area
            if (GetArea(oLair) == GetArea(OBJECT_SELF))
            {
               ActionMoveToLocation(GetLocation(oLair), TRUE);
            }
            else
            {
               ActionJumpToLocation(GetLocation(oLair));
            }
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "RETREATED", 0));
            ActionDoCommand(SetCommandable(TRUE, OBJECT_SELF));
            SetCommandable(FALSE, OBJECT_SELF);
         }
         else
         {
            ActionDoCommand(DestroyObject(OBJECT_SELF));
         }
         SetCommandable(FALSE, OBJECT_SELF);
      }
   }

   //Shout a RETREAT_CHECK, but not if you're the one making the
   //check based on an ally's call. Reads an int set in
   //nw_c2_default4.
   if (GetLocalInt(OBJECT_SELF, "HEARD_THE_CALL") == 1)
   {
      SetLocalInt(OBJECT_SELF, "HEARD_THE_CALL", 0);
   }
   else
   {
      SpeakString("RETREAT_CHECK", TALKVOLUME_SILENT_TALK);
   }
}

//void main() {} // testing/compiling purposes

