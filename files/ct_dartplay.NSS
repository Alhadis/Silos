void main()
{
object oPC = GetLastUsedBy();
int score = 0;
int iCurrentScore = 0;
object oTarget = OBJECT_SELF;
object oTotake = GetLocalObject(oPC, "dartequip");

SetLocalInt(oTarget, "dartscore", 0);
AssignCommand(oPC, ActionMoveToLocation(GetLocation(GetWaypointByTag("ct_wp_dartplay"))));
DelayCommand(2.2, AssignCommand(oPC, ActionAttack(oTarget)));
DelayCommand(3.2, AssignCommand(oPC, ClearAllActions()));
DelayCommand(3.3, SetCommandable(0, oPC));
DelayCommand(8.1, SetCommandable(1, oPC));
DelayCommand(8.2, AssignCommand(oPC, ActionAttack(oTarget)));
DelayCommand(9.2, AssignCommand(oPC, ClearAllActions()));
DelayCommand(9.3, SetCommandable(0, oPC));
DelayCommand(14.1, SetCommandable(1, oPC));
DelayCommand(14.2, AssignCommand(oPC, ActionAttack(oTarget)));
DelayCommand(15.2, AssignCommand(oPC, ClearAllActions()));
DelayCommand(15.3, SetCommandable(0, oPC));
DelayCommand(20.1, SetCommandable(1, oPC));
DelayCommand(20.2, AssignCommand(oPC, ActionAttack(oTarget)));
DelayCommand(21.2, AssignCommand(oPC, ClearAllActions()));
DelayCommand(21.3, SetCommandable(0, oPC));
DelayCommand(26.1, SetCommandable(1, oPC));
DelayCommand(26.2, AssignCommand(oPC, ActionAttack(oTarget)));
DelayCommand(27.2, AssignCommand(oPC, ClearAllActions()));
DelayCommand(30.1, ActionTakeItem(oTotake, oPC));
}