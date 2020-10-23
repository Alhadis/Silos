void main()
{

        object oPC = GetEnteringObject();
        object oMold = GetObjectByTag("mold_conv_b");
        AssignCommand (oPC, ActionStartConversation (oMold));
}
