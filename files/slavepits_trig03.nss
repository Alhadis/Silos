void main()
{
  object oPC = GetEnteringObject();
  if (!GetIsPC(oPC)) return;

  effect eDam;
  object oPitvictim = GetEnteringObject(); //That's the PC who might fall
  location lLoc = GetLocation(oPitvictim); //The initial place of the falling PC
  object oWay = GetWaypointByTag("SP_PITFALL03"); //That's where he is going to land
  int rSave = ReflexSave(oPitvictim, 20, SAVING_THROW_TYPE_TRAP, OBJECT_SELF);

  if (rSave==0)
    {
      ActionSpeakString ("You've fallen into a pit!!!", TALKVOLUME_TALK);
      eDam = EffectDamage(d6(2), DAMAGE_TYPE_BLUDGEONING); //The damage roll
      ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oPitvictim);
      AssignCommand(oPitvictim, ActionJumpToLocation(GetLocation(oWay)));
      AssignCommand(oPitvictim,ActionPlayAnimation(ANIMATION_LOOPING_SIT_CROSS, 1.0, 2.0));
      FloatingTextStringOnCreature("ouch...", oPitvictim, FALSE);
    }
  else
    {
      ActionSpeakString ("You've managed to avoid a deep pit!", TALKVOLUME_TALK);
    }
}
