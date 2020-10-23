void main()
{
    object oTarget = GetEnteringObject();
    object oBallista = GetObjectByTag("SR_STEINKOPF2");

    AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_MORDENKAINENS_DISJUNCTION, oTarget,METAMAGIC_ANY,FALSE, 0, TRUE));
    DelayCommand(1.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_BIGBYS_FORCEFUL_HAND , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
    DelayCommand(2.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_DESTRUCTION , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
    DelayCommand(3.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_DESTRUCTION , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
    DelayCommand(4.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_DESTRUCTION , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
    DelayCommand(5.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_DESTRUCTION , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));






}
