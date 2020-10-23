void main()
{
    object oTarget = GetEnteringObject();
    object oBallista = GetObjectByTag("SR_STATUE_FALLE35");

    AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FIREBALL , oTarget, 0));
    DelayCommand(1.5,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FIREBALL , oTarget, 0)));
    DelayCommand(3.0,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FIREBALL , oTarget, 0)));
    DelayCommand(4.5,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FIREBALL , oTarget, 0)));
}
