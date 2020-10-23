void main()
{
    object oTarget = GetEnteringObject();
    object oBallista = GetObjectByTag("ZEP_HEAD003");

    AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_BIGBYS_FORCEFUL_HAND, oTarget,METAMAGIC_ANY,FALSE, 0, TRUE));
    DelayCommand(1.5,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FLESH_TO_STONE, oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
DelayCommand(2.5,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FINGER_OF_DEATH, oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));




}
