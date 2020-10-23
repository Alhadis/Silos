void main()
{
    object oTarget = GetEnteringObject();
    object oBallista = GetObjectByTag("SR_STEINKOPF2");

    AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_BIGBYS_CRUSHING_HAND, oTarget,METAMAGIC_ANY,FALSE, 0, TRUE));
    DelayCommand(1.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_EPIC_RUIN , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
    DelayCommand(2.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_EARTHQUAKE , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));




}
