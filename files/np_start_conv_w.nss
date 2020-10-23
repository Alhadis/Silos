void main()
{

        object oPC = GetEnteringObject();
        object oWight = GetObjectByTag("melissa2");
        AssignCommand (oPC, ActionStartConversation(oWight));
}
