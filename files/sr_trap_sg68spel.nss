void main()
{
    object oTarget = GetEnteringObject();
    object oBallista = GetObjectByTag("SR_STEINKOPF2");

    AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_MORDENKAINENS_DISJUNCTION, oTarget,METAMAGIC_ANY,FALSE, 0, TRUE));
    DelayCommand(1.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_BIGBYS_CRUSHING_HAND , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
    DelayCommand(2.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_WAIL_OF_THE_BANSHEE , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
    DelayCommand(3.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_WAIL_OF_THE_BANSHEE , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
    DelayCommand(4.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_WAIL_OF_THE_BANSHEE , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));






}
