void main()
{
    object oTarget = GetEnteringObject();
    object oBallista = GetObjectByTag("SR_STATUE_FALLE35");

    AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_DESTRUCTION , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE));
    DelayCommand(1.0,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FINGER_OF_DEATH , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
    DelayCommand(2.0,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FINGER_OF_DEATH , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
    DelayCommand(3.0,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FINGER_OF_DEATH , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));


}
