void main()
{
    object oTarget = GetEnteringObject();
    object oBallista = GetObjectByTag("SR_STEINKOPF2");

    AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FLESH_TO_STONE, oTarget,METAMAGIC_ANY,FALSE, 0, TRUE));
    DelayCommand(1.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FINGER_OF_DEATH , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
    DelayCommand(2.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FINGER_OF_DEATH , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
    DelayCommand(3.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_FINGER_OF_DEATH , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));
    DelayCommand(4.8,AssignCommand(oBallista, ActionCastSpellAtObject(SPELL_EPIC_RUIN , oTarget,METAMAGIC_ANY,FALSE, 0, TRUE)));






}
